Proofs. For the proof of the lemma, note that by the continuous mapping theorem, the sequence $\sup _{h \in F \cap A} \mathbb{M}_{n}(h)-\sup _{h \in B} \mathbb{M}_{n}(h)$ converges in distribution to the same expression, but with $\mathbb{M}$ instead of $\mathbb{M}_{n}$. Thus

$$
\begin{aligned}
\limsup _{n \rightarrow \infty} \mathrm{P}^{*} & \left(\hat{h}_{n} \in F \cap A\right) \\
& \leq \limsup \mathrm{P}^{*}\left(\sup _{h \in F \cap A} \mathbb{M}_{n}(h) \geq \sup _{h \in B} \mathbb{M}_{n}(h)-o_{P}(1)\right) \\
& \leq \mathrm{P}\left(\sup _{h \in F \cap A} \mathbb{M}(h) \geq \sup _{h \in B} \mathbb{M}(h)\right)
\end{aligned}
$$

by Slutsky's lemma and the portmanteau theorem. By the condition on the sample paths of $\mathbb{M}$, the event in the last probability is contained in the set $\{\hat{h} \in F\} \cup\{\hat{h} \notin B\}$, since the set $G=F^{c}$ is open. The lemma follows.

For the proof of the theorem, take $A=B=K$ equal to a compact set $K$. Then almost surely

$$
\mathbb{M}(\hat{h})>\sup _{h \notin G, h \in K} \mathbb{M}(h)
$$

for every open set $G$ around $\hat{h}$. If this were not true, then there would exist a sequence $h_{m} \subset G^{c} \cap K$ with $\mathbb{M}\left(h_{m}\right) \rightarrow \mathbb{M}(\hat{h})$. Since $K$ is compact the sequence may be chosen to be convergent; by upper semicontinuity the value $\mathbb{M}(h)$ at the limit would be at least $\mathbb{M}(\hat{h})$. This contradicts the fact that $\hat{h}$ is unique, for $h$ is contained in the closed set $G^{c}$ and hence cannot equal $\hat{h}$.

Thus, the lemma may be applied and yields

$$
\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(\hat{h}_{n} \in F\right) \leq \mathrm{P}(\hat{h} \in F)+\mathrm{P}(\hat{h} \notin K)+\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(\hat{h}_{n} \notin K\right)
$$

for every closed set $F$. The last two terms on the right can be made arbitrarily small by the choice of $K$. Apply the portmanteau theorem to conclude that $\hat{h}_{n} \rightsquigarrow \hat{h}$.

The preceding results are stated in terms of the parameter $h$, because they are typically applied to a local parameter. However, they may also be applied to the original parameter, in which case the limit criterion function is typically nonrandom and the approach turns into a consistency proof.
3.2.3 Corollary (Consistency). Let $\mathbb{M}_{n}$ be stochastic processes indexed by a metric space $\Theta$, and let $\mathbb{M}: \Theta \mapsto \mathbb{R}$ be a deterministic function.
(i) Suppose that $\left\|\mathbb{M}_{n}-\mathbb{M}\right\|_{\Theta} \rightarrow 0$ in outer probability and that there exists a point $\theta_{0}$ such that

$$
\mathbb{M}\left(\theta_{0}\right)>\sup _{\theta \notin G} \mathbb{M}(\theta)
$$

for every open set $G$ that contains $\theta_{0}$. Then any sequence $\hat{\theta}_{n}$, such that $\mathbb{M}_{n}\left(\hat{\theta}_{n}\right) \geq \sup _{\theta} \mathbb{M}_{n}(\theta)-o_{P}(1)$, satisfies $\hat{\theta}_{n} \rightarrow \theta_{0}$ in outer probability.
(ii) Suppose that $\left\|\mathbb{M}_{n}-\mathbb{M}\right\|_{K} \rightarrow 0$ in outer probability for every compact $K \subset \Theta$ and that the map $\theta \mapsto \mathbb{M}(\theta)$ is upper semicontinuous with a unique maximum at $\theta_{0}$. Then the same conclusion is true provided the sequence $\hat{\theta}_{n}$ is uniformly tight.

If the estimator $\hat{\theta}_{n}$ maximizes the criterion function $\theta \mapsto \mathbb{M}_{n}(\theta)$, then the preceding theorem will typically be applied to a multiple of a "rescaled" criterion function

$$
h \mapsto \mathbb{M}_{n}\left(\theta+\frac{h}{r_{n}}\right)-\mathbb{M}_{n}(\theta),
$$

where $\theta$ is the "true" parameter and $r_{n} \rightarrow \infty$ is the "rate of convergence" of the estimator. We then obtain a distributional limit result for the sequence $\hat{h}_{n}=r_{n}\left(\hat{\theta}_{n}-\theta\right)$. On the other hand, the corollary will be applied to (a multiple of) the orginal criterion functions $\mathbb{M}_{n}$.

A good approach to obtain the limiting distribution of $M$-estimators of Euclidean parameters appears to consist of three steps:

- establish the consistency of the sequence $\hat{\theta}_{n}$ for a value $\theta_{0}$;
- establish the rate of convergence $r_{n}$ of the sequence $\hat{\theta}_{n}$ or, equivalently, establish the tightness of the sequence of local parameters $\hat{h}_{n}=r_{n}\left(\hat{\theta}_{n}-\right. \theta_{0}$ );
- show that suitably rescaled versions of the criterion functions converge in distribution to a limit process $\mathbb{M}$ in the space $\ell^{\infty}(h:\|h\| \leq K$ ) for every $K$.
If the sample paths $h \mapsto \mathbb{M}(h)$ of the limit process are upper semicontinuous and possess a unique maximum $\hat{h}$, then the final conclusion is that the sequence $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution to $\hat{h}$.
3.2.4 Example (Parametric maximum likelihood). For the maximum likelihood estimator based on i.i.d. observations from a density $p_{\theta}$ we may choose $\mathbb{M}_{n}(\theta)=\sum_{i=1}^{n} \log p_{\theta}\left(X_{i}\right)$. If the map $\theta \mapsto p_{\theta}$ is sufficiently smooth, then the sequence of statistical models is locally asymptotically normal:

$$
\sum_{i=1}^{n} \log \frac{p_{\theta+h / \sqrt{n}}}{p_{\theta}}\left(X_{i}\right)=h^{\prime} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{\ell}_{\theta}\left(X_{i}\right)-\frac{1}{2} h^{\prime} I_{\theta} h+o_{P_{\theta}}(1) .
$$

Here $\dot{\ell}_{\theta}$ is the score function of the model and $I_{\theta}$ is the Fisher information matrix. The sequence of stochastic processes on the right (indexed by $h \in \mathbb{R}^{k}$ ) converges marginally in distribution to the Gaussian process

$$
h \mapsto h^{\prime} \Delta-\frac{1}{2} h^{\prime} I_{\theta} h,
$$

for a $N_{k}\left(0, I_{\theta}\right)$-distributed random variable $\Delta$. If $\theta$ is an inner point of the parameter set, then the sequence $\hat{h}_{n}=\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ typically converges in distribution to the maximizer $\hat{h}$ of this process when $h$ ranges over the full Euclidean space. The classical results on asymptotic normality of maximum
likelihood estimators precisely make this statement, for the maximizer is $\hat{h}=I_{\theta}^{-1} \Delta_{\theta}$ and possesses a normal $N\left(0, I_{\theta}^{-1}\right)$-distribution.

Asymptotic normality may be proved by means of the preceding theorem provided the marginal convergence of the processes is suitably strengthened. Simple, but already powerful, conditions are given in Example 3.2.24.

In the case of i.i.d. data and an empirical criterion function of the form $\mathbb{M}_{n}(\theta)=\mathbb{P}_{n} m_{\theta}$, the uniform convergence in Corollary 3.2.3 (to $\left.\mathbb{M}(\theta)=P m_{\theta}\right)$ is valid if and only if the class of functions $\left\{m_{\theta}: \theta \in \Theta\right\}$ is Glivenko-Cantelli. The main Glivenko-Cantelli theorems can be found in Chapter 2.4. The rescaled processes $\left\{\mathbb{P}_{n}\left(m_{\theta+h / r_{n}}-m_{\theta}\right): h \in K\right\}$ are up to centering at mean zero a multiple of the empirical process indexed by the classes of functions $\left\{m_{\theta+h / r_{n}}-m_{\theta}: h \in K\right\}$. Because these classes are changing with $n$, the convergence in distribution of these processes is somewhat more complicated than establishing a Donsker property. However, sufficient conditions for the convergence in distribution are given in Section 2.11.3.

In the next section we present a method to establish the rate of convergence.

### 3.2.2 Rate of Convergence

If $\theta_{0}$ is a point of maximum of the map $\theta \mapsto \mathbb{M}(\theta)$, then the first derivative must vanish at $\theta_{0}$ and the second derivative should be negative definite. Thus, it is natural to assume that for $\theta$ in a neighborhood of $\theta_{0},{ }^{\ddagger}$

$$
\mathbb{M}(\theta)-\mathbb{M}\left(\theta_{0}\right) \lesssim-d^{2}\left(\theta, \theta_{0}\right)
$$

Consider estimators $\hat{\theta}_{n}$ that (nearly) maximize maps $\theta \mapsto \mathbb{M}_{n}(\theta)$. An upper bound for the rate of convergence of $\hat{\theta}_{n}$ can be obtained from the continuity modulus of the difference $\mathbb{M}_{n}-\mathbb{M}$.
3.2.5 Theorem (Rate of convergence). Let $\mathbb{M}_{n}$ be stochastic processes indexed by a semimetric space $\Theta$ and $\mathbb{M}: \Theta \mapsto \mathbb{R}$ a deterministic function, such that for every $\theta$ in a neighborhood of $\theta_{0}$,

$$
\mathbb{M}(\theta)-\mathbb{M}\left(\theta_{0}\right) \lesssim-d^{2}\left(\theta, \theta_{0}\right)
$$

Suppose that, for every $n$ and sufficiently small $\delta$, the centered process $\mathbb{M}_{n}-\mathbb{M}$ satisfies

$$
\mathrm{E}^{*} \sup _{d\left(\theta, \theta_{0}\right)<\delta}\left|\left(\mathbb{M}_{n}-\mathbb{M}\right)(\theta)-\left(\mathbb{M}_{n}-\mathbb{M}\right)\left(\theta_{0}\right)\right| \lesssim \frac{\phi_{n}(\delta)}{\sqrt{n}}
$$

[^0]for functions $\phi_{n}$ such that $\delta \mapsto \phi_{n}(\delta) / \delta^{\alpha}$ is decreasing for some $\alpha<2$ (not depending on $n$ ). Let
$$
r_{n}^{2} \phi_{n}\left(\frac{1}{r_{n}}\right) \leq \sqrt{n}, \quad \text { for every } n
$$

If the sequence $\hat{\theta}_{n}$ satisfies $\mathbb{M}_{n}\left(\hat{\theta}_{n}\right) \geq \mathbb{M}_{n}\left(\theta_{0}\right)-O_{P}\left(r_{n}^{-2}\right)$ and converges in outer probability to $\theta_{0}$, then $r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)=O_{P}^{*}(1)$. If the displayed conditions are valid for every $\theta$ and $\delta$, then the condition that $\hat{\theta}_{n}$ is consistent is unnecessary.

Proof. Assume for simplicity that $\hat{\theta}_{n}$ truly maximizes the map $\theta \mapsto \mathbb{M}_{n}(\theta)$. For each $n$, the parameter space (minus the point $\theta_{0}$ ) can be partitioned into the "shells" $S_{j, n}=\left\{\theta: 2^{j-1}<r_{n} d\left(\theta, \theta_{0}\right) \leq 2^{j}\right\}$ with $j$ ranging over the integers. If $r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)$ is larger than $2^{M}$ for a given integer $M$, then $\hat{\theta}_{n}$ is in one of the shells $S_{j, n}$ with $j \geq M$. In that case the supremum of the map $\theta \mapsto \mathbb{M}_{n}(\theta)-\mathbb{M}_{n}\left(\theta_{0}\right)$ over this shell is nonnegative by the property of $\hat{\theta}_{n}$. Conclude that, for every $\eta>0$,

$$
\begin{gathered}
\mathrm{P}^{*}\left(r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)>2^{M}\right) \leq \sum_{\substack{j \geq M \\
2^{j} \leq \eta r_{n}}} \mathrm{P}^{*}\left(\sup _{\theta \in S_{j, n}}\left(\mathbb{M}_{n}(\theta)-\mathbb{M}_{n}\left(\theta_{0}\right)\right) \geq 0\right) \\
+\mathrm{P}^{*}\left(2 d\left(\hat{\theta}_{n}, \theta_{0}\right) \geq \eta\right)
\end{gathered}
$$

If the sequence $\hat{\theta}_{n}$ is consistent for $\theta_{0}$, then the second probability on the right converges to 0 as $n \rightarrow \infty$ for every $\eta>0$. Choose $\eta>0$ small enough that the first condition of the theorem holds for every $d\left(\theta, \theta_{0}\right) \leq \eta$ and the second for every $\delta \leq \eta$. Then for every $j$ involved in the sum, we have, for every $\theta \in S_{j, n}$,

$$
\mathbb{M}(\theta)-\mathbb{M}\left(\theta_{0}\right) \leq-d^{2}\left(\theta, \theta_{0}\right) \lesssim \frac{-2^{2 j-2}}{r_{n}^{2}}
$$

In terms of the centered process $W_{n}=\mathbb{M}_{n}-\mathbb{M}$, the series may be bounded by

$$
\begin{aligned}
\sum_{\substack{j \geq M \\
2^{j} \leq \eta r_{n}}} \mathrm{P}^{*}\left(\left\|W_{n}(\theta)-W_{n}\left(\theta_{0}\right)\right\|_{S_{j, n}} \geq \frac{2^{2 j-2}}{r_{n}^{2}}\right) & \lesssim \sum_{j \geq M} \frac{\phi_{n}\left(2^{j} / r_{n}\right) r_{n}^{2}}{\sqrt{n} 2^{2 j}} \\
& \lesssim \sum_{j \geq M} 2^{j \alpha-2 j}
\end{aligned}
$$

by Markov's inequality, the definition of $r_{n}$, and the fact that $\phi_{n}(c \delta) \leq c^{\alpha} \phi_{n}(\delta)$ for every $c>1$ by the assumption on $\phi_{n}$. This expression converges to zero for every $M=M_{n} \rightarrow \infty$.

The second assertion follows by a minor simplification of the preceding argument.

In the case of i.i.d. data and criterion functions of the form $\mathbb{M}_{n}(\theta)= \mathbb{P}_{n} m_{\theta}$ and $\mathbb{M}(\theta)=P m_{\theta}$, the centered and scaled process $\sqrt{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)= \mathbb{G}_{n} m_{\theta}$ equals the empirical process at $m_{\theta}$. The second condition of the theorem involves the suprema of the empirical process indexed by classes of functions

$$
\mathcal{M}_{\delta}=\left\{m_{\theta}-m_{\theta_{0}}: d\left(\theta, \theta_{0}\right)<\delta\right\}
$$

It is not unreasonable to assume that these suprema are bounded uniformly in $n$. This leads to the following result.
3.2.6 Corollary. In the i.i.d. case assume that, for every $\theta$ in a neighborhood of $\theta_{0}$,

$$
P\left(m_{\theta}-m_{\theta_{0}}\right) \lesssim-d^{2}\left(\theta, \theta_{0}\right) .
$$

Furthermore, assume that there exists a function $\phi$ such that $\delta \mapsto \phi(\delta) / \delta^{\alpha}$ is decreasing for some $\alpha<2$ and, for every $n$,

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{\delta}} \lesssim \phi(\delta) .
$$

If the sequence $\hat{\theta}_{n}$ satisfies $\mathbb{P}_{n} m_{\hat{\theta}_{n}} \geq \mathbb{P}_{n} m_{\theta_{0}}-O_{P}\left(r_{n}^{-2}\right)$ and converges in outer probability to $\theta_{0}$, then $r_{n} d\left(\hat{\theta}_{n}, \theta_{0}\right)=O_{P}^{*}(1)$ for every sequence $r_{n}$ such that $r_{n}^{2} \phi\left(1 / r_{n}\right) \leq \sqrt{n}$ for every $n$. Thus the "continuity modulus" of the empirical process gives an upper bound on the rate. For instance, the modulus $\phi(\delta)=\delta^{\alpha}$ gives a rate of at least $n^{1 /(4-2 \alpha)}$; the "usual" rate $\sqrt{n}$ corresponds to $\phi(\delta)=\delta$.

For a Euclidean parameter space, the first condition of the theorem is satisfied if the map $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at the point of maximum $\theta_{0}$ with nonsingular second-derivative matrix.

The preceding theorem appears to give the correct rate in fair generality, the main problem being to derive sharp bounds on the continuity modulus of the empirical process. A simple, but not necessarily efficient, method is to apply the maximal inequalities given by Theorems 2.14.1 and 2.14.2. These yield bounds in terms of the uniform entropy integral $J\left(1, \mathcal{M}_{\delta}\right)$ or the bracketing integral $J_{[]}\left(1, \mathcal{M}_{\delta}, L_{2}(P)\right)$ of the class $\mathcal{M}_{\delta}$ given by

$$
\begin{aligned}
& \mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{\delta}} \lesssim J\left(1, \mathcal{M}_{\delta}\right)\left(P^{*} M_{\delta}^{2}\right)^{1 / 2} \\
& \mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{\delta}} \lesssim J_{[]}\left(1, \mathcal{M}_{\delta}, L_{2}(P)\right)\left(P^{*} M_{\delta}^{2}\right)^{1 / 2}
\end{aligned}
$$

Here $M_{\delta}$ is an envelope function of the class $\mathcal{M}_{\delta}$. These bounds are pessimistic in that they depend on the size of the functions $m_{\theta}-m_{\theta_{0}}$, which are likely to be small for small $\delta$, mostly through the envelope of the class. The assumption that the entropy integrals $J\left(1, \mathcal{M}_{\delta}\right)$ and $J_{[]}\left(1, \mathcal{M}_{\delta}, L_{2}(P)\right)$ are bounded as $\delta \downarrow 0$ appears reasonable. (This is not automatically the case, because they are defined relative to an envelope function.) In that case the
preceding corollary may be applied with the upper bound $\phi^{2}(\delta)=P^{*} M_{\delta}^{2}$ and leads to a rate of convergence $r_{n}$ of at least the solution of

$$
\begin{equation*}
r_{n}^{4} P^{*} M_{1 / r_{n}}^{2} \sim n \tag{3.2.7}
\end{equation*}
$$

In many examples involving finite-dimensional parameters this gives the correct result. In Chapter 3.4 we discuss rates of convergence in more generality.

In the remainder of this section we pursue the special case that the rate is given by (3.2.7) and present a theorem concerning the limit distribution of the sequence $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$. As is clear from the examples given in the next section, this theorem should not be viewed as the only approach, but it does give a good illustration of the combination of the argmax theorem, Theorem 3.2.2, and the rate theorem, Theorem 3.2.5.

We specialize to a Euclidean parameter set $\Theta$ and the case of i.i.d. observations. To derive the limit distribution of $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ using the argmax theorem, we need to establish the convergence of a multiple of the processes $h \mapsto \mathbb{P}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)$ in $\ell^{\infty}(h:\|h\| \leq K$ ) for every $K$. Theorems 2.11.22 and 2.11.23 give conditions for the convergence in distribution of the centered processes

$$
\begin{aligned}
h \mapsto \frac{r_{n}^{2}}{\sqrt{n}} & \mathbb{G}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right) \\
& \quad=r_{n}^{2} \mathbb{P}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)-r_{n}^{2} P\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)
\end{aligned}
$$

These are the empirical processes with indexed classes $\left(r_{n}^{2} / \sqrt{n}\right) \mathcal{M}_{K / r_{n}}$. Theorems 2.11.22 and 2.11.23 require that the envelope functions of these classes are bounded in square expectation. In the present case this is satisfied by the definition of $r_{n}$ in (3.2.7). (Of course, it was the motivation for multiplying the empirical measure by $r_{n}^{2}$.) We shall also translate the other conditions to the present situation.

Assume that either the uniform entropy or bracketing integrals of the classes $\mathcal{M}_{\delta}$ are uniformly bounded as $\delta$ tends to 0 : for some $\delta_{0}>0$

$$
\begin{equation*}
\int_{0}^{\infty} \sup _{\delta<\delta_{0}} \sup _{Q} \sqrt{\log N\left(\varepsilon\left\|M_{\delta}\right\|_{Q, 2}, \mathcal{M}_{\delta}, L_{2}(Q)\right)} d \varepsilon<\infty \tag{3.2.8}
\end{equation*}
$$

or

$$
\begin{equation*}
\int_{0}^{\infty} \sup _{\delta<\delta_{0}} \sqrt{\log N_{[]}\left(\varepsilon\left\|M_{\delta}\right\|_{P, 2}, \mathcal{M}_{\delta}, L_{2}(P)\right)} d \varepsilon<\infty \tag{3.2.9}
\end{equation*}
$$

The first type of entropy condition can be exploited only under some measurability conditions. In the following it will be understood, that (3.2.8) includes the condition that the classes $\mathcal{M}_{\delta}$ satisfy the conditions of Theorem 2.14.1.
3.2.10 Theorem. For each $\theta$ in an open subset of Euclidean space, let $m_{\theta}$ be a measurable function such that $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at a point of maximum $\theta_{0}$, with nonsingular second-derivative matrix $V$. ${ }^{b}$ Let the entropy condition (3.2.8) or (3.2.9) hold. Assume that for some continuous function $\phi$, such that $\phi^{2}(\delta) \geq P^{*} M_{\delta}^{2}$ and such that $\delta \mapsto \phi(\delta) / \delta^{\alpha}$ is decreasing for some $\alpha<2$, and for every $\eta>0$,

$$
\begin{align*}
\lim _{\delta \downarrow 0} \frac{P^{*} M_{\delta}^{2}\left\{M_{\delta}>\eta \delta^{-2} \phi^{2}(\delta)\right\}}{\phi^{2}(\delta)} & =0, \\
\lim _{\varepsilon \downarrow 0} \limsup _{\delta \downarrow 0} \sup _{\substack{\|h-g\|<\varepsilon \\
\|h\| v\|g\| \leq K}} \frac{P\left(m_{\theta_{0}+\delta g}-m_{\theta_{0}+\delta h}\right)^{2}}{\phi^{2}(\delta)} & =0, \\
2.11) & \lim _{\delta \downarrow 0} \frac{P\left(m_{\theta_{0}+\delta g}-m_{\theta_{0}+\delta h}\right)^{2}}{\phi^{2}(\delta)}  \tag{3.2.11}\\
& =\mathrm{E}(G(g)-G(h))^{2},
\end{align*}
$$

for all $K$ and some zero-mean Gaussian process $G$ such that $G(g)=G(h)$ almost surely only if $h=g . .^{\sharp}$ Then there exists a version of $G$ with bounded, uniformly continuous sample paths on compacta. Define $r_{n}$ as the solution of $r_{n}^{2} \phi\left(1 / r_{n}\right)=\sqrt{n}$. If $\hat{\theta}_{n}$ nearly maximizes the map $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ for every $n$ and converges in outer probability to $\theta_{0}$, then the sequence $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution to the unique maximizer $\hat{h}$ of the process $h \mapsto G(h)+\frac{1}{2} h^{\prime} V h$.

Proof. By the discussion preceding the theorem and the nonsingularity of the second-derivative matrix $V$, the sequence $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is uniformly tight.

The conditions of Theorems 2.11.22 and 2.11.23 for asymptotic tightness of the sequence $\left(r_{n}^{2} / \sqrt{n}\right) \mathbb{G}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)$ in the space $\ell^{\infty}(h:\|h\| \leq K)$ are an entropy condition and

$$
\begin{gathered}
\frac{r_{n}^{4}}{n} P^{*} M_{K / r_{n}}^{2}=O(1) ; \quad \frac{r_{n}^{4}}{n} P^{*} M_{K / r_{n}}^{2}\left\{r_{n}^{2} M_{K / r_{n}}>\eta n\right\}=o(1), \\
\sup _{\|h-g\|<\eta_{n}} \frac{r_{n}^{4}}{n} P\left(m_{\theta_{0}+g / r_{n}}-m_{\theta_{0}+h / r_{n}}\right)^{2}=o(1) .
\end{gathered}
$$

These conditions are implied by the conditions of the theorem. By the twotimes differentiability of the map $\theta \mapsto P m_{\theta}$,

$$
r_{n}^{2} P\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right) \rightarrow \frac{1}{2} h^{\prime} V h,
$$

uniformly in $h$ ranging over bounded sets. Conclude that the sequence of processes $h \mapsto r_{n}^{2} \mathbb{P}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)$ is asymptotically tight in the

[^1]space $\ell^{\infty}(h:\|h\| \leq K)$ as well. Its marginals are triangular arrays of i.i.d. random vectors that satisfy the Lindeberg condition. In view of the preceding display and (3.2.11), the mean and covariance function converge to $\frac{1}{2} h^{\prime} V h$ and $\mathrm{E} G(g) G(h)$, respectively. Thus, the sequence of processes $h \mapsto r_{n}^{2} \mathbb{P}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)$ converges in distribution in the space $\ell^{\infty}\left(h:\|h\| \leq K\right.$ ) to the Gaussian process $h \mapsto G(h)+\frac{1}{2} h^{\prime} V h$, for every $K$.

By Proposition A.2.20, almost all sample paths of this process attain their supremum at a unique point $\hat{h}$. Finally, apply Theorem 3.2.2.

The second and third lines of the display in the theorem are implied by the single condition: for every $g_{\delta} \rightarrow g$ and $h_{\delta} \rightarrow h$,

$$
\lim _{\delta \downarrow 0} \frac{P\left(m_{\theta_{0}+\delta g_{\delta}}-m_{\theta_{0}+\delta h_{\delta}}\right)^{2}}{\phi^{2}(\delta)}=\mathrm{E}(G(g)-G(h))^{2} .
$$

Instead of the variances of the differences, the condition could also be stated in terms of the covariances of $m_{\theta_{1}}$ and $m_{\theta_{2}}$. See Problem 3.2.1 for further simplifications of the theorem.

### 3.2.3 Examples

This section presents some examples that show the scope of combining the argmax theorem, Theorem 3.2.2, and the rate theorem, Theorem 3.2.5. In some examples we simply apply Theorem 3.2.10; in other examples we give the complete argument.
3.2.12 Example (Lipschitz in parameter). A simple method to verify the conditions of the preceding theorems is by a pointwise Lipschitz condition on the maps $\theta \mapsto m_{\theta}$. Let $X_{1}, \ldots, X_{n}$ be i.i.d. random variables with common law $P$, and let $m_{\theta}$ be measurable functions such that, for every $\theta_{1}, \theta_{2}$ in a neighborhood of $\theta_{0}$,

$$
\left|m_{\theta_{1}}(x)-m_{\theta_{2}}(x)\right| \leq \dot{m}(x)\left\|\theta_{1}-\theta_{2}\right\|^{\alpha},
$$

for a square-integrable function $\dot{m}$. Then the first two displayed conditions of the theorem are satisfied for $\phi(\delta)=\delta^{\alpha}$. The envelope function $M_{\delta}$ can be taken equal to $\delta^{\alpha} \dot{m}$, and the bracketing numbers of the class $\mathcal{M}_{\delta}$ are bounded by the covering numbers of Euclidean balls of radius $\delta$ for the Euclidean metric to the power $\alpha$, hence polynomial. See Section 2.7.4.

Let $\hat{\theta}_{n}$ maximize $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ for every $n$ and be consistent for $\theta_{0}$. If in addition the map $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at its point of maximum $\theta_{0}$ with a nonsingular second-derivative matrix, then Theorem 3.2.5 gives a rate of convergence of at least $n^{1 /(4-2 \alpha)}$.

The limit distribution of the sequence $n^{1 /(4-2 \alpha)}\left(\hat{\theta}_{n}-\theta_{0}\right)$ follows by the preceding theorem under the further condition that for a zero-mean Gaussian process $G$,

$$
P\left(m_{\theta_{0}+\delta g}-m_{\theta_{0}}\right)\left(m_{\theta_{0}+\delta h}-m_{\theta_{0}}\right) \sim \delta^{2 \alpha} \mathrm{E} G(g) G(h) .
$$

In this case the sequence $n^{1 /(4-2 \alpha)}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution to the maximizer of the process $h \mapsto G(h)+\frac{1}{2} h^{\prime} V h$ for a version of $G$ with continuous sample paths.

For $\alpha=1$, it appears not unreasonable to assume that, for some vectorvalued function $\dot{m}_{\theta_{0}}$,

$$
P\left[\frac{m_{\theta_{0}+\delta h}-m_{\theta_{0}}}{\delta}-h^{\prime} \dot{m}_{\theta_{0}}\right]^{2} \rightarrow 0 .
$$

This yields the covariance structure $\mathrm{E} G(g) G(h)=g^{\prime} W h$ for the matrix $W=P \dot{m}_{\theta_{0}} \dot{m}_{\theta_{0}}^{\prime}$. A process $G$ with a covariance structure of this type can be represented as $G(h)=h^{\prime} \Delta$ for a $N(0, W)$-distributed random vector $\Delta$. The maximizer of the process $h \mapsto h^{\prime} \Delta+\frac{1}{2} h^{\prime} V h$ is $\hat{h}=-V^{-1} \Delta$ and is normally distributed with mean zero and covariance matrix $V^{-1} W V^{-1}$. Thus, in this case the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)$ converges in distribution to a normal distribution.

Example 3.2.22 ahead establishes the same conclusion by a more classical linearization argument.
3.2.13 Example. Let $X_{1}, \ldots, X_{n}$ be i.i.d., real-valued random variables with common law $P$ with a differentiable Lebesgue density $p$. Define an estimator $\hat{\theta}_{n}$ of location as the maximizer of the function

$$
\theta \mapsto \mathbb{P}_{n}[\theta-1, \theta+1] .
$$

Thus $\hat{\theta}_{n}$ is the center of an interval of length 2 that contains the largest possible fraction of the observations.

By the classical Glivenko-Cantelli theorem, the sequence $\sup _{\theta} \mid\left(\mathbb{P}_{n}-\right. P)[\theta-1, \theta+1] \mid$ converges in probability to zero. Consequently, if the map $\theta \mapsto P[\theta-1, \theta+1]$ has a unique "well-separated" point of maximum $\theta_{0}$, then the sequence $\theta_{n}$ converges in probability to $\theta_{0}$. The second derivative of $\theta \mapsto P[\theta-1, \theta+1]$ equals $p^{\prime}(\theta+1)-p^{\prime}(\theta-1)$, which is likely to be strictly negative at $\theta_{0}$.

The functions $m_{\theta}=1_{[\theta-1, \theta+1]}$ are not Lipschitz in the parameter. Nevertheless, the classes of functions $\mathcal{M}_{\delta}$ satisfy the conditions of the preceding theorem. These classes are Vapnik-Cervonenkis with envelope functions

$$
\sup _{\left|\theta-\theta_{0}\right|<\delta}\left|1_{[\theta-1, \theta+1]}-1_{\left[\theta_{0}-1, \theta_{0}+1\right]}\right| \leq 1_{\left[\theta_{0}-1-\delta, \theta_{0}-1+\delta\right]}+1_{\left[\theta_{0}+1-\delta, \theta_{0}+1+\delta\right]}
$$

The $L_{2}(P)$-norm of these functions is bounded above by a constant times $\sqrt{\delta}$. Thus, the conditions of the theorem are satisfied with $\phi(\delta)=c \sqrt{\delta}$ for a constant $c$, leading to a rate of convergence $n^{1 / 3}$. The sequence $n^{1 / 3}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution to the maximizer of the process $h \mapsto G(h)+ \frac{1}{2} h^{2}\left(p^{\prime}\left(\theta_{0}+1\right)-p^{\prime}\left(\theta_{0}-1\right)\right)$. Here $G$ is zero-mean Gaussian with continuous sample paths and variance function

$$
\mathrm{E}(G(g)-G(h))^{2}=\left(p\left(\theta_{0}-1\right)+p\left(\theta_{0}+1\right)\right)|g-h| .
$$

Up to a scale factor, $G$ is a two-sided Brownian motion originating from zero.
3.2.14 Example (Monotone densities). Let $X_{1}, \ldots, X_{n}$ be an i.i.d. sample from a Lebesgue density $f$ on $[0, \infty)$ that is known to be decreasing. The maximum likelihood estimator $\hat{f}_{n}$ of $f$ is the step function equal to the left derivative of the least concave majorant of the empirical distribution function $\mathbb{F}_{n}$. For a fixed value $t>0$, we shall derive the limit distribution of the sequence $n^{1 / 3}\left(\hat{f}_{n}(t)-f(t)\right)$ under the assumption that the true density is differentiable at $t$ with derivative $f^{\prime}(t)<0$.

![](https://cdn.mathpix.com/cropped/49457860-375c-496b-8a8d-9d2916c5ddb3-010.jpg?height=639&width=975&top_left_y=643&top_left_x=310)
Figure 3.1. If $\hat{f}_{n}(t) \leq a$, then a line of slope $a$ moved down vertically from $+\infty$ first hits $\mathbb{F}_{n}$ to the left of $t$. The point where the line hits is the point where $\mathbb{F}_{n}$ is farthest above the line of slope $a$ through the origin.

Define a stochastic process $\left\{\hat{s}_{n}(a): a>0\right\}$ by

$$
\hat{s}_{n}(a)=\underset{s}{\operatorname{argmax}}\left\{\mathbb{F}_{n}(s)-a s\right\},
$$

where the largest value is chosen when multiple maximizers exist. The function $\hat{s}_{n}$ is the inverse of the function $\hat{f}_{n}$ in the sense that $\hat{f}_{n}(t) \leq a$ if and only if $\hat{s}_{n}(a) \leq t$ for every $t$ and $a$. This is explained in Figure 3.1. It follows that

$$
\mathrm{P}\left(n^{1 / 3}\left(\hat{f}_{n}(t)-f(t)\right) \leq x\right)=\mathrm{P}\left(\hat{s}_{n}\left(f(t)+x n^{-1 / 3}\right) \leq t\right) .
$$

Hence the desired result can be deduced from the limiting behavior of the process of points of maximum $\hat{s}_{n}\left(f(t)+x n^{-1 / 3}\right)$. By the change of variable $s \mapsto t+h n^{-1 / 3}$ in the definition of $\hat{s}_{n}$, we have

$$
\begin{aligned}
& \hat{s}_{n}\left(f(t)+x n^{-1 / 3}\right)-t \\
& \quad=n^{-1 / 3} \underset{h}{\operatorname{argmax}}\left\{\mathbb{F}_{n}\left(t+h n^{-1 / 3}\right)-\left(f(t)+x n^{-1 / 3}\right)\left(t+h n^{-1 / 3}\right)\right\} .
\end{aligned}
$$

It follows that the probability of interest is $\mathrm{P}\left(\hat{h}_{n} \leq 0\right)$ for $\hat{h}_{n}$ equal to the $\operatorname{argmax}_{h}$ appearing on the right. The location of the maximum of a function does not change when the function is multiplied by a positive constant or shifted vertically. Thus, the $\operatorname{argmax} \hat{h}_{n}$ is also a point of maximum of the process

$$
\begin{aligned}
h & \mapsto n^{2 / 3}\left(\mathbb{P}_{n}-P\right)\left(1_{\left[0, t+h n^{-1 / 3}\right]}-1_{[0, t]}\right) \\
& \quad+n^{2 / 3}\left[F\left(t+h n^{-1 / 3}\right)-F(t)-f(t) h n^{-1 / 3}\right]-x h
\end{aligned}
$$

By Theorem 2.11.22 or 2.11.23, this sequence of processes converges, for every $K$, in the space $\ell^{\infty}(-K, K)$ to the process

$$
h \mapsto \sqrt{f(t)} \mathbb{Z}(h)+\frac{1}{2} f^{\prime}(t) h^{2}-x h,
$$

where $\mathbb{Z}$ is a two-sided Brownian motion originating from zero: a mean-zero Gaussian process with $\mathbb{Z}(0)=0$ and $\mathrm{E}(\mathbb{Z}(g)-\mathbb{Z}(h))^{2}=|g-h|$ for every $g, h$. If it can be proved that $\hat{h}_{n}=O_{P}(1)$, then the argmax continuous mapping theorem yields that the sequence $\hat{h}_{n}$ converges in distribution to the maximizer $\hat{h}$ of the limit process. In particular,

$$
\mathrm{P}\left(n^{1 / 3}\left(\hat{f}_{n}(t)-f(t)\right) \leq x\right)=\mathrm{P}\left(\hat{h}_{n} \leq 0\right) \rightarrow \mathrm{P}(\hat{h} \leq 0)
$$

Elementary properties of Brownian motion allow one to rewrite the limit probability $\mathrm{P}(\hat{h} \leq 0)$ in a simple form. See Problem 3.2.5. The final conclusion is that

$$
n^{1 / 3}\left(\hat{f}_{n}(t)-f(t)\right) \leadsto\left|4 f^{\prime}(t) f(t)\right|^{1 / 3} \underset{h}{\operatorname{argmax}}\left\{\mathbb{Z}(h)-h^{2}\right\}
$$

The sequence $\hat{h}_{n}$ can be shown to be uniformly tight by Theorem 3.2.5 with criterion and centering function

$$
\begin{aligned}
\mathbb{M}_{n}(g) & =\left(\mathbb{P}_{n}-P\right)\left(1_{[0, t+g]}-1_{[0, t]}\right)+F(t+g)-F(t)-f(t) g-x g n^{-1 / 3}, \\
\mathbb{M}(g) & =F(t+g)-F(t)-f(t) g .
\end{aligned}
$$

By its definition, $\hat{g}_{n}=n^{-1 / 3} \hat{h}_{n}$ maximizes $g \mapsto \mathbb{M}_{n}(g)$. In order to show that the sequence $n^{1 / 3} \hat{g}_{n}$ is bounded in probability, we shall apply Theorem 3.2.5. By assumption $\mathbb{M}(g)=\frac{1}{2} f^{\prime}(t) g^{2}+o\left(g^{2}\right)$ as $g \rightarrow 0$. The bracketing entropy integral of the class of functions $\left\{1_{[0, t+g]}-1_{[0, t]}:|g|<\delta\right\}$ is bounded uniformly in $\delta$ and the envelopes satisfy $P M_{\delta}^{2} \lesssim \delta$. It follows that we can set $\phi_{n}(\delta)=\sqrt{\delta}+\delta n^{1 / 6}$, leading to a rate of convergence $n^{1 / 3}$ for $\hat{g}_{n}$ as desired, provided $\hat{g}_{n}$ is consistent. The consistency can be proved by a direct argument, but also by Theorem 3.2.5 applied with $d(g, 0)=-\mathbb{M}(g)$. For this choice of "distance" the conditions of Theorem 3.2.5 are valid for every $g$ and $\delta$, so that by the last assertion of the theorem, $-n^{2 / 3} \mathbb{M}\left(g_{n}\right)=O_{P}^{*}(1)$. The concavity of $\mathbb{M}$ shows that $\hat{g}_{n}$ converges to zero in probability.
3.2.15 Example (Current status). Let $X_{1}, \ldots, X_{n}$ and $T_{1}, \ldots, T_{n}$ be independent i.i.d. samples from distribution functions $F$ and $G$ on the nonnegative half-line, respectively. Define $\Delta_{i}=1\left\{X_{i} \leq T_{i}\right\}$. Each $X_{i}$ is interpreted as the (unobserved) time of onset of a disease; each $T_{i}$ is a check-up time at which the patient is observed to be ill or not: $\Delta_{i}=1$ or 0 . The observations consist of the pairs $\left(\Delta_{1}, T_{1}\right), \ldots,\left(\Delta_{n}, T_{n}\right)$. The maximum likelihood estimator $\hat{F}_{n}$ for $F$ maximizes the (partial) likelihood function

$$
F \mapsto \sum_{i=1}^{n}\left(\Delta_{i} \log F\left(T_{i}\right)+\left(1-\Delta_{i}\right) \log \left(1-F\left(T_{i}\right)\right)\right)
$$

This function depends on $F$ only through the values $F\left(T_{i}\right)$. Hence the maximum likelihood estimator is not unique. In the following, $\hat{F}_{n}$ is assumed constant on the intervals $\left[T_{(i-1)}, T_{(i)}\right)$.

If the observation times are initially ordered so that the observation times are increasing, then finding the values $\hat{F}_{n}\left(T_{i}\right)$ is equivalent to the "isotonic" maximization problem of maximizing the function

$$
\left(y_{1}, \ldots, y_{n}\right) \mapsto \sum_{i=1}^{n}\left(\delta_{i} \log y_{i}+\left(1-\delta_{i}\right) \log \left(1-y_{i}\right)\right)
$$

subject to $0 \leq y_{1} \leq y_{2} \leq \cdots \leq y_{n} \leq 1$. In view of Theorem 1.5.1 of Robertson, Wright, and Dykstra (1988) applied with the convex function $\Phi(y)=y \log y+(1-y) \log (1-y)$ the solution vector $\hat{y}$ to this problem is the "isotonic regression" of the vector $\left(\delta_{1}, \ldots, \delta_{n}\right)$ : the vector $\hat{y}$ that mimimizes $y \mapsto \sum_{i=1}^{n}\left(\delta_{i}-y_{i}\right)^{2}$ subject to the same condition as before. By Theorem 1.2.1 of the same reference, the isotonic regression $\hat{y}_{i}$ can be graphically represented as the slope in the interval $(i-1, i)$ of the greatest convex minorant of the "cumulative-sum diagram" of the points $n^{-1}\left(i, \sum_{j \leq i} \delta_{i}\right)$. The cumulative-sum diagram is the function $c:[0,1] \mapsto \mathbb{R}$, which equals $n^{-1} \sum_{j \leq i} \delta_{i}$ on the interval $n^{-1}(i-1, i]$ and equals 0 at zero. The graphical representation shows that $\hat{y}_{i} \leq a$ if and only if $\operatorname{argmin}_{s}\{c(s)-a s\} \geq i / n$. (In case of multiple points of minimum, take the largest.) Let $\mathbb{P}_{n}$ be the empirical measure of the pairs $\left(X_{1}, T_{1}\right), \ldots,\left(X_{n}, T_{n}\right)$, and let $A=\{(x, t): x \leq t\}$. Define the stochastic processes

$$
\begin{gathered}
V_{n}(t)=\mathbb{P}_{n} 1_{A} 1_{\mathbb{R} \times[0, t]}=\frac{1}{n} \sum \Delta_{i} 1\left\{T_{i} \leq t\right\} \\
G_{n}(t)=\mathbb{P}_{n} 1_{\mathbb{R} \times[0, t]}=\frac{1}{n} \sum 1\left\{T_{i} \leq t\right\}
\end{gathered}
$$

Then the function $s \mapsto V_{n} \circ G_{n}^{-1}(s)$ equals the cumulative-sum diagram, whence for every observation point $t_{i}$,

$$
\hat{F}_{n}\left(T_{i}\right) \leq a \quad \text { if and only if } \quad \underset{s}{\operatorname{argmin}}\left\{V_{n}(s)-a G_{n}(s)\right\} \geq T_{i}
$$

Thus, the limit distribution of $\hat{F}_{n}(t)$ can be derived by studying the locations of the minima of the sequence of processes $s \mapsto V_{n}(s)-a G_{n}(s)$. Assume that $F$ and $G$ are differentiable at $t>0$ with derivatives $f(t)$ and $g(t)>0$. For each $t$, the value $\hat{F}_{n}(t)$ equals $\hat{F}_{n}\left(T_{i}\right)$ for some $i$; hence $\hat{F}_{n}(t) \leq a$ if and only if the argmin appearing in the display is larger than the observation time $T_{i}$ that is just left of $t$. Under the condition that $g(t)>0$, the difference between this observation time and $t$ is asymptotically negligible. By the change of variables $s \mapsto t+n^{-1 / 3} h$,

$$
\begin{aligned}
& n^{1 / 3}\left(\underset{s}{\operatorname{argmin}}\left\{V_{n}(s)-\left(F(t)+x n^{-1 / 3}\right) G_{n}(s)\right\}-t\right) \\
& =\underset{h}{\operatorname{argmin}}\left\{n^{2 / 3}\left(\mathbb{P}_{n}-P\right)\left(1_{A}-F(t)\right)\left(1_{\mathbb{R} \times\left[0, t+h n^{-1 / 3}\right]}-1_{\mathbb{R} \times[0, t]}\right)\right. \\
& \quad+n^{2 / 3} P\left(1_{A}-F(t)\right)\left(1_{\mathbb{R} \times\left[0, t+h n^{-1 / 3}\right]}-1_{\mathbb{R} \times[0, t]}\right) \\
& \left.\quad-x n^{1 / 3} \mathbb{P}_{n}\left(1_{\mathbb{R} \times\left[0, t+h n^{-1 / 3}\right]}-1_{\mathbb{R} \times[0, t]}\right)\right\}
\end{aligned}
$$

Let $\mathbb{Z}$ be a two-sided Brownian motion process, originating from zero. By Theorems 2.11.22 and 2.11.23, the sequence of processes inside the argmin converges, for every $K$, in the space $\ell^{\infty}(-K, K)$ to the process

$$
h \mapsto \sqrt{F(1-F) g(t)} \mathbb{Z}(h)+\frac{1}{2} h^{2} f(t) g(t)-x g(t) h .
$$

The locations of the minima converge to the location of the minimum $\hat{h}$ of this limit process provided the sequence of locations of minima is bounded in probability. The final conclusion is

$$
n^{1 / 3}\left(\hat{F}_{n}(t)-F(t)\right) \rightsquigarrow\left(\frac{4 F(1-F) f}{g}(t)\right)^{1 / 3} \underset{h}{\operatorname{argmin}}\left\{\mathbb{Z}(h)+h^{2}\right\}
$$

Here we have used Problem 3.2.5 to rewrite the probability $\mathrm{P}(\hat{h} \geq 0)$ in a simple form.

Uniform tightness of the locations of the minima can be shown with the help of Theorem 3.2.5. Define the processes

$$
\begin{gathered}
\mathbb{M}_{n}(h)=\left(\mathbb{P}_{n}-P\right)\left(1_{A}-F(t)\right)\left(1_{\mathbb{R} \times[0, t+h]}-1_{\mathbb{R} \times[0, t]}\right) \\
+P\left(1_{A}-F(t)\right)\left(1_{\mathbb{R} \times[0, t+h]}-1_{\mathbb{R} \times[0, t]}\right) \\
-x n^{-1 / 3} \mathbb{P}_{n}\left(1_{\mathbb{R} \times[0, t+h]}-1_{\mathbb{R} \times[0, t]}\right) \\
\mathbb{M}(h)=P\left(1_{A}-F(t)\right)\left(1_{\mathbb{R} \times[0, t+h]}-1_{\mathbb{R} \times[0, t]}\right)
\end{gathered}
$$

The conditions of Theorem 3.2.5 are satisfied with $\phi_{n}(\delta)=\sqrt{\delta}+x \delta n^{1 / 6}$. Thus, the location of the maximum of $h \mapsto \mathbb{M}_{n}(h)$ has rate of convergence $n^{1 / 3}$, provided the sequence converges to zero in probability. The latter can be shown by a standard consistency proof.

### 3.2.4 Linearization

A (more) classical approach toward proving asymptotic normality of $M$ estimators is through a Taylor expansion of the criterion function. Assume that the limit criterion function $\theta \mapsto P m_{\theta}$ takes its maximum at a point $\theta_{0}$; then its first derivative must vanish at $\theta_{0}$, and the second derivative $V$ must be negative definite. If the function $\theta \mapsto m_{\theta}$ is several times differentiable, then since $\mathbb{P}_{n}=P+n^{-1 / 2} \mathbb{G}_{n}$,

$$
\begin{aligned}
n \mathbb{P}_{n}\left(m_{\theta}-m_{\theta_{0}}\right)= & n P\left(m_{\theta}-m_{\theta_{0}}\right)+\sqrt{n} \mathbb{G}_{n}\left(m_{\theta}-m_{\theta_{0}}\right) \\
\approx & \frac{1}{2} \sqrt{n}\left(\theta-\theta_{0}\right)^{\prime} V \sqrt{n}\left(\theta-\theta_{0}\right)^{\prime}+\sqrt{n}\left(\theta-\theta_{0}\right)^{\prime} \mathbb{G}_{n} \dot{m}_{\theta_{0}} \\
& \quad+n o\left(\left\|\theta-\theta_{0}\right\|^{2}\right)+\sqrt{n} o_{P}\left(\left\|\theta-\theta_{0}\right\|\right) .
\end{aligned}
$$

If the two remainder terms are neglected, then the maximum of the righthand side is taken for $\sqrt{n}\left(\theta-\theta_{0}\right)=-V^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}$. Thus, it may be expected that the $M$-estimator $\hat{\theta}_{n}$ that maximizes the left-hand side satisfies

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}(1) .
$$

This derivation can be made rigorous by various methods. One possibility is to impose "classical" smoothness conditions on the maps $\theta \mapsto m_{\theta}(x)$ (for every $x$ ) in combination with domination of derivatives. More general results can be obtained under the assumption that the criterion functions are differentiable in a stochastic sense.

The basic result does not require the i.i.d. set-up and will be stated for general criterion functions. Let $\hat{\theta}_{n}$ maximize the random function $\theta \mapsto \mathbb{M}_{n}(\theta)$ which is "centered" at the deterministic function $\theta \mapsto \mathbb{M}(\theta)$. Assume that the sequence $\hat{\theta}_{n}$ converges to a point of maximum $\theta_{0}$ of $\theta \mapsto \mathbb{M}(\theta)$.
3.2.16 Theorem. Let $\mathbb{M}_{n}$ be stochastic processes indexed by an open subset $\Theta$ of Euclidean space and $\mathbb{M}: \Theta \mapsto \mathbb{R}$ a deterministic function. Assume that $\theta \mapsto \mathbb{M}(\theta)$ is twice continuously differentiable at a point of maximum $\theta_{0}$ with nonsingular second-derivative matrix $V .^{\dagger}$ Suppose that

$$
\begin{aligned}
& r_{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)\left(\tilde{\theta}_{n}\right)-r_{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)\left(\theta_{0}\right) \\
& \quad=\left(\tilde{\theta}_{n}-\theta_{0}\right)^{\prime} Z_{n}+o_{P}^{*}\left(\left\|\tilde{\theta}_{n}-\theta_{0}\right\|+r_{n}\left\|\tilde{\theta}_{n}-\theta_{0}\right\|^{2}+r_{n}^{-1}\right)
\end{aligned}
$$

for every random sequence $\tilde{\theta}_{n}=\theta_{0}+o_{P}^{*}(1)$ and a uniformly tight sequence of random vectors $Z_{n}$. If the sequence $\hat{\theta}_{n}$ converges in outer probability to $\theta_{0}$ and satisfies $\mathbb{M}_{n}\left(\hat{\theta}_{n}\right) \geq \sup _{\theta} \mathbb{M}_{n}(\theta)-o_{P}\left(r_{n}^{-2}\right)$ for every $n$, then

$$
r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V^{-1} Z_{n}+o_{P}^{*}(1)
$$

If it is known that the sequence $r_{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is uniformly tight, then the displayed condition needs to be verified for sequences $\tilde{\theta}_{n}=\theta_{0}+O_{P}^{*}\left(r_{n}^{-1}\right)$ only.

[^2]Proof. The stochastic differentiability condition of the theorem together with the two-times differentiability of the map $\theta \mapsto \mathbb{M}(\theta)$ yields for every sequence $\tilde{h}_{n}=o_{P}^{*}(1)$

$$
\begin{align*}
\mathbb{M}_{n}\left(\theta_{0}+\tilde{h}_{n}\right)-\mathbb{M}_{n}\left(\theta_{0}\right)= & \frac{1}{2} \tilde{h}_{n}^{\prime} V \tilde{h}_{n}+r_{n}^{-1} \tilde{h}_{n}^{\prime} Z_{n}  \tag{3.2.17}\\
& +o_{P}^{*}\left(\left\|\tilde{h}_{n}\right\|^{2}+r_{n}^{-1}\left\|\tilde{h}_{n}\right\|+r_{n}^{-2}\right)
\end{align*}
$$

For $\tilde{h}_{n}$ chosen equal to $\hat{h}_{n}=\hat{\theta}_{n}-\theta_{0}$, the left side (and hence the right side) is at least $-o_{P}\left(r_{n}^{-2}\right)$ by the definition of $\hat{\theta}_{n}$. In the right side the term $\tilde{h}_{n}^{\prime} V \tilde{h}_{n}$ can be bounded above by $-c\left\|\tilde{h}_{n}\right\|^{2}$ for a positive constant $c$, since the matrix $V$ is strictly negative definite. Conclude that

$$
-o_{P}\left(r_{n}^{-2}\right) \leq-c\left\|\hat{h}_{n}\right\|^{2}+r_{n}^{-1}\left\|\hat{h}_{n}\right\| O_{P}(1)+o_{P}\left(\left\|\hat{h}_{n}\right\|^{2}+r_{n}^{-2}\right) .
$$

Complete the square to see that this implies that

$$
\left(c+o_{P}(1)\right)\left(\left\|\hat{h}_{n}\right\|-O_{P}\left(r_{n}^{-1}\right)\right)^{2} \leq O_{P}\left(r_{n}^{-2}\right)
$$

This can be true only if $\left\|\hat{h}_{n}\right\|=O_{P}^{*}\left(r_{n}^{-1}\right)$.
For any sequence $\tilde{h}_{n}$ of the order $O_{P}^{*}\left(r_{n}^{-1}\right)$, the three parts of the remainder term in (3.2.17) are of the order $o_{P}\left(r_{n}^{-2}\right)$. Apply this with the choices $\hat{h}_{n}$ and $-r_{n}^{-1} V^{-1} Z_{n}$ to conclude that

$$
\begin{aligned}
\mathbb{M}_{n}\left(\theta_{0}+\hat{h}_{n}\right)-\mathbb{M}_{n}\left(\theta_{0}\right) & =\frac{1}{2} \hat{h}_{n}^{\prime} V \hat{h}_{n}+r_{n}^{-1} \hat{h}_{n}^{\prime} Z_{n}+o_{P}^{*}\left(r_{n}^{-2}\right) \\
\mathbb{M}_{n}\left(\theta_{0}-r_{n}^{-1} V^{-1} Z_{n}\right)-\mathbb{M}_{n}\left(\theta_{0}\right) & =-\frac{1}{2} r_{n}^{-2} Z_{n}^{\prime} V^{-1} Z_{n}+o_{P}^{*}\left(r_{n}^{-2}\right)
\end{aligned}
$$

The left-hand side of the first equation is larger than the second, up to an $o_{P}^{*}\left(r_{n}^{-2}\right)$-term. Subtract the second equation from the first to find that

$$
\frac{1}{2}\left(\hat{h}_{n}+r_{n}^{-1} V^{-1} Z_{n}\right)^{\prime} V\left(\hat{h}_{n}+r_{n}^{-1} V^{-1} Z_{n}\right) \geq-o_{P}\left(r_{n}^{-2}\right)
$$

Since $V$ is strictly negative definite, this yields the first assertion of the theorem.

If it is known that the sequence $\hat{\theta}_{n}$ is $r_{n}$-consistent, then the middle part of the preceding proof is unnecessary and we can proceed to inserting $\hat{h}_{n}$ and $-r_{n}^{-1} V^{-1} Z_{n}$ in (3.2.17) immediately. The latter equation is then needed for sequences $\tilde{h}_{n}=O_{P}^{*}\left(r_{n}^{-1}\right)$ only.

The main condition of the theorem could be described as stochastic differentiability of the standardized process $r_{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)$, requiring a linear approximation with remainder of order

$$
o_{P}\left(\left\|\tilde{\theta}_{n}-\theta_{0}\right\|+r_{n}\left\|\tilde{\theta}_{n}-\theta_{0}\right\|^{2}+r_{n}^{-1}\right) .
$$

To require a remainder of the order $o_{P}\left(\left\|\tilde{\theta}_{n}-\theta_{0}\right\|\right)$ would be more natural, but also more stringent: if $\tilde{\theta}_{n}$ converges to $\theta_{0}$ slower or faster than $O_{P}\left(r_{n}^{-1}\right)$, then the sum in the previous display is dominated by its second and third
terms, respectively. Thus, in these cases the differentiability as required by the theorem is less stringent than the "natural" condition.

The last statement of the theorem is of some interest, because it also allows one in this approach to separate establishing the rate of convergence from the derivation of the limit distribution. The rate of convergence may be derived with the help of Theorem 3.2.5. For sequences $\tilde{\theta}_{n}=\theta_{0}+O_{P}\left(r_{n}^{-1}\right)$ the stochastic differentiability condition reduces to ${ }^{\ddagger}$

$$
r_{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)\left(\tilde{\theta}_{n}\right)-r_{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)\left(\theta_{0}\right)=\left(\tilde{\theta}_{n}-\theta_{0}\right)^{\prime} Z_{n}+o_{P}^{*}\left(r_{n}^{-1}\right) .
$$

This condition together with $r_{n}$-consistency of $\hat{\theta}_{n}$ yield the conclusion of the theorem if the map $\theta \mapsto \mathbb{M}(\theta)$ is two times differentiable with nonsingular second derivative matrix.

In the case of i.i.d. observations, the theorem can be applied with criterion functions $\mathbb{M}_{n}(\theta)=\mathbb{P}_{n} m_{\theta}$ and $\mathbb{M}(\theta)=P m_{\theta}$ and rate of convergence $r_{n}=\sqrt{n}$. In this case $\sqrt{n}\left(\mathbb{M}_{n}-\mathbb{M}\right)(\theta)=\mathbb{G}_{n} m_{\theta}$ for the empirical process $\mathbb{G}_{n}$. Then the stochastic differentiability can be ascertained by empirical process methods. It is natural to require that each $Z_{n}$ will be a centered and scaled sum, in which case the stochastic differentiability condition can be recast in terms of the existence of a vector-valued function $\dot{m}_{\theta_{0}}$ (not necessarily a pointwise partial derivative) such that, for every $\tilde{\theta}_{n}=\theta_{0}+o_{P}^{*}(1)$,

$$
\begin{align*}
\mathbb{G}_{n}\left(m_{\tilde{\theta}_{n}}\right. & \left.-m_{\theta_{0}}\right)=\left(\tilde{\theta}_{n}-\theta_{0}\right)^{\prime} \mathbb{G}_{n} \dot{m}_{\theta_{0}}  \tag{3.2.18}\\
& +o_{P}^{*}\left(\left\|\tilde{\theta}_{n}-\theta_{0}\right\|+\sqrt{n}\left\|\tilde{\theta}_{n}-\theta_{0}\right\|^{2}+n^{-1 / 2}\right)
\end{align*}
$$

The following lemma gives a simple sufficient condition for this type of differentiability.
3.2.19 Lemma. Suppose that there exists a vector-valued function $\dot{m}_{\theta_{0}}$ such that, for some $\delta>0$,

$$
\begin{gathered}
\left\{\frac{m_{\theta}-m_{\theta_{0}}-\left(\theta-\theta_{0}\right)^{\prime} \dot{m}_{\theta_{0}}}{\left\|\theta-\theta_{0}\right\|}: \quad\left\|\theta-\theta_{0}\right\|<\delta\right\} \quad \text { is P-Donsker, } \\
P\left[m_{\theta}-m_{\theta_{0}}-\left(\theta-\theta_{0}\right)^{\prime} \dot{m}_{\theta_{0}}\right]^{2}=o\left(\left\|\theta-\theta_{0}\right\|^{2}\right) .
\end{gathered}
$$

Then (3.2.18) is satisfied for every sequence $\tilde{\theta}_{n}==\theta_{0}+o_{P}^{*}(1)$. Consequently, if the map $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at $\theta_{0}$ with nonsingular second derivative matrix ${ }^{b}$ and $\hat{\theta}_{n}$ converges to $\theta_{0}$ in outer probability, then $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}^{*}(1)$.

Proof. Without loss of generality, assume that $\tilde{\theta}_{n}$ takes its values in $\Theta_{\delta}= \left\{\theta:\left\|\theta-\theta_{0}\right\|<\delta\right\}$. Define a function $f: \ell^{\infty}\left(\Theta_{\delta}\right) \times \Theta_{\delta} \mapsto \mathbb{R}^{d}$ by $f(z, \theta)=z(\theta)$.

[^3]This function is continuous at every point $\left(z, \theta_{0}\right)$ such that $\theta \mapsto z(\theta)$ is continous at $\theta_{0}$.

Define a stochastic process $Z_{n}$ indexed by $\Theta_{\delta}$ by

$$
Z_{n}(\theta)=\mathbb{G}_{n} \frac{m_{\theta}-m_{\theta_{0}}-\left(\theta-\theta_{0}\right)^{\prime} \dot{m}_{\theta_{0}}}{\left\|\theta-\theta_{0}\right\|} .
$$

By assumption, the sequence $Z_{n}$ converges in $\ell^{\infty}\left(\Theta_{\delta}\right)$ to a tight Gaussian process $Z$. This process has continuous sample paths with respect to the semimetric $\rho$ given by

$$
\rho^{2}\left(\theta_{1}, \theta_{2}\right)=\mathrm{E}\left(Z\left(\theta_{1}\right)-Z\left(\theta_{2}\right)\right)^{2} .
$$

By assumption, $\rho\left(\theta, \theta_{0}\right) \rightarrow 0$ if $\theta \rightarrow \theta_{0}$. Thus, almost all sample paths of $Z$ are continuous at $\theta_{0}$.

By Slutszky's lemma $\left(Z_{n}, \tilde{\theta}_{n}\right) \rightsquigarrow\left(Z, \theta_{0}\right)$. By the continuous mapping theorem, $Z_{n}\left(\tilde{\theta}_{n}\right)=f\left(Z_{n}, \tilde{\theta}_{n}\right) \rightsquigarrow f\left(Z, \theta_{0}\right)=0$. Since convergence in distribution to a constant is the same as convergence in probability, it follows that (3.2.18) holds with remainder $\operatorname{term} o_{P}^{*}\left(\left\|\tilde{\theta}_{n}-\theta_{0}\right\|\right)$.

The conditions of the lemma require some type of differentiability of the map $\theta \mapsto m_{\theta}$ but are weak enough to allow the treatment of slightly irregular functions, such as the absolute value $x \mapsto|x-\theta|$.

The presence of the factor $\left\|\theta-\theta_{0}\right\|$ in the denominator appears a bit awkward. It would be unnecessary to handle this term if the rate of convergence could first be established by a different method. Thus, that may motivate separating also in this approach deriving the limit distribution from establishing the rate of convergence. If it is known that the maximizing sequence $\hat{\theta}_{n}$ is $\sqrt{n}$-consistent, then (3.2.18) need hold only for sequences $\tilde{\theta}_{n}=\theta_{0}+O_{P}^{*}\left(n^{-1 / 2}\right)$ and can be replaced by

$$
\begin{equation*}
\mathbb{G}_{n} \sqrt{n}\left(m_{\tilde{\theta}_{n}}-m_{\theta_{0}}\right)=\sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right)^{\prime} \mathbb{G}_{n} \dot{m}_{n, \theta_{0}}+o_{P}^{*}(1) . \tag{3.2.20}
\end{equation*}
$$

The function $\dot{m}_{n, \theta_{0}}$ may depend on $n$; typically it would be equal almost everywhere to a derivative of $m_{\theta}$ and fixed, but we could even try functions such as $\sqrt{n}\left(m_{\theta_{0}+e_{i} n^{-1 / 2}}-m_{\theta_{0}}\right)$. \#

The following lemma gives a simple sufficient condition for this type of differentiability.

[^4]3.2.21 Lemma. Suppose that the classes of functions $\mathcal{M}_{\delta}=\left\{m_{\theta}-\right. \left.m_{\theta_{0}}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ satisfy the entropy condition (3.2.8) or (3.2.9) and have envelope functions $M_{\delta}$ such that $P^{*} M_{\delta}^{2}\left\{M_{\delta}>\eta\right\}=o\left(\delta^{2}\right)$ for every $\eta>0$, and
$$
\begin{aligned}
\lim _{\varepsilon \downarrow 0} \limsup _{\delta \downarrow 0} & \sup _{\substack{\|h-g\|<\varepsilon \\
\|g\| \vee\|h\| \leq K}} \frac{P\left(m_{\theta_{0}+\delta g}-m_{\theta_{0}+\delta h}\right)^{2}}{\delta^{2}}=0 \\
\lim _{\delta \downarrow 0} \frac{P\left(m_{\theta_{0}+\delta g}-m_{\theta_{0}+\delta h}\right)^{2}}{\delta^{2}} & =\mathrm{E}(G(h)-G(g))^{2}
\end{aligned}
$$
for all $K$ and some linear, zero-mean Gaussian process $G$. Then (3.2.20) holds for every sequence $\tilde{\theta}_{n}=\theta_{0}+o_{P}^{*}\left(n^{-1 / 2}\right)$. Consequently, if the map $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at $\theta_{0}$ with nonsingular derivative and $\hat{\theta}_{n}$ converges to $\theta_{0}$ in outer probability, then $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)= -V^{-1} \mathbb{G}_{n} \dot{m}_{n, \theta_{0}}+o_{P}^{*}(1)$.

Proof. For the first assertion it suffices to show that the sequence of processes

$$
h \mapsto \mathbb{G}_{n}\left(\sqrt{n}\left(m_{\theta_{0}+h / \sqrt{n}}-m_{\theta_{0}}\right)-h^{\prime} \dot{m}_{n, \theta_{0}}\right)
$$

converges in probability to zero in the space $\ell^{\infty}(h:\|h\| \leq K$ ), for every $K$. The sequence of processes $h \mapsto \mathbb{G}_{n} \sqrt{n}\left(m_{\theta_{0}+h / \sqrt{n}}-m_{\theta_{0}}\right)$ can be shown to be asymptotically tight by application of Theorem 2.11.22 or 2.11.23. A fortiori the sequence $\mathbb{G}_{n} \dot{m}_{n, \theta_{0}}$ and hence the sequence of processes $h \mapsto h^{\prime} \dot{m}_{n, \theta_{0}}$ are asymptotically tight. It now suffices to show that the processes in the preceding display converge marginally to zero. By the definition of $\dot{m}_{n, \theta_{0}}$,

$$
P\left(\sqrt{n}\left(m_{\theta_{0}+h / \sqrt{n}}-m_{\theta_{0}}\right)-h^{\prime} \dot{m}_{n, \theta_{0}}\right)^{2} \rightarrow \mathrm{E}\left(G(h)-\sum h_{i} G\left(e_{i}\right)\right)^{2} .
$$

This is zero for every $h$ by the linearity of $G$. An application of Markov's inequality yields marginal convergence to zero and concludes the proof of the first assertion.

For the final assertion of the lemma, note first that the rate of convergence of $\hat{\theta}_{n}$ is $\sqrt{n}$ by Theorem 3.2.5 (or Theorem 3.2.10). Thus, the conclusion follows by Theorem 3.2.16.

The second and third lines of the display in the lemma are implied by the single condition: for every $g_{\delta} \rightarrow g$ and $h_{\delta} \rightarrow h$,

$$
\lim _{\delta \downarrow 0} \frac{1}{\delta^{2}} P\left(m_{\theta_{0}+\delta g_{\delta}}-m_{\theta_{0}+\delta h_{\delta}}\right)^{2}=\mathrm{E}(G(g)-G(h))^{2} .
$$

Instead of the variances of the differences, the condition could also be stated in terms of the covariances of $m_{\theta_{1}}$ and $m_{\theta_{2}}$. In particular, the condition is implied by twice differentiability of the map $\left(\theta_{1}, \theta_{2}\right) \mapsto P m_{\theta_{1}} m_{\theta_{2}}$ at $\left(\theta_{0}, \theta_{0}\right)$. See Problem 3.2.1.
3.2.22 Example (Lipschitz in parameter). Let $X_{1}, \ldots, X_{n}$ be i.i.d. random variables with common law $P$, and let $m_{\theta}$ be measurable functions indexed by a parameter $\theta$ ranging over an open subset of Euclidean space. Assume that, for every $\theta_{1}, \theta_{2}$ in a neighborhood of $\theta_{0}$,

$$
\begin{aligned}
\left|m_{\theta_{1}}(x)-m_{\theta_{2}}(x)\right| & \leq \dot{m}(x)\left\|\theta_{1}-\theta_{2}\right\|, \\
P\left[m_{\theta}-m_{\theta_{0}}-\left(\theta-\theta_{0}\right)^{\prime} \dot{m}_{\theta_{0}}\right]^{2} & =o\left(\left\|\theta-\theta_{0}\right\|^{2}\right),
\end{aligned}
$$

for functions $\dot{m}$ and $m_{\theta_{0}}$ with $P \dot{m}^{2}(x)<\infty$. Furthermore, assume that the map $\theta \mapsto P m_{\theta}$ is twice continuously differentiable at a point of maximum $\theta_{0}$ with nonsingular second-derivative matrix $V$. If $\hat{\theta}_{n}$ maximizes $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ up to an $o_{P}(1 / n)$-term and is consistent for $\theta_{0}$, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V^{-1} \mathbb{G}_{n} \dot{m}_{\theta_{0}}+o_{P}^{*}(1)
$$

This follows from the preceding lemma. By the Lipschitz condition, the $L_{2}(P)$-covering numbers of the classes $\mathcal{M}_{\delta}$ are polynomial and the envelopes can be taken equal to $M=\dot{m} \delta$. In view of the differentiability of $\theta \mapsto m_{\theta}$ in square mean, the process $G$ can be taken as $G(h)=h^{\prime} \Delta$ for normally distributed vector $\Delta$ with mean zero and covariance matrix $P \dot{m}_{\theta_{0}} \dot{m}_{\theta_{0}}^{\prime}$.

It may be noted that $P \dot{m}_{\theta_{0}}=0$, because this is the first derivative at $\theta_{0}$ of the map $\theta \mapsto P m_{\theta}$. Hence the sequence $\mathbb{G}_{n} \dot{m}_{\theta_{0}}$ is asymptotically zero-mean normal.
3.2.23 Example (Least absolute deviation regression). Given independent i.i.d. random vectors $X_{1}, \ldots, X_{n}$ and $e_{1}, \ldots, e_{n}$ in $\mathbb{R}^{d}$ and $\mathbb{R}$, respectively, let $Y_{i}=\theta_{0}^{\prime} X_{i}+e_{i}$. The least-absolute-deviation estimator $\hat{\theta}_{n}$ minimizes the function

$$
\theta \mapsto \frac{1}{n} \sum_{i=1}^{n}\left|Y_{i}-\theta^{\prime} X_{i}\right|=\mathbb{P}_{n} m_{\theta}
$$

where $\mathbb{P}_{n}$ is the empirical measure of the pairs ( $X_{i}, Y_{i}$ ) and $m_{\theta}(x, y)= \left|y-\theta^{\prime} x\right|$.

The parameter $\theta_{0}$ is a point of minimum of the map $\theta \mapsto P\left|Y-\theta^{\prime} X\right|$ if the distribution of the errors $e_{i}$ has median zero. (Write the expectation as $\mathrm{E}_{X} \mathrm{E}_{e}\left|e-\left(\theta-\theta_{0}\right)^{\prime} X\right|$ and note that the inner integral is minimized by $\theta_{0}$ for every fixed value of $X$.) Furthermore, the maps $\theta \mapsto m_{\theta}$ satisfy the conditions in Example 3.2.22:

$$
\begin{gathered}
\left|\left|y-\theta_{1}^{\prime} x\right|-\left|y-\theta_{2}^{\prime} x\right|\right| \leq\left\|\theta_{1}-\theta_{2}\right\|\|x\| \\
P\left[\left|Y-\theta^{\prime} X\right|-\left|Y-\theta_{0}^{\prime} X\right|-\left(\theta-\theta_{0}\right)^{\prime} X \operatorname{sign}\left(Y-\theta_{0}^{\prime} X\right)\right]^{2}=o\left(\left\|\theta-\theta_{0}\right\|^{2}\right)
\end{gathered}
$$

The consistency of the least-absolute-deviation estimator can be argued from the convexity of the map $\theta \mapsto\left|y-\theta^{\prime} x\right|$. The map $\theta \mapsto P\left|Y-\theta^{\prime} X\right|$
is twice differentiable at $\theta_{0}$ if the distribution of the errors has a positive density at its median.

The final conclusion is that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normal with mean zero and covariance matrix $V^{-1} \mathrm{E}\left(X X^{\prime}\right) \operatorname{sign}(Y- \left.\theta_{0}^{\prime} X\right) V^{-1}$ for $V$, the second-derivative matrix of $\theta \mapsto P\left|Y-\theta^{\prime} X\right|$ at $\theta_{0}$.
3.2.24 Example (Maximum likelihood). Let $X_{1}, \ldots, X_{n}$ be a sample from a density $p_{\theta}$ with respect to a measure $\mu$ on a measurable space $(\mathcal{X}, \mathcal{A})$. The parameter $\theta$ ranges over an open subset of Euclidean space. Assume that, for $\theta_{1}, \theta_{2}$ in a neighborhood of $\theta_{0}$,

$$
\left|\log p_{\theta_{1}}(x)-\log p_{\theta_{2}}(x)\right| \leq \dot{\ell}(x)\left\|\theta_{1}-\theta_{2}\right\|,
$$

for a function $\dot{\ell}$ with $P_{\theta_{0}} \dot{\ell}^{2}<\infty$. Furthermore, assume that the map $\theta \mapsto P_{\theta_{0}} \log p_{\theta}$ is twice continuously differentiable at $\theta_{0}$ and that as $\theta \mapsto \theta_{0}$

$$
\int\left[p_{\theta}^{1 / 2}-p_{\theta_{0}}^{1 / 2}-\frac{1}{2}\left(\theta-\theta_{0}\right)^{\prime} \dot{\ell}_{\theta_{0}} p_{\theta_{0}}^{1 / 2}\right]^{2} d \mu=o\left(\left\|\theta-\theta_{0}\right\|^{2}\right)
$$

for some measurable vector-valued function $\dot{\ell}_{\theta_{0}}$. Under these conditions, if the maximum likelihood estimator $\hat{\theta}_{n}$ for $\theta_{0}$ is consistent, then

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-I_{\theta_{0}}^{-1} \frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{\ell}_{\theta_{0}}\left(X_{i}\right)+o_{P_{\theta_{0}}}^{*}(1) .
$$

Here the Fisher information matrix $I_{\theta_{0}}=P_{\theta_{0}} \dot{\ell}_{\theta_{0}} \dot{\ell}_{\theta_{0}}^{\prime}$ is assumed to be nonsingular.

Since the maximum likelihood estimator is an $M$-estimator for $m_{\theta}= \log p_{\theta}$, its asymptotic normality also follows under the conditions of Example 3.2.22 for general Lipschitz criterion functions. The present statement is better in two respects. First, the differentiability of the log density in quadratic mean is replaced by the differentiability of the root density, which has long been known to be the "right" condition for asymptotic theory. Second, the present statement gives the inverse of the Fisher information matrix as the asymptotic covariance matrix, rather than a matrix $V^{-1} I_{\theta_{0}} V^{-1}$, which would next have to be checked to be equal to $I_{\theta_{0}}^{-1}$ under additional conditions.

The claim can be proved as follows. Define a zero-mean stochastic process $\mathbb{Z}_{n}$ by

$$
\mathbb{Z}_{n}(h)=n\left(\mathbb{P}_{n}-P_{\theta_{0}}\right)\left(\log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}-\frac{h^{\prime} \dot{\ell}_{\theta_{0}}}{\sqrt{n}}\right) .
$$

The differentiability of the root density implies that the score is mean-zero: $P_{\theta_{0}} \dot{\ell}_{\theta_{0}}=0$ as well as local asymptotic normality. The latter means that for every $h$,

$$
\begin{aligned}
\mathbb{Z}_{n}(h) & =-\frac{1}{2} h^{\prime} I_{\theta_{0}} h-n P_{\theta_{0}} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}+o_{P_{\theta_{0}}}(1) \\
& =-\frac{1}{2} h^{\prime} I_{\theta_{0}} h-\frac{1}{2} h^{\prime} V h+o_{P_{\theta_{0}}}(1)
\end{aligned}
$$

Here $V$ is the second-derivative matrix of the map $\theta \mapsto P_{\theta_{0}} \log p_{\theta}$ at $\theta=\theta_{0}$. The second moment of $\mathbb{Z}_{n}(h)$ is equal to its variance and satisfies

$$
\mathrm{E} \mathbb{Z}_{n}^{2}(h) \leq P_{\theta_{0}}\left(\sqrt{n} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}-h^{\prime} \dot{\ell}_{\theta_{0}}\right)^{2} \lesssim P_{\theta_{0}}\left(\dot{\ell}^{2}+\left\|\dot{\ell}_{\theta_{0}}\right\|^{2}\right)\|h\|^{2} .
$$

Since this is uniformly bounded in $n$, it follows that the sequence of means $\mathrm{E} \mathbb{Z}_{n}(h)=0$ converges to the mean of the limit in probability, $-\frac{1}{2} h^{\prime} I_{\theta_{0}} h- \frac{1}{2} h^{\prime} V h$ of the sequence $\mathbb{Z}_{n}(h)$. Since this is true for every $h$, it follows that $V=-I_{\theta_{0}}$.

In view of Corollary 3.2.6, Theorem 3.2.10, or Example 3.2.12, the rate of the maximum likelihood estimator is $\sqrt{n}$. In view of the discussion following Theorem 3.2.16, it now suffices to verify condition (3.2.20) with $\dot{m}_{n, \theta_{0}}=\dot{\ell}_{\theta_{0}}$. In the present situation this is implied by the sequence of random variables $\sup _{\|h\| \leq K}\left|\mathbb{Z}_{n}(h)\right|$ converging to zero in distribution for every $K$. Since it was seen that the sequence of processes $\left\{\mathbb{Z}_{n}(h):\|h\| \leq K\right\}$ converges marginally in probability to zero, it suffices to show that the sequence is asymptotically tight in the space of bounded functions. In view of the Lipschitz condition on the maps $\theta \mapsto \log p_{\theta}$, the bracketing numbers $N_{[]}\left(\varepsilon\left\|M_{n}\right\|_{P_{\theta_{0}, 2}}, \mathcal{M}_{n}, L_{2}\left(P_{\theta_{0}}\right)\right)$ of the classes of functions

$$
\mathcal{M}_{n}=\left\{\sqrt{n} \log \frac{p_{\theta_{0}+h / \sqrt{n}}}{p_{\theta_{0}}}:\|h\| \leq K\right\}, \quad M_{n}=K \dot{\ell},
$$

are uniformly bounded by the covering numbers of a Euclidean ball. The asymptotic tightness follows from Theorem 2.11.23.

## Problems and Complements

1. Assume one of the entropy conditions (3.2.8) or (3.2.9) for the class of functions $\mathcal{M}_{\delta}=\left\{m_{\theta}-m_{\theta_{0}}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ with envelope function $M_{\delta}$. Furthermore, suppose that, for every $\eta>0$,

$$
P^{*} M_{\delta}^{2} \leq \delta^{2} ; \quad P^{*} M_{\delta}^{2}\left\{M_{\delta}>\eta\right\}=o\left(\delta^{2}\right)
$$

Finally, suppose that the maps $\theta \mapsto P m_{\theta}$ and $\left(\theta_{1}, \theta_{2}\right) \mapsto P m_{\theta_{1}} m_{\theta_{2}}$ are twice continuously differentiable at $\theta_{0}$ and $\left(\theta_{0}, \theta_{0}\right)$, respectively, the first one with nonsingular second-derivative matrix $V$. Then a (near) maximizer $\hat{\theta}_{n}$ of $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ satisfies $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-V^{-1} \mathbb{G}_{n} \dot{m}_{n, \theta_{0}}+o_{P}^{*}(1)$ provided it converges to $\theta_{0}$ in outer probability. Here $\mathbb{G}_{n} \dot{m}_{n, \theta_{0}}$ converges in distribution to a normal distribution with mean zero and covariance matrix the derivative $\partial^{2} / \partial \theta_{1} \partial \theta_{2} P m_{\theta_{1}} m_{\theta_{2}}$ evaluated at ( $\theta_{0}, \theta_{0}$ ).
2. If $M: \Theta \mapsto \mathbb{R}$ is upper semicontinuous on a compact metric space $\Theta$, then it achieves its maximum value. If it achieves its maximum value at a unique point $\theta_{0}$, then $M\left(\theta_{0}\right)>\sup _{\theta \notin G} M(\theta)$ for every open set $G$ around $\theta_{0}$.
3. (Consistency and Lipschitz criterion functions) Let $\Theta$ be a measurable subset of Euclidean space and $\mathbb{M}_{n}$ be separable stochastic processes that converge pointwise in probability to a fixed function $\mathbb{M}$. Suppose that

$$
\left|\mathbb{M}_{n}\left(\theta_{1}\right)-\mathbb{M}_{n}\left(\theta_{2}\right)\right| \leq \dot{\mathbb{M}}_{n}\left\|\theta_{1}-\theta_{2}\right\|,
$$

for random variables such that $\sup _{n} \dot{\mathbb{M}}_{n}<\infty$ almost surely. Let $\theta \mapsto \mathbb{M}(\theta)$ be upper semicontinuous and possess a unique maximum at $\theta_{0}$. If $\hat{\theta}_{n}$ (nearly) maximizes $\theta \mapsto \mathbb{M}_{n}(\theta)$ and $\hat{\theta}_{n}=O_{P}(1)$, then $\hat{\theta}_{n} \rightarrow \theta_{0}$ in probability.
[Hint: Almost every sequence of sample paths $\theta \mapsto \mathbb{M}_{n}(\theta, \omega)$ is uniformly bounded and uniformly equicontinuous on compacta. By the Arzelà-Ascoli theorem almost every sequence is relatively compact for the topology of uniform convergence on compacta. Conclude that the sequence $\left\|\mathbb{M}_{n}-\mathbb{M}\right\|_{K}$ converges to zero in probability for every compact $K$. Apply part (ii) of Corollary 3.2.3.]
4. (Consistency and concave criterion functions) Let $\Theta$ be a subset of Euclidean space and $\mathbb{M}_{n}$ be separable stochastic processes that converge pointwise in probability to a fixed function $\mathbb{M}$. Let every $\mathbb{M}_{n}$ and $\mathbb{M}$ be strictly concave, and let the unique maximizer $\theta_{0}$ of $\mathbb{M}$ be an interior point of $\Theta$. If $\hat{\theta}_{n}$ (nearly) maximizes $\theta \mapsto \mathbb{M}_{n}(\theta)$, then $\hat{\theta}_{n}$ converges in probability to $\theta_{0}$.
[Hint: A sequence of concave functions $M_{n}$ that converges pointwise on an open set automatically converges uniformly on every compact subset. In particular, it converges uniformly on a sufficiently small ball around the unique maximizer $\theta_{0}$ of the limit $M$. Since $M$ is continuous, the value $M\left(\theta_{0}\right)$ is strictly larger than its maximum value on the edge of the ball. This implies that for each sufficiently large $n$ the functions $M_{n}$ have a local maximum in this ball. A concave function has no point of local maxima besides the point of global maximum. Conclude that the sequence $\hat{\theta}_{n}$ is $O_{P}(1)$ and apply part (ii) of Corollary 3.2.3. (The uniform convergence on compacta is a consequence of the fact that a concave function on an open set is automatically Lipschitz on every closed set inside the domain with Lipschitz constant depending on the supremum of the function over the open set and the distance from the closed set to the complement of the open set. Thus, the concavity in this problem is mostly used to obtain the uniform tightness of $\hat{\theta}_{n}$. The consistency follows from the more general argument of the preceding problem.)]
5. Let $\{\mathbb{Z}(h): h \in \mathbb{R}\}$ be a standard two-sided Brownian motion with $\mathbb{Z}(0)=$ 0 . (The process is zero-mean Gaussian and the increment $Z(g)-Z(h)$ has variance $|g-h|$.) Then $\operatorname{argmax}_{h}\left\{a \mathbb{Z}(h)-b h^{2}-c h\right\}$ is equal in distribution to $(a / b)^{2 / 3} \operatorname{argmax}_{g}\left\{\mathbb{Z}(g)-g^{2}\right\}-\frac{1}{2} c / b$. Here $a, b$, and $c$ are positive constants.
[Hint: The process $z \mapsto \mathbb{Z}(\sigma h-\mu)$ is equal in distribution to the process $h \mapsto \sqrt{\sigma} \mathbb{Z}(h)-\mathbb{Z}(\mu)$. Apply the change of variable $h \mapsto(a / b)^{2 / 3} g-\frac{1}{2} c / b$ and note that the location of a maximum does not change by multiplication by a positive constant or a vertical shift.]

## 3.3

## Z-Estimators

Let the parameter set $\Theta$ be a subset of a Banach space, and let

$$
\Psi_{n}: \Theta \mapsto \mathbb{L}, \quad \Psi: \Theta \mapsto \mathbb{L}
$$

be random maps and a deterministic map, respectively, with values in another Banach space $\mathbb{L}$. Here "random maps" means that each $\Psi_{n}(\theta)$ is defined on the product of $\Theta$ and some probability space. The dependence on the probability space is suppressed in the notation.

In this chapter we prove asymptotic normality of "estimators" $\hat{\theta}_{n}$ that (approximately) satisfy the equation

$$
\Psi_{n}\left(\hat{\theta}_{n}\right)=0
$$

Such estimators will be referred to as $Z$-estimators.
If $\mathbb{L}$ is an $\ell^{\infty}(\mathcal{H})$-space, as can be assumed without loss of generality, the equation is equivalent to the collection of (real-valued) estimating equations $\Psi_{n}\left(\hat{\theta}_{n}\right) h=0$, when $h$ runs through $\mathcal{H}$. If $\theta$ is finite-dimensional, then the number of estimating equations is typically chosen equal to the dimension, and the space $\ell^{\infty}(\mathcal{F})$ can be identified with Euclidean space. In the case of an infinite-dimensional parameter, infinitely many estimating equations may be used. Letting $\Psi$ be the "asymptotic version" of $\Psi_{n}$ as $n$ tends to infinity, we may hope that $\hat{\theta}_{n}$ tends to a value $\theta_{0}$ satisfying

$$
\Psi\left(\theta_{0}\right)=0
$$

In the following, "consistency" $\hat{\theta}_{n} \xrightarrow{\mathrm{P} *} \theta_{0}$ is assumed from the start. We study conditions under which $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ converges in distribution.

The set $\Theta$ should be chosen to contain the "true value" $\theta_{0}$ and the possible values of the estimators $\hat{\theta}_{n}$, at least asymptotically. The estimators must be defined on the same probability space as the criterion maps $\Psi_{n}$. They need not be defined by the estimating equation and need not be measurable. Also, $\theta_{0}$ need not be an interior point of the parameter set $\Theta$ and $\Theta$ need not be a linear space.

We assume that the map $\Psi$ is Fréchet-differentiable at $\theta_{0}$. This entails that

$$
\left\|\Psi(\theta)-\Psi\left(\theta_{0}\right)-\dot{\Psi}_{\theta_{0}}\left(\theta-\theta_{0}\right)\right\|=o\left(\left\|\theta-\theta_{0}\right\|\right),
$$

as $\theta \rightarrow \theta_{0}$ within $\Theta$, for a continuous, linear, one-to-one map $\dot{\Psi}_{\theta_{0}}: \operatorname{lin} \Theta \mapsto \mathbb{L}$. We also make the crucial assumption that the inverse $\dot{\Psi}_{\theta_{0}}^{-1}$ of the derivative exists and is continuous on the range of $\dot{\Psi}_{\theta_{0}}$. A linear operator on a finitedimensional space is automatically continuous; in this case the assumption is simply that $\theta \mapsto \Psi(\theta)$ is differentiable at $\theta_{0}$ with a nonsingular derivative matrix $\dot{\Psi}_{\theta_{0}}$. In the infinite-dimensional case, the assumption that the derivative $\dot{\Psi}_{\theta_{0}}$ is continuously invertible is harder to ascertain. If the inverse $\dot{\Psi}_{\theta_{0}}^{-1}$ is continuous on the range of $\dot{\Psi}_{\theta_{0}}$, then it has a unique continuous extension to the closure of this range. This will also be denoted $\dot{\Psi}_{\theta_{0}}^{-1}$ and is the inverse of the unique continuous extension of $\dot{\Psi}_{\theta_{0}}$ to the closure of $\operatorname{lin} \Theta$.
3.3.1 Theorem. Let $\Psi_{n}$ and $\Psi$ be random maps and a fixed map, respectively, from $\Theta$ into a Banach space such that

$$
\begin{equation*}
\sqrt{n}\left(\Psi_{n}-\Psi\right)\left(\hat{\theta}_{n}\right)-\sqrt{n}\left(\Psi_{n}-\Psi\right)\left(\theta_{0}\right)=o_{P}^{*}\left(1+\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right), \tag{3.3.2}
\end{equation*}
$$

and such that the sequence $\sqrt{n}\left(\Psi_{n}-\Psi\right)\left(\theta_{0}\right)$ converges in distribution to a tight random element $Z$. Let $\theta \mapsto \Psi(\theta)$ be Fréchet-differentiable at $\theta_{0}$ with a continuously invertible derivative $\Psi_{\theta_{0}}$. If $\Psi\left(\theta_{0}\right)=0$ and $\hat{\theta}_{n}$ satisfies $\Psi_{n}\left(\hat{\theta}_{n}\right)=o_{P}^{*}\left(n^{-1 / 2}\right)$ and converges in outer probability to $\theta_{0}$, then

$$
\sqrt{n} \dot{\Psi}_{\theta_{0}}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\sqrt{n}\left(\Psi_{n}-\Psi\right)\left(\theta_{0}\right)+o_{P *}(1) .
$$

Consequently, $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right) \rightsquigarrow-\dot{\Psi}_{\theta_{0}}^{-1} Z$. If it is known that the sequence $\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|$ is asymptotically tight, then the first conclusion is valid without the assumption of continuous invertibility of $\dot{\Psi}_{\theta_{0}}$. If it is known that $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically tight, then it suffices that $\Psi$ is Hadamarddifferentiable.

Proof. By the definition of $\hat{\theta}_{n}$

$$
\begin{align*}
\sqrt{n}\left(\Psi\left(\hat{\theta}_{n}\right)-\Psi\left(\theta_{0}\right)\right) & =\sqrt{n}\left(\Psi\left(\hat{\theta}_{n}\right)-\Psi_{n}\left(\hat{\theta}_{n}\right)\right)+o_{P}^{*}(1)  \tag{3.3.3}\\
= & -\sqrt{n}\left(\Psi_{n}-\Psi\right)\left(\theta_{0}\right)+o_{P}^{*}\left(1+\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right)
\end{align*}
$$

by the first displayed assumption of the theorem. Since the derivative $\dot{\Psi}_{\theta_{0}}$ is continuously invertible, there exists a positive constant $c$ such that
$\left\|\dot{\Psi}_{\theta_{0}}\left(\theta-\theta_{0}\right)\right\| \geq c\left\|\theta-\theta_{0}\right\|$ for every $\theta$ and $\theta_{0}$. This can be combined with the differentiability of $\Psi$ to yield

$$
\left\|\Psi(\theta)-\Psi\left(\theta_{0}\right)\right\| \geq c\left\|\theta-\theta_{0}\right\|+o\left(\left\|\theta-\theta_{0}\right\|\right)
$$

Apply this to (3.3.3) to find that

$$
\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\left(c+o_{P}(1)\right) \leq O_{P}(1)+o_{P}\left(1+\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) .
$$

This implies that the sequence $\hat{\theta}_{n}$ is $\sqrt{n}$-consistent for $\theta_{0}$ in norm. By the differentiability of $\Psi$, the left side of (3.3.3) can be replaced by

$$
\sqrt{n} \dot{\Psi}_{\theta_{0}}\left(\hat{\theta}_{n}-\theta_{0}\right)+o_{P}^{*}\left(\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) .
$$

The last term is $o_{P}(1)$ as is the remainder on the right side of (3.3.3). The second assertion of the theorem follows. Next the continuity of $\dot{\Psi}_{\theta_{0}}^{-1}$ and the continuous mapping theorem give the weak convergence of the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$.

Under the additional assumptions on the sequence $\hat{\theta}_{n}$, the preceding proof can be simplified.

The preceding theorem separates the conditions for asymptotic normality into the stochastic condition (3.3.2), which requires that the remainder in a Taylor expansion is negligible, and analytical conditions on the asymptotic criterion function $\Psi$.

In the case of i.i.d. observations the theorem may be applied with $\Psi_{n}(\theta) h=\mathbb{P}_{n} \psi_{\theta, h}$ and $\Psi(\theta) h=P \psi_{\theta, h}$ for given measurable functions $\psi_{\theta, h}$ indexed by $\Theta$ and an arbitrary index set $\mathcal{H}$. In this case $\sqrt{n}\left(\Psi_{n}-\Psi\right)(\theta)= \left\{\mathbb{G}_{n} \psi_{\theta, h}: h \in \mathcal{H}\right\}$ is the empirical process indexed by the class of functions $\left\{\psi_{\theta, h}: h \in \mathcal{H}\right\}$. Then the stochastic condition reduces to

$$
\begin{equation*}
\left\|\mathbb{G}_{n}\left(\psi_{\hat{\theta}_{n}, h}-\psi_{\theta_{0}, h}\right)\right\|_{\mathcal{H}}=o_{P}^{*}\left(1+\sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|\right) . \tag{3.3.4}
\end{equation*}
$$

It is a stronger condition to require that the left-hand side is $o_{P}^{*}(1)$. The following lemma gives a simple sufficient condition.
3.3.5 Lemma. Suppose that the class of functions

$$
\left\{\psi_{\theta, h}-\psi_{\theta_{0}, h}:\left\|\theta-\theta_{0}\right\|<\delta, h \in \mathcal{H}\right\}
$$

is $P$-Donsker for some $\delta>0$ and that

$$
\sup _{h \in \mathcal{H}} P\left(\psi_{\theta, h}-\psi_{\theta_{0}, h}\right)^{2} \rightarrow 0, \quad \theta \rightarrow \theta_{0}
$$

If $\hat{\theta}_{n}$ converges in outer probability to $\theta_{0}$, then (3.3.4) is satisfied.
Proof. Without loss of generality, assume that $\hat{\theta}_{n}$ takes its values in $\Theta_{\delta}= \left\{\theta:\left\|\theta-\theta_{0}\right\|<\delta\right\}$. Define a function $f: \ell^{\infty}\left(\Theta_{\delta} \times \mathcal{H}\right) \times \Theta_{\delta} \mapsto \ell^{\infty}(\mathcal{H})$ by
$f(z, \theta) h=z(\theta, h)$. This function is continuous at every point $\left(z, \theta_{0}\right)$ such that $\left\|z(\theta, h)-z\left(\theta_{0}, h\right)\right\|_{\mathcal{H}} \rightarrow 0$ as $\theta \rightarrow \theta_{0}$.

Define a stochastic process $Z_{n}$ indexed by $\Theta_{\delta} \times \mathcal{H}$ by

$$
Z_{n}(\theta, h)=\mathbb{G}_{n}\left(\psi_{\theta, h}-\psi_{\theta_{0}, h}\right)
$$

By assumption, the sequence $Z_{n}$ converges in $\ell^{\infty}\left(\Theta_{\delta} \times \mathcal{H}\right)$ to a tight Gaussian process $Z$. This process has continuous sample paths with respect to the semimetric $\rho$ given by

$$
\rho^{2}\left(\left(\theta_{1}, h_{1}\right),\left(\theta_{2}, h_{2}\right)\right)=P\left(\psi_{\theta_{1}, h_{1}}-\psi_{\theta_{0}, h_{1}}-\psi_{\theta_{2}, h_{2}}+\psi_{\theta_{0}, h_{2}}\right)^{2}
$$

By assumption, $\left.\sup _{h} \rho(\theta, h),\left(\theta_{0}, h\right)\right) \rightarrow 0$ if $\theta \rightarrow \theta_{0}$. Conclude that the function $f$ is continuous at almost all sample paths of $Z$.

By Slutszky's lemma, $\left(Z_{n}, \hat{\theta}_{n}\right) \rightsquigarrow\left(Z, \theta_{0}\right)$. By the continuous mapping theorem, $Z_{n}\left(\hat{\theta}_{n}\right)=f\left(Z_{n}, \hat{\theta}_{n}\right) \rightsquigarrow f\left(Z, \theta_{0}\right)=0$ in $\ell^{\infty}(\mathcal{H})$.

It appears that the conditions of the preceding lemma are relatively weak. In the case of infinite-dimensional parameters, verification of the analytical conditions may require more effort. The assertion of the theorem becomes

$$
\begin{equation*}
\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\dot{\Psi}_{\theta_{0}}^{-1} \mathbb{G}_{n} \psi_{\theta_{0}}+o_{P}^{*}(1) \tag{3.3.6}
\end{equation*}
$$

where $\dot{\Psi}_{\theta_{0}}$ is the derivative of the map $\theta \mapsto P \psi_{\theta}$. Note that $P \psi_{\theta_{0}}=0$ by the "definition" of $\theta_{0}$.
3.3.7 Example (Lipschitz functions). Let $X_{1}, \ldots, X_{n}$ be i.i.d. random variables with common law $P$, and let $\psi_{\theta}$ be measurable vector-valued functions indexed by a Euclidean parameter $\theta$. (Thus, we take $\mathcal{H}$ to be a finite set, whose cardinality is the dimension of $\theta$.) Assume that, for every $\theta_{1}, \theta_{2}$ in a neighborhood of $\theta_{0}$,

$$
\left\|\psi_{\theta_{1}}(x)-\psi_{\theta_{2}}(x)\right\| \leq \dot{\psi}(x)\left\|\theta_{1}-\theta_{2}\right\|
$$

for some measurable function $\dot{\psi}$ with $P \dot{\psi}^{2}<\infty$. Let the map $\theta \mapsto P \psi_{\theta}$ be differentiable at its zero $\theta_{0}$ with a nonsingular derivative. Then the (near) zeros $\hat{\theta}_{n}$ of the map $\theta \mapsto \mathbb{P}_{n} \psi_{\theta}$ satisfy (3.3.6), provided the sequence $\hat{\theta}_{n}$ converges in outer probability to $\theta_{0}$.

This is a consequence of the preceding theorem. The class of functions $\left\{\psi_{\theta}-\psi_{\theta_{0}}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ is Donsker for sufficiently small $\delta>0$, because its bracketing integral is finite. Furthermore, $P\left\|\psi_{\theta}-\psi_{\theta_{0}}\right\|^{2} \leq P \dot{\psi}^{2}\left\|\theta-\theta_{0}\right\|^{2}$ converges to zero as $\theta \rightarrow \theta_{0}$.

The pointwise local Lipschitz condition in the preceding example is satisfied if for each $x$ the map $\theta \mapsto \psi_{\theta}(x)$ is differentiable in a neighborhood of $\theta_{0}$ with derivative matrices $\dot{\psi}_{\theta}(x)$ such that, for some $\delta>0$,

$$
P^{*} \sup _{\left\|\theta-\theta_{0}\right\|<\delta}\left\|\dot{\psi}_{\theta}\right\|^{2}<\infty
$$

This is comparable to the classical condition of domination of derivatives ${ }^{\dagger}$, but it concerns the second moment of the first derivative rather than the first moment of the second derivative. To obtain complete analogy with the classical result, it appears to be necessary to exploit the possibility of the extra term $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ in the remainder of (3.3.2). See the following example.
3.3.8 Example (Classical smoothness). Let $X_{1}, \ldots, X_{n}$ be i.i.d. random variables with common law $P$, and let $\psi_{\theta}$ be measurable vector-valued functions indexed by a parameter $\theta$ ranging over an open subset of Euclidean space. Assume that $P \psi_{\theta_{0}}=0$ and that the map $\theta \mapsto \psi_{\theta}(x)$ is twice continuously differentiable with respect to $\theta$ in a neighborhood of $\theta_{0}$, for each $x$, with derivatives satisfying

$$
P\left\|\dot{\psi}_{\theta_{0}}\right\|^{2}<\infty ; \quad \quad P^{*} \sup _{\left\|\theta-\theta_{0}\right\|<\delta}\left\|\ddot{\psi}_{\theta}\right\|<\infty .
$$

Then the map $\theta \mapsto P \psi_{\theta}$ is differentiable at $\theta_{0}$ with derivative $P \dot{\psi}_{\theta_{0}}$ and the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$ is asymptotically normally distributed provided $\hat{\theta}_{n}$ is consistent for $\theta_{0}$.

A Taylor expansion gives for each $\theta$ that is sufficiently close to $\theta_{0}$

$$
\mathbb{G}_{n}\left(\psi_{\theta}-\psi_{\theta_{0}}\right)=\mathbb{G}_{n} \dot{\psi}_{\theta_{0}}\left(\theta-\theta_{0}\right)+\frac{1}{2}\left(\theta-\theta_{0}\right)^{\prime} \mathbb{G}_{n} \ddot{\psi}_{\tilde{\theta}}\left(\theta-\theta_{0}\right)
$$

for a point $\tilde{\theta}=\tilde{\theta}(\theta, x)$ on the line connecting $\theta$ and $\theta_{0}$. In the quadratic term, the empirical process is applied to the function $x \mapsto \ddot{\psi}_{\tilde{\theta}(\theta, x)}(x)$. Let the function $M$ bound $\left\|\ddot{\psi}_{\theta}\right\|$ for every $\theta$ in a neighborhood of $\theta_{0}$. Then $\left\|\mathbb{G}_{n}\left(\psi_{\hat{\theta}_{n}}-\psi_{\theta_{0}}\right)\right\|$ is bounded by
$\left\|\mathbb{G}_{n} \dot{\psi}_{\theta_{0}}\right\|\left\|\hat{\theta}_{n}-\theta_{0}\right\|+\frac{1}{2}\left\|\hat{\theta}_{n}-\theta_{0}\right\|^{2} \sqrt{n}\left(\mathbb{P}_{n}+P\right) M=o_{P}(1)+o_{P}(1) \sqrt{n}\left\|\hat{\theta}_{n}-\theta_{0}\right\|$,
since the sequence $\left(\mathbb{P}_{n}+P\right) M$ is bounded in probability. Thus (3.3.4) is satisfied.

Our emphasis on Lipschitz conditions on the criterion functions in the preceding examples may give the (wrong) impression that smoothness is necessary for the estimators to be asymptotically normal or the theory of empirical processes to be of help. This is certainly a false impression, as

[^5]should be clear from Lemmas 3.3.5 and 3.2.19. The point is that smoothness permits an easy general method to check the more abstract empirical process conditions, such as that the functions $\psi_{\theta, h}$ are in a Donsker class. In particular examples we can apply all methods and results of Part 2 to verify these conditions; for instance, the stability properties of Chapter 2.10. We include one example to illustrate this.
3.3.9 Example (Median and median deviation). The median and median deviation are $M$-estimators for the location and scale parameter ( $\mu, \sigma$ ) relative to the functions
$$
\psi_{\mu, \sigma}(x)=\left(\operatorname{sign}\left(\frac{x-\mu}{\sigma}\right), \operatorname{sign}\left(\left|\frac{x-\mu}{\sigma}\right|-\beta\right)\right) .
$$

The constant $\beta$ is usually chosen such that the median deviation converges to the standard deviation of some distribution of interest; for instance, $\Phi^{-1}(3 / 4)$ for the normal distribution.

The dependence $(\mu, \sigma) \mapsto \psi_{\mu, \sigma}(x)$ is not Lipschitz. However, the class of functions $\left\{\psi_{\mu, \sigma, 1}, \psi_{\mu, \sigma, 2}: \mu \in \mathbb{R}, \sigma>0\right\}$ can easily be shown to be a Donsker class. The class of functions $x \mapsto(x-\mu) / \sigma$ belongs to a finite-dimensional vector space and hence is a VC-class. Next the stability properties of VCclasses show that the components of $\psi_{\mu, \sigma}$ also run through VC-classes. Since they are uniformly bounded and pointwise separable, they are universally Donsker.

The preceding examples are concerned with finite-dimensional parameters or functionals. The theory of empirical processes is used to carry out the usual linearization argument under better conditions. An important advantage is that cases that require special and separate treatment in the classical approach can be dealt with in a unified manner by using the theory of empirical processes.

The next example shows that empirical processes can also be used successfully to derive properties of estimators in infinitely dimensional models. It is just one out of a number of examples that have been studied recently. These examples cannot be treated by classical methods, and the development of abstract empirical process theory seems to have occurred at the right time for the development of this part of semiparametric statistics.
3.3.10 Example. Suppose one observes a sample $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ from a distribution given formally by the density

$$
\int p_{\theta}(x \mid z) d \eta(z) d \eta(y)
$$

Here the map $x \rightarrow p_{\theta}(x \mid z)$ is for each $z$ a probability density with respect to a measure $\mu$ on some measurable space $(\mathcal{X}, \mathcal{A})$, which is known up to a parameter $\theta$ ranging over an open subset $\Theta$ of Euclidean space. The second
parameter $\eta$ is a completely unknown probability distribution on a measurable space $(\mathcal{Z}, \mathcal{C})$. Write $p_{\theta}(x \mid \eta)$ for the mixture density $\int p_{\theta}(x \mid z) d \eta(z)$.

Consider the asymptotic behavior of the maximum likelihood estimator $(\hat{\theta}, \hat{\eta})$ of $(\theta, \eta)$ defined as the maximizer of the "likelihood"

$$
(\theta, \eta) \rightarrow \prod_{i=1}^{n} p_{\theta}\left(X_{i} \mid \eta\right) \prod_{i=1}^{n} \eta\left\{Y_{i}\right\}
$$

This combines the usual likelihood of the first sample, the joint density of the observations, with the "nonparametric" likelihood of the second sample, the product of the point masses $\eta\left\{Y_{i}\right\}$ of the observations. In this semiparametric set-up, we are mostly interested in estimating $\theta$.

A proof of the asymptotic normality of the sequence of maximum likelihood estimators may proceed by showing that a maximum likelihood estimator solves a collection of (likelihood) equations and next apply Theorem 3.3.1. This method applies to many different kernels. Consider in particular the case that $p_{\theta}(x \mid z)=\phi((x-z) / \theta) / \theta$. Then the observations are a sample $X_{1}, \ldots, X_{n}$ from the model $X=Z+\theta e$ for an (unobserved) standard normal error variable $e$ and an (unobserved) independent variable $Z$ with distribution $\eta$ and in addition a sample $Y_{1}, \ldots, Y_{n}$ without measurement error; that is with the same distribution as $Z$. We can think of this as observing one sample from the distribution of $Z$ itself and an additional sample corrupted by normal measurement error. In this special example take the parameter set $\Theta$ and $\mathcal{Z}$ to be compact intervals in ( $0, \infty$ ).

Likelihood equations corresponding to $\theta$ can be obtained in the usual manner by partial differentiation of the loglikelihood with respect to $\theta$ at $\hat{\theta}$. For simplicity, assume that $\theta$ is one-dimensional. Then we obtain

$$
\mathbb{P}_{n} \dot{\ell}_{\hat{\theta}, \hat{\eta}}=0
$$

where $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{\left(X_{i}, Y_{i}\right)}$ is the empirical measure of the observations and $\dot{\ell}_{\theta, \eta}$ is the score function for $\theta$ of the mixture model. This can be expressed in the score functions $\dot{\ell}_{\theta}(x \mid z)=\partial / \partial \theta \log p_{\theta}(x \mid z)$ of the conditional models by

$$
\dot{\ell}_{\theta, \eta}(x, y)=\frac{\int \dot{\ell}_{\theta}(x \mid z) p_{\theta}(x \mid z) d \eta(z)}{p_{\theta}(x \mid \eta)}
$$

Likelihood equations corresponding to the infinite-dimensional parameter $\eta$ can be obtained by inserting one-dimensional submodels $t \rightarrow \hat{\eta}_{t}$ passing through $\hat{\eta}$ in the loglikelihood and differentiating with respect to $t$. In particular, given a bounded, measurable function $h$ and every sufficiently small number $|t|$, we can define a probability measure $\hat{\eta}_{t}$ by

$$
d \hat{\eta}_{t}=\left(1+t\left(h-\int h d \hat{\eta}\right)\right) d \hat{\eta}
$$

This leads to the likelihood equation

$$
\mathbb{P}_{n} A_{\hat{\theta}, \hat{\eta}} h-P_{\hat{\theta}, \hat{\eta}} A_{\hat{\theta}, \hat{\eta}} h=0
$$

where $A_{\theta, \eta}$ are the "score operators" given by

$$
A_{\theta, \eta} h(x, y)=B_{\theta, \eta} h(x)+h(y)=\frac{\int h(z) p_{\theta}(x \mid z) d \eta(z)}{p_{\theta}(x \mid \eta)}+h(y) .
$$

The operators $B_{\theta, \eta}$ are the score operators for the mixture part of the model.

Let $H$ be the set of all functions $h: \mathcal{Z} \rightarrow[0,1]$ with $\|h\|_{\text {lip }} \leq 1$, the positive part of the unit ball of the space $C^{1}(\mathcal{Z})$ considered in Chapter 2.7. For each $h \in H$ the maximum likelihood estimator satisfies the equation as derived previously. Let $\Psi_{n}(\theta, \eta)=\left(\Psi_{n 1}(\theta, \eta), \Psi_{n 2}(\theta, \eta)\right)$ be the element of $\mathbb{R} \times \ell^{\infty}(H)$ given by

$$
\Psi_{n 1}(\theta, \eta)=\mathbb{P}_{n} \dot{\ell}_{\theta, \eta} ; \quad \Psi_{n 2}(\theta, \eta) h=\mathbb{P}_{n} A_{\theta, \eta} h-P_{\theta, \eta} A_{\theta, \eta} h .
$$

The map $h \rightarrow \Psi_{n 2}(\theta, \eta) h$ is indeed uniformly bounded on $H$, because the conditional expectation operator $B_{\theta, \eta}$ retains boundedness: $0 \leq B_{\theta, \eta} h \leq 1$ for every $h \in H$. The expectation of $\Psi_{n}(\theta, \eta)$ under the true distribution $P_{0}=P_{\theta_{0}, \eta_{0}}$ is the element $\Psi(\theta, \eta)=\left(\Psi_{1}(\theta, \eta), \Psi_{2}(\theta, \eta)\right)$ of $\mathbb{R} \times \ell^{\infty}(H)$ given by

$$
\Psi_{1}(\theta, \eta)=P_{0} \dot{\ell}_{\theta, \eta} ; \quad \Psi_{2}(\theta, \eta) h=P_{0} A_{\theta, \eta} h-P_{\theta, \eta} A_{\theta, \eta} h .
$$

The maximum likelihood estimator ( $\hat{\theta}_{n}, \hat{\eta}_{n}$ ) and the true value ( $\theta_{0}, \eta_{0}$ ) are zeros of these maps, respectively:

$$
\Psi_{n}\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right) \equiv 0 ; \quad \Psi\left(\theta_{0}, \eta_{0}\right) \equiv 0
$$

We identify each probability measure $\eta$ with an element of $\ell^{\infty}(H)$ through $\eta h=\int h d \eta$. Then both $\Psi_{n}$ and $\Psi$ can be viewed as maps from the space $\mathbb{R} \times \ell^{\infty}(H)$ into itself whose domain is the product of $\Theta$ and the set of probability measures in $\ell^{\infty}(H)$ under the given identification. The present choice of $H$ is appropriate for our special example (and many other examples) but should be replaced by a different choice whenever convenient.

The remainder of this example is concerned with checking the conditions of Theorem 3.3.1, particularly for our special example involving a normal measurement error model.

The consistency of the sequence $\left(\hat{\theta}_{n}, \hat{\eta}_{n}\right)$ may be proved by the method of Wald or by a method using empirical processes. This requires some regularity conditions on the kernel $z \mapsto p_{\theta}(x \mid z)$. We omit a discussion.

In the present case the process $\sqrt{n}\left(\Psi_{n}-\Psi\right)$ takes the form

$$
\sqrt{n}\left(\Psi_{n}-\Psi\right)(\theta, \eta)=\left(\sqrt{n}\left(\mathbb{P}_{n}-P_{0}\right) \dot{\ell}_{\theta, \eta}, \sqrt{n}\left(\mathbb{P}_{n}-P_{0}\right) A_{\theta, \eta} \cdot\right) .
$$

The right side is the empirical process indexed by the class of functions $\left\{A_{\theta, \eta} h: h \in H\right\} \cup\left\{\dot{\ell}_{\theta, \eta}\right\}$. In view of the discussion following the proof of

Theorem 3.3.1, condition (3.3.2) of this theorem is certainly satisfied if, for some $\delta>0$,

$$
\begin{align*}
& \text { 1) }\left\{A_{\theta, \eta} h: h \in H,\left\|\theta-\theta_{0}\right\|+\left\|\eta-\eta_{0}\right\|<\delta\right\} \quad \text { is } P_{0} \text {-Donsker, }  \tag{3.3.11}\\
& \sup _{h \in H} P_{0}\left(A_{\theta, \eta} h-A_{0} h\right)^{2}+P_{0}\left(\dot{\ell}_{\theta, \eta}-\dot{\ell}_{0}\right)^{2} \rightarrow 0, \quad \theta \rightarrow \theta_{0}, \eta \rightarrow \eta_{0} .
\end{align*}
$$

In view of the dominated convergence theorem, the last condition is valid if $A_{\theta, \eta} h \rightarrow A_{0} h$ and $\dot{\ell}_{\theta, \eta} \rightarrow \dot{\ell}_{0}$ pointwise, uniformly in $h$.

It is hard to characterize condition (3.3.11) directly in terms of the kernel $p_{\theta}(x \mid z)$. In fact, different kernels may require different approaches. Consider the case that the kernel is a smooth function on Euclidean space. Then the functions $x \mapsto B_{\theta, \eta} h(x)$ will be smooth functions as well and Theorem 2.10.24 may be appropriate. If the tail of $P_{0}$ is not too large and $\mathcal{X}$ is a subset of $\mathbb{R}^{d}$, then a uniform $\alpha$-smoothness condition on the functions $x \mapsto B_{\theta, \eta} h(x)$ for some $\alpha>d / 2$ is sufficient. Under appropriate conditions on the map $x \rightarrow p_{\theta}(x \mid z)$, straightforward differentiation yields

$$
\frac{\partial}{\partial x_{i}} B_{\theta, \eta} h(x)=\operatorname{cov}_{x}\left(h(Z), \frac{\partial}{\partial x_{i}} \log p_{\theta}(x \mid Z)\right),
$$

where for each $x$ the covariance is computed for the random variable $Z$ having the (conditional) density $z \rightarrow p_{\theta}(x \mid z) d \eta(z) / p_{\theta}(x \mid \eta)$. Thus, for a given bounded function $h$,

$$
\left|\frac{\partial}{\partial x_{i}} B_{\theta, \eta} h(x)\right| \leq\|h\|_{\infty} \frac{\int\left|\partial / \partial x_{i} \log p_{\theta}(x \mid z)\right| p_{\theta}(x \mid z) d \eta(z)}{\int p_{\theta}(x \mid z) d \eta(z)} .
$$

Depending on the function $\partial / \partial x_{i} \log p_{\theta}(x \mid z)$, this leads to a bound on the first derivative and hence on the Lipschitz norm of order 1 of the function $x \rightarrow B_{\theta, \eta} h(x)$. If $\mathcal{X}$ is equal to $\mathbb{R}$, then this is sufficient for the applicability of Theorem 2.10.24. In our example we have $\left|\partial / \partial x \log p_{\theta}(x \mid z)\right|=|x-z| / \theta^{2}$, which is bounded by a constant times $|x|$ for $\theta$ in a neighborhood of $\theta_{0}$ and $\eta$ ranging over probability measures on a fixed interval. Since the tails of $P_{0}$ are Gaussian, the function $|x|$ has the required integrability properties and Theorem 2.10.24 implies that (3.3.11) is satisfied.

If $\mathcal{X}$ is a subset of a higher-dimensional Euclidean space, then the same conclusion may be reached by consideration of higher-order derivatives.

The remaining conditions of Theorem 3.3.1 are the differentiability of the map $\Psi$ and the continuity of the inverse of the derivative. For convenience of notation, we introduce the Hilbert-space adjoint $B_{\theta, \eta}^{*}$ of the operator $B_{\theta, \eta}: L_{2}(\eta) \rightarrow L_{2}\left(p_{\theta}(\cdot \mid \eta)\right)$ given by

$$
B_{\theta, \eta}^{*} g(z)=\int g(x) p_{\theta}(x \mid z) d \mu(x)
$$

The range of the operator $A_{\theta, \eta}$ is contained in the subset $G$ of $L_{2}\left(p_{\theta}(\cdot \mid \eta) \times\right. \eta)$ consisting of functions of the form $(x, y) \rightarrow g_{1}(x)+g_{2}(y)+c$. The
representation of a function of this type is unique if both $g_{1}$ and $g_{2}$ are taken to be zero-mean functions. The adjoint of the operator $A_{\theta, \eta}: L_{2}(\eta) \rightarrow G$ is given by $A_{\theta, \eta}^{*}\left(g_{1}+g_{2}+c\right)=B_{\theta, \eta}^{*} g_{1}+g_{2}+2 c$. On the set of zero-mean functions in $L_{2}(\eta)$, we have the identity $A_{\theta, \eta}^{*} A_{\theta, \eta}=I+B_{\theta, \eta}^{*} B_{\theta, \eta}$.

Informally, the derivative $\dot{\Psi}=\left(\dot{\Psi}_{1}, \dot{\Psi}_{2}\right)$ of the map $\Psi$ at $\left(\theta_{0}, \eta_{0}\right)$ can be derived as follows. First,

$$
\begin{aligned}
\Psi_{1}(\theta, \eta) & -\Psi_{1}\left(\theta_{0}, \eta_{0}\right)=P_{0}\left(\dot{\ell}_{\theta, \eta}-\dot{\ell}_{0}\right) \\
& \approx\left(\theta-\theta_{0}\right) P_{0} \ddot{\ell}_{0}+\iint\left(\dot{\ell}_{0}(x \mid z)-\dot{\ell}_{0}(x)\right) p_{0}(x \mid z) d \mu(x) d\left(\eta-\eta_{0}\right)(z)
\end{aligned}
$$

Under regularity conditions, $P_{0} \ddot{\ell}_{0}=-I_{0}$ is minus the Fisher information for $\theta$ in the situation when $\eta=\eta_{0}$ is known and the expectation $\int \dot{\ell}_{0}(x \mid z) p_{0}(x \mid z) d \mu(x)=0$ for every $z$. Then the last line can be rewritten as

$$
-I_{0}\left(\theta-\theta_{0}\right)-\int B_{0}^{*} \dot{\ell}_{0} d\left(\eta-\eta_{0}\right)
$$

The derivative of the second component of $\Psi$ can be obtained in a similar way. Uniformly in $h$,

$$
\begin{aligned}
\Psi_{2}(\theta, h) h- & \Psi_{2}\left(\theta_{0}, \eta_{0}\right) h=-\int A_{\theta, \eta} h d\left(P_{\theta, \eta}-P_{0}\right) \\
& \approx-\int A_{0} h d\left(P_{\theta, \eta}-P_{0}\right) \\
& \approx-\left(\theta-\theta_{0}\right) \int A_{0} h \dot{\ell}_{0} d P_{0}-\int\left(I+B_{0}^{*} B_{0}\right) h d\left(\eta-\eta_{0}\right)
\end{aligned}
$$

The combination of the preceding displays suggests that the derivative of $\Psi$ at $\left(\theta_{0}, \eta_{0}\right)$ is given by the map

$$
\left(\theta-\theta_{0}, \eta-\eta_{0}\right) \rightarrow\left(\begin{array}{ll}
\dot{\Psi}_{11} & \dot{\Psi}_{12} \\
\dot{\Psi}_{21} & \dot{\Psi}_{22}
\end{array}\right)\binom{\theta-\theta_{0}}{\eta-\eta_{0}}
$$

where

$$
\begin{aligned}
\dot{\Psi}_{11}\left(\theta-\theta_{0}\right) & =-I_{0}\left(\theta-\theta_{0}\right) \\
\dot{\Psi}_{12}\left(\eta-\eta_{0}\right) & =-\int B_{0}^{*} \dot{\ell}_{0} d\left(\eta-\eta_{0}\right) \\
\dot{\Psi}_{21}\left(\theta-\theta_{0}\right) h & =-P_{0} A_{0} h \dot{\ell}_{0}\left(\theta-\theta_{0}\right) \\
\dot{\Psi}_{22}\left(\eta-\eta_{0}\right) h & =-\int\left(I+B_{0}^{*} B_{0}\right) h d\left(\eta-\eta_{0}\right)(z)
\end{aligned}
$$

The derivation can be made rigorous under regularity conditions. We omit the somewhat tedious verification in our concrete example.

Theorem 3.3.1 requires that the derivative operator be continuously invertible on the linear span of the domain of $\Psi$. This can be verified by
ascertaining the continuous invertibility of the two operators $\dot{\Psi}_{11}$ and $\dot{V}= \dot{\Psi}_{22}-\dot{\Psi}_{21} \dot{\Psi}_{11}^{-1} \dot{\Psi}_{12}$. In that case we have

$$
\dot{\Psi}^{-1}=\left(\begin{array}{cc}
\dot{\Psi}_{11}^{-1}\left(\dot{\Psi}_{11}+\dot{\Psi}_{12} \dot{V}^{-1} \dot{\Psi}_{21}\right) \dot{\Psi}_{11}^{-1} & -\dot{\Psi}_{11}^{-1} \Psi_{12} \dot{V}^{-1} \\
-\dot{V}^{-1} \dot{\Psi}_{21} \dot{\Psi}_{11}^{-1} & \dot{V}^{-1}
\end{array}\right) .
$$

The operator $\dot{\Psi}_{11}$ is continuously invertible provided the Fisher information for $\theta$ is positive. The second operator has the form

$$
\dot{V}\left(\eta-\eta_{0}\right) h=-\int\left[\left(I+B_{0}^{*} B_{0}\right) h-\frac{P_{0} A_{0} h \dot{\ell}_{0}}{I_{0}} B_{0}^{*} \dot{\ell}_{0}\right] d\left(\eta-\eta_{0}\right) .
$$

This operator is certainly continuously invertible if there exists a positive number $\epsilon$ such that

$$
\left\{\left(I+B_{0}^{*} B_{0}\right) h-\frac{P_{0} A_{0} h \dot{\ell}_{0}}{I_{0}} B_{0}^{*} \dot{\ell}_{0}: h \in H\right\} \supset \epsilon H .
$$

In many examples, including our concrete example, this can be ascertained by using the theory of Fredholm operators. An operator of the form $I+K$ from a Banach space in itself, where $K$ is compact, is continuously invertible if and only if it is one-to-one. ${ }^{\ddagger}$ In the present situation, consider the operator $K$ given by

$$
K h=B_{0}^{*} B_{0} h-\frac{P_{0} A_{0} h \dot{\ell}_{0}}{I_{0}} B_{0}^{*} \dot{\ell}_{0}
$$

If the maps $z \rightarrow p_{\theta_{0}}(x \mid z)$ are sufficiently smooth, as is the case in our example, then the operator $B_{0}^{*}: C^{1}(\mathcal{Z}) \rightarrow C^{1}(\mathcal{Z})$ can be seen to be compact by the Arzelà-Ascoli theorem. Consequently, $B_{0}^{*} B_{0}$ is a compact operator from $C^{1}(\mathcal{Z})$ into itself. The second part of $K$ is compact, because it has a one-dimensional range. Finally, it suffices to show that $I+K$ is one-to-one. The spectrum of the self-adjoint operator $I+B_{0}^{*} B_{0}: L_{2}\left(\eta_{0}\right) \rightarrow L_{2}\left(\eta_{0}\right)$ is contained in $[1, \infty)$. Hence this operator is continuously invertible in the Hilbert-space sense. The equation

$$
\begin{equation*}
h+B_{0}^{*} B_{0} h-\frac{P_{0} A_{0} h \dot{\ell}_{0}}{I_{0}} B_{0}^{*} \dot{\ell}_{0}=0 \tag{3.3.12}
\end{equation*}
$$

can be solved to give either

$$
P_{0} A_{0} h \dot{\ell}_{0}=0 \quad \text { or } \quad P_{0}\left(A_{0}\left(I+B_{0}^{*} B_{0}\right)^{-1} B_{0}^{*} \dot{\ell}_{0}\right) \dot{\ell}_{0}=I_{0} .
$$

The efficient Fisher information for $\theta$ is by definition the square length of the projection of $\dot{\ell}_{0}$ on the orthocomplement of the range of $A_{0}$. This is positive in most examples, including the present one. The function $A_{0}(I+ \left.B_{0}^{*} B_{0}\right)^{-1} B_{0}^{*} \dot{\ell}_{0}=A_{0}\left(A_{0}^{*} A_{0}\right)^{-1} A_{0}^{*} \dot{\ell}_{0}$ is the projection of $\dot{\ell}_{0}$ onto the range of $A_{0}$. Hence the difference of the right and the left sides of the second equation in the preceding display is the efficient Fisher information, which

[^6]is nonzero. If the first expression in the display is zero, then we find that (3.3.12) reduces to $h+B_{0}^{*} B_{0} h=0$, whence $h=0$ almost surely under $\eta_{0}$. Reinsert this into equation (3.3.12) to find that $h$ is zero pointwise. This concludes the proof of the continuous invertibility of the operator $I+K$ and hence of the continuous invertibility of $\dot{\Psi}_{0}$.

Thus, all conditions of Theorem 3.3.1 have been verified. We conclude that the sequence $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}, \hat{\eta}_{n}-\eta_{0}\right)$ is asymptotically normal in the space $\mathbb{R} \times \ell^{\infty}(H)$. In particular, the sequence of prime interest, $\sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)$, is asymptotically normal with mean zero and variance $P_{0}\left(\dot{\ell}_{0}-A_{0}\left(A_{0}^{*} A_{0}\right)^{-1} \dot{\ell}_{0}\right)^{2}$.

## 3.4

## Rates of Convergence

This chapter gives some results on rates of convergence of $M$-estimators, including maximum likelihood estimators and least-squares estimators. We first state an abstract result, which is a generalization of the theorem on rates of convergence in Chapter 3.2, and next discuss some methods to establish the maximal inequalities needed for the application of this result. Our main interest is in $M$-estimators of infinite-dimensional parameters.

In the introduction the parameter set is denoted $\Theta$ and may be thought of as a semimetric space $\Theta$ with semimetric $d$. We consider sieved $M$ estimators, sieves $\Theta_{n}$ being a sequence of subsets of the parameter space. Let $\mathbb{P}_{n}$ denote the empirical measure of observations $X_{1}, X_{2}, \ldots, X_{n}$ taking their values in a measurable space ( $\mathcal{X}, \mathcal{A}$ ). Given measurable maps $m_{n, \theta}: \mathcal{X} \mapsto \mathbb{R}$, "estimators" $\hat{\theta}_{n}$ are maps defined on $\mathcal{X}^{n}$ with values in the sieve $\Theta_{n}$, such that, for certain parameters $\theta_{n}$,

$$
\mathbb{P}_{n} m_{n, \hat{\theta}_{n}} \geq \mathbb{P}_{n} m_{n, \theta_{n}}
$$

The estimators may be thought of as maximizing the random criterion function $\theta \mapsto \mathbb{P}_{n} m_{n, \theta}$ over $\Theta_{n}$. Then the preceding display is valid for every $\theta_{n} \in \Theta_{n}$. However, in the following it is not assumed that $\hat{\theta}_{n}$ is defined as a maximizer of $\theta \mapsto \mathbb{P}_{n} m_{n, \theta}$. In fact, in the examples, the map $\theta \mapsto \mathbb{P}_{n} m_{n, \theta}$ is often not observable. In these examples, $\hat{\theta}_{n}$ satisfies the property as in the preceding display in virtue of the fact that it maximizes another criterion function, which is observable.

Generally, for the estimators $\hat{\theta}_{n}$ to be consistent, the sieves $\Theta_{n}$ must be constructed to grow dense in $\Theta$ as $n \rightarrow \infty$. The simplest sequence of
sieves with this property is the whole parameter set $\Theta_{n}=\Theta$. In this case, a natural choice for $\theta_{n}$ is the "true" parameter $\theta_{0}$. In any case the sieves must be large enough, because the rate of convergence of $d\left(\hat{\theta}_{n}, \theta_{0}\right)$ to zero guaranteed by Theorem 3.4.1 ahead is never faster than $d\left(\theta_{n}, \theta_{0}\right)$. The latter quantity may be thought of as the distance of $\theta_{0}$ to the sieve $\Theta_{n}$.

Maximizing a given criterion function over the whole parameter space may or may not be a good idea. On the one hand, the full maximum likelihood estimator is often a good (in particular, asymptotically efficient) estimator, even in the case of infinite-dimensional parameter spaces. On the other hand, $\sup _{\theta} \mathbb{P}_{n} m_{n, \theta}$ may be infinite and no $M$-estimator is defined; or the criterion functions may have a unique point of maximum for every $n$, but the sequence of estimators may fail to converge to the true value, or do so at a suboptimal rate. While examples provide some insight as to when these possibilities occur, a general theory as to when a sequence of sieves is necessary or how to construct one is unavailable.

The observations $X_{1}, \ldots, X_{n}$ need not be i.i.d. For a flexible statement, we consider estimators $\hat{\theta}_{n}$ such that

$$
\mathbb{M}_{n}\left(\hat{\theta}_{n}\right) \geq \mathbb{M}_{n}\left(\theta_{n}\right)
$$

for arbitrary stochastic processes $\mathbb{M}_{n}$. Then it is understood that each $\hat{\theta}_{n}$ is an arbitrary map defined on the same probability space as $\mathbb{M}_{n}$. Corresponding to the criterion functions are centering functions $\theta \mapsto M_{n}(\theta)$. Typically these are the mean functions of the criterion functions, but the following theorem allows them to be arbitrary, even random. The value $\theta_{n}$ may be thought of as maximizing the centering function $M_{n}$ (but this is not an assumption), paralleling the maximization of $\mathbb{M}_{n}$ by $\hat{\theta}_{n}$. Thus it is reasonable to expect that

$$
M_{n}(\theta)-M_{n}\left(\theta_{n}\right) \leq-d_{n}^{2}\left(\theta, \theta_{n}\right) .
$$

This explains the first displayed condition of the following theorem. Here $\theta \mapsto d_{n}\left(\theta, \theta_{n}\right)$ may be an arbitrary, nonnegative map on $\Theta_{n}$, though it is written in a form that suggests that it derives from a distance. In our discussions we shall think of it in this manner for a fixed distance $d\left(\theta, \theta_{n}\right)= d_{n}\left(\theta, \theta_{n}\right)$. Actually, the following theorem allows $d_{n}$ as well as the centering functions $M_{n}$ and the value $\theta_{n}$ to be random (a map defined on the product of $\Theta_{n}$ and the underlying probability space). In particular $d_{n}^{2}\left(\theta, \theta_{n}\right)$ can be chosen equal to $M_{n}\left(\theta_{n}\right)-M_{n}(\theta)$, in which case the preceding display ceases to be a condition.
3.4.1 Theorem (Rate of convergence). For each $n$, let $\mathbb{M}_{n}$ and $M_{n}$ be stochastic processes indexed by a set $\Theta$. Let $\theta_{n} \in \Theta$ (possibly random) and $0 \leq \delta_{n}<\eta$ be arbitrary, ${ }^{b}$ and let $\theta \mapsto d_{n}\left(\theta, \theta_{n}\right)$ be an arbitrary

[^7]map (possibly random) from $\Theta$ to $[0, \infty)$. Suppose that, for every $n$ and $\delta_{n}<\delta \leq \eta$
$$
\begin{gathered}
\sup _{\delta / 2<d_{n}\left(\theta, \theta_{n}\right) \leq \delta, \theta \in \Theta_{n}} M_{n}(\theta)-M_{n}\left(\theta_{n}\right) \leq-\delta^{2}, \\
\mathrm{E}^{*} \sup _{\delta / 2<d_{n}\left(\theta, \theta_{n}\right) \leq \delta, \theta \in \Theta_{n}} \sqrt{n}\left[\left(\mathbb{M}_{n}-M_{n}\right)(\theta)-\left(\mathbb{M}_{n}-M_{n}\right)\left(\theta_{n}\right)\right]^{+} \lesssim \phi_{n}(\delta),
\end{gathered}
$$
for functions $\phi_{n}$ such that $\delta \mapsto \phi_{n}(\delta) / \delta^{\alpha}$ is decreasing on ( $\delta_{n}, \eta$ ), for some $\alpha<2$. Let $r_{n} \lesssim \delta_{n}^{-1}$ satisfy
$$
r_{n}^{2} \phi_{n}\left(\frac{1}{r_{n}}\right) \leq \sqrt{n}, \quad \text { for every } n
$$

If the sequence $\hat{\theta}_{n}$ takes its values in $\Theta_{n}$ and satisfies $\mathbb{M}_{n}\left(\hat{\theta}_{n}\right) \geq \mathbb{M}_{n}\left(\theta_{n}\right)$ -$O_{P}\left(r_{n}^{-2}\right)$ and $d_{n}\left(\hat{\theta}_{n}, \theta_{n}\right)$ converges to zero in outer porbability, then $r_{n} d_{n}\left(\hat{\theta}_{n}, \theta_{n}\right)=O_{P}^{*}(1)$. If the displayed conditions are valid for $\eta=\infty$, then the condition that $\hat{\theta}_{n}$ is consistent is unnecessary.

Proof. The proof is basically the same as that for Theorem 3.2.5, where $\theta_{n}$ must be substituted for $\theta_{0}$ throughout and $\Theta_{n}$ for $\Theta$.

Under the conditions of the theorem, the distance of $\hat{\theta}_{n}$ to the true value $\theta_{0}$ satisfies

$$
d\left(\hat{\theta}_{n}, \theta_{0}\right)=O_{P}^{*}\left(r_{n}^{-1}\right)+d\left(\theta_{n}, \theta_{0}\right)
$$

The rate $r_{n}$ is determined by the "modulus of continuity" $\phi_{n}(\delta)$ of the centered processes $\sqrt{n}\left(\mathbb{M}_{n}-M_{n}\right)$ over $\Theta_{n}$. Typically, small sieves $\Theta_{n}$ lead to a small modulus, hence fast rates $r_{n}$. On the other hand, the distance of $\theta_{0}$ to a small sieve will be large. Thus, the two terms on the right in the preceding display may be loosely understood as a "variance" (or rather, standard deviation) and "bias" term, which must be balanced to obtain a good rate of convergence. We note that in many problems an unsieved $M$-estimator actually performs very well, so the trade-off should not be understood too literally: it may work well to reduce the "bias" to zero.

The main challenge for the application of the preceding theorem is to derive the maximal inequalities for the modulus of the centered processes $\sqrt{n}\left(\mathbb{M}_{n}-M_{n}\right)$. For the case that $\mathbb{M}_{n}(\theta)=\mathbb{P}_{n} m_{n, \theta}$ considered in the introduction with centering $M_{n}(\theta)=P m_{n, \theta}$, this involves the empirical process indexed by the classes of functions

$$
\mathcal{M}_{n, \delta}=\left\{m_{n, \theta}-m_{n, \theta_{n}}: \theta \in \Theta_{n}, \frac{\delta}{2}<d_{n}\left(\theta, \theta_{n}\right) \leq \delta\right\}
$$

Write $M_{n, \delta}$ for the envelope function of these classes. In several examples in Chapter 3.2 it works well to use an inequality of the type

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{n, \delta}} \lesssim J(1)\left(P^{*} M_{n, \delta}^{2}\right)^{1 / 2}
$$

with $J(1)$ a uniform bound on the uniform entropy or bracketing entropy integral of the classes $\mathcal{M}_{n, \delta}$. The rate of convergence is then driven by the sizes of the envelope functions as $\delta \downarrow 0$, and the size of the classes is important only to guarantee a finite entropy integral. In genuinely infinitedimensional situations, this approach appears to be less useful. It is intuitively clear that the precise entropy must make a difference for the rate of convergence in general.

An alternative is to use the refined bracketing inequality given by Lemma 2.14.3, which bounds the modulus by a bracketing integral plus two remainder terms, which concern finite suprema. If a good (exponential) bound on all of the variables $\mathbb{G}_{n} f_{i}$ and $\mathbb{G}_{n} \sup _{f \in \mathcal{F}_{i}}\left|f-f_{i}\right|$ is available, then the remainder terms can be further bounded; for instance, by means of Lemma 2.2.2 or 2.2.10. We consider two examples of this approach. For a given norm $\|\cdot\|$, let

$$
\tilde{J}_{[]}(\delta, \mathcal{F},\|\cdot\|)=\int_{0}^{\delta} \sqrt{1+\log N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)} d \varepsilon
$$

be the bracketing integral of a class of functions $\mathcal{F} . \#$
3.4.2 Lemma. Let $\mathcal{F}$ be class of measurable functions such that $P f^{2}<\delta^{2}$ and $\|f\|_{\infty} \leq M$ for every $f$ in $\mathcal{F}$. Then

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim \tilde{J}_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)\left(1+\frac{\tilde{J}_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)}{\delta^{2} \sqrt{n}} M\right)
$$

The assumption that $\mathcal{F}$ is uniformly bounded is strong, but it can be dropped if the $L_{2}(P)$-norm is replaced by the "norm"

$$
\|f\|_{P, B}=\left(2 P\left(e^{|f|}-1-|f|\right)\right)^{1 / 2}
$$

This "Bernstein norm" neither is homogeneous nor satisfies the triangle inequality, but we shall nevertheless use it to measure the "size" of functions. The Bernstein "norm" dominates the $L_{2}(P)$-norm and allows the use of the refined form of Bernstein's inequality given by Lemma 2.2.11, in a chaining argument, for the proof of Lemma 2.14.3 actually only requires the property that $|f| \leq|g|$ implies $\|f\| \leq\|g\|$.
3.4.3 Lemma. Let $\mathcal{F}$ be a class of measurable functions such that $\|f\|_{P, B} \leq \delta$ for every $f \in \mathcal{F}$. Then

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim \tilde{J}_{[]}\left(\delta, \mathcal{F},\|\cdot\|_{P, B}\right)\left(1+\frac{\tilde{J}_{[]}\left(\delta, \mathcal{F},\|\cdot\|_{P, B}\right)}{\delta^{2} \sqrt{n}}\right)
$$

[^8]Proofs. Apply Lemma 2.14.3 with $\gamma=0$ and $p=1$. It suffices to bound the second and third terms on the right appropriately.

For the first lemma use Bernstein's inequality given by Lemma 2.2.9 and Lemma 2.2.10 (see (2.5.5)) to bound both the second and first terms by a multiple of

$$
\left(1+\log N_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)\right) \frac{M}{\sqrt{n}}+\sqrt{1+\log N_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)} \delta
$$

Since the entropy is decreasing in $\delta$, the second term is smaller than the entropy integral. By the same reasoning the part in brackets of the first term is bounded by the square of the entropy integral divided by $\delta^{2}$.

The second lemma follows similarly, this time using the refined form of Bernstein's inequality, Lemma 2.2.11, in combination with the "norm" $\|\cdot\|_{P, B}$. -

Since the Bernstein "norm" is not homogeneous, it may actually be beneficial to apply the second lemma to a multiple $\sigma \mathcal{F}$ of the class $\mathcal{F}$, noting that the left side equals $\sigma^{-1} \mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\sigma \mathcal{F}}$ for every $\sigma>0$. Even taking $\sigma=2$ may be helpful!

Another possibility is to use symmetrization by Rademacher variables followed by application of the sub-Gaussian maximal inequality given by Corollary 2.2.8, conditionally on the original observations. By Lemma 2.3.1 followed by Corollary 2.2.8,

$$
\begin{aligned}
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{n, \delta}} & \leq 2 \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \varepsilon_{i} m\left(X_{i}\right)\right\|_{\mathcal{M}_{n, \delta}} \\
& \lesssim \mathrm{E}^{*} \int_{0}^{\theta_{n}(\delta)} \sqrt{\log N\left(\varepsilon, \mathcal{M}_{n, \delta}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon
\end{aligned}
$$

Here $\theta_{n}(\delta)$ is the $L_{2}\left(\mathbb{P}_{n}\right)$-diameter of the set $\mathcal{M}_{n, \delta}$. This expression may be handled directly, but in most cases it allows further estimates only if the uniform entropy of the classes $\mathcal{M}_{n, \delta}$ behaves well. Then the integral can be bounded by

$$
\mathrm{E}^{*} \int_{0}^{\theta_{n}(\delta) /\left\|M_{n, \delta}\right\|_{\mathbb{P}_{n}, 2}} \sup _{Q} \sqrt{\log N\left(\varepsilon\left\|M_{n, \delta}\right\|_{Q, 2}, \mathcal{M}_{n, \delta}, L_{2}(Q)\right)} d \varepsilon \sqrt{\mathbb{P}_{n} M_{n, \delta}^{2}}
$$

This is identical to the bound given by Theorem 2.14.1. For instance, if the uniform entropy is bounded by $(1 / \varepsilon)^{V}$ (uniformly in $\delta$ ), we obtain the bound

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{n, \delta}} \lesssim \mathrm{E}^{*}\left\|\mathbb{P}_{n}\right\|_{\mathcal{M}_{n, \delta}^{2}}^{1-V / 2}\left(\mathbb{P}_{n} M_{n, \delta}^{2}\right)^{V / 4}
$$

A disadvantage of this approach is that further handling of the right-hand side still involves a maximal inequality, but this may be more straightforward than the original problem.

In certain applications the empirical process indexed by the class $\mathcal{M}_{n, \delta}$ may also be sub-Gaussian or satisfy other tail bounds. Then the maximal inequalities of Chapter 2.2 may be applied directly, without the additional arguments used for the empirical process in Chapter 2.14.

In some examples the bracketing entropy integral diverges at zero. Then the preceding lemmas are useless, but the more general Lemma 2.14.3 can be used with a positive value of $\gamma$. The choice $\gamma=c \delta^{2} \wedge \delta / 3$ for a small positive constant $c$ is appropriate, because in Theorem 3.4.1 the random process $\sqrt{n}\left(\mathbb{M}_{n}-M_{n}\right)$ could be allowed to have a quadratic drift as long as this is strictly smaller than the quadratic drift of the centering function. It suffices that the supremum of the empirical process indexed by $\mathcal{M}_{n, \delta}$ can be bounded by $Z_{n, \delta}+\frac{1}{2} \delta^{2} \sqrt{n}$ for a random variable $Z_{n, \delta}$ such that

$$
\mathrm{E} Z_{n, \delta}^{+} \lesssim \phi_{n}(\delta)
$$

(see Problem 3.4.2). Lemma 2.14.3 yields such a bound on the empirical processes shifted downward.

This argument shows that in the following the entropy integrals can be replaced by the integrals

$$
\int_{c \delta^{2} \wedge \delta / 3}^{\delta} \sqrt{1+\log N_{[]}(\varepsilon, \mathcal{F},\|\cdot\|)} d \varepsilon
$$

Since this does not make a difference in most applications, this fact will not be stressed.

### 3.4.1 Maximum Likelihood

Let $X_{1}, \ldots, X_{n}$ be an i.i.d. sample from a density $p$ that belongs to a set $\mathcal{P}$ of densities with respect to a measure $\mu$ on some measurable space.

The sieved maximum likelihood estimator $\hat{p}_{n}$ based on $X_{1}, \ldots, X_{n}$ maximizes the loglikelihood $p \mapsto \mathbb{P}_{n} \log p$. In this section the parameter is the density $p$ itself and is denoted by $p$ rather than $\theta$. If $\hat{p}_{n}$ maximizes the loglikelihood over a sieve $\mathcal{P}_{n}$ and $p_{n} \in \mathcal{P}_{n}$, then by concavity of the logarithm,

$$
\mathbb{P}_{n} \log \frac{\hat{p}_{n}+p_{n}}{2 p_{n}} \geq 0=\mathbb{P}_{n} \log \frac{p_{n}+p_{n}}{2 p_{n}}
$$

Thus the set-up of the introduction applies with the criterion function

$$
m_{n, p}=\log \frac{p+p_{n}}{2 p_{n}}
$$

(Note that it is not claimed that the maximum likelihood estimator maximizes $p \mapsto \mathbb{P}_{n} m_{n, p}$ over $\mathcal{P}_{n}$.) This choice is technically more convenient than the naive choice $\log p$, as it combines smoothly with the Hellinger distance

$$
h(p, q)=\left(\int\left(p^{1 / 2}-q^{1 / 2}\right)^{2} d \mu\right)^{1 / 2}
$$

The key is the following pair of inequalities, which relate the Bernstein "norm" of the criterion functions $m_{n, p}$ to the Hellinger distance of the densities $p$. For densities (nonnegative functions) $p, q, p_{n}$, and $p_{0}$ such that $p_{0} / p_{n} \leq M$ and $p \leq q$, we have

$$
\begin{aligned}
\left\|m_{n, p}-m_{n, p_{n}}\right\|_{P_{0}, B} & \lesssim h\left(p, p_{n}\right) \\
\left\|m_{n, p}-m_{n, q}\right\|_{P_{0}, B} & \lesssim h\left(p+p_{n}, q+p_{n}\right) \leq h(p, q)
\end{aligned}
$$

where the constant in $\lesssim$ depends on the upper bound $M$ only. These inequalities are proved ahead. Since the map $p \mapsto m_{n, p}$ is monotone, the second inequality shows that a bracketing partition of a class of densities $p$ for the Hellinger distance induces a bracketing partition of the class of criterion functions $m_{n, p}$ for the Bernstein "norm" of essentially the same size. Thus, Lemma 3.4.3 becomes available for the classes of functions $\mathcal{M}_{n, \delta}$ with the entropy bounded by the Hellinger entropy of the class of densities.
3.4.4 Theorem. Let $h$ denote the Hellinger distance on a class of densities $\mathcal{P}$ and set $m_{n, p}=\log \frac{1}{2}\left(p+p_{n}\right) / p_{n}$. If $p_{n}$ and $p_{0}$ are probability densities with $p_{0} / p_{n} \leq M$ pointwise, then

$$
P_{0}\left(m_{n, p}-m_{n, p_{n}}\right) \lesssim-h^{2}\left(p, p_{n}\right),
$$

for every probability density $p$ such that $h\left(p, p_{n}\right) \geq 32 M h\left(p_{n}, p_{0}\right)$. Furthermore, for the class of functions $\mathcal{M}_{n, \delta}=\left\{m_{n, p}-m_{n, p_{n}}: p \in \mathcal{P}_{n}, h\left(p, p_{n}\right)<\right. \delta\}$,

$$
\mathrm{E}_{P_{0}}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{M}_{n, \delta}} \lesssim \tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)\left(1+\frac{\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)}{\delta^{2} \sqrt{n}}\right)
$$

In both assertions the constants in $\lesssim$ depend on $M$ only. In $\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)$ the set $\mathcal{P}_{n}$ may be replaced by $\mathcal{P}_{n, \delta}=\left\{p \in \mathcal{P}_{n}: h\left(p, p_{n}\right)<\delta\right\}$ and the Hellinger distance may be replaced by the distance $h_{n}(p, q)=h\left(p+p_{n}, q+p_{n}\right)$.

Proof. Since $\log x \leq 2(\sqrt{x}-1)$ for every positive $x$,

$$
\begin{aligned}
P_{0} \log \frac{q}{p_{n}} & \leq 2 P_{0}\left(\frac{q^{1 / 2}}{p_{n}^{1 / 2}}-1\right) \\
= & 2 P_{n}\left(\frac{q^{1 / 2}}{p_{n}^{1 / 2}}-1\right)+2 \int\left(q^{1 / 2}-p_{n}^{1 / 2}\right)\left(p_{0}^{1 / 2}-p_{n}^{1 / 2}\right) \frac{p_{0}^{1 / 2}+p_{n}^{1 / 2}}{p_{n}^{1 / 2}} d \mu
\end{aligned}
$$

The first term on the far right equals $-h^{2}\left(q, p_{n}\right)$; the second can be bounded by the expression $2 h\left(q, p_{n}\right) h\left(p_{0}, p_{n}\right)(\sqrt{M}+1)$ in view of the assumption on the quotient $p_{0} / p_{n}$ and the Cauchy-Schwarz inequality. The sum is bounded by $-\frac{1}{2} h^{2}\left(q, p_{n}\right)$ if $h\left(p_{0}, p_{n}\right) 2(\sqrt{M}+1) \leq \frac{1}{2} h\left(q, p_{n}\right)$.

The first statement of the theorem follows upon combining this with the inequalities

$$
h(2 p, p+q) \leq h(p, q) \leq 2 h(2 p, p+q)
$$

These inequalities are valid for every pair of densities $p$ and $q$ and show that the Hellinger distance between $p$ and $q$ is equivalent to the Hellinger distance between $p$ and $\frac{1}{2}(p+q)$. See Problem 3.4.4.

Next we establish the inequalities relating the Bernstein "norm" and the Hellinger distance given in the discussion preceding the statement of the theorem. Since $e^{|x|}-1-|x| \leq 2\left(e^{x / 2}-1\right)^{2}$, for every $x \geq-2$ and $m_{n, p} \geq-\log 2$,

$$
\left\|m_{n, p}-m_{n, p_{n}}\right\|_{P_{0}, B}^{2} \lesssim P_{0}\left(e^{m_{n, p} / 2}-1\right)^{2}=P_{0}\left(\frac{\left(p+p_{n}\right)^{1 / 2}}{\left(2 p_{n}\right)^{1 / 2}}-1\right)^{2}
$$

Since $p_{0} / p_{n} \leq M$, the right side is bounded by $\frac{1}{2} M h^{2}\left(p+p_{n}, 2 p_{n}\right)$. Combination with the preceding display gives the first inequality. If $p \leq q$, then $m_{n, q}-m_{n, p}$ is nonnegative. By the same inequality for $e^{x}-1-x$ as before,

$$
\left\|m_{n, p}-m_{n, q}\right\|_{P_{0}, B}^{2} \lesssim P_{0}\left(e^{\left(m_{n, q}-m_{n, p}\right) / 2}-1\right)^{2}=P_{0}\left(\frac{\left(q+p_{n}\right)^{1 / 2}}{\left(p+p_{n}\right)^{1 / 2}}-1\right)^{2}
$$

This is bounded by $M h^{2}\left(q+p_{n}, p+p_{n}\right)$ as before.
The maximal inequality is a consequence of Lemma 3.4.3. Each of the functions in $\mathcal{M}_{n, \delta}$ has Bernstein "norm" bounded by a multiple of $\delta$, while a bracket $\left[p^{1 / 2}, q^{1 / 2}\right]$ of densities of size $\delta$ leads to a bracket $\left[m_{n, p}, m_{n, q}\right]$ of Bernstein "norm" of size a multiple of $\delta$.

It follows that the conditions of Theorem 3.4.1 are satisfied with the Hellinger distance, $\delta_{n}=h\left(p_{n}, p_{0}\right)$, and

$$
\phi_{n}(\delta)=\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)\left(1+\frac{\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)}{\delta^{2} \sqrt{n}}\right)
$$

where $\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)$ is the Hellinger bracketing integral of the sieve $\mathcal{P}_{n}$. (Usually this function has the property that $\phi_{n}(\delta) / \delta^{\alpha}$ is increasing for some $\alpha<2$ as required by Theorem 3.4.1; otherwise $\tilde{J}_{[]}\left(\delta, \mathcal{P}_{n}, h\right)$ must be replaced by a suitable upper bound.) The condition $r_{n}^{2} \phi_{n}\left(1 / r_{n}\right) \lesssim \sqrt{n}$ is equivalent to

$$
r_{n}^{2} \tilde{J}_{[]}\left(\frac{1}{r_{n}}, \mathcal{P}_{n}, h\right) \lesssim \sqrt{n}
$$

For the unsieved maximum likelihood estimator the Hellinger integral is independent of $n$ and any $r_{n}$ solving the preceding display gives an upper bound on the rate. Under the condition that the true density $p_{0}$ can be approximated by a sequence $p_{n} \in \mathcal{P}_{n}$ such that $p_{0} / p_{n}$ is uniformly bounded, the sieved maximum likelihood estimator that maximizes the likelihood over $\mathcal{P}_{n}$ has at least the rate $r_{n}$ satisfying both

$$
r_{n}^{2} \tilde{J}_{[]}\left(\frac{1}{r_{n}}, \mathcal{P}_{n}, h\right) \leq \sqrt{n} \quad \text { and } \quad r_{n} \lesssim h\left(p_{n}, p_{0}\right)^{-1}
$$

These are rates for the convergence of the maximum likelihood estimator $\hat{p}_{n}$ to the true density $p_{0}$ in the Hellinger distance: $h\left(\hat{p}_{n}, p_{0}\right)=O_{P}^{*}\left(r_{n}^{-1}\right)$.

The last assertion of the theorem-that in the above the Hellinger distance may be replaced by $h\left(p+p_{n}, q+p_{n}\right)$ when computing the bracketing entropy of $\mathcal{P}_{n}$-is of some interest, both because it tends to be hard to compute the entropy for the Hellinger distance and because this entropy may behave badly due to the infinite derivative at zero of the root transformation. We have

$$
\begin{equation*}
h_{n}^{2}(p, q)=h^{2}\left(p+p_{n}, q+p_{n}\right) \leq \int(p-q)^{2} \frac{1}{p_{n}} d \mu \tag{3.4.5}
\end{equation*}
$$

Thus the distance $h_{n}$ is bounded by the $L_{2}$-distance with respect to the measure with density $p_{n}^{-1}$. If the latter measure is finite, then the usual upper estimates for the $L_{2}$-entropy of the class of densities $\mathcal{P}_{n}$ are relevant and give upper bounds on the entropy of the class of densities with respect to $h_{n}$. While the assumption that $p_{n}^{-1}$ is integrable is not natural, at least it allows some conclusions in situations that appear otherwise hard to handle.
3.4.6 Example (Monotone densities). Suppose the observations take their values in a compact interval $[0, T]$ in the real line and are sampled from a density that is known to be nonincreasing. According to Theorem 2.7.5, the set $\mathcal{F}$ of all nonincreasing functions $f:[0, T] \mapsto[0,1]$ has bracketing entropy for the $L_{2}(\lambda)$-norm of the order $1 / \varepsilon$ for any finite measure $\lambda$ on $[0, T]$, in particular Lebesgue measure. If a density $p$ is nonincreasing, then so is its root $p^{1 / 2}$. Furthermore, the Hellinger distance on the densities is the $L_{2}(\lambda)$-distance on the root densities. Conclude that if $\mathcal{P}$ is the set of all nonincreasing probability densities bounded by a constant $C$, then

$$
\log N_{[]}(\varepsilon, \mathcal{P}, h) \leq N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(\lambda)\right) \lesssim\left(\frac{1}{\varepsilon}\right) .
$$

Thus $\tilde{J}_{[]}(\delta, \mathcal{P}, h) \lesssim \delta^{1 / 2}$, which yields a rate of convergence of at least $r_{n}=n^{1 / 3}$ for the maximum likelihood estimator. The maximum likelihood estimator is the Grenander estimator. In Example 3.2.14 it is shown that the pointwise rate is exactly $n^{-1 / 3}$ if the derivative of the true density is nonzero.
3.4.7 Example (Convex densities). Suppose the observations take their values in a compact convex subset of $\mathbb{R}^{d}$ and are sampled from a density $p$ that is known to be convex, uniformly bounded by a constant $M$, and uniformly Lipschitz $|p(y)-p(x)| \leq M\|y-x\|$. According to Theorem 2.7.10, the collection of all convex functions that are uniformly bounded and uniformly Lipschitz (without the restrictions that it is nonnegative and integrates to 1 ) has entropy of the order $\varepsilon^{-d / 2}$ for the uniform norm. In view of (3.4.5), the entropy of the class of densities for the distance $h_{1}(p, q)=h\left(p+p_{0}, q+p_{0}\right)$ is bounded by the $L_{2}$-entropy with respect to the measure with Lebesgue
density $p_{0}^{-1}$. Thus, under the assumption that the true density satisfies $\int p_{0}^{-1} d \lambda<\infty$,

$$
\log N_{[]}\left(\varepsilon, \mathcal{P}, h_{1}\right) \lesssim\left(\frac{1}{\varepsilon}\right)^{d / 2}
$$

For dimension $d \leq 3$, this leads to a converging entropy integral $\tilde{J}_{[]}\left(\delta, \mathcal{P}, h_{1}\right) \lesssim \delta^{1-d / 4}$ and yields a rate of convergence of at least $r_{n}= n^{2 /(d+4)}$. For dimension $d \geq 4$, the entropy integral diverges, but according to the note following Theorem 3.4.1 (also see Problem 3.4.2), the relevant quantity is

$$
\int_{c \delta^{2} \wedge \delta / 3}^{\delta} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{P}, h_{1}\right)} d \varepsilon \lesssim \begin{cases}\log \left(\frac{1}{\delta}\right), & \text { if } d=4 \\ \left(\frac{1}{\delta}\right)^{d / 2-2}, & \text { if } d>4\end{cases}
$$

This leads to a rate of convergence of at least $r_{n}=n^{1 / 4} /(\log n)^{1 / 2}$ if $d=4$ and a rate of convergence of at least $r_{n}=n^{1 / d}$ if $d>4$.

### 3.4.2 Concave Parametrizations

Assume that the parameter $\theta$ ranges over a subset of a linear space. Consider criterion functions $\theta \mapsto \mathbb{P}_{n} m_{\theta}$ for measurable functions $m_{\theta}$ such that the maps $\theta \mapsto \exp m_{\theta}(x)$ are concave. We are mostly thinking of maximum likelihood estimators based on a sample $X_{1}, \ldots, X_{n}$ from a density $p_{\theta}$ that depends linearly on the parameter. Consequently we denote $\exp m_{\theta}(x)$ by $p_{\theta}(x)$. If $\hat{\theta}_{n}$ maximizes $\mathbb{P}_{n} \log p_{\theta}$ over a convex subset $\Theta_{n}$, then

$$
\mathbb{P}_{n} \log \frac{p_{\hat{\theta}_{n}}}{(1-t) p_{\hat{\theta}_{n}}+t p_{\theta_{n}}} \geq 0
$$

for all $0 \leq t \leq 1$ and every $\theta_{n} \in \Theta_{n}$. Differentiation at $t=0$ yields the inequality

$$
\begin{equation*}
\mathbb{P}_{n} \frac{p_{\theta_{n}}}{p_{\hat{\theta}_{n}}} \leq 1, \quad \text { for every } \theta_{n} \in \Theta_{n} \tag{3.4.8}
\end{equation*}
$$

If $L:(0, \infty) \mapsto \mathbb{R}$ is increasing such that the function $t \mapsto L(1 / t)$ is convex, then Jensen's inequality gives

$$
\mathbb{P}_{n} L\left(\frac{p_{\hat{\theta}_{n}}}{p_{\theta_{n}}}\right) \geq L\left(\frac{1}{\mathbb{P}_{n}\left(p_{\theta_{n}} / p_{\hat{\theta}_{n}}\right)}\right) \geq L(1)=\mathbb{P}_{n} L\left(\frac{p_{\theta_{n}}}{p_{\theta_{n}}}\right)
$$

Thus the set-up of the introduction applies with

$$
m_{n, \theta}=L\left(\frac{p_{\theta}}{p_{\theta_{n}}}\right)
$$

This conclusion depends essentially on the concavity of the map $\theta \mapsto p_{\theta}$, an assumption that is not made in the preceding section. We can take
advantage of the present structure, which is not uncommon in infinitedimensional applications, by making a clever choice of the function $L$. (This may even depend on $n$.) Some possible choices are

$$
\log t ; \quad \frac{\log (1+t)}{2} ; \quad 1-t^{-\alpha} ; \quad t^{\alpha}-1 ; \quad\left(\frac{2 t}{t+1}\right)^{\alpha}-1 ; \quad \frac{t^{\alpha}-1}{t^{\alpha}+1},
$$

each time with $0<\alpha \leq 1$. The last two choices are of special interest because they are bounded functions. The first choice leads back to the original definition of $\hat{\theta}_{n}$, showing that (3.4.8) characterizes the $M$-estimator. The second choice is used in the preceding section.

### 3.4.3 Least Squares Regression

In this section we consider estimating a regression function $\theta$ in the model $Y=\theta(X)+e$ by the method of least-squares. The regression function is typically known to belong to an infinite-dimensional set (or sieve) only. The application of Theorem 3.4.1 to obtain rates of convergence is carried out separately for models with fixed and random design points, by different methods.

### 3.4.3.1 Fixed Design

Given fixed "design" points $x_{1}, \ldots, x_{n}$ in a set $\mathcal{X}$ and a map $\theta_{0}: \mathcal{X} \mapsto \mathbb{R}$, let

$$
Y_{i}=\theta_{0}\left(x_{i}\right)+e_{i},
$$

for independent and identically distributed "error" variables $e_{1}, \ldots, e_{n}$. The observations consist of the pairs $\left(x_{1}, Y_{1}\right), \ldots,\left(x_{n}, Y_{n}\right)$ and the unknown regression function $\theta_{0}$ is known to belong to a set $\Theta$. The sieved leastsquares estimator $\hat{\theta}_{n}$ minimizes

$$
\mathbb{P}_{n}(Y-\theta)^{2}=\frac{1}{n} \sum_{i=1}^{n}\left(Y_{i}-\theta\left(x_{i}\right)\right)^{2}
$$

over a set $\Theta_{n}$ of regressions functions. Inserting the expression for $Y_{i}$ and calculating the square, we see that $\hat{\theta}_{n}$ maximizes

$$
2 \mathbb{P}_{n}\left(\theta-\theta_{0}\right) e-\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2}
$$

The latter criterion function is not observable but is of simpler character than the sum of squares. Note that the second term is assumed nonrandom, the randomness solely residing in the error terms. The set-up of the introduction is valid with

$$
m_{n, \theta}(x, e)=2\left(\theta-\theta_{0}\right)(x) e-\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2} \text {. }
$$

Under the assumption that the error variables have mean zero, the mean of this expression is given by $M_{n}(\theta)=-\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2}$ and can be used as a centering function. It satisfies

$$
M_{n}(\theta)-M_{n}\left(\theta_{n}\right) \leq-\frac{1}{4} \mathbb{P}_{n}\left(\theta-\theta_{n}\right)^{2},
$$

for every $\theta$ such that $\mathbb{P}_{n}\left(\theta-\theta_{n}\right)^{2} \geq 4 \mathbb{P}_{n}\left(\theta_{n}-\theta_{0}\right)^{2}$ (Problem 3.4.5). Thus, Theorem 3.4.1 applies with $d_{n}\left(\theta, \theta_{n}\right)$ equal to the $L_{2}\left(\mathbb{P}_{n}\right)$-distance on the set of regression functions. The necessary maximal inequality takes the form

$$
\mathrm{E}^{*} \sup _{\mathbb{P}_{n}\left(\theta-\theta_{n}\right)^{2}<\delta^{2}, \theta \in \Theta_{n}}\left|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\theta-\theta_{n}\right)\left(x_{i}\right) e_{i}\right| \lesssim \phi_{n}(\delta) .
$$

Since the design points are nonrandom, this involves relatively simple multiplier processes, to which the abstract maximal inequalities of Chapter 2.2 may apply directly. In particular, if the error variables are Gaussian, then the stochastic process $\left\{n^{-1 / 2} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}: \theta \in \Theta\right\}$ is sub-Gaussian for the $L_{2}\left(\mathbb{P}_{n}\right)$-semimetric on the set of regression functions. Corollary 2.2.8 shows that we may choose

$$
\phi_{n}(\delta)=\int_{0}^{\delta} \sqrt{\log N\left(\varepsilon, \Theta_{n}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon
$$

This conclusion depends only the sub-Gaussianity of the stochastic process $\left\{n^{-1 / 2} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}: \theta \in \Theta\right\}$ for the $L_{2}\left(\mathbb{P}_{n}\right)$-semimetric. By Proposition A.1.6, this is more generally true if the error variables are sub-Gaussian.

For errors with heavier than Gaussian tails, Theorem 2.2.4 may be applied with a different Orlicz norm. For instance, in case of errors with subexponential tails, we have by Proposition A.1.6, followed by Lemma 2.2.2:

$$
\begin{aligned}
\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}\right\|_{\psi_{1}} & \lesssim\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}\right\|_{1}+\left\|\max _{1 \leq i \leq n} n^{-1 / 2} \theta\left(x_{i}\right) e_{i}\right\|_{\psi_{1}} \\
& \leq\|\theta\|_{\mathbb{P}_{n}, 2}\left\|e_{1}\right\|_{2}+\frac{\log n}{\sqrt{n}}\|\theta\|_{\mathbb{P}_{n}, \infty}\|e\|_{\psi_{1}} \\
& \lesssim \log n\|\theta\|_{\mathbb{P}_{n}, 2}\left\|e_{1}\right\|_{\psi_{1}} .
\end{aligned}
$$

Then Theorem 2.2.4 shows that we may choose

$$
\phi_{n}(\delta)=\int_{0}^{\delta \log n} \log N\left(\varepsilon, \Theta_{n}, \log n L_{2}\left(\mathbb{P}_{n}\right)\right) d \varepsilon
$$

The $\log n$ terms do not affect the upper bound on the rate of convergence much. However, taking the integral of the entropy, rather than the squareroot entropy, makes much difference. For instance, the integral does not appear to converge for monotone regression functions. Thus, this approach does not necessarily lead to a sharp upper bound on the rate. The discrepancy might be due to the fact that the present application of Theorem 2.2.4 uses the special sum structure of the process $\left\{n^{-1 / 2} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}: \theta \in \Theta\right\}$
only through their $\psi_{1}$-norms. The maximal inequalities of Chapter 2.2 are designed especially for sums of independent processes and may be expected to give sharper bounds. Another explanation of the discrepancy is that too much is lost in our attempt to bound the $\psi_{1}$-norm by the $L_{2}\left(\mathbb{P}_{n}\right)$-norm. Unfortunately, it appears hard to use better estimates in general, since we are interested in the modulus with respect to the $L_{2}\left(\mathbb{P}_{n}\right)$-norm.

Another approach is possible if the class of regression functions $\Theta_{n}$ has bounded uniform entropy. Symmetrization by Rademacher variables (Lemma 2.3.1) followed by application of the sub-Gaussian maximal inequality (Corollary 2.2.8) conditionally on the observations yields the desired maximal inequality with

$$
\phi_{n}(\delta)=\mathrm{E}^{*} \int_{0}^{d_{n}} \sup _{Q} \sqrt{\log N\left(\varepsilon\left\|M_{n}\right\|_{Q, 2}, \Theta_{n}, L_{2}(Q)\right)} d \varepsilon\left(\mathbb{P}_{n} M_{n}^{2} e^{2}\right)^{1 / 2}
$$

Here the supremum is taken over all finitely discrete measures $Q$, the function $M_{n}(x)$ is an envelope function for $\Theta_{n}$, and

$$
d_{n}^{2}=\sup _{\mathbb{P}_{n}\left(\theta-\theta_{n}\right)^{2}<\delta^{2}, \theta \in \Theta_{n}} \frac{\mathbb{P}_{n}\left(\theta-\theta_{n}\right)^{2} e^{2}}{\mathbb{P}_{n} M_{n}^{2} e^{2}} \lesssim \frac{\delta^{2 / p}\left(\mathbb{P}_{n} M_{n}^{(1-2 / p) q} e^{2 q}\right)^{1 / q}}{\mathbb{P}_{n} M_{n}^{2} e^{2}}
$$

The last step follows by Hölder's inequality for every $1 / p+1 / q=1$. Assume that the uniform entropy (the square of the integrand) is bounded by $\varepsilon^{-1 / m}$ for $m>1 / 2$. Then

$$
\phi_{n}(\delta) \leq \delta^{1 / p(1-1 / 2 m)} \mathrm{E}^{*}\left(\mathbb{P}_{n} M_{n}^{(1-2 / p) q} e^{2 q}\right)^{(1-1 / 2 m) / 2 q}\left(\mathbb{P}_{n} M_{n}^{2} e^{2}\right)^{1 / 4 m}
$$

If the expectation on the right-hand side is bounded as $n \rightarrow \infty$, then this leads to a rate of convergence of at least

$$
r_{n}=n^{\frac{m p}{(4 p-2) m+1}}
$$

For instance, if the class of regression functions is uniformly bounded, then this is a valid upper bound on the rate if $\mathrm{E}|e|^{2 q}<\infty$. For every $q$ the upper bound $r_{n}$ is slower than the rate $n^{m /(2 m+1)}$ obtained under sub-Gaussian tails, although this rate is approached arbitrarily closely as $q \rightarrow \infty$. It seems not unreasonable to expect that slower rates may pertain under just polynomial tails of the error distribution, but from the present derivation it is unclear whether the present upper bound is sharp or is the outcome of the application of suboptimal inequalities.
3.4.9 Example. If the set of regression functions is known to belong to $C_{1}^{\alpha}[K]$ for a compact convex subset $K$ of $\mathbb{R}^{d}$, then the unsieved least-squares estimator attains a rate of convergence of at least

$$
n^{\frac{\alpha p}{(4 p-2) \alpha+d}}
$$

if the errors have finite $2 q$ th moment. For errors with sub-Gaussian tails, the rate of convergence is at least $n^{\alpha /(2 \alpha+d)}$, which is the limit as $q \rightarrow \infty$ of the display.

A third approach to least-squares uses finite-dimensional sieves and can be analyzed by an elementary maximal inequality. For each $n$ let $\psi_{1, n}, \ldots, \psi_{N_{n}, n}$ be functions from $\mathcal{X}$ to $\mathbb{R}$ that form an orthonormal system in $L_{2}\left(\mathbb{P}_{n}^{x}\right)$. The number of elements $N_{n} \leq n$ of the system is to be determined later. Consider the sieves

$$
\Theta_{n}=\operatorname{lin}\left(\psi_{1, n}, \ldots, \psi_{N_{n}, n}\right) .
$$

Expressing $\theta-\theta_{n}$ in terms of the orthonormal system and applying the Cauchy-Schwarz inequality, we obtain (if $\theta_{n} \in \Theta_{n}$ )

$$
\begin{aligned}
\mathrm{E}^{*} \sup \left|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \theta\left(x_{i}\right) e_{i}\right|^{2} & \leq \mathrm{E}^{*}\left[\sup \sum_{j=1}^{N_{n}}\left\langle\theta, \psi_{j, n}\right\rangle\left(\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{j, n}\left(x_{i}\right) e_{i}\right)\right]^{2} \\
& \leq \sup \sum_{j=1}^{N_{n}}\left\langle\theta, \psi_{j, n}\right\rangle^{2} \mathrm{E}^{*}\left(\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{j, n}\left(x_{i}\right) e_{i}\right)^{2} \\
& \leq \delta^{2} N_{n} \mathrm{E} e^{2}
\end{aligned}
$$

where each time the supremum is taken over all $\theta \in \Theta_{n}-\theta_{n}$ such that $\mathbb{P}_{n} \theta^{2}<\delta^{2}$. This approach gives useful results under just the assumption that the errors are mean zero with finite variance. The rate of convergence of the sieved least-squares estimator depends on the upper bound in combination with the approximation error $\left\|\theta_{0}-\Theta_{n}\right\|_{\mathbb{P}_{n}, 2}$.
3.4.10 Example. Consider the design points $x_{i}=i / n$ when the set of regression functions $\theta:[0,1] \mapsto \mathbb{R}$ is known to be Lipschitz of order $0<\alpha \leq$ 1. The Lipschitz constants are not assumed uniformly bounded. A simple choice of the sieve is given by letting the base functions be multiples of the indicators of the cells $((i-1) / N, i / N]$. Discretization of $\theta_{0}$ on the points $i / N$ shows that

$$
\left\|\theta_{0}-\Theta_{n}\right\| \leq\left\|\theta_{0}\right\|_{\operatorname{Lip}} \frac{1}{N^{\alpha}}
$$

In combination with the preceding maximal inequality, a rate of convergence for the sieved least-squares estimator in the $L_{2}\left(\mathbb{P}_{n}\right)$-semimetric is given by the solution of

$$
r_{n}^{2} \frac{1}{r_{n}} \sqrt{N_{n}} \leq \sqrt{n} ; \quad \text { and } \quad \frac{1}{r_{n}} \geq \frac{1}{N_{n}^{\alpha}}
$$

The minimal choice $N_{n}=r_{n}^{1 / \alpha}$ leads to the rate $r_{n}=n^{\alpha /(2 \alpha+1)}$. This rate is known to be optimal in this case.

### 3.4.3.2 Random Design

Another approach towards finding an upper bound on the rate of leastsquares estimators uses the maximal inequality Lemma 3.4.3 based on the Bernstein "norm". It is convenient to develop this approach for the situation wherein the design points are i.i.d. random variables. Thus $X_{1}, \ldots, X_{n}$ and $e_{1}, \ldots, e_{n}$ are independent i.i.d. samples and the observations consist of the pairs $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$, where each $Y_{i}$ is defined by

$$
Y_{i}=\theta_{0}\left(X_{i}\right)+e_{i} .
$$

As in the case of fixed design points considered in the preceding section, we consider the least-squares estimator $\hat{\theta}_{n}$, which minimizes the sum of squares $n^{-1} \sum_{i=1}^{n}\left(Y_{i}-\theta\left(X_{i}\right)\right)^{2}$ over a sieve $\Theta_{n}$. Equivalently, it maximizes

$$
\mathbb{M}_{n}(\theta)=2 \mathbb{P}_{n}\left(\theta-\theta_{0}\right) e-\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2} .
$$

Under the assumption that the errors have mean zero, this leads to the centering function $M(\theta)=-P\left(\theta-\theta_{0}\right)^{2}$, which satisfies

$$
M(\theta)-M\left(\theta_{n}\right) \leq-\frac{1}{4} P\left(\theta-\theta_{n}\right)^{2},
$$

for every $\theta$ such that $P\left(\theta-\theta_{n}\right)^{2} \geq 4 P\left(\theta_{n}-\theta_{0}\right)^{2}$. Thus Theorem 3.4.1 applies with $d_{n}$ equal to the $L_{2}$-distance on the regression functions. If the class of regression functions is uniformly bounded by $M \geq 1 / 2$, then

$$
\begin{aligned}
P\left(e^{t\left|\theta-\theta_{n}\right||e|}-1-t\left|\theta-\theta_{n}\right||e|\right) & =\sum_{m \geq 2} \frac{P\left|\theta-\theta_{n}\right|^{m} P|t e|^{m}}{m!} \\
& \leq P\left(\theta-\theta_{n}\right)^{2} E e^{2 M t|e|}
\end{aligned}
$$

If the error variables have subexponential tails, then it follows that the Bernstein "norm" of a multiple of the variables $\left(\theta-\theta_{n}\right)\left(X_{i}\right) e_{i}$ is bounded by a multiple of the $L_{2}$-norm of $\theta-\theta_{n}$. A bracket $\left[\theta_{1}, \theta_{2}\right]$ for regression functions leads to a bracket $\left[\theta_{1} e^{+}-\theta_{2} e^{-}, \theta_{2} e^{+}-\theta_{1} e^{-}\right]$for the variables $\theta\left(X_{i}\right) e_{i}$. In view of Lemma 3.4.3,

$$
\begin{aligned}
& \mathrm{E}^{*} \sup _{P\left(\theta-\theta_{n}\right)^{2}<\delta^{2}, \theta \in \Theta_{n}}\left|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\theta-\theta_{n}\right)\left(X_{i}\right) e_{i}\right| \\
& \quad \lesssim \tilde{J}_{[]}\left(\delta, \Theta_{n}, L_{2}(P)\right)\left(1+\frac{\tilde{J}_{[]}\left(\delta, \Theta_{n}, L_{2}(P)\right)}{\delta^{2} \sqrt{n}}\right) .
\end{aligned}
$$

This essentially gives the same rates of convergence as the approach based on Theorem 2.2.4 in the preceding section. Presently, the error variables are assumed to be subexponential rather than sub-Gaussian. On the other hand the set of regression functions is assumed uniformly bounded.

### 3.4.4 Least-Absolute-Deviation Regression

The results on least-squares regression can be easily generalized to other minimization schemes. Typically, the rates of convergence of the estimators are the same, but the conditions on the error variables necessary to obtain these rates vary strongly. This is illustrated in this section by the case of least-absolute-deviation estimators.

In the set-up of Section 3.4.3 with fixed design points, let $\hat{\theta}_{n}$ minimize the sum

$$
\frac{1}{n} \sum_{i=1}^{n}\left|Y_{i}-\theta\left(x_{i}\right)\right|
$$

over the set of possible regression functions $\Theta$. If the error distribution has median zero and is smooth, then the map $\mu \mapsto P|e+\mu|$ will be twice differentiable at its point of maximum $\mu=0$. Then for $\left\|\theta-\theta_{0}\right\|_{\infty}$ close enough to zero,

$$
\frac{1}{n} \sum_{i=1}^{n}\left(P\left|e_{i}-\left(\theta-\theta_{0}\right)\left(x_{i}\right)\right|-P|e|\right) \lesssim-\frac{1}{n} \sum_{i=1}^{n}\left(\theta-\theta_{0}\right)^{2}\left(x_{i}\right) .
$$

In order to apply Theorem 3.4.1 with the empirical $L_{2}$-semimetric of the design points, it suffices to show that $\left\|\hat{\theta}_{n}-\theta_{0}\right\|$ converges to zero (so that we can take $\Theta_{n}$ to be inside a small ball in the uniform norm around $\theta_{0}$ ) and to control

$$
\mathrm{E}^{*} \sup _{\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2}<\delta^{2}}\left|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\left|e_{i}-\left(\theta-\theta_{0}\right)\left(x_{i}\right)\right|-\left|e_{i}\right|-P\left|e-\left(\theta-\theta_{0}\right)\left(x_{i}\right)\right|+P|e|\right)\right| .
$$

The centered variables within the large parentheses are bounded in absolute value by $2\left|\theta-\theta_{0}\right|\left(x_{i}\right)$. In view of Proposition A.1.6,

$$
\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(\left|e_{i}-\left(\theta-\theta_{0}\right)\left(x_{i}\right)\right|-\left|e_{i}\right|-P\left|e-\theta\left(x_{i}\right)\right|+P|e|\right)\right\|_{\psi_{2}} \lesssim\left(\mathbb{P}_{n}\left(\theta-\theta_{0}\right)^{2}\right)^{1 / 2}
$$

Thus the $\psi_{2}$-norm of the increments is bounded by the $L_{2}\left(\mathbb{P}_{n}\right)$-norm of the regression functions. According to Corollary 2.2.8, Theorem 3.4.1 can be applied with

$$
\phi_{n}(\delta)=\int_{0}^{\delta} \sqrt{\log N\left(\varepsilon, \Theta_{n}, L_{2}\left(\mathbb{P}_{n}\right)\right)} d \varepsilon
$$

Note that this is true without any tail conditions on the error distribution. It can be concluded that the method of least-absolute-deviations estimation is very robust against outliers, also in the sense of stabilizing rates of convergence in nonparametric regression problems.

## Problems and Complements

1. If the conditions of Theorem 3.4.1 hold for $\eta=\infty$, then $r_{n} d_{n}\left(\hat{\theta}_{n}, \theta_{n}\right)$ converges to zero in mean. If the second condition of the theorem is strengthened to

$$
\left\|_{\delta / 2<d_{n}\left(\theta, \theta_{n}\right) \leq \delta, \theta \in \Theta_{n}} \sqrt{n}\left[\left(\mathbb{M}_{n}-M_{n}\right)(\theta)-\left(\mathbb{M}_{n}-M_{n}\right)\left(\theta_{n}\right)\right]^{+}\right\|_{p} \lesssim \phi_{n}(\delta)
$$

then the sequence $r_{n} d_{n}\left(\hat{\theta}_{n}, \theta_{n}\right)$ converges to zero in $p$ th mean. Finally, to obtain the conclusion of the theorem (convergence in probability), it suffices that a probability version of this condition is valid.
[Hint: Bound $\mathrm{E}^{*} r_{n}^{p} d_{n}^{p}\left(\hat{\theta}_{n}, \theta_{n}\right)$ by the $\operatorname{sum} \sum 2^{j p} \mathrm{P}^{*}\left(\hat{\theta}_{n} \in S_{j, n}\right)$.]
2. The conditions in Theorem 3.4.1 can be relaxed to

$$
\sup ^{*} \sup _{\delta / 2<d_{n}\left(\theta, \theta_{n}\right) \leq \delta, \theta \in \Theta_{n}} M_{n}(\theta)-M_{n}\left(\theta_{n}\right) \leq-c \delta^{2},
$$

for constants $c>d \geq 0$. If the other conditions of the theorem remain valid, so does the conclusion.
3. Under the conditions of Lemma 3.4.2 or 3.4.3, the expectation

$$
\mathrm{E}_{P}^{*} \sup _{f}\left(\mathbb{G}_{n} f-\eta \sqrt{n}\right)^{+}
$$

is bounded by the right side of the lemma, but with the entropy integrals computed over the interval $[\eta / 8, \delta]$ rather than $[0, \delta]$.
4. For any nonnegative numbers $p$ and $q$,

$$
\left|(2 p)^{1 / 2}-(p+q)^{1 / 2}\right| \leq\left|p^{1 / 2}-q^{1 / 2}\right| \leq\left(1+\frac{1}{2} \sqrt{2}\right)\left|(2 p)^{1 / 2}-(p+q)^{1 / 2}\right| .
$$

Thus $h(p, q)$ and $h(2 p, p+q)$ are equivalent up to constants.
[Hint: The lower inequality is trivial. The upper is valid with constant $\sqrt{2}$ if $q \geq p$ and with constant $1+\frac{1}{2} \sqrt{2}$ as stated if $q \leq p$.]
5. For any elements $x, y$, and $z$ in a normed space and $c \geq 2$, we have $\| x- z\left\|^{2}-\right\| y-z\left\|^{2} \geq(1-2 / c)^{2}\right\| x-y \|^{2}$ whenever $\|x-y\| \geq c\|z-y\|$.
[Hint: By the triangle inequality, $\|x-y\| \leq\|x-z\|-\|y-z\|+2\|y-z\|$. Bound $\|z-y\|$ by $1 / c$ times the left side and thus obtain

$$
(1-2 / c)\|x-y\| \leq\|x-z\|-\|y-z\| .
$$

Take squares and use the fact that the right-hand side is nonnegative, since $c \geq 2$, so that one difference in the square on the right can be replaced by a sum.]
6. Consider Example 3.2.15 with the additional assumption that the distribution $G$ of the observation times is fixed and known. Consider the class $\mathcal{P}$ of
densities with respect to $\mu=G \times \nu$, where $\nu$ is the counting measure on $\{0,1\}$, given by

$$
\mathcal{P}=\left\{p_{F}(t, \delta)=F(t)^{\delta}(1-F(t))^{1-\delta}: F \text { is a d.f. on } \mathbb{R}\right\}
$$

Let $\hat{F}$ denote the maximum likelihood estimator as described in Example 3.2.15, given a sample $\left(T_{1}, \Delta_{1}\right), \ldots,\left(T_{n}, \Delta_{n}\right)$ from $p_{F_{0}}$. Show that $h\left(p_{\hat{F}_{n}}, p_{F_{0}}\right)=O_{p}\left(n^{-1 / 3}\right)$.
[Hint: See Van de Geer (1993a), pages 25 and 35.]
7. Does the result in Exercise 3.4.6 change if $G$ is unknown?

## 3.5

## Random Sample Size, Poissonization and Kac Processes

It can be argued that in practice the number of available observations is random and perhaps dependent on the same random phenomenon. In the first section it is shown in fair generality that the empirical central limit theorem is valid also for random sample size.

The Kac process is a Poisson process obtained by taking the sample size in the empirical distribution to be a Poisson distributed variable independent of the data. We study the convergence of the Kac empirical process.

### 3.5.1 Random Sample Size

Suppose that at "time" $n$ a random number $N_{n}$ of observations from an infinite i.i.d. sequence $X_{1}, X_{2}, \ldots$ is available. Formally, $N_{n}$ is any integervalued, nonnegative map defined on the same probability space as the sequence of observations. Assume that the sequence $N_{n}$ converges to infinity in the strong sense that

$$
\frac{N_{n}}{c_{n}} \xrightarrow{\mathrm{P}} \nu,
$$

for a strictly positive random variable $\nu$ and a deterministic sequence $c_{n} \rightarrow \infty$. Let $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ be the empirical process as before. Then $\mathbb{G}_{N_{n}}$ converges in distribution whenever the sequence $\mathbb{G}_{n}$ does, to the same limit.
3.5.1 Theorem. Let $\mathcal{F}$ be a Donsker class of measurable functions. Suppose that $N_{n}$ is a sequence of positive, integer-valued random variables such
that $N_{n} / c_{n} \xrightarrow{\mathrm{P}} \nu$ for a random variable $\nu$ with $\mathrm{P}(\nu>0)=1$ and a deterministic sequence $c_{n} \rightarrow \infty$. Then the sequence $\mathbb{G}_{N_{n}}$ converges in distribution in $\ell^{\infty}(\mathcal{F})$ to a tight Brownian bridge as $n \rightarrow \infty$.

Proof. First, suppose that $c_{n}=n$ and $N_{n} / n \leq M$ for some number $M$. Let $\mathbb{Z}_{n}(s, f)=n^{-1 / 2} \sum_{i=1}^{\lfloor n s\rfloor}\left(\delta_{X_{i}}-P\right)$ be the sequential empirical process. By a minor extension of Theorem 2.12.1, the sequence $\mathbb{Z}_{n}$ converges in distribution in $\ell^{\infty}([0, M] \times \mathcal{F})$ to a Kiefer-Müller process $\mathbb{Z}$.

The lemma below shows that the sequence $\left(\mathbb{Z}_{n}, N_{n} / n\right)$ converges weakly in the space $\ell^{\infty}([0, M] \times \mathcal{F}) \times \mathbb{R}$ to a pair $(\mathbb{Z}, \nu)$ of independent random elements $\mathbb{Z}$ and $\nu$. Now

$$
\frac{1}{\sqrt{n}} \sum_{i=1}^{N_{n}}\left(\delta_{X_{i}}-P\right) f=\mathbb{Z}_{n}\left(\frac{N_{n}}{n}, f\right)=g\left(\mathbb{Z}_{n}, \frac{N_{n}}{n}\right) f,
$$

where $g: \ell^{\infty}([0, M] \times \mathcal{F}) \times \mathbb{R} \mapsto \ell^{\infty}(\mathcal{F})$ is defined by $g(z, r)=z(r, \cdot)$. The map $g$ is continuous at every point ( $z, r$ ) such that $s \mapsto z(s, \cdot)$ is continuous with respect to $\|\cdot\|_{\mathcal{F}}$. The paths of the Kiefer-Müller process $\mathbb{Z}$ possess the latter continuity property with probability 1 . Thus, the continuous mapping theorem yields $g\left(\mathbb{Z}_{n}, N_{n} / n\right) \rightsquigarrow g(\mathbb{Z}, \nu)=\mathbb{Z}(\nu, \cdot)$. By the same argument,

$$
\mathbb{G}_{N_{n}}=\frac{1}{\sqrt{N_{n}}} \sum_{i=1}^{N_{n}}\left(\delta_{X_{i}}-P\right) \rightsquigarrow \frac{1}{\sqrt{\nu}} \mathbb{Z}(\nu, \cdot) .
$$

Since $\nu$ and $\mathbb{Z}$ are independent and $\nu^{-1 / 2} \mathbb{Z}(\nu, \cdot)$ is distributed as a Brownian bridge for every deterministic $\nu$, the variable on the right is distributed as a Brownian bridge. This concludes the proof under the special assumptions on the $N_{n}$.

If $N_{n} / n$ is not bounded (but still $c_{n}=n$ ), define $N_{n, M}=N_{n} \wedge(M n)$. By the preceding argument, $\mathbb{G}_{N_{n, M}} \rightsquigarrow \mathbb{G}$ for every $M$. The probability that $N_{n, M} \neq N_{n}$ can be made arbitrarily small by choice of $M$. The theorem follows.

Finally, the case that $c_{n} \neq n$ can be treated by relabeling the indexes. We may assume that each $c_{n}$ is an integer. Furthermore, since it suffices to show that every subsequence of $\{n\}$ has a further subsequence along which $\mathbb{G}_{N_{n}}$ converges, it is not a loss of generality to assume that $c_{n}$ is also strictly increasing. Define $N_{k}^{\prime}=N_{n}$ if $c_{n}=k$ and define $N_{k}^{\prime}=k \nu$ if $k \neq c_{n}$ for every $n$. Then $N_{k}^{\prime} / k \xrightarrow{\mathrm{P}} \nu$, hence $\mathbb{G}_{N_{k}^{\prime}} \rightarrow \mathbb{G}$. The sequence $\mathbb{G}_{N_{n}}$ is a subsequence.
3.5.2 Lemma. Let $\mathcal{F}$ be a Donsker class and $\nu_{n}$ a sequence of random variables such that $\nu_{n} \xrightarrow{\mathrm{P}} \nu$ for a random variable $\nu$. Then the sequence of sequential empirical processes $\mathbb{Z}_{n}$ satisfies $\left(\mathbb{Z}_{n}, \nu_{n}\right) \rightsquigarrow(\mathbb{Z}, \nu)$ in $\ell^{\infty}([0, M] \times \mathcal{F}) \times \mathbb{R}$, where $\mathbb{Z}$ and $\nu$ are independent.

Proof. Let $k_{n} \rightarrow \infty$ slowly enough that $k_{n}=o(\sqrt{n})$. Set

$$
\mathbb{Z}_{n}^{\prime}(s, f)=\frac{1}{\sqrt{n}} \sum_{i=k_{n}+1}^{\lfloor n s\rfloor}\left(\delta_{X_{i}}-P\right)
$$

Then the sequence $\mathbb{Z}_{n}^{\prime}-\mathbb{Z}_{n}$ converges to zero in probability in $\ell^{\infty}([0, M] \times \mathcal{F}$ ). By a version of Slutsky's lemma, the sequence ( $\mathbb{Z}_{n}^{\prime}, \nu$ ) has the same limit distribution as the sequence $\left(\mathbb{Z}_{n}, \nu_{n}\right)$. By Doob's martingale convergence theorem, $\mathrm{P}\left(\nu \in B \mid X_{1}, \ldots, X_{k}\right) \rightarrow \mathrm{P}\left(\nu \in B \mid X_{1}, X_{2}, \ldots\right)$ in mean as $k \rightarrow \infty$. Conclude that

$$
\lim _{n \rightarrow \infty} \mathrm{P}^{*}\left(\mathbb{Z}_{n}^{\prime} \in A, \nu \in B\right)=\lim _{n \rightarrow \infty} \mathrm{E}\left(1_{A}\left(\mathbb{Z}_{n}^{\prime}\right)^{*} \mathrm{P}\left(\nu \in B \mid X_{1}, \ldots, X_{k_{n}}\right)\right)
$$

Since $\mathbb{Z}_{n}^{\prime}$ is independent of $X_{1}, \ldots, X_{k_{n}}$, the expectation in the right side can be factorized as $\mathrm{P}^{*}\left(\mathbb{Z}_{n}^{\prime} \in A\right) \mathrm{P}(\nu \in B)$. This converges to $\mathrm{P}(\mathbb{Z} \in A) \mathrm{P}(\nu \in B)$ for every continuity set $A$.

The assumption on the sequence $N_{n}$ in the preceding theorem is remarkably weak. Under the stronger assumption that $N_{n} / n \xrightarrow{\mathrm{P}} 1$, the sequences $\mathbb{G}_{N_{n}}$ and $\mathbb{G}_{n}$ are not only asymptotically equal in law, but also equivalent in probability.
3.5.3 Theorem. Let $\mathcal{F}$ be a Donsker class of measurable functions. Suppose that $N_{n}$ is a sequence of positive, integer-valued random variables such that $N_{n} / n \xrightarrow{\mathrm{P}} 1$. Then the sequence $\mathbb{G}_{N_{n}}-\mathbb{G}_{n}$ converges in outer probability to zero in $\ell^{\infty}(\mathcal{F})$ as $n \rightarrow \infty$.

Proof. With the same notation as in the proof of Theorem 3.5.1, the sequence $\left(\mathbb{Z}_{n}, N_{n} / n\right)$ converges in distribution to $(\mathbb{Z}, 1)$ in the space $\ell^{\infty}([0,2] \times \mathcal{F}) \times \mathbb{R}$. By the continuous mapping theorem, $\mathbb{Z}_{n}\left(N_{n} / n, \cdot\right)- \mathbb{Z}_{n}(1, \cdot) \rightsquigarrow \mathbb{Z}(1, \cdot)-\mathbb{Z}(1, \cdot)=0$ in $\ell^{\infty}(\mathcal{F})$. Convergence in distribution and in outer probability to a degenerate limit are equivalent.

### 3.5.2 Poissonization

Let the sample size $N_{n}$ at "time" $n$ be a Poisson variable with mean $n$ and independent of the i.i.d. observations $X_{1}, X_{2}, \ldots$. The random measure

$$
\mathbb{N}_{n}=\sum_{i=1}^{N_{n}} \delta_{X_{i}}
$$

is the Kac empirical point process. Straightforward calculations show that, for every measurable set $C$, the random variable $\mathbb{N}_{n}(C)$ is Poissondistributed with mean $n P(C)$ (where $P(C)=\mathrm{P}\left(X_{i} \in C\right)$ ). Furthermore, for every finite collection $C_{1}, \ldots, C_{k}$ of pairwise-disjoint measurable sets,
the random variables $\mathbb{N}_{n}\left(C_{1}\right), \ldots, \mathbb{N}_{n}\left(C_{k}\right)$ are independent. Thus the Kac process $\mathbb{N}_{n}$ is a (generalized) Poisson process on the sample space ( $\mathcal{X}, \mathcal{A}$ ) with intensity measure $n P$.

Given a class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$, consider the process $\left\{\mathbb{N}_{n}(f): f \in \mathcal{F}\right\}$. Its mean and variance function equal $\mathrm{EN}_{n}(f)=n P f= \operatorname{var} \mathbb{N}_{n}(f)$. A standardized version of this process is

$$
\mathbb{Z}_{n}=\frac{1}{\sqrt{n}}\left(\mathbb{N}_{n}-n P\right)=\sqrt{\frac{N_{n}}{n}} \mathbb{G}_{N_{n}}+\sqrt{n}\left(\frac{N_{n}}{n}-1\right) P,
$$

where $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ is the empirical process. The collection $\mathcal{F}$ is called $P$ - $K a c$ if the sequence $\mathbb{Z}_{n}$ converges in distribution to a tight limit process in $\ell^{\infty}(\mathcal{F})$. (The sample paths of $\mathbb{Z}_{n}$ are in $\ell^{\infty}(\mathcal{F})$ if $\mathcal{F}$ possesses a finite envelope function and $\|P\|_{\mathcal{F}}<\infty$.)

Since $N_{n} / n \xrightarrow{\mathrm{P}} 1$, Theorem 3.5.3 yields that $\mathbb{G}_{N_{n}}-\mathbb{G}_{n} \xrightarrow{\mathrm{P}} 0$ if $\mathcal{F}$ is Donsker. In that case the sequence $\mathbb{Z}_{n}$ is equivalent to the sequence $\mathbb{G}_{n}+ \sqrt{n}\left(N_{n} / n-1\right) P$ and converges in distribution to $\mathbb{G}+Z P$ for an independent Brownian bridge $\mathbb{G}$ and $N(0,1)$ variable $Z$. Thus the limit process $\mathbb{Z}= \mathbb{G}+Z P$ in the Kac central limit theorem is a Brownian motion process and has covariance function

$$
\mathrm{E} \mathbb{Z}(f) \mathbb{Z}(g)=P f g
$$

Each $\mathbb{Z}_{n}$ has the same covariance function, $\mathrm{E} \mathbb{Z}_{n}(f) \mathbb{Z}_{n}(g)=\operatorname{Pfg}$.
We have shown that every Donsker class with $\|P\|_{\mathcal{F}}<\infty$ is Kac. Actually, these two concepts are equivalent, which can be seen from the following concentration lemma.

Since $\mathbb{N}_{n}$ is a Poisson process with intensity measure $n P$, it can be written as the sum of $n$ i.i.d. Poisson processes of intensity measure $P$. Formally, let $Y_{1}, Y_{2}, \ldots$ be an i.i.d. sequence of Poisson(1) variables, and let $X_{i, j}$ be an array of i.i.d. copies of $X_{1}$. Then the process

$$
H_{n}=\sum_{i=1}^{n} \sum_{j=1}^{Y_{i}}\left(\delta_{X_{i, j}}-P\right)
$$

is equal in distribution to $H_{n}^{\prime}=\sum_{i=1}^{N_{n}}\left(\delta_{X_{i}}-P\right)$ (in the sense that $\mathrm{E}^{*} h\left(H_{n}\right)=\mathrm{E}^{*} h\left(H_{n}^{\prime}\right)$ for every $h$ if the $Y_{i}$ and $X_{i, j}$ are suitably defined as coordinate projections on a product space). It follows that the random-sample central limit theorem for $\mathbb{G}_{N_{n}}$ is equivalent to the central limit theorem for a deterministic number of Poisson processes of the type $\sum_{j=1}^{Y_{i}}\left(\delta_{X_{i, j}}-P\right)$. Le Cam's lemma compares the concentration of these processes with the concentration of the empirical process.
3.5.4 Lemma (Le Cam's Poissonization lemma). Let $N_{n}$ be Poissondistributed with mean $n$ and be independent of the i.i.d. zero-mean stochastic processes $Z_{1}, \ldots, Z_{n}$. Then for any class of functions $\mathcal{F}$

$$
\left(1-\frac{1}{e}\right) \mathrm{E}^{*}\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}} \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{N_{n}} Z_{i}\right\|_{\mathcal{F}}
$$

Proof. A Poisson variable $Y_{i}$ with mean 1 satisfies $\mathrm{E}\left(Y_{i} \wedge 1\right)=1-e^{-1}$. Let the array $Z_{i, j}$ consist of i.i.d. copies of $Z_{1}$ independent of $Y_{1}, \ldots, Y_{n}$. The left side of the lemma equals

$$
\begin{aligned}
\mathrm{E}_{Z}^{*}\left\|\mathrm{E}_{Y} \sum_{i=1}^{n}\left(Y_{i} \wedge 1\right) Z_{i}\right\|_{\mathcal{F}} & \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{n}\left(Y_{i} \wedge 1\right) Z_{i}\right\|_{\mathcal{F}} \\
& \leq \mathrm{E}_{Y} \mathrm{E}_{Z}^{*}\left\|\sum_{i=1}^{n} \sum_{j=1}^{Y_{i}} Z_{i, j}\right\|_{\mathcal{F}}
\end{aligned}
$$

Here the factorization of $\mathrm{E}^{*}$ as $\mathrm{E}_{Y} \mathrm{E}_{Z}^{*}$ is warranted by Lemma 1.2.7, and in the last step we replace 0 by 0 if $Y_{i}=0, Z_{i}$ by $Z_{i, 1}$ if $Y_{i}=1, Z_{i}$ by $Z_{i, 1}+Z_{i, 2}$ if $Y_{i}=2$, etc. The inequality is valid in view of the inequality $\mathrm{E}^{*}\left\|Z_{1}\right\|=\mathrm{E}^{*}\left\|Z_{1}+\mathrm{E} Z_{2}\right\| \leq \mathrm{E}^{*}\left\|Z_{1}+Z_{2}\right\|$ for independent processes $Z_{1}$ and $Z_{2}$ with $\mathrm{E} Z_{2}=0$.

By the discussion preceding the lemma, the double sum on the right side is equal in distribution to $\sum_{i=1}^{N_{n}} Z_{i}$.
3.5.5 Theorem. A class $\mathcal{F}$ of measurable functions with $\|P\|_{\mathcal{F}}<\infty$ is Kac if and only it is Donsker. In that case $\left\|\mathbb{G}_{N_{n}}-\mathbb{G}_{n}\right\|_{\mathcal{F}}^{*}=O_{P}\left(n^{-1 / 4}\right)$.

Proof. Set $\mathbb{G}_{n}^{\prime}=n^{-1 / 2} \sum_{i=1}^{N_{n}}\left(\delta_{X_{i}}-P\right)$. If $N_{n}=n+k$, then the difference $\mathbb{G}_{n}-\mathbb{G}_{n}^{\prime}$ is the sum of $k$ terms $n^{-1 / 2}\left(\delta_{X_{i}}-P\right)$. Since $\mathrm{P}\left(\left|N_{n}-n\right| \geq M \sqrt{n}\right) \leq M^{-2}$ by Chebyshev's inequality, we have for every $\varepsilon>0$

$$
\begin{aligned}
\mathrm{P}^{*}\left(\| \mathbb{G}_{n}\right. & \left.-\mathbb{G}_{n}^{\prime} \|_{\mathcal{F}}>\varepsilon\right) \\
& \leq \frac{1}{M^{2}}+\frac{1}{\varepsilon} \sum_{|k|<M \sqrt{n}} \mathrm{P}\left(N_{n}=n+k\right) \mathrm{E}^{*}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{|k|}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}} \\
& \leq \frac{1}{M^{2}}+\frac{1}{\varepsilon \sqrt{n}} \mathrm{E}^{*}\left\|\sum_{i=1}^{\lfloor M \sqrt{n}\rfloor}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}} .
\end{aligned}
$$

Here the last step follows, since the outer expectations $\mathrm{E}^{*}\left\|\sum_{i=1}^{|k|}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}$ are non-decreasing in $|k|$ by Jensen's inequality.

If $\mathcal{F}$ is Donsker, then the sequence $n^{-1 / 4} \mathrm{E}^{*}\left\|\sum_{i=1}^{\lfloor M \sqrt{n}\rfloor}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}$ is bounded by Lemma 2.3.11. In that case the calculation in the preceding paragraph shows that the probability $\mathrm{P}^{*}\left(\left\|\mathbb{G}_{n}-\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}>K n^{-1 / 4}\right)$ is
bounded by $M^{-2}+K^{-1} O(1)$. Its limsup as $n \rightarrow \infty$ can be made arbitrarily small by choice of $M$ and $K$. Thus $\left\|\mathbb{G}_{n}-\mathbb{G}_{n}^{\prime}\right\|_{\mathcal{F}}^{*}=O_{P}\left(n^{-1 / 4}\right)$. The theorem follows, because $\left\|\mathbb{G}_{n}^{\prime}-\mathbb{G}_{N_{n}}\right\|_{\mathcal{F}}^{*}=O_{P}\left(n^{-1 / 2}\right)$.

If $\mathcal{F}$ is Kac, then $\mathbb{G}_{n}^{\prime}=n^{-1 / 2}\left(\mathbb{N}_{n}-\mathbb{N}_{n}(1) P\right)$ converges in distribution to a tight limit. In view of the preceding discussion, this is equivalent to the processes $Z_{i}=\sum_{j=1}^{Y_{i}}\left(\delta_{X_{i, j}}-P\right)$ satisfying the central limit theorem. Thus the sequence of expectations $n^{-1 / 2} \mathrm{E}^{*}\left\|\sum_{i=1}^{n} Z_{i}\right\|_{\mathcal{F}}$ is bounded by Lemma 2.3.11. By Le Cam's lemma these expectations dominate the outer expectations $n^{-1 / 2} \mathrm{E}^{*}\left\|\sum_{i=1}^{n}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}$ up to a positive constant and the argument can be finished as before.

## 3.6

## The Bootstrap

In this chapter we first prove the asymptotic consistency of the empirical bootstrap estimator of the distribution of the empirical process. Next this result is generalized to more general, "exchangeable" bootstrap schemes. The results of this chapter are particularly interesting when combined with those of Section 3.9.3, which show that the consistency of the bootstrap is retained under application of the delta-method.

### 3.6.1 The Empirical Bootstrap

Let $\mathbb{P}_{n}$ be the empirical measure of an i.i.d. sample $X_{1}, \ldots, X_{n}$ from a probability measure $P$. Given the sample values, let $\hat{X}_{1}, \ldots, \hat{X}_{n}$ be an i.i.d. sample from $\mathbb{P}_{n}$. The bootstrap empirical distribution is the empirical measure $\hat{\mathbb{P}}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{\hat{X}_{i}}$, and the bootstrap empirical process $\hat{\mathbb{G}}_{n}$ is

$$
\hat{\mathbb{G}}_{n}=\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(M_{n i}-1\right) \delta_{X_{i}},
$$

where $M_{n i}$ is the number of times that $X_{i}$ is "redrawn" from the original sample. Instead of $n$ we can also "redraw" $k$ bootstrap values $\hat{X}_{1}, \ldots, \hat{X}_{k}$. The corresponding bootstrap empirical process is

$$
\hat{\mathbb{G}}_{n, k}=\sqrt{k}\left(\hat{\mathbb{P}}_{k}-\mathbb{P}_{n}\right)=\frac{1}{\sqrt{k}} \sum_{i=1}^{n}\left(M_{k i}-\frac{k}{n}\right) \delta_{X_{i}}
$$

A more precise specification of taking "bootstrap samples" $\hat{X}_{1}, \ldots, \hat{X}_{k}$ should include a probability space on which these variables are defined.
(This would be particularly appropriate since the results in this chapter are formulated in terms of outer measure.) Alternatively, the definitions of the bootstrap processes can be made rigorous by simply defining them as the far right side of the preceding displays. This is more convenient for the purpose of this chapter. In the resulting definition of $\hat{\mathbb{G}}_{n}$ and $\hat{\mathbb{G}}_{n, k}$, it is further specified that the vector ( $M_{k 1}, \ldots, M_{k n}$ ) is independent of $X_{1}, \ldots, X_{n}$ and multinomially distributed with parameters $k$ and (probabilities) $1 / n, \ldots, 1 / n$. For computing outer expectations independence is understood in terms of a product probability space. Let $X_{1}, X_{2}, \ldots$ be the coordinate projections on the first $\infty$ coordinates of the product space $\left(\mathcal{X}^{\infty}, \mathcal{A}^{\infty}, P^{\infty}\right) \times(\mathcal{Z}, \mathcal{C}, Q)$ and let the multinomial vectors $M$ depend on the last factor only. ${ }^{\dagger}$ The Poisson variables introduced later are also assumed to depend on $\mathcal{Z}$ only.

Let $\mathcal{F}$ be a class of measurable functions with a finite envelope function. Then $\hat{\mathbb{G}}_{n}$ considered as a process indexed by $\mathcal{F}$ can be viewed as a map in $\ell^{\infty}(\mathcal{F})$. The main result of this section is that the sequence $\hat{\mathbb{G}}_{n}$ converges in $\ell^{\infty}(\mathcal{F})$ conditionally in distribution to a tight Brownian bridge process given almost all sequences $X_{1}, X_{2}, \ldots$ if and only if $\mathcal{F}$ is Donsker and $P^{*} \| f- P f \|_{\mathcal{F}}^{2}<\infty$. In that case the difference between the "conditional random law" of $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)$ and the "law" of $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges to zero almost surely. In statistical terms this means that the conditional law of $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\right. \left.\mathbb{P}_{n}\right)$ is an asymptotically consistent estimator of the law of $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$. This result is particularly interesting in combination with the delta-method, by which the consistency result carries over to a large class of statistics which are smooth functionals of the empirical distribution (see Section 3.9.3).

The result on almost-sure weak convergence of the bootstrap empirical process is reminiscent of the multiplier central limit theorem discussed in Chapter 2.9. The difference is that in the bootstrap situation the multipliers $M_{n 1}-1, \ldots, M_{n n}-1$ are dependent. Our line of proof is to remove the dependence by Poissonization and to show that the Poissonized process and the ordinary bootstrap process are asymptotically equivalent.

Instead of $n$, take a Poisson number $N_{n}$ of replicates, where $N_{n}$ has mean $n$ and is independent of the original observations. Then $M_{N_{n}, 1}, \ldots, M_{N_{n}, n}$ are i.i.d. Poisson variables with mean 1 . The corresponding bootstrap empirical process can be written

$$
\hat{\mathbb{G}}_{n, N_{n}}=\frac{1}{\sqrt{N_{n}}} \sum_{i=1}^{n}\left(M_{N_{n}, i}-1\right)\left(\delta_{X_{i}}-P\right)-\frac{N_{n}-n}{\sqrt{N_{n}}}\left(\mathbb{P}_{n}-P\right) .
$$

Conditionally on $X_{1}, X_{2}, \ldots$, the second term converges in distribution to zero almost surely if $\mathcal{F}$ is Glivenko-Cantelli. Furthermore, by the results of Chapter 2.9, the first term converges in distribution to a Brownian bridge process almost surely if and only if $\mathcal{F}$ is Donsker and $P^{*}\|f-P f\|_{\mathcal{F}}^{2}<\infty$. It follows under these conditions that the Poissonized bootstrap process

[^9]$\hat{\mathbb{G}}_{n, N_{n}}$ converges to a Brownian bridge. In the proof ahead, it is shown that the difference in distribution between $\hat{\mathbb{G}}_{n, N_{n}}$ and $\hat{\mathbb{G}}_{n}=\hat{\mathbb{G}}_{n, n}$ is very small.

As in Chapter 2.9, (conditional) weak convergence is formulated in terms of the bounded Lipschitz metric.
3.6.1 Theorem. Let $\mathcal{F}$ be a class of measurable functions with finite envelope function. Define $\hat{\mathbb{Y}}_{n}=n^{-1 / 2} \sum_{i=1}^{n}\left(M_{N_{n}, i}-1\right)\left(\delta_{X_{i}}-P\right)$. The following statements are equivalent:
(i) $\mathcal{F}$ is Donsker;
(ii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{M, N} h\left(\hat{\mathbb{Y}}_{n}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\mathrm{P} *} 0$ and $\hat{Y}_{n}$ is asymptotically measurable;
(iii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\mathrm{P} *} 0$ and $\hat{\mathbb{G}}_{n}$ is asymptotically measurable.
3.6.2 Theorem. Let $\mathcal{F}$ be a class of measurable functions with finite envelope function. Define $\hat{\mathbb{Y}}_{n}=n^{-1 / 2} \sum_{i=1}^{n}\left(M_{N_{n}, i}-1\right)\left(\delta_{X_{i}}-P\right)$. The following statements are equivalent:
(i) $\mathcal{F}$ is Donsker and $P^{*}\|f-P f\|_{\mathcal{F}}^{2}<\infty$;
(ii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{M, N} h\left(\hat{\mathbb{Y}}_{n}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\text { as* }} 0$ and the sequence $\mathrm{E}_{M, N} h\left(\hat{\mathbb{Y}}_{n}\right)^{*}$ $\mathrm{E}_{M, N} h\left(\mathbb{Y}_{n}\right)_{*}$ converges almost surely to zero for every $h \in \mathrm{BL}_{1}$;
(iii) $\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\text { as* }} 0$ and the sequence $\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)^{*}- \mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)_{*}$ converges almost surely to zero for every $h \in \mathrm{BL}_{1}$.
Here the asterisks denote the measurable cover functions with respect to $M, N$, and $X_{1}, X_{2}, \ldots$ jointly.

Proofs. The equivalence of (i) and (ii) in both theorems is an immediate consequence of the multiplier central limit theorems, Theorems 2.9.6 and 2.9.7. The proof that (i)+(ii) is equivalent to (iii) is based on a coupling of the bootstrap empirical process $\hat{\mathbb{G}}_{n}$ and its (partly) Poissonized version $\hat{Y}_{n}$ by a special construction of multinomial variables. Let $m_{n}^{(1)}, m_{n}^{(2)}, \ldots$ be i.i.d. multinomial( $1, n^{-1}, \ldots, n^{-1}$ ) variables independent of $N_{n}$ and set

$$
M_{n}=\sum_{i=1}^{n} m_{n}^{(i)} ; \quad M_{N_{n}}=\sum_{i=1}^{N_{n}} m_{n}^{(i)}
$$

Define $\hat{\mathbb{G}}_{n}$ using $M_{n}$ and $\hat{\mathbb{Y}}_{n}$ using $M_{N_{n}}$. Note that $\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)$ and $\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)^{*}$ do not depend on the probability space on which $M_{n}$ is defined (up to null sets). The first depends on the distribution of $M_{n}$ only, in the second $h\left(\hat{\mathbb{G}}_{n}\right)^{*}$ is equal to the measurable majorant with respect to $X_{1}, \ldots, X_{n}$ only by the remarks following Lemma 1.2.7.

The absolute difference $\left|M_{N_{n}}-M_{n}\right|$ is the sum of $\left|N_{n}-n\right|$ of the variables $m_{n}^{(i)}$. Given $N_{n}=k$, its $i$-th component $\left|M_{N_{n}, i}-M_{n, i}\right|$ is binomially $\left(|k-n|, n^{-1}\right)$-distributed. For any $\varepsilon>0$, there exists a sequence of integers
$\ell_{n}$ with $\ell_{n}=O(\sqrt{n})$ such that $\mathrm{P}\left(\left|N_{n}-n\right| \geq \ell_{n}\right) \leq \varepsilon$ for every $n$. By direct calculation,

$$
\mathrm{P}\left(\max _{1 \leq i \leq n}\left|M_{N_{n}, i}-M_{n, i}\right|>2\right) \leq \varepsilon+n \mathrm{P}\left(\operatorname{bin}\left(\ell_{n}, n^{-1}\right)>2\right) \rightarrow \varepsilon .
$$

It follows that for sufficiently large $n$ all coordinates of the vector $\mid M_{N_{n}}- M_{n} \mid$ are 0,1 , or 2 with probability at least $1-2 \varepsilon$. (The 2 is not important for the following: any bound would do.)

We can write $\left|M_{N i}-M_{n i}\right|=\sum_{j=1}^{\infty} 1\left\{\left|M_{N i}-M_{n i}\right| \geq j\right\}$. Alternatively, with $I_{n}^{j}$ the set of indexes $i \in\{1,2, \ldots, n\}$ such that $\left|M_{N i}-M_{n i}\right| \geq j$, we have $M_{N i}-M_{n i}=\operatorname{sign}(N-n) \sum_{j=1}^{\infty} 1\left\{i \in I_{n}^{j}\right\}$. Thus,

$$
\begin{aligned}
\hat{\mathbb{Y}}_{n}-\hat{\mathbb{G}}_{n} & =\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(M_{N i}-M_{n i}\right)\left(\delta_{X_{i}}-P\right) \\
& =\operatorname{sign}(N-n) \sum_{j=1}^{\infty} \frac{\# I_{n}^{j}}{\sqrt{n}}\left(\frac{1}{\# I_{n}^{j}} \sum_{i \in I_{n}^{j}}\left(\delta_{X_{i}}-P\right)\right) .
\end{aligned}
$$

On the set where $\max _{1 \leq i \leq n}\left|M_{N i}-M_{n i}\right| \leq 2$, only the first two terms of the sum over $j$ can be nonzero. For any $j$ we have $j\left(\# I_{n}^{j}\right) \leq\left|N_{n}-n\right|=O_{P}(\sqrt{n})$. Furthermore, the norm of the average between brackets on the far right side converges to zero outer almost surely for any $j$ if $\mathcal{F}$ is a Glivenko-Cantelli class (cf. Lemma 3.6.16 ahead). Conclude that in that case

$$
\mathrm{P}_{M, N}\left(\left\|\hat{\mathbb{Y}}_{n}-\hat{\mathbb{G}}_{n}\right\|_{\mathcal{F}}^{*}>\varepsilon\right) \rightarrow 0,
$$

as $n \rightarrow \infty$, given almost all sequences $X_{1}, X_{2}, \ldots$, for every $\varepsilon>0$. Consequently, the difference $\sup _{h}\left|\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n}\right)^{*}-\mathrm{E}_{M, N} h\left(\hat{\mathbb{Y}}_{n}\right)^{*}\right|$ converges to zero outer almost surely. The same is true for this expression with the asterisks removed or moved to the bottom.

It follows that (i)+(ii) and (iii) are equivalent (in both theorems) provided $\mathcal{F}$ is Glivenko-Cantelli. If (i)+(ii) holds, then $\mathcal{F}$ is Donsker and certainly Glivenko-Cantelli. Thus, the proof of the theorem in the most interesting direction is complete. For the proof in the converse direction, it must be shown that (iii) implies that $\mathcal{F}$ is Glivenko-Cantelli.

It is no loss of generality to assume that $P f=0$ for every $f$ in $\mathcal{F}$. Suppose that (iii) holds in probability, and assume for the moment that $P^{*} F^{p}<\infty$ for some $p>1$. Under (iii) the sequence $n^{-1 / 2}\left\|\hat{\mathbb{G}}_{n}\right\|_{\mathcal{F}}$ converges (unconditionally) to zero in outer probability. An application of Hölder's inequality yields

$$
\mathrm{E}^{*}\left(\frac{1}{\sqrt{n}}\left\|\hat{\mathbb{G}}_{n}\right\|_{\mathcal{F}}\right)^{p} \leq \mathrm{E}^{*} \frac{1}{n} \sum_{i=1}^{n}\left(M_{n i}+1\right)^{p} F^{p}\left(X_{i}\right)=\mathrm{E}\left(M_{n 1}+1\right)^{p} P^{*} F^{p}
$$

This is uniformly bounded in $n$. Conclude that $n^{-1 / 2}\left\|\hat{\mathbb{G}}_{n}\right\|_{\mathcal{F}}$ converges to zero in outer mean. This implies the same for $n^{-1 / 2}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}}$ in view of the
following inequalities. Since each $M_{n i}$ is binomially ( $n, n^{-1}$ ) distributed,

$$
\begin{aligned}
\left(1-\frac{1}{n}\right)^{n} \mathrm{E}^{*} \sqrt{n}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} & =\mathrm{E}_{X}^{*}\left\|\sum_{i=1}^{n} \mathrm{E}_{M} 1_{M_{n i}=0}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}^{*} \\
& \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{n} 1_{M_{n i}=0}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}^{*} \\
& =\mathrm{E}_{M} \mathrm{E}_{X}^{*}\left\|\sum_{i=1}^{n} 1_{M_{n i}=0}\left(1-M_{n i}\right)\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}^{*} \\
& \leq \mathrm{E}^{*}\left\|\sum_{i=1}^{n}\left(1-M_{n i}\right)\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}^{*}=\mathrm{E}^{*} \sqrt{n}\left\|\hat{G}_{n}\right\|_{\mathcal{F}}
\end{aligned}
$$

where the last inequality follows from the inequality $\mathrm{E}^{*}\|U\| \leq \mathrm{E}^{*}\|U+V\|$ for independent, zero-mean processes $U$ and $V$ (applied conditionally given $M$; also cf. Lemma 1.2.7). Conclude that $\mathcal{F}$ is Glivenko-Cantelli in outer mean. Still under the assumption that $P^{*} F<\infty$, a martingale argument shows that $\mathcal{F}$ is also Glivenko-Cantelli almost surely (cf. Lemma 2.4.5 and the proof of Theorem 2.4.3.)

Finally, it is shown that $F$ satisfies $P^{*} F^{p}<\infty$, for every $p<2$, under (iii) of the first theorem. The proof is based on the representation $\hat{\mathbb{G}}_{n}=n^{-1 / 2} \sum_{i=1}^{n}\left(\delta_{\hat{X}_{i}}-\mathbb{P}_{n}\right)$ of the bootstrap empirical process, where for each $n$ given the original observations $\hat{X}_{1}, \ldots, \hat{X}_{n}$ is an i.i.d. sample from $\mathbb{P}_{n}$. To give a precise meaning to the (conditional) outer probabilities, these bootstrap values can be defined as in Problem 3.6.1. As before, $\mathrm{P}_{M}$ denotes conditional probability given the original observations. Under assumption (iii), the sequence $\mathrm{P}_{M}\left(\left\|\hat{\mathbb{G}}_{n}\right\|^{*}>m_{n}\right)$ converges in probability to zero for every $m_{n} \rightarrow \infty$. Let $\hat{Y}_{1}, \ldots, \hat{Y}_{n}$ be an independent copy of $\hat{X}_{1}, \ldots, \hat{X}_{n}$ given the original observations based on multinomial variables $\tilde{M}$. Adapt the proof of the Lévy inequality given by Proposition A.1.2 to obtain

$$
\begin{aligned}
& \mathrm{P}_{M, \tilde{M}}\left(\max _{1 \leq i \leq n}\left\|f\left(\hat{X}_{i}\right)-f\left(\hat{Y}_{i}\right)\right\|_{\mathcal{F}}^{*}>m_{n} \sqrt{n}\right) \\
& \quad \leq 2 \mathrm{P}_{M, \tilde{M}}\left(\left\|\sum\left(f\left(\hat{X}_{i}\right)-f\left(\hat{Y}_{i}\right)\right)\right\|^{*}>m_{n} \sqrt{n}\right) \xrightarrow{\mathrm{P}} 0 .
\end{aligned}
$$

In view of Problem 2.3.2, it follows that

$$
n \mathrm{P}_{M, \tilde{M}}\left(\left\|f\left(\hat{X}_{i}\right)-f\left(\hat{Y}_{i}\right)\right\|_{\mathcal{F}}^{*}>m_{n} \sqrt{n}\right) \xrightarrow{\mathrm{P}} 0 .
$$

Since the processes $f\left(\hat{X}_{i}\right)$ and $f\left(\hat{Y}_{i}\right)$ are (conditionally) independent, the left side is an upper bound for

$$
n \mathrm{P}_{M}\left(\left\|f\left(\hat{X}_{i}\right)\right\|_{\mathcal{F}}^{*}>2 m_{n} \sqrt{n}\right) \mathrm{P}_{\tilde{M}}\left(\left\|f\left(\hat{Y}_{i}\right)\right\|_{\mathcal{F}}^{*} \leq m_{n} \sqrt{n}\right)
$$

Here $\left\|f\left(\hat{X}_{i}\right)\right\|_{\mathcal{F}}=\sum F\left(X_{j}\right) 1\left\{m_{n}^{(i)}=e_{j}\right\}$, so that we can conclude that

$$
n \mathrm{P}_{M}\left(\left\|f\left(\hat{X}_{i}\right)\right\|_{\mathcal{F}}^{*}>2 m_{n} \sqrt{n}\right)=\sum_{j=1}^{n} 1\left\{F^{*}\left(X_{j}\right)>2 m_{n} \sqrt{n}\right\} \xrightarrow{\mathrm{P}} 0 .
$$

Since the sums are binomially distributed, it follows that $n P\left(F^{*}>\right. \left.m 2_{n} \sqrt{n}\right)=O(1)$.

The preceding proof does not apply to the bootstrapped empirical process $\hat{\mathbb{G}}_{n, k}$ based on $k$ (possibly unequal to $n$ ) replicates of the original sample $X_{1}, \ldots, X_{n}$. However, the most important part of the theorem is true for arbitrary bootstrap sample sizes. If $\mathcal{F}$ is Donsker, then the "sequence" $\hat{\mathbb{G}}_{n, k}$ converges conditionally in distribution to a Brownian bridge process for every possible manner in which both $n, k \rightarrow \infty$.

Let $\mathcal{F}_{\delta}=\left\{f-g: f, g \in \mathcal{F}, \rho_{P}(f-g)<\delta\right\}$.
3.6.3 Theorem. Let $\mathcal{F}$ be a Donsker class of measurable functions such that $\mathcal{F}_{\delta}$ is measurable for every $\delta>0$. Then

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n, k_{n}}\right)-\mathrm{E} h(\mathbb{G})\right| \xrightarrow{\mathrm{P} *} 0,
$$

as $n \rightarrow \infty$, for any sequence $k_{n} \rightarrow \infty$. Furthermore, the sequence $\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n, k_{n}}\right)^{*}-\mathrm{E}_{M} h\left(\hat{\mathbb{G}}_{n, k_{n}}\right)_{*}$ converges to zero in probability for every $h \in \mathrm{BL}_{1}$. If $P^{*}\|f-P f\|_{\mathcal{F}}^{2}<\infty$, then the convergence is also outer almost surely.

Proof. As in the proof of the conditional multiplier theorems, Theorems 2.9 .6 and 2.9.7, it suffices to establish almost-sure convergence of all the finite-dimensional marginals plus conditional convergence to zero of the sequence $\left\|\hat{\mathbb{G}}_{n, k}\right\|_{\mathcal{F}_{\delta}}$. Without loss of generality, assume that $P f=0$ for every $f \in \mathcal{F}$.

The distribution of $\hat{\mathbb{G}}_{n, k} f$ equals that of $k^{-1 / 2}$ times the centered sum of the i.i.d. random variables $f\left(\hat{X}_{1}\right), \ldots, f\left(\hat{X}_{k}\right)$. Weak convergence of the sequence $\hat{\mathbb{G}}_{n, k} f$ can be established by the Lindeberg-Lévy theorem. By the law of large numbers for real variables,

$$
\begin{gathered}
\mathrm{E}_{\hat{X}} f^{2}\left(\hat{X}_{1}\right)=\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right) \xrightarrow{\text { as }} P f^{2}, \\
\mathrm{E}_{\hat{X}} f^{2}\left(\hat{X}_{1}\right)\left\{\left|f\left(\hat{X}_{1}\right)\right|>\varepsilon \sqrt{k}\right\}=\frac{1}{n} \sum_{i=1}^{n} f^{2}\left(X_{i}\right)\left\{\left|f\left(X_{i}\right)\right|>\varepsilon \sqrt{k}\right\} \xrightarrow{\text { as }} 0 .
\end{gathered}
$$

Therefore, $\hat{\mathbb{G}}_{n, k} f$ converges in distribution to a $N\left(0, P f^{2}\right)$ distribution for almost every sequence $X_{1}, X_{2}, \ldots$. This concludes the proof of finitedimensional convergence.

Let $\tilde{N}_{1}, \tilde{N}_{2}, \ldots$ be i.i.d. symmetrized Poisson variables with parameter $\frac{1}{2} k / n$. By Lemma 3.6.6 (ahead),

$$
\begin{equation*}
\mathrm{E}_{\hat{X}}\left\|\hat{\mathbb{G}}_{n, k}\right\|_{\mathcal{F}_{\delta}} \leq 4 \mathrm{E}_{\tilde{N}}\left\|\frac{1}{\sqrt{k}} \sum_{i=1}^{n} \tilde{N}_{i} \delta_{X_{i}}\right\|_{\mathcal{F}_{\delta}} . \tag{3.6.4}
\end{equation*}
$$

By the multiplier inequality Lemma 2.9.1, the outer expectation of the left side is for any $1 \leq n_{0} \leq n$ bounded up to a constant by

$$
\left(n_{0}-1\right) \mathrm{E} \max _{1 \leq i \leq n} \frac{\tilde{N}_{i}}{\sqrt{k}} P^{*} F+\sqrt{\frac{n}{k}}\left\|\tilde{N}_{i}\right\|_{2,1} \max _{n_{0} \leq j \leq n} \mathrm{E}^{*}\left\|\frac{1}{\sqrt{j}} \sum_{i=n_{0}}^{j} \varepsilon_{i} \delta_{X_{i}}\right\|_{\mathcal{F}_{\delta}} .
$$

In view of Problem 3.6.4, the first term is bounded by $\left(n_{0}-1\right) 2 \sqrt{2}(n \wedge k)^{-1 / 4} P^{*} F$. It converges to zero as $n, k \rightarrow \infty$ for every fixed $n_{0}>1$. By Problem 3.6.3, $\sqrt{n / k}\left\|\tilde{N}_{i}\right\|_{2,1} \leq 2 \sqrt{2}$ for all $n, k$. Hence the second term converges to 0 as $n, k \rightarrow \infty$ followed by $n_{0} \rightarrow \infty$ and $\delta \downarrow 0$ in view of Theorem 2.3.11. It follows that $\mathrm{E}^{*}\left\|\hat{\mathbb{G}}_{n, k}\right\|_{\mathcal{F}_{\delta}} \rightarrow 0$ as $n, k \rightarrow \infty$ followed by $\delta \downarrow 0$. This concludes the proof of the first statement of the theorem.

Assume that $P^{*} F^{2}<\infty$. If $\varepsilon_{1}, \varepsilon_{2}, \ldots$ are i.i.d. Rademacher variables independent of $\tilde{N}_{1}, \tilde{N}_{2}, \ldots$ and $X_{1}, X_{2}, \ldots$, then $\tilde{N}_{i}$ in (3.6.4) can be replaced by $\varepsilon_{i}\left|\tilde{N}_{i}\right|$. Next, Lemma 3.6.7 applied with $Z_{i}=\varepsilon_{i} \delta_{X_{i}}$ and $X_{i}$ fixed yields

$$
\begin{aligned}
\mathrm{E}_{\hat{X}}\left\|\hat{G}_{n, k}\right\|_{\mathcal{F}_{\delta}}^{*} \leq\left(n_{0}-1\right) & \mathrm{E} \max _{1 \leq i \leq n} \frac{\left|\tilde{N}_{i}\right|}{\sqrt{k}} \mathrm{E}_{\varepsilon} \frac{1}{n} \sum_{i=1}^{n}\left\|\varepsilon_{i} \delta_{X_{i}}\right\|_{\mathcal{F}_{\delta}}^{*} \\
& +\sqrt{\frac{n}{k}}\left\|\tilde{N}_{i}\right\|_{2,1} \max _{n_{0} \leq j \leq n} \mathrm{E}_{\varepsilon, R}\left\|\frac{1}{\sqrt{j}} \sum_{i=n_{0}}^{j} \varepsilon_{i} \delta_{X_{R_{i}}}\right\|_{\mathcal{F}_{\delta}}^{*}
\end{aligned}
$$

The first term on the right is bounded by $\left(n_{0}-1\right) 2 \sqrt{2}(n \wedge k)^{-1 / 4} 2 \mathbb{P}_{n} F$. Since $\mathcal{F}$ is Glivenko-Cantelli, the first term converges to zero almost surely for every fixed $n_{0}$. To conclude the proof, it suffices to show that

$$
\begin{equation*}
\max _{n_{0} \leq j \leq n} \mathrm{E}_{\varepsilon, R}\left\|\frac{1}{\sqrt{j}} \sum_{i=n_{0}}^{j} \varepsilon_{i} \delta_{X_{R_{i}}}\right\|_{\mathcal{F}_{\delta}}^{*} \xrightarrow{\text { as }} 0, \tag{3.6.5}
\end{equation*}
$$

as $n, k \rightarrow \infty$ followed by $n_{0} \rightarrow \infty$ and $\delta \downarrow 0$. By Jensen's inequality, the expression is bounded by

$$
\max _{n_{0} \leq j \leq n} \mathrm{E}_{\varepsilon, R}\left\|\frac{1}{\sqrt{j}} \sum_{i=1}^{j} \varepsilon_{i} \delta_{X_{R_{i}}}\right\|_{\mathcal{F}_{\delta}}^{*}=\max _{n_{0} \leq j \leq n} \mathrm{E}\left(U_{j} \mid \Sigma_{n}\right) \leq \mathrm{E}\left(\max _{n_{0} \leq j} U_{j} \mid \Sigma_{n}\right),
$$

where $U_{j}=\mathrm{E}_{\varepsilon}\left\|j^{-1 / 2} \sum_{i=1}^{j} \varepsilon_{i} \delta_{X_{i}}\right\|_{\mathcal{F}_{\delta}}^{*}$ and $\Sigma_{n}$ is the $\sigma$-field generated by all functions $f: \mathcal{X}^{\infty} \mapsto \mathbb{R}$ that are symmetric in their first $n$ coordinates. By Corollary 2.9.9, the variable $\max _{j} U_{j}$ is integrable. The sequence $\Sigma_{n}$
decreases to the "symmetric" $\sigma$-field $\Sigma$, which consists of sets of probability 0 or 1 only by the Hewitt-Savage zero-one law. ${ }^{\ddagger}$ It follows that, as $n \rightarrow \infty$,

$$
\mathrm{E}\left(\max _{n_{0} \leq j} U_{j} \mid \Sigma_{n}\right) \xrightarrow{\text { as }} \mathrm{E}\left(\max _{n_{0} \leq j} U_{j} \mid \Sigma\right)=\mathrm{E} \max _{n_{0} \leq j} U_{j} .
$$

By Lemma 2.9.8, $\limsup _{j \rightarrow \infty} U_{j} \leq K \mathrm{E}\|\mathbb{G}\|_{\mathcal{F}_{\delta}}$ almost surely. Hence $\max _{n_{0} \leq j} U_{j} \rightarrow 0$ almost surely as $n_{0} \rightarrow \infty$ followed by $\delta \downarrow 0$. Its expectation converges to zero by dominated convergence. This proves (3.6.5).
3.6.6 Lemma. For fixed elements $x_{1}, \ldots, x_{n}$ of a set $\mathcal{X}$, let $\hat{X}_{1}, \ldots, \hat{X}_{k}$ be an i.i.d. sample from $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{x_{i}}$. Then

$$
\mathrm{E}_{\hat{X}}\left\|\sum_{j=1}^{k}\left(\delta_{\hat{X}_{j}}-\mathbb{P}_{n}\right)\right\|_{\mathcal{F}} \leq 4 \mathrm{E}_{N, N^{\prime}}\left\|\sum_{i=1}^{n}\left(N_{i}-N_{i}^{\prime}\right) \delta_{x_{i}}\right\|_{\mathcal{F}},
$$

for every class $\mathcal{F}$ of functions $f: \mathcal{X} \mapsto \mathbb{R}$ and i.i.d. Poisson variables $N_{1}, N_{1}^{\prime}, \ldots, N_{n}, N_{n}^{\prime}$ with mean $\frac{1}{2} k / n$.

Proof. Let $\varepsilon_{j}$ and $\varepsilon_{i, j}$ be i.i.d. Rademacher variables, independent of $\hat{X}_{1}, \ldots, \hat{X}_{k}$. By the symmetrization lemma, Lemma 2.3.1, and Le Cam's Poissonization's lemma, Lemma 3.5.4,

$$
\mathrm{E}_{\hat{X}}\left\|\sum_{j=1}^{k}\left(\delta_{\hat{X}_{j}}-\mathbb{P}_{n}\right)\right\|_{\mathcal{F}} \leq 2 \mathrm{E}_{\hat{X}}\left\|\sum_{j=1}^{k} \varepsilon_{j} \delta_{\hat{X}_{j}}\right\|_{\mathcal{F}} \leq 4 \mathrm{E}_{N, \hat{X}}\left\|\sum_{j=1}^{N} \varepsilon_{j} \delta_{\hat{X}_{j}}\right\|_{\mathcal{F}},
$$

where $N$ is $\operatorname{Poisson}(k)$-distributed, independent of the i.i.d. sequence $\hat{X}_{1}, \hat{X}_{2}, \ldots$. Set

$$
N_{i}=\#\left(j \leq N: \hat{X}_{j}=x_{i}, \varepsilon_{j}=1\right) ; \quad N_{i}^{\prime}=\#\left(j \leq N: \hat{X}_{j}=x_{i}, \varepsilon_{j}=-1\right) .
$$

Given $N=m$, the vector ( $N_{1}, N_{1}^{\prime}, \ldots, N_{n}, N_{n}^{\prime}$ ) is multinomially distributed with parameters $(m, 1 / 2 n, \ldots, 1 / 2 n)$. Hence, unconditionally the coordinates of this vector are i.i.d. Poisson-distributed with mean $k / 2 n$. The lemma follows since $\sum_{j=1}^{N} \varepsilon_{j} \delta_{\hat{X}_{j}}=\sum_{i=1}^{n}\left(N_{i}-N_{i}^{\prime}\right) \delta_{x_{i}}$.
3.6.7 Lemma (Multiplier inequalities). For arbitrary stochastic processes $Z_{1}, \ldots, Z_{n}$, every exchangeable random vector $\left(\xi_{1}, \ldots, \xi_{n}\right)$ that is independent of $Z_{1}, \ldots, Z_{n}$, and any $1 \leq n_{0} \leq n$,

$$
\begin{aligned}
\mathrm{E}_{\xi}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*} \leq 2\left(n_{0}\right. & -1) \frac{1}{n} \sum_{i=1}^{n}\left\|Z_{i}\right\|_{\mathcal{F}}^{*} \mathrm{E}_{\xi} \max _{1 \leq i \leq n} \frac{\left|\xi_{i}\right|}{\sqrt{n}} \\
& +2\left\|\xi_{1}\right\|_{2,1} \max _{n_{0} \leq k \leq n} \mathrm{E}_{R}\left\|\frac{1}{\sqrt{k}} \sum_{i=n_{0}}^{k} Z_{R_{i}}\right\|_{\mathcal{F}}^{*} .
\end{aligned}
$$

[^10]Here ( $R_{1}, \ldots, R_{n}$ ) is uniformly distributed on the set of all permutations of $\{1,2, \ldots, n\}$ and independent of $Z_{1}, \ldots, Z_{n}$ and the asterisks denote measurable covers with respect to all variables jointly. Furthermore,

$$
\begin{aligned}
\mathrm{E}\left\|\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \xi_{i} Z_{i}\right\|_{\mathcal{F}}^{*} \leq 2\left(n_{0}-1\right) & \frac{1}{n} \sum_{i=1}^{n} \mathrm{E}\left\|Z_{i}\right\|_{\mathcal{F}}^{*} \mathrm{E}_{\xi} \max _{1 \leq i \leq n} \frac{\left|\xi_{i}\right|}{\sqrt{n}} \\
& +2\left\|\xi_{1}\right\|_{2,1} \max _{n_{0} \leq k \leq n} \mathrm{E}\left\|\frac{1}{\sqrt{k}} \sum_{i=n_{0}}^{k} Z_{R_{i}}\right\|_{\mathcal{F}}^{*}
\end{aligned}
$$

For nonnegative variables $\xi_{i}$, the two constants 2 on the right can be deleted.
Proof. Since the $\xi_{i}$ can be split into their positive and negative parts, it suffices to consider the case that they are nonnegative.

Choose the vector $R=\left(R_{1}, \ldots, R_{n}\right)$ independent of $\xi_{1}, \ldots, \xi_{n}$. By exchangeability of $\xi_{1}, \ldots \xi_{n}$, the left side times $\sqrt{n}$ equals

$$
\mathrm{E}_{\xi}\left\|\sum_{i=1}^{n} \xi_{R_{i}} Z_{i}\right\|_{\mathcal{F}}^{*}=\mathrm{E}_{\xi, R}\left\|\sum_{i=1}^{n} \xi_{i} Z_{R_{i}}\right\|_{\mathcal{F}}^{*}=\mathrm{E}_{\xi, R}\left\|\sum_{i=1}^{n} \xi_{(i)} Z_{R_{S_{i}}}\right\|_{\mathcal{F}}^{*},
$$

where $\xi_{(1)} \geq \cdots \geq \xi_{(n)}$ are the reverse order statistics of $\xi_{1}, \ldots, \xi_{n}$ and $S= \left(S_{1}, \ldots, S_{n}\right)$ is a (random) permutation such that $\xi_{(i)}=\xi_{S_{i}}$. To determine $S$ uniquely also in the presence of ties, we can require that $S_{i}<S_{i+1}$ whenever $\xi_{S_{i}}=\xi_{S_{i+1}}$. Then the vector $R \circ S$ (with $i$ th component $R_{S_{i}}$ ) is distributed as $R$ and is independent of $S$ and $\xi_{1}, \ldots, \xi_{n}$. By the triangle inequality, the right-hand side of the last display is bounded by

$$
\mathrm{E}_{\xi, R}\left\|\sum_{i=1}^{n_{0}-1} \xi_{(i)} Z_{R_{S_{i}}}\right\|_{\mathcal{F}}^{*}+\mathrm{E}_{\xi, R}\left\|\sum_{j=n_{0}}^{n} \xi_{(i)} Z_{R_{S_{i}}}\right\|_{\mathcal{F}}^{*} .
$$

The first term is bounded by

$$
\mathrm{E}_{\xi, R} \max _{1 \leq i \leq n} \xi_{i} \sum_{i=1}^{n_{0}-1}\left\|Z_{R_{S_{i}}}\right\|_{\mathcal{F}}^{*} \leq \mathrm{E}_{\xi} \max _{1 \leq i \leq n} \xi_{i} \frac{n_{0}-1}{n} \sum_{i=1}^{n}\left\|Z_{i}\right\|_{\mathcal{F}}^{*}
$$

The second term can be bounded by the same method as in the proof of Lemma 2.9.1.

The second inequality is proved in the same manner.

### 3.6.2 The Exchangeable Bootstrap

For each $n$, let $\left(W_{n 1}, \ldots, W_{n n}\right)$ be an exchangeable, nonnegative random vector. Consider the weighted bootstrap empirical measure

$$
\hat{\mathbb{P}}_{n}=\frac{1}{n} \sum_{i=1}^{n} W_{n i} \delta_{X_{i}}
$$

The corresponding weighted bootstrap empirical process is defined as
$\hat{\mathbb{G}}_{n}=\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\bar{W}_{n} \mathbb{P}_{n}\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n}\left(W_{n i}-\bar{W}_{n}\right) \delta_{X_{i}}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} W_{n i}\left(\delta_{X_{i}}-\mathbb{P}_{n}\right)$.
This corresponds to resampling $W_{n i}$ times the variable $X_{i}$. However, it is not required that the weights $W_{n i}$ be integer-valued. In the case that in total $n$ variables are resampled, the average $\bar{W}_{n}$ is equal to one and the weighted bootstrap process is simply $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)$. It is assumed that

$$
\begin{align*}
& \sup _{n}\left\|W_{n 1}-\bar{W}_{n}\right\|_{2,1}<\infty, \\
& n^{-1 / 2} \mathrm{E} \max _{1 \leq i \leq n}\left|W_{n i}-\bar{W}_{n}\right| \xrightarrow{\mathrm{P}} 0,  \tag{3.6.8}\\
& n^{-1} \sum_{i=1}^{n}\left(W_{n i}-\bar{W}_{n}\right)^{2} \xrightarrow{\mathrm{P}} c^{2}>0 .
\end{align*}
$$

Sufficient for the second condition is that the variables $W_{n i}-\bar{W}_{n}$ are uniformly weak- $L_{2}$ (Problem 2.3.3). Both the first and second conditions are valid if $\left\|W_{n 1}\right\|_{2+\varepsilon}$ is uniformly bounded for some $\varepsilon>0$.

The multinomial weights considered in the preceding section satisfy these conditions. The following theorem shows that the conditions (3.6.8) alone imply the conditional weak convergence of the bootstrap process. This gives a large number of different ways to obtain bootstrap estimators for the distribution of the empirical process.
3.6.9 Example. If $Y_{1}, \ldots, Y_{n}$ are i.i.d. nonnegative random variables with $\left\|Y_{1}\right\|_{2,1}<\infty$, then the weights $W_{n i}=Y_{i} / \bar{Y}_{n}$ satisfy (3.6.8) with $c= \sigma\left(Y_{1}\right) / \mathrm{E} Y_{1}$. If the variables $Y_{i}$ are exponentially distributed with mean 1 , the resulting scheme is known as the Bayesian bootstrap.
3.6.10 Example. Multinomial vectors $\left(W_{n 1}, \ldots, W_{n n}\right)$ with parameters $n$ and (probabilities) $(1 / n, \ldots, 1 / n)$ satisfy (3.6.8) with $c=1$.
3.6.11 Example. The vectors $\left(W_{n 1}, \ldots, W_{n n}\right)$ equal to $\sqrt{n / k}$ times multinomial vectors with parameters $k$ and (probabilities) $(1 / n, \ldots, 1 / n)$ satisfy (3.6.8) with $c=1$ provided $k \rightarrow \infty$. Thus, the theorem in this section contains the consistency of the empirical bootstrap based on $k$ replicates.
3.6.12 Example. If $W_{n 1}, \ldots, W_{n n}$ are i.i.d. vectors with finite $L_{2,1}$-norm, then the conditions (3.6.8) are satisfied with $c^{2}=\operatorname{var} W_{1,1}$. In this case the total mass $\bar{W}_{n}$ of $\hat{\mathbb{P}}_{n}$ is a random variable. This choice of weights $\left\{W_{n i}\right\}$ has been called the wild bootstrap by some authors.
3.6.13 Theorem. Let $\mathcal{F}$ be a Donsker class of measurable functions such that $\mathcal{F}_{\delta}$ is measurable for every $\delta>0$. For each $n$ let $\left(W_{n 1}, \ldots, W_{n n}\right)$ be an exchangeable, nonnegative random vector independent of $X_{1}, X_{2}, \ldots$ such that the conditions (3.6.8) are satisfied. Then as $n \rightarrow \infty$,

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{W} h\left(\hat{\mathbb{G}}_{n}\right)-\mathrm{E} h(c \mathbb{G})\right| \xrightarrow{\mathrm{P} *} 0 .
$$

Furthermore, the sequence $\mathrm{E}_{W} h\left(\hat{\mathbb{G}}_{n}\right)^{*}-\mathrm{E}_{W} h\left(\hat{\mathbb{G}}_{n}\right)_{*}$ converges to zero in outer probability. If $P^{*}\|f-P f\|_{\mathcal{F}}^{2}<\infty$, then the convergence is also outer almost surely.

Proof. Without loss of generality, assume that $\bar{W}_{n}=0$ and that $P f=0$ for every $n$ and $f$. As before, it suffices to prove the conditional almostsure weak convergence of every marginal plus the conditional asymptotic equicontinuity in probability or almost surely.

The variables $W_{n i}$ satisfy the conditions of Lemma 3.6 .15 (ahead). Thus this lemma with $a_{n i}=f\left(X_{i}\right)-\mathbb{P}_{n} f$ implies that conditionally on the sequence $X_{1}, X_{2}, \ldots$ the sequence $\hat{\mathbb{G}}_{n} f$ is asymptotically normal $N\left(0, c^{2} P f^{2}\right)$ given every sequence $X_{1}, X_{2}, \ldots$ such that, as $n \rightarrow \infty$ followed by $M \rightarrow \infty$,

$$
\mathbb{P}_{n}\left(f-\mathbb{P}_{n} f\right)^{2} \rightarrow P f^{2} \quad \text { and } \quad \mathbb{P}_{n}\left(f-\mathbb{P}_{n} f\right)^{2}\left\{\left|f-\mathbb{P}_{n} f\right|>M\right\} \rightarrow 0
$$

Both are valid almost surely, since $P f^{2}<\infty$. Combined with the CramérWold device, this establishes finite-dimensional convergence.

Let $\mathcal{F}_{\delta}$ be the set of differences $f-g$ of elements $f, g \in \mathcal{F}$ with $P(f- g)^{2}<\delta^{2}$, as usual. By the multiplier inequalities given by Lemma 3.6.7 (applied with $Z_{i}=\delta_{X_{i}}-\mathbb{P}_{n}$ fixed), the conditional expectation $\mathrm{E}_{W}\left\|\hat{\mathbb{G}}_{n}\right\|_{\mathcal{F}_{\delta}}$ equals

$$
\begin{aligned}
\mathrm{E}_{W}\left\|\frac{1}{\sqrt{n}} \sum W_{n i}\left(\delta_{X_{i}}-\mathbb{P}_{n}\right)\right\|_{\mathcal{F}_{\delta}}^{*} & \frac{n_{0}-1}{n} \sum_{i=1}^{n}\left\|\delta_{X_{i}}-\mathbb{P}_{n}\right\|_{\mathcal{F}_{\delta}}^{*} \mathrm{E} \max _{1 \leq i \leq n} \frac{\left|W_{n i}\right|}{\sqrt{n}} \\
& +\left\|W_{n 1}\right\|_{2,1} \max _{n_{0} \leq k \leq n} \mathrm{E}_{R}\left\|\frac{1}{\sqrt{n}} \sum_{i=n_{0}}^{k}\left(\delta_{X_{R_{i}}}-\mathbb{P}_{n}\right)\right\|_{\mathcal{F}_{\delta}}^{*}
\end{aligned}
$$

The first term on the right converges to zero outer almost surely for every fixed $n_{0}$. In the second term the vector ( $X_{R_{1}}, \ldots, X_{R_{n}}$ ) is a random sample without replacement from $X_{1}, \ldots, X_{n}$. By Hoeffding's inequality (Lemma A.1.9), this term increases if the vector is replaced by a sample with replacement $\hat{X}_{1}, \ldots, \hat{X}_{n}$. Next, the sum can be extended to the range from 1 to $k$ by Jensen's inequality. Conclude that the second term is bounded by

$$
2 \sup _{n}\left\|W_{n 1}\right\|_{2,1} \max _{n_{0} \leq k \leq n} \mathrm{E}_{\hat{X}}\left\|\hat{\mathbb{G}}_{n, k}\right\|_{\mathcal{F}_{\delta}}
$$

Here $\hat{\mathbb{G}}_{n, k}=k^{-1 / 2} \sum_{i=1}^{k}\left(\delta_{\hat{X}_{i}}-\mathbb{P}_{n}\right)$ is the multinomial bootstrap process encountered in the previous section. By (the proof of) Theorem 3.6.3, this expression converges to zero in outer probability as $n_{0}, n \rightarrow \infty$ followed by $\delta \downarrow 0$. Under the additional condition on the envelope function, the convergence is outer almost surely.
3.6.14 Example (Bootstrap without replacement). The bootstrap without replacement is based on resampling $k<n$ observations from $X_{1}, \ldots, X_{n}$ without replacement. This can be incorporated in the scheme of the theorem by letting $\left(W_{n 1}, \ldots, W_{n n}\right)$ be a row of $k$ times the number $n(n-k)^{-1 / 2} k^{-1 / 2}$ and $n-k$ times the number 0 , ordered at random, independent of the $X$ 's. Then the conditions (3.6.8) on the weights are satisfied for $c=1$, provided both $k \rightarrow \infty$ and $n-k \rightarrow \infty$. (For this choice the sample standard deviation is even identically equal to $c=1$.)

In this case the assertion of the theorem can be phrased in terms of the empirical measures

$$
\tilde{\mathbb{P}}_{k, n}=\frac{1}{k} \sum_{i=1}^{k} \delta_{X_{R_{n i}}} ; \quad \tilde{\mathbb{Q}}_{n-k, n}=\frac{1}{n-k} \sum_{i=k+1}^{n} \delta_{X_{R_{n i}}},
$$

where $\left(R_{n 1}, \ldots, R_{n n}\right)$ is a random permutation of the numbers $1,2, \ldots, n$. If both $k \rightarrow \infty$ and $n-k \rightarrow \infty$, then the sequence

$$
\sqrt{\frac{n k}{n-k}}\left(\tilde{\mathbb{P}}_{k, n}-\mathbb{P}_{n}\right)=\sqrt{\frac{k(n-k)}{n}}\left(\tilde{\mathbb{P}}_{k, n}-\tilde{\mathbb{Q}}_{n-k, n}\right)
$$

converges conditionally in distribution to a tight Brownian bridge.
3.6.15 Lemma. For each $n$, let ( $a_{n 1}, \ldots, a_{n n}$ ) and ( $W_{n 1}, \ldots, W_{n n}$ ) be a vector of numbers and an exchangeable random vector such that

$$
\begin{aligned}
\bar{a}_{n i} & =0 ; & \frac{1}{n} \sum_{i=1}^{n} a_{n i}^{2} \rightarrow \sigma^{2}>0 ; & \lim _{M \rightarrow \infty} \limsup _{n \rightarrow \infty} \frac{1}{n} \sum_{i=1}^{n} a_{n i}^{2}\left\{\left|a_{n i}\right|>M\right\}=0 ; \\
\bar{W}_{n i} & =0 ; & \frac{1}{n} \sum_{i=1}^{n} W_{n i}^{2} \xrightarrow{\mathrm{P}} \tau^{2}>0 ; & \frac{1}{n} \max _{1 \leq i \leq n} W_{n i}^{2} \xrightarrow{\mathrm{P}} 0 .
\end{aligned}
$$

Then the sequence $n^{-1 / 2} \sum_{i=1}^{n} a_{n i} W_{n i}$ converges weakly to a $N\left(0, \sigma^{2} \tau^{2}\right)$ distribution.

Proof. Without loss of generality, assume that both $n^{-1} \sum a_{n i}^{2}$ and $n^{-1} \sum_{i=1}^{n} W_{n i}^{2}$ are equal to 1 for every $n$. Then

$$
\sum_{i} \sum_{j} \frac{a_{n i}^{2} W_{n j}^{2}}{n n}\left\{\left|a_{n i} W_{n j}\right|>\varepsilon \sqrt{n}\right\} \leq \frac{1}{n} \sum_{i} a_{n i}^{2}\left\{\left|a_{n i}\right| \max _{j}\left|W_{n j}\right|>\varepsilon \sqrt{n}\right\} .
$$

Since $\max _{j}\left|W_{n j}\right| / \sqrt{n}$, converges to zero in probability and the array $a_{n i}$ is "uniformly integrable", this expression converges to zero in probability as $n \rightarrow \infty$, for every $\varepsilon>0$.

Combination with the assumptions shows that every subsequence of $\{n\}$ has a further subsequence along which, for every $\varepsilon>0$,

$$
\max _{1 \leq j \leq n} \frac{\left|W_{n i}\right|}{\sqrt{n}} \xrightarrow{\text { as }} 0 ; \quad \sum_{i} \sum_{j} \frac{a_{n i}^{2} W_{n j}^{2}}{n n}\left\{\left|a_{n i} W_{n j}\right|>\varepsilon \sqrt{n}\right\} \xrightarrow{\text { as }} 0 .
$$

This means that for almost every realization of the $W_{n j}$, the conditions of Hájek's rank central limit theorem (Proposition A.5.3) are satisfied along the subsequence. Hence conditionally on the $W_{n j}$, By the subsequence of rank statistics $n^{-1 / 2} \sum_{i=1}^{n} a_{n i} W_{n, R_{n i}}$ is asymptotically standard normally distributed.

This argument implies that every subsequence of $\{n\}$ has a further subsequence along which

$$
\sup _{h \in \mathrm{BL}_{1}}\left|\mathrm{E}_{R} h\left(\frac{1}{\sqrt{n}} \sum a_{n i} W_{n, R_{n i}}\right)-\mathrm{E} h(\xi)\right| \rightarrow 0,
$$

almost surely, for a standard normal variable $\xi$. Conclude that this bounded Lipschitz distance converges to zero in probability along the whole sequence $\{n\}$. Take the expectation with respect to the $W_{n i}$ to see that the sequence $n^{-1 / 2} \sum a_{n i} W_{n, R_{n i}}$ is unconditionally asymptotically normal as well. By the exchangeability of the $W_{n j}$, this sequence is equal in distribution to the sequence $n^{-1 / 2} \sum a_{n i} W_{n i}$. $\square$

Glivenko-Cantelli theorem with exchangeable multipliers. A special case of the lemma is used in the proof of Theorem 3.6.2.
3.6.16 Lemma. Let $\mathcal{F}$ be a Glivenko-Cantelli class of measurable functions. For each $n$, let ( $W_{n 1}, \ldots, W_{n n}$ ) be an exchangeable nonnegative random vector independent of $X_{1}, X_{2}, \ldots$ such that $\sum_{i=1}^{n} W_{n i}=1$ and $\max _{1 \leq i \leq n}\left|W_{n i}\right|$ converges to zero in probability. Then, for every $\varepsilon>0$, as $n \rightarrow \infty$,

$$
\mathrm{P}_{W}\left(\left\|\sum_{i=1}^{n} W_{n i}\left(\delta_{X_{i}}-P\right)\right\|_{\mathcal{F}}^{*}>\varepsilon\right) \xrightarrow{\text { as* }} 0 .
$$

Proof. By a modification of the multiplier inequality given by Lemma 3.6.7 (the $L_{r}$ form with $r<1$ with Glivenko-Cantelli normalization instead of the $L_{1}$ form with Donsker normalization in the bound of the second term), with $Z_{i}=\delta_{X_{i}}-P$,

$$
\begin{aligned}
\mathrm{E}_{W}\left\|\sum_{i=1}^{n} W_{n i} Z_{i}\right\|_{\mathcal{F}}^{* r} \leq & \left(n_{0}-1\right) \mathrm{E} \max _{1 \leq i \leq n} W_{n i}^{r} \frac{1}{n} \sum_{j=1}^{n}\left\|Z_{j}\right\|_{\mathcal{F}}^{* r} \\
& +\left(n \mathrm{E} W_{n 1}\right)^{r} \max _{n_{0} \leq k \leq n} \mathrm{E}_{R}\left\|\frac{1}{k} \sum_{j=n_{0}}^{k} Z_{R_{j}}\right\|_{\mathcal{F}}^{* r} .
\end{aligned}
$$

In the first term on the right, the average $n^{-1} \sum_{i=1}^{n}\left\|Z_{i}\right\|_{\mathcal{F}}^{* r}$ is bounded by $\mathbb{P}_{n} F^{* r}+P^{*} F^{r}$, which converges almost surely to $2 P^{*} F^{r}$. Since the variables $W_{n i}$ take their values in $[0,1]$, the sequence $\max _{1 \leq i \leq n} W_{n i}^{r}$ converges to zero in mean by the dominated convergence theorem. Thus, the first term on the right converges almost surely to zero for every fixed $n_{0}$.

The factor $n E W_{n 1}$ in the second term equals 1 by exchangeability and the fact that the sum of the $W_{n i}$ is 1 . By the triangle inequality, the second term is bounded by

$$
\begin{aligned}
2 \max _{n_{0}-1 \leq k \leq n} \mathrm{E}_{R}\left\|\frac{1}{k} \sum_{j=1}^{k} Z_{R_{j}}\right\|_{\mathcal{F}}^{* r} & =2 \max _{n_{0}-1 \leq k \leq n} \mathrm{E}\left(U_{k}^{r} \mid \Sigma_{n}\right) \\
& \leq 2 \mathrm{E}\left(\max _{n_{0}-1 \leq k} U_{k}^{r} \mid \Sigma_{n}\right)
\end{aligned}
$$

where $U_{k}=\left\|k^{-1} \sum_{j=1}^{k} Z_{j}\right\|_{\mathcal{F}}^{*}$, and $\Sigma_{n}$ is the $\sigma$-field generated by all functions $f: \mathcal{X}^{\infty} \mapsto \mathbb{R}$ that are symmetric in their first $n$ coordinates. Since $\mathcal{F}$ is Glivenko-Cantelli, we have $\operatorname{Emax}_{k} U_{k}^{r}<\infty$ by Problem 2.3.6 (also see Corollary A.1.8) and the sequence $U_{k}$ converges almost surely to zero. The sequence $\Sigma_{n}$ decreases to the symmetric $\sigma$-field $\Sigma$, which consists of sets of probability 0 or 1 by the Hewitt-Savage zero-one law. It follows that as $n \rightarrow \infty$

$$
\mathrm{E}\left(\max _{n_{0}-1 \leq j} U_{j}^{r} \mid \Sigma_{n}\right) \xrightarrow{\text { as }} \mathrm{E}\left(\max _{n_{0}-1 \leq j} U_{j}^{r} \mid \Sigma\right)=\mathrm{E} \max _{n_{0}-1 \leq j} U_{j}^{r} .
$$

The right side converges to zero as $n_{0} \rightarrow \infty$. Conclude that the left side converges to zero almost surely when $n \rightarrow \infty$ followed by $n_{0} \rightarrow \infty$.

Apply Markov's inequality to complete the proof.

## Problems and Complements

1. (Formally defining bootstrap samples) Let $m_{n}^{(1)}, m_{n}^{(2)}, \ldots$ be i.i.d. $n$ dimensional multinomial $(1,1 / n, \ldots, 1 / n)$ variables defined on some probability space $(\mathcal{Z}, \mathcal{C}, Q)$. Let $X_{1}, X_{2}, \ldots$ be the coordinate projections of ( $\mathcal{X}^{\infty}, \mathcal{A}^{\infty}, P^{\infty}$ ). Then bootstrap values can be defined on $\mathcal{X}^{\infty} \times \mathcal{Z}$ by $\hat{X}_{i}=X_{j}$ if $m_{n}^{(i)}$ equals the $j$ th unit vector in $\mathbb{R}^{n}$. Then

$$
P^{\infty} \times Q\left(\left(\hat{X}_{1}, \ldots, \hat{X}_{n}\right)=\left(X_{j_{1}}, \ldots, X_{j_{n}}\right) \mid X_{1}, \ldots, X_{n}\right)=\left(\frac{1}{n}\right)^{n}
$$

for every vector $j \in\{1,2, \ldots, n\}^{n}$, and taking conditional expectation given $X_{1}, \ldots, X_{n}$ is the same as taking expectation with respect to $m_{n}^{(1)}, m_{n}^{(2)}, \ldots$ only.
2. For each $n$, let $Z_{n 1}, \ldots, Z_{n n}$ be i.i.d. stochastic processes. Suppose that $\left\|n^{-1 / 2} \sum_{i=1}^{n}\left(Z_{n i}-\mathrm{E} Z_{n i}\right)\right\|_{\mathcal{F}}^{*}=O_{P}(1)$ and $\mathrm{P}^{*}\left(\left\|Z_{n 1}\right\|_{\mathcal{F}}>\sqrt{n}\right) \rightarrow 0$ as $n \rightarrow \infty$. Then $\limsup _{n \rightarrow \infty} n \mathrm{P}^{*}\left(\left\|Z_{n 1}\right\|_{\mathcal{F}}>t \sqrt{n}\right)$ converges to zero as $t \rightarrow \infty$. [Hint: Let $\tilde{Z}_{n 1}, \ldots, \tilde{Z}_{n n}$ be an i.i.d. copy of $Z_{n 1}, \ldots, Z_{n n}$. Fix $0<\varepsilon<1 / 4$. For any sufficiently large $t$,

$$
\limsup \mathrm{P}^{*}\left(\left\|\sum_{i=1}^{n}\left(Z_{n i}-\tilde{Z}_{n i}\right)\right\|_{\mathcal{F}}>t \sqrt{n}\right)<\varepsilon
$$

By a Lévy inequality followed by Problem 2.3.2, there exists an $N_{t}$ such that, for all $n \geq N_{t}$,

$$
n \mathrm{P}^{*}\left(\left\|Z_{n 1}-\tilde{Z}_{n 1}\right\|_{\mathcal{F}}^{*}>t \sqrt{n}\right)<4 \varepsilon
$$

Independent random processes $Z$ and $\tilde{Z}$ satisfy for every $t$ the inequality $\mathrm{P}^{*}\left(\|Z-\tilde{Z}\|_{\mathcal{F}}>t\right) \geq \mathrm{P}^{*}\left(\|Z\|_{\mathcal{F}}>2 t\right) \mathrm{P}^{*}\left(\|\tilde{Z}\|_{\mathcal{F}} \leq t\right)$.]
3. A symmetrized Poisson variable $\tilde{N}$ with parameter $\lambda$ satisfies $\|\tilde{N} / \sqrt{\lambda}\|_{2,1} \leq$ 4.
[Hint: $\mathrm{E} \tilde{N}^{4} \leq 12 \lambda^{2}+2 \lambda$.]
4. The maximum of i.i.d. symmetrized Poisson variables $\tilde{N}_{1}, \ldots, \tilde{N}_{n}$ with parameter $\lambda$ satisfies $\mathrm{E} \max _{1 \leq i \leq n}\left|\tilde{N}_{i}\right| \leq n^{1 / 4}\left(12 \lambda^{2}+2 \lambda\right)^{1 / 4}$.
[Hint: This bound is based on Lemma 2.2.2 with the $L_{4}$-norm and can be greatly improved.]
5. If $\tilde{N}_{\lambda}$ is a symmetrized Poisson variable with parameter $\lambda$, then the family $\left\{\tilde{N}_{\lambda} / \sqrt{\lambda}: \lambda>0\right\}$ is not uniformly square integrable (even though the family is uniformly bounded in the $L_{2,1}$-norm).
6. It appears that for the consistency of the bootstrap without replacement with $n-k=o(n)$, the fact that $\mathcal{F}$ is Donsker is not used as much in the proof, as one would expect.

## 3.7

## The Two-Sample Problem

Let $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ be independent random samples from distributions $P$ and $Q$ on a measurable space ( $\mathcal{X}, \mathcal{A}$ ). We wish to test the null hypothesis $H_{0}: P=Q$ versus the alternative $H_{1}: P \neq Q$.

One possible test statistic is the two-sample Kolmogorov-Smirnov statistic. Given a class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$, set

$$
D_{m, n}=\sqrt{\frac{m n}{m+n}}\left\|\mathbb{P}_{m}-\mathbb{Q}_{n}\right\|_{\mathcal{F}}
$$

where $\mathbb{P}_{m}$ and $\mathbb{Q}_{n}$ are the empirical measures of the $X$ 's and $Y$ 's, respectively. For real-valued observations and $\mathcal{F}$ equal to the set of indicators of cells $(-\infty, t]$, this reduces to the classical Kolmogorov-Smirnov statistic, which is the supremum distance between the two empirical distribution functions. If the underlying distributions $P$ and $Q$ are a priori assumed to be atomless, then the classical Kolmogorov-Smirnov statistic is distributionfree under the null hypothesis and both its finite sample and asymptotic null distribution are well known.

In contrast, for more general sample spaces and indexing classes $\mathcal{F}$, even the asymptotic null distribution of the "sequence" $D_{m, n}$ may depend on the common underlying measure $P=Q$. In this chapter we discuss two ways of setting critical values for the test and show that the test is asymptotically consistent against every alternative ( $P, Q$ ) with $\|P-Q\|_{\mathcal{F}}>$ 0 , if $\mathcal{F}$ is a Donsker class with respect to both $P$ and $Q$.

If $\mathcal{F}$ is a Donsker class under both $P$ and $Q$, then the sequences $\mathbb{G}_{m}= \sqrt{m}\left(\mathbb{P}_{m}-P\right)$ and $\mathbb{G}_{n}^{\prime}=\sqrt{n}\left(\mathbb{Q}_{n}-Q\right)$ converge jointly in distribution to
independent Brownian bridges $\mathbb{G}_{P}$ and $\mathbb{G}_{Q}$. Set $N=m+n$ and note that

$$
D_{m, n}=\left\|\sqrt{\frac{n}{N}} \mathbb{G}_{m}-\sqrt{\frac{m}{N}} \mathbb{G}_{n}^{\prime}+\sqrt{\frac{m n}{N}}(P-Q)\right\|_{\mathcal{F}} .
$$

If $\|P-Q\|_{\mathcal{F}}>0$, then $D_{m, n} \rightarrow \infty$ in probability as $m, n \rightarrow \infty$. On the other hand, under the null hypothesis $P=Q$ the sequence $D_{m, n}$ converges in distribution to the random variable $\left\|\sqrt{1-\lambda} \mathbb{G}_{P}-\sqrt{\lambda} \mathbb{G}_{Q}\right\|_{\mathcal{F}}$ if $m, n \rightarrow \infty$ such that $m / N \rightarrow \lambda$. For $P=Q$, the limit variable $\sqrt{1-\lambda} \mathbb{G}_{P}-\sqrt{\lambda} \mathbb{G}_{Q}$ possesses the same distribution as $\mathbb{G}_{P}$. It follows that the test that rejects the null hypothesis if $D_{m, n}>c_{m, n}$ has asymptotic level $\alpha$ if the critical values $c_{m, n}$ can be chosen such that

$$
c_{m, n} \rightarrow c_{P}=\inf \left\{t: \mathrm{P}\left(\left\|\mathbb{G}_{P}\right\|_{\mathcal{F}}>t\right) \leq \alpha\right\}
$$

Since $c_{P}<\infty$, the test is then consistent in the sense that $\mathrm{P}\left(D_{m, n}>\right. \left.c_{m, n}\right) \rightarrow 1$ against any alternative with $\|P-Q\|_{\mathcal{F}}>0$.

In general, the upper $\alpha$-quantile, $c_{P}$, of the limiting distribution depends on the underlying measure, $P$. Then it is impossible to find numbers $c_{m, n}$ with the given convergence property for every $P$ in the null hypothesis. Instead we use data-dependent "critical points" $\tilde{c}_{m, n}= c_{m, n}\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$, and properly speaking the test statistic is $D_{m, n}-\tilde{c}_{m, n}$ rather than $D_{m, n}$. Similar reasoning as before shows that the sequence of tests that reject the null hypothesis if $D_{m, n}>\tilde{c}_{m, n}$ is asymptotically consistent and of level $\alpha$ if the sequence $\tilde{c}_{m, n}$ behaves well in probability. More precisely, the asymptotic level is $\alpha$ in the sense that $\limsup \mathrm{P}\left(D_{m, n}>\tilde{c}_{m, n}\right) \leq \alpha$ for $P=Q$ if ${ }^{\text {b }}$

$$
\tilde{c}_{m, n} \xrightarrow{\mathrm{P}} c_{P} .
$$

Furthermore, the sequence of tests is consistent against any alternative $(P, Q)$ for which $\tilde{c}_{m, n}$ is bounded in probability and $\|P-Q\|_{\mathcal{F}}>0$.
"Critical values" $\tilde{c}_{m, n}$ with these properties can be determined by a permutation or a bootstrap approach. These procedures amount to sampling without and with replacement, respectively, from the pooled data $\left(Z_{N 1}, \ldots, Z_{N N}\right)=\left(X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}\right)$. Let $\lambda_{N}=m / N$, and consider the pooled empirical measure

$$
\mathbb{H}_{N}=\frac{1}{N} \sum_{i=1}^{N} \delta_{Z_{N i}}=\lambda_{N} \mathbb{P}_{m}+\left(1-\lambda_{N}\right) \mathbb{Q}_{n}
$$

Since $\mathbb{P}_{m}-\mathbb{H}_{N}=\left(1-\lambda_{N}\right)\left(\mathbb{P}_{m}-\mathbb{Q}_{n}\right)$, the Kolmogorov-Smirnov test is equivalent to a test based on the discrepancy between $\mathbb{P}_{m}$ and the pooled empirical measure.

[^11]
### 3.7.1 Permutation Empirical Processes

Sampling without replacement from the pooled empirical measure $\mathbb{H}_{N}$ can be represented in terms of a random permutation. Let the random vector $R=\left(R_{1}, \ldots, R_{N}\right)$ be uniformly distributed on the set of all permutations of $\{1,2, \ldots, N\}$ and be independent from $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$. (As usual, when outer expectations are involved, "independence" is understood in terms of a product probability space.) The two-sample permutation empirical measures are

$$
\tilde{\mathbb{P}}_{m, N}=\frac{1}{m} \sum_{i=1}^{m} \delta_{Z_{N R_{i}}} ; \quad \tilde{\mathbb{Q}}_{n, N}=\frac{1}{n} \sum_{i=m+1}^{N} \delta_{Z_{N R_{i}}} .
$$

The permutation empirical process corresponding to the first sample is $\sqrt{m}\left(\tilde{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right)$. The following theorems establish the almost-sure and in-probability limiting behavior of this process.
3.7.1 Theorem. Let $\mathcal{F}$ be a class of measurable functions that is Donsker under both $P$ and $Q$ and satisfies both $\|P\|_{\mathcal{F}}<\infty$ and $\|Q\|_{\mathcal{F}}< \infty$. If $m, n \rightarrow \infty$ such that $m / N \rightarrow \lambda \in(0,1)$, then $\sqrt{m}\left(\tilde{\mathbb{P}}_{m, N}\right.$ $\left.\mathbb{H}_{N}\right) \rightsquigarrow \sqrt{1-\lambda} \mathbb{G}_{H}$ given $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$ in probability. Here $\mathbb{G}_{H}$ is a tight Brownian bridge process corresponding to the measure $H= \lambda P+(1-\lambda) Q$.
3.7.2 Theorem. If in addition $\mathcal{F}$ possesses an envelope function $F$ with both $P^{*} F^{2}<\infty$ and $Q^{*} F^{2}<\infty$, then also $\sqrt{m}\left(\tilde{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right) \rightsquigarrow \sqrt{1-\lambda} \mathbb{G}_{H}$ given almost every sequence $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$.

Proof. Without loss of generality, assume that $P f=0$ for every $f$. Otherwise, replace $f$ by $f^{o}=f-P f$ for every $f$, in which case we still have $\|Q\|_{\mathcal{F}^{\circ}}<\infty$. Given fixed values of the original pooled sample, let $\hat{Z}_{N 1}, \ldots, \hat{Z}_{N N}$ be an i.i.d. sample from $\mathbb{H}_{N}$.

For marginal convergence it suffices by the Cramér-Wold device to show that, for every $f$ with $H f=0$ and $H f^{2}<\infty$,

$$
\frac{1}{\sqrt{m}} \sum_{i=1}^{m}\left(f\left(Z_{N R_{i}}\right)-\mathbb{H}_{N} f\right) \rightsquigarrow N\left(0,(1-\lambda) H f^{2}\right)
$$

given almost every sequence $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$ This follows from the central limit theorem for two-sample rank statistics, Proposition A.5.3, applied with $a_{N, i}=f\left(Z_{N i}\right)$ and $b_{N i}$ equal to 1 or 0 if $i \leq m$ or $i>m$.

Set $\mathcal{F}_{\delta}=\left\{f-g, f, g \in \mathcal{F}, H(f-g)^{2}<\delta^{2}\right\}$. The assumptions imply that $\mathcal{F}$ is totally bounded in both $L_{2}(P)$ and $L_{2}(Q)$. Then $\mathcal{F}$ is also totally bounded in $L_{2}(H)$. By Hoeffding's inequality, Proposition A.1.9,

$$
\mathrm{E}_{R}\left\|\frac{1}{\sqrt{m}} \sum_{i=1}^{m}\left(\delta_{Z_{N R_{i}}}-\mathbb{H}_{N}\right)\right\|_{\mathcal{F}_{\delta}} \leq \mathrm{E}_{\hat{Z}}\left\|\frac{1}{\sqrt{m}} \sum_{i=1}^{m}\left(\delta_{\hat{Z}_{N i}}-\mathbb{H}_{N}\right)\right\|_{\mathcal{F}_{\delta}}
$$

Let $\tilde{N}_{1}, \ldots, \tilde{N}_{N}$ be i.i.d. symmetrized Poisson $(m / 2 N)$ variables. By the Poissonization inequality, Lemma 3.6.6, the right side is bounded by 4 times

$$
\mathrm{E}_{\tilde{N}}\left\|\frac{1}{\sqrt{m}} \sum_{i=1}^{N} \tilde{N}_{i} \delta_{Z_{N i}}\right\|_{\mathcal{F}_{\delta}} \leq \mathrm{E}_{\tilde{N}}\left\|\frac{1}{\sqrt{m}} \sum_{i=1}^{m} \tilde{N}_{i} \delta_{X_{i}}\right\|_{\mathcal{F}_{\delta}}+\mathrm{E}_{\tilde{N}}\left\|\frac{1}{\sqrt{m}} \sum_{i=1}^{n} \tilde{N}_{i} \delta_{Y_{i}}\right\|_{\mathcal{F}_{\delta}} .
$$

By the closedness of the symmetrized Poisson family under convolution and Jensen's inequality, the parameter of the Poisson variables can be increased to $1 / 2$. According to the unconditional multiplier theore, Theorem 2.9.2, the sequences of processes $m^{-1 / 2} \sum_{i=1}^{m} \tilde{N}_{i} \delta_{X_{i}}$ and $n^{-1 / 2} \sum_{i=1}^{n} \tilde{N}_{i} \delta_{Y_{i}}$ converge in distribution to tight Gaussian processes $Z_{P}$ and $Z_{Q}$, respectively.

By Lemma 2.3.11, the outer expectation with respect to the original observations $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$ of the right side of the last display is asymptotically bounded by a multiple of the expression $\mathrm{E}\left\|Z_{P}\right\|_{\mathcal{F}_{\delta}}+ \sqrt{(1-\lambda) / \lambda} \mathrm{E}\left\|Z_{Q}\right\|_{\mathcal{F}_{\delta}}$ as $m, n \rightarrow \infty$. This converges to 0 as $\delta \downarrow 0$ since both processes have uniformly continuous sample paths with respect to the $L_{2}(H)$-semimetric. This concludes the proof of the first theorem.

If $\mathcal{F}$ possesses an envelope function that is square integrable under both $P$ and $Q$, then the limsup as $m, n \rightarrow \infty$ of the last display is bounded by a constant times $\mathrm{E}\left\|Z_{P}\right\|_{\mathcal{F}_{\delta}}+\sqrt{(1-\lambda) / \lambda} \mathrm{E}\left\|Z_{Q}\right\|_{\mathcal{F}_{\delta}}$, for almost every $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$, by Corollary 2.9.8 combined with Lemma 2.3.11. Again, this upper bound converges to 0 as $\delta \rightarrow 0$.

The preceding theorem implies that the sequence

$$
\tilde{D}_{m, n}=\sqrt{\frac{m n}{m+n}}\left\|\tilde{\mathbb{P}}_{m, N}-\tilde{\mathbb{Q}}_{n, N}\right\|_{\mathcal{F}}=\frac{1}{\sqrt{1-\lambda_{N}}} \sqrt{m}\left\|\tilde{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right\|_{\mathcal{F}}
$$

converges in distribution to $\left\|\mathbb{G}_{H}\right\|_{\mathcal{F}}$ given the original observations. Consequently, the upper $\alpha$-quantiles

$$
\begin{equation*}
\tilde{c}_{m, n}=\inf \left\{t: \mathrm{P}_{R}\left(\tilde{D}_{m, n}>t\right) \leq \alpha\right\} \tag{3.7.3}
\end{equation*}
$$

of the conditional distribution of $\tilde{D}_{m, n}$ can be used as "critical values" for the Kolmogorov-Smirnov test. The distribution of the norm $\mathbb{G}_{H}$ of a tight Brownian bridge is known to be absolutely continuous with a positive density. ${ }^{\sharp}$ Thus, under the conditions of the preceding theorems,

$$
\tilde{c}_{m, n} \rightarrow c_{H}=\inf \left\{t: \mathrm{P}\left(\left\|\mathbb{G}_{H}\right\|_{\mathcal{F}}>t\right) \leq \alpha\right\}
$$

in probability and almost surely, respectively.
If follows that the sequence of tests that reject the null hypothesis $H_{0}: P=Q$ if $D_{m, n}>\tilde{c}_{m, n}$, is asymptotically of level $\alpha$ for any $P=Q$ for which the index set $\mathcal{F}$ is Donsker. Furthermore, the sequence of tests is consistent against any alternative ( $P, Q$ ) for which $\|P-Q\|_{\mathcal{F}}>0$ and for

[^12]which $\mathcal{F}$ is both $P$ - and $Q$-Donsker. In most cases there exist simple index classes $\mathcal{F}$ that satisfy these requirements for every pair $P=Q$ and $P \neq Q$ on the sample space, respectively.
3.7.4 Example. In Euclidean space any suitably measurable, uniformly bounded VC-class of functions is universally Donsker. The collection of all indicators of cells $(-\infty, t]$ can be added to ensure that $\|P-Q\|_{\mathcal{F}}>0$ for every $P \neq Q$. The resulting class satisfies the two requirements, and the sequence of Kolmogorov-Smirnov tests is asymptotically consistent against every possible alternative.

While every reasonable VC-class will thus ensure consistency against every possible alternative, the particular choice will determine the power of the resulting test. See Chapter 3.10 for a study of empirical processes under contiguous alternatives.
3.7.5 Example. If the $\sigma$-field in the sample space is countably generated, then there exists a sequence of measurable sets $A_{i}$ such that $P \neq Q$ if and only if $P\left(A_{i}\right) \neq Q\left(A_{i}\right)$ for at least one $i$. (Replace a given countable generator by the collection of all finite intersections. This is a countable generator that is intersection-stable and hence a measure determining class.) By Theorem 2.13.1, the sequence $\left\{c_{i} 1_{A_{i}}\right\}$ is a universal Donsker class for every sequence $c_{i}$ that decreases to zero sufficiently fast.

Thus, any sample space with a countably generated $\sigma$-field supports a class $\mathcal{F}$ for which the Kolmogorov-Smirnov test is asymptotically consistent against every possible alternative. (The Donsker class in the preceding paragraph proves existence but is not necessarily recommended to obtain power against "reasonable" alternatives.)

The test that rejects the null hypothesis if $D_{m, n}>\tilde{c}_{m, n}$ with $\tilde{c}_{m, n}$ determined by (3.7.3) is exactly a classical permutation test. There are $N$ ! possible orderings of the pooled sample $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$ and, counting ties by multiplicity, equally many corresponding values of the test statistic $D_{m, n}$. Given the values in the pooled sample, each possible value of $D_{m, n}$ is equally probable under the null hypothesis (still counting ties by multiplicity). The definition (3.7.3) of $\tilde{c}_{m, n}$ is such that the null hypothesis is rejected if the observed value $D_{m, n}\left(x_{1}, \ldots, x_{m}, y_{1}, \ldots, y_{n}\right)$ is among the $\alpha$-fraction of largest possible values of $D_{m, n}$.

It follows that given the values of the pooled sample the probability of an error of the first kind is smaller than $\alpha$. This being true for every $m, n$ and every pooled sample also yields the conclusion that the sequence of tests is asymptotically of level $\alpha$. The abstract approach given previously shows in addition that the sequence of tests is consistent and that the critical values $\tilde{c}_{m, n}$ converge (in probability or almost surely) to a deterministic value. It can also be used to study the power of the sequence of tests under contiguous alternatives.

### 3.7.2 Two-Sample Bootstrap

Instead of sampling values without replacement from the pooled sample, we can sample with replacement. This leads to two-sample bootstrap empirical measures

$$
\hat{\mathbb{P}}_{m, N}=\frac{1}{m} \sum_{i=1}^{m} \delta_{\hat{Z}_{N i}} ; \quad \hat{\mathbb{Q}}_{n, N}=\frac{1}{n} \sum_{i=1}^{n} \delta_{\hat{Z}_{N, m+i}}
$$

where $\hat{Z}_{N 1}, \ldots, \hat{Z}_{N N}$ is an i.i.d. sample from the pooled empirical measure $\mathbb{H}_{N}$. Unlike the permutation empirical measures, the bootstrap empirical measures corresponding to the two samples are independent.
3.7.6 Theorem. Let $\mathcal{F}$ be a class of measurable functions that is Donsker under both $P$ and $Q$ and satisfies both $\|P\|_{\mathcal{F}}<\infty$ and $\|Q\|_{\mathcal{F}}<\infty$. If $m, n \rightarrow \infty$ such that $m / N \rightarrow \lambda \in(0,1)$, then $\sqrt{m}\left(\hat{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right) \rightsquigarrow \mathbb{G}_{H}$ given $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$ in probability. Here $\mathbb{G}_{H}$ is a tight Brownian bridge process corresponding to the measure $H=\lambda P+(1-\lambda) Q$.
3.7.7 Theorem. If in addition $\mathcal{F}$ possesses an envelope function $F$ with both $P^{*} F^{2}<\infty$ and $Q^{*} F^{2}<\infty$, then also $\sqrt{m}\left(\hat{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right) \rightsquigarrow \mathbb{G}_{H}$ given almost every sequence $X_{1}, X_{2}, \ldots, Y_{1}, Y_{2}, \ldots$.

The theorems are proved by the same arguments as used in the proofs of the permutation theorems. In fact, the proofs are simpler, because Hoeffding's inequality is no longer needed and the finite-dimensional convergence follows from the Lindeberg theorem.

The theorems combined with the analogous results for the bootstrap process corresponding to the second sample imply that the sequence

$$
\begin{aligned}
\hat{D}_{m, n} & =\sqrt{\frac{m n}{N}}\left\|\hat{\mathbb{P}}_{m, N}-\hat{\mathbb{Q}}_{n, N}\right\|_{\mathcal{F}} \\
& =\left\|\sqrt{m\left(1-\lambda_{N}\right)}\left(\hat{\mathbb{P}}_{m, N}-\mathbb{H}_{N}\right)-\sqrt{n \lambda_{N}}\left(\hat{\mathbb{Q}}_{n, N}-\mathbb{H}_{N}\right)\right\|_{\mathcal{F}}
\end{aligned}
$$

converges in distribution to $\left\|\sqrt{1-\lambda} \mathbb{G}_{H}-\sqrt{\lambda} \mathbb{G}_{H}^{\prime}\right\|_{\mathcal{F}}$ for independent Brownian bridges $\mathbb{G}_{H}$ and $\mathbb{G}_{H}^{\prime}$. The process $\sqrt{1-\lambda} \mathbb{G}_{H}-\sqrt{\lambda} \mathbb{G}_{H}^{\prime}$ is a version of an $H$-Brownian bridge itself. Consequently, the upper $\alpha$-quantiles

$$
\hat{c}_{m, n}=\inf \left\{t: \mathrm{P}_{\hat{Z}}\left(\hat{D}_{m, n}>t\right) \leq \alpha\right\}
$$

of the conditional distribution of $\hat{D}_{m, n}$ can be used as "critical values" for the Kolmogorov-Smirnov test. Under the conditions of the preceding theorems,

$$
\hat{c}_{m, n} \rightarrow c_{H}=\inf \left\{t: \mathrm{P}\left(\left\|\mathbb{G}_{H}\right\|_{\mathcal{F}}>t\right) \leq \alpha\right\}
$$

in probability and almost surely, respectively. The critical values set by the permutation method in the preceding section possess exactly the same behavior. Hence at this level of analysis the two methods are of equal accuracy.

## Problems and Complements

1. If $\mathcal{F}$ is $P$-Donsker and $\mathbb{P}_{m}$ and $\mathbb{Q}_{n}$ are the empirical measures of independent i.i.d. samples of sizes $m$ and $n$ from $P$, then $\sqrt{m n / N}\left(\mathbb{P}_{m}-\mathbb{Q}_{n}\right)$ converges in distribution to a tight Brownian bridge if $m, n \rightarrow \infty$ (also if $m / n \rightarrow 0$ or does not converge).
2. (The $k$-sample problem) For each $j=1, \ldots, k$, let $X_{j 1}, \ldots, X_{j, n_{j}}$ be an i.i.d. sample from a probability measure $P_{j}$. Consider testing the null hypothesis $H_{0}: P_{1}=\cdots=P_{k}$. Let $\mathbb{P}_{j, n_{j}}$ be the empirical measure of the $j$ th sample, and let $\mathbb{H}_{n}$ be the empirical measure of the pooled sample. If $\mathcal{F}$ is a $P$-Donsker class and $\|P\|_{\mathcal{F}}<\infty$ for every $P$, then under the null hypothesis

$$
K=\sum_{j=1}^{k} n_{j}\left(\mathbb{P}_{j, n_{j}}-\mathbb{H}_{N}\right)^{2} \rightsquigarrow \sum_{j=1}^{k-1} \mathbb{G}_{j}^{2},
$$

in $\ell^{\infty}(\mathcal{F})$, where $\mathbb{G}_{1}, \ldots, \mathbb{G}_{k-1}$ are i.i.d. tight $P$-Brownian bridge processes. Critical values for a test based on $\|K\|_{\mathcal{F}}$ can be set both by a permutation and a bootstrap procedure.
3. In the setting of the preceding problem, consider tests based on the statistics defined as $\sum_{i \neq j} \sqrt{n_{i} n_{j} / N}\left\|\mathbb{P}_{i, n_{i}}-\mathbb{P}_{j, n_{j}}\right\|_{\mathcal{F}}$ and $\sup _{i \neq j} \sqrt{n_{i} n_{j} / N} \| \mathbb{P}_{i, n_{i}}$ $\mathbb{P}_{j, n_{j}} \|_{\mathcal{F}}$.
4. (Deficient two-sample bootstrap) Let $\hat{\mathbb{P}}_{m}$ and $\hat{\mathbb{Q}}_{n}$ be the bootstrap empirical measures based on independent samples of sizes $m$ and $n$ from $\mathbb{P}_{m}$ and $\mathbb{Q}_{n}$, respectively. If $\mathcal{F}$ is $P$-Donsker, then the sequence $\hat{D}_{m, n}= \sqrt{m n / N}\left\|\hat{\mathbb{P}}_{m}-\hat{\mathbb{Q}}_{n}\right\|_{\mathcal{F}}$ converges under the null hypothesis $P=Q$ in distribution to $\left\|\mathbb{G}_{P}\right\|_{\mathcal{F}}$ conditionally on the original observations (in probability or almost surely). Thus the upper $\alpha$-quantile of the distribution of $\hat{D}_{m, n}$ can be used as critical values for the test based on $D_{m, n}$. Is the resulting test consistent for every $\|P-Q\|_{\mathcal{F}}>0$ ?
[Hint: The variables $\hat{D}_{m, n}$ defined this way mimic the variables $\hat{D}_{m, n}$ under the alternative hypothesis as well as under the null hypothesis in the sense that $D_{m, n} / \sqrt{m n / N} \xrightarrow{\mathrm{P}}\|P-Q\|_{\mathcal{F}}$ and $\hat{D}_{m, n} / \sqrt{m n / N} \xrightarrow{\mathrm{P}}\|P-Q\|_{\mathcal{F}}$. Hence $\hat{c}_{\alpha} \xrightarrow{\mathrm{P}} \infty$.]

## 3.8

## Independence Empirical Processes

Let $H$ be a probability measure on the measurable space $(\mathcal{X} \times \mathcal{Y}, \mathcal{A} \times \mathcal{B})$ with marginal laws $P$ and $Q$ on $(\mathcal{X}, \mathcal{A})$ and $(\mathcal{Y}, \mathcal{B})$, respectively. Given a sample $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ of independently and identically distributed vectors from $H$, we want to test the null hypothesis of independence $H_{0}: H=P \times Q$ versus the alternative hypothesis $H_{1}: H \neq P \times Q$. Let $\mathbb{H}_{n}$ be the empirical measure of the observations, and let $\mathbb{P}_{n}$ and $\mathbb{Q}_{n}$ be its marginals. The latter are the empirical measures of the $X_{i}$ 's and $Y_{i}$ 's, respectively.

Given classes $\mathcal{F}$ and $\mathcal{G}$ of real-valued measurable functions defined on $\mathcal{X}$ and $\mathcal{Y}$, respectively, let $\mathcal{F} \times \mathcal{G}$ be the class of all functions $f \times g$ from $\mathcal{X} \times \mathcal{Y}$ to $\mathbb{R}$ defined as

$$
(f \times g)(x, y)=f(x) g(y)
$$

when $f$ and $g$ range over $\mathcal{F}$ and $\mathcal{G}$, respectively. Consider the test statistics

$$
K_{n}=\sqrt{n}\left\|\mathbb{H}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n}\right\|_{\mathcal{F} \times \mathcal{G}}
$$

The independence empirical process $\mathbb{Z}_{n}$ is the process indexed by $\mathcal{F} \times \mathcal{G}$ given by

$$
\begin{aligned}
\mathbb{Z}_{n}(f, g) & =\sqrt{n}\left[\left(\mathbb{H}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n}\right)(f \times g)-(H-P \times Q)(f \times g)\right] \\
& =\sqrt{n}\left(\mathbb{H}_{n}-H\right)(f \times g)-\sqrt{n}\left(\mathbb{P}_{n}-P\right) f \mathbb{Q}_{n} g-P f \sqrt{n}\left(\mathbb{Q}_{n}-Q\right) g \\
& =\sqrt{n}\left(\mathbb{H}_{n}-H\right)((f-P f) \times(g-Q g))-\sqrt{n}\left(\mathbb{P}_{n}-P\right) f\left(\mathbb{Q}_{n}-Q\right) g
\end{aligned}
$$

Under the null hypothesis $H=P \times Q$ the test statistic can be written as $K_{n}=\left\|\mathbb{Z}_{n}\right\|_{\mathcal{F} \times \mathcal{G}}$, while under the alternative hypothesis $K_{n}=\| \mathbb{Z}_{n}+ \sqrt{n}(H-P \times Q) \|_{\mathcal{F} \times \mathcal{G}}$.

The second term in the third representation of $\mathbb{Z}_{n}$ is asymptotically negligible. The following result follows from Slutsky's lemma.
3.8.1 Theorem. Let $\mathcal{F}$ and $\mathcal{G}$ be classes of measurable functions on measurable spaces ( $\mathcal{X}, \mathcal{A}$ ) and ( $\mathcal{Y}, \mathcal{B}$ ), respectively. If $\mathcal{F} \times \mathcal{G}, \mathcal{F}$, and $\mathcal{G}$ are $H$-Donsker and $\|P\|_{\mathcal{F}}<\infty$ and $\|Q\|_{\mathcal{G}}<\infty$, then the sequence of independence processes $\mathbb{Z}_{n}$ converges in distribution in $\ell^{\infty}(\mathcal{F} \times \mathcal{G})$ to the Gaussian process $\mathbb{Z}_{H}(f \times g)=\mathbb{G}_{H}((f-P f) \times(g-P g))$ for a tight $H$-Brownian bridge $\mathbb{G}_{H}$.

Under the null hypothesis $H=P \times Q$, the covariance function of the limit process can be calculated as

$$
\operatorname{cov}\left(\mathbb{Z}_{H}\left(f_{1}, g_{1}\right), \mathbb{Z}_{H}\left(f_{2}, g_{2}\right)\right)=\left(P f_{1} f_{2}-P f_{1} P f_{2}\right)\left(Q g_{1} g_{2}-Q g_{1} Q g_{2}\right)
$$

Thus, the limiting process has the same mean and covariance function as the product $\mathbb{G}_{P}(f) \mathbb{G}_{Q}(g)$ of two independent Brownian bridges (which is not Gaussian).
3.8.2 Example (Completely tucked Brownian sheet). When $\mathcal{X} \times \mathcal{Y}$ is the unit square in the Euclidean plane with uniform measure and both $\mathcal{F}$ and $\mathcal{G}$ are the indicators of the cells $\{[0, t]: 0 \leq t \leq 1\}$, the limit process is the completely tucked Brownian sheet. The class $\mathcal{F} \times \mathcal{G}$ is the set of all indicators of cells $[0, t]$ in the unit square, and the limit process can be identified with a process $\mathbb{Z}(s, t)$ indexed by the unit square. This is a zeromean Gaussian process with covariance function

$$
\mathrm{E} \mathbb{Z}\left(s_{1}, t_{1}\right) \mathbb{Z}\left(s_{2}, t_{2}\right)=\left(s_{1} \wedge s_{2}-s_{1} s_{2}\right)\left(t_{1} \wedge t_{2}-t_{1} t_{2}\right)
$$

A "completely tucked Brownian sheet" derives its name from the fact that $\mathbb{Z}(s, t)=0$ almost surely for all $(s, t)$ in the boundary of the unit square. The distribution of the norm $\|\mathbb{Z}\|_{[0,1]^{2}}$ appears to be unknown in closed form.

The same limiting distribution for the sequence $K_{n}$ arises when $\mathcal{X} \times \mathcal{Y}=\mathbb{R}^{2}$ and $\mathcal{F}$ and $\mathcal{G}$ are equal to the class of indicators of cells $\{(-\infty, t]: t \in \mathbb{R}\}$. Under the null hypothesis of independence, the weak limit of the sequence $\mathbb{Z}_{n}$ can be represented as $\mathbb{Z}(P(s), Q(t))$, where $\mathbb{Z}$ is a standard, completely tucked Brownian sheet. Under the assumption that the marginal distribution functions $P(s)$ and $Q(t)$ are continuous, the variable $\|\mathbb{Z}(P(s), Q(t))\|_{\mathbb{R}^{2}}$ is distributed as the norm of a completely tucked Brownian sheet.

The conclusion of the preceding theorem immediately yields that under the null hypothesis the sequence of test statistics $K_{n}=\sqrt{n} \| \mathbb{H}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n} \|_{\mathcal{F} \times \mathcal{G}}$ converges in distribution to the norm $\left\|\mathbb{Z}_{H}\right\|_{\mathcal{F} \times \mathcal{G}}$ of the limit independence process. Furthermore, since the test statistics can be written

$$
K_{n}=\left\|\mathbb{Z}_{n}+\sqrt{n}(H-P \times Q)\right\|_{\mathcal{F} \times \mathcal{G}},
$$

the sequence of test statistics converges in probability to $+\infty$ under every $H$ in the alternative hypothesis such that $\|H-P \times Q\|_{\mathcal{F} \times \mathcal{G}}>0$.

To implement a test based on $K_{n}$, it remains to approximate the critical points of its distribution. Since the limit distribution of the sequence $K_{n}$ depends on the unknown marginal distributions $P$ and $Q$ even under the null hypothesis, it is typically not practical to obtain critical points from the asymptotic distribution. However, critical points can be set by a bootstrap approach.

Under the null hypothesis, a natural estimate for the underlying distribution $H$ of the observations is the product $\mathbb{P}_{n} \times \mathbb{Q}_{n}$ of the empirical measures of the two samples. For the bootstrap test of independence, let $\left(\hat{X}_{1}, \hat{Y}_{1}\right), \ldots,\left(\hat{X}_{n}, \hat{Y}_{n}\right)$ be an i.i.d. sample from the measure $\mathbb{P}_{n} \times \mathbb{Q}_{n}$, and let $\hat{\mathbb{H}}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{\left(\hat{X}_{i}, \hat{Y}_{i}\right)}$ be the corresponding bootstrap empirical measure. The bootstrap independence process is defined by

$$
\hat{\mathbb{Z}}_{n}=\sqrt{n}\left(\hat{\mathbb{H}}_{n}-\hat{\mathbb{P}}_{n} \times \hat{\mathbb{Q}}_{n}\right) .
$$

Note that, given the original observations, the variable $\hat{\mathbb{Z}}_{n}(f \times g)$ is centered at mean zero since the bootstrap sample is taken from $\mathbb{P}_{n} \times \mathbb{Q}_{n}$, not $\mathbb{H}_{n}$. Thus, there is a symmetry in the definitions of $\hat{\mathbb{Z}}_{n}$ and $\mathbb{Z}_{n}$ only if the latter is considered under the null hypothesis $H=P \times Q$. We shall still be interested in the asymptotic behavior of $\hat{\mathbb{Z}}_{n}$ conditionally on the original observations, under both null and alternative hypotheses.

With $\hat{K}_{n}=\left\|\hat{\mathbb{Z}}_{n}\right\|_{\mathcal{F} \times \mathcal{G}}$, define a critical point

$$
\hat{c}_{n}=\inf \left\{t>0: \mathrm{P}_{\hat{X}, \hat{Y}}\left(\hat{K}_{n}>t\right) \leq \alpha\right\} .
$$

Here $\mathrm{P}_{\hat{X}, \hat{Y}}$ denotes the conditional law given the original observations $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$. The bootstrap test of independence rejects the null hypothesis for values of $K_{n}$ exceeding $\hat{c}_{n}$. This procedure is a model-based bootstrap in that the bootstrap resampling is done from the estimated model under the null hypothesis.

To derive the asymptotic properties of this test, the convergence of the process $\hat{\mathbb{Z}}_{n}$ must be established under both the null and alternative hypotheses. Although theorems as general as those of Chapter 3.7 are lacking for this process, a number of conclusions are possible using the methods developed in Sections 2.8 and 2.9. These methods apply to a wide range of problems involving model-based bootstrapping.

We apply the results of Section 2.8.3 with $P_{n}$ of that section taken to be $\mathbb{P}_{n} \times \mathbb{Q}_{n}$ for given values of the original observations.
3.8.3 Theorem. Let $\mathcal{F}$ and $\mathcal{G}$ be separable classes of measurable functions on measurable spaces ( $\mathcal{X}, \mathcal{A}$ ) and ( $\mathcal{Y}, \mathcal{B}$ ), respectively, such that $\mathcal{F} \times \mathcal{G}$ satisfies the uniform entropy condition for envelope functions $F, G$, and $F \times G$ that are $H$-square integrable. Then

$$
\hat{\mathbb{G}}_{n}=\sqrt{n}\left(\hat{\mathbb{H}}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n}\right) \rightsquigarrow \mathbb{G}_{P \times Q}, \quad \text { in } \ell^{\infty}(\mathcal{F} \times \mathcal{G}),
$$

and

$$
\hat{\mathbb{Z}}_{n}=\sqrt{n}\left(\hat{\mathbb{H}}_{n}-\hat{\mathbb{P}}_{n} \times \hat{\mathbb{Q}}_{n}\right) \rightsquigarrow \mathbb{Z}_{P \times Q}, \quad \text { in } \ell^{\infty}(\mathcal{F} \times \mathcal{G}),
$$

given $H^{\infty}$-almost every sequence $\left(X_{1}, Y_{1}\right),\left(X_{2}, Y_{2}\right), \ldots$ Here $\mathbb{G}_{P \times Q}$ is a $P \times Q$-Brownian bridge.

Proof. The bootstrap independence process can be rewritten as

$$
\begin{aligned}
& \hat{\mathbb{Z}}_{n}=\sqrt{n}\left(\hat{\mathbb{H}}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n}\right)(f \times g)-\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right) f \mathbb{Q}_{n} g \\
& \quad-\mathbb{P}_{n} f \sqrt{n}\left(\hat{\mathbb{Q}}_{n}-\mathbb{Q}_{n}\right) g-\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right) f\left(\hat{\mathbb{Q}}_{n}-\mathbb{Q}_{n}\right) g .
\end{aligned}
$$

The assertions now follow from an empirical central limit theorem for a triangular array of observations. In the present case the $n$th row of the array is the sample $\left(\hat{X}_{1}, \hat{Y}_{1}\right), \ldots,\left(\hat{X}_{n}, \hat{Y}_{n}\right)$ from $\mathbb{P}_{n} \times \mathbb{Q}_{n}$. Since $\mathcal{F} \times \mathcal{G}$ satisfies the uniform entropy condition, Theorem 2.8.9 shows that $\hat{\mathbb{G}}_{n}$ converges in distribution to $\mathbb{G}_{P \times Q}$ for every sequence of original observations for which

$$
\begin{aligned}
\left(\mathbb{P}_{n} \times \mathbb{Q}_{n}\right)(F \times G)^{2} & =O(1), \\
\left(\mathbb{P}_{n} \times \mathbb{Q}_{n}\right)(F \times G)^{2}\{|F \times G| \geq \varepsilon \sqrt{n}\} & \rightarrow 0, \quad \text { every } \varepsilon>0, \\
\sup _{h_{1}, h_{2} \in \mathcal{F} \times \mathcal{G}}\left|\rho_{\mathbb{P}_{n} \times \mathbb{Q}_{n}}\left(h_{1}, h_{2}\right)-\rho_{P \times Q}\left(h_{1}, h_{2}\right)\right| & \rightarrow 0 .
\end{aligned}
$$

The quantities in this display are two-sample U-statistics (for dependent samples if $H$ is not a product measure), but in view of the special structure of the kernels can be handled by the strong law of large numbers for i.i.d. variables. For instance, the second line of the display can be written as

$$
\frac{1}{n^{2}} \sum_{i=1}^{n} \sum_{j=1}^{n} F^{2}\left(X_{i}\right) G^{2}\left(Y_{j}\right)\left\{\left|F\left(X_{i}\right) G\left(Y_{j}\right)\right| \geq \varepsilon \sqrt{n}\right\}
$$

For every $M^{2} \leq \varepsilon \sqrt{n}$ this is bounded above by

$$
\mathbb{P}_{n} F^{2}\{F \geq M\} \mathbb{Q}_{n} G^{2}+\mathbb{P}_{n} F^{2} \mathbb{Q}_{n} G^{2}\{G \geq M\}
$$

For $n \rightarrow \infty$ this converges almost surely to a fixed value, which can be made arbitrarily small by choosing $M$ large. This concludes the proof of the weak convergence of $\hat{\mathbb{G}}_{n}$.

By Slutsky's lemma and the continuous mapping theorem, the sequence $\hat{\mathbb{Z}}_{n}$ converges in distribution to $\mathbb{G}_{P \times Q}(f \times g)-\mathbb{G}_{P \times Q}(f \times 1) Q g-$ P $f \mathbb{G}_{P \times Q}(1 \times g)$, which is a mean zero Gaussian process with the same covariance function as $\mathbb{Z}_{P \times Q}$ (Cf. the second representation of $\mathbb{Z}_{n}$ in the introduction).

The preceding theorem implies that the sequence $\hat{K}_{n}=\left\|\hat{\mathbb{Z}}_{n}\right\|_{\mathcal{F} \times \mathcal{G}}$ converges almost surely conditionally in distribution to $\left\|\mathbb{Z}_{P \times Q}\right\|_{\mathcal{F} \times \mathcal{G}}$ under
both null and alternative hypotheses. Thus, it has the same limiting distribution as the test statistic $K_{n}$ under the null hypothesis $H=P \times Q$. Hence the upper $\alpha$-quantiles $\hat{c}_{n}$ of its (conditional) distribution satisfy

$$
\hat{c}_{n} \rightarrow \inf \left\{t>0: \mathrm{P}\left(\left\|\mathbb{Z}_{P \times Q}\right\|_{\mathcal{F} \times \mathcal{G}}>t\right) \leq \alpha\right\}, \quad \text { a.s. }
$$

It follows that the sequence of tests that reject the null hypothesis $H_{0}: H= P \times Q$ if $K_{n}>\hat{c}_{n}$ is asymptotically of level $\alpha$ for any $H=P \times Q$ for which the index set $\mathcal{F} \times \mathcal{G}$ satisfies the conditions of the preceding theorem. Furthermore, the sequence of tests is consistent against any alternative $H$ for which $\|H-P \times Q\|_{\mathcal{F} \times \mathcal{G}}>0$.

An alternative to using the bootstrap is to set critical points by a permutation procedure. For a permutation test of independence let $R=\left(R_{1}, \ldots, R_{n}\right)$ be uniformly distributed on the set of permutations of $\{1, \ldots, n\}$ and independent of the original observations. Then $\tilde{\mathbb{H}}_{n}= n^{-1} \sum_{i=1}^{n} \delta_{\left(X_{i}, Y_{R_{i}}\right)}$ is the permutation empirical measure, and the process

$$
\tilde{\mathbb{Z}}_{n}=\sqrt{n}\left(\tilde{\mathbb{H}}_{n}-\mathbb{P}_{n} \times \mathbb{Q}_{n}\right)
$$

is called the permutation independence process. Now with $\tilde{K}_{n} \equiv\left\|\tilde{\mathbb{Z}}_{n}\right\|_{\mathcal{F} \times \mathcal{G}}$ define as critical point

$$
\tilde{c}_{n}=\inf \left\{t>0: \mathrm{P}_{R}\left(\tilde{K}_{n}>t\right)<\alpha\right\} .
$$

The permutation test of independence rejects the null hypothesis for values of $K_{n}$ larger than $\tilde{c}_{n}$. A proof of the consistency of this procedure appears to be unavailable at this point, although it is likely that the permutation independence process has asymptotic behavior similar to the bootstrap process considered previously.

## Problems and Complements

1. Suppose that $\mathcal{F} \times \mathcal{G}$ is $H$-Donsker where $H$ is a distribution on $\mathcal{X} \times \mathcal{Y}$. Then the finite-dimensional distributions of the permutation independence process $\tilde{\mathbb{Z}}_{n}$ converge in distribution to those of $\mathbb{Z}_{P \times Q}$, given $H^{\infty}$-almost every sequence $\left(X_{1}, Y_{1}\right),\left(X_{2}, Y_{2}\right), \ldots$.
[Hint: Use the rank central limit theorem, Proposition A.5.3.]

## 3.9

## The Delta-Method

After giving the general principle of the delta-method, we consider the special case of Gaussian limits and the "conditional" delta-method, which applies to the bootstrap. The chapter closes with a large number of examples.

### 3.9.1 Main Result

Suppose $X_{n}$ is a sequence of real-valued maps with $\sqrt{n}\left(X_{n}-\theta\right) \rightsquigarrow X$ for some constant $\theta$. If $\phi: \mathbb{R} \mapsto \mathbb{R}$ is differentiable at $\theta$, then by Slutsky's theorem

$$
\sqrt{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)=\frac{\phi\left(X_{n}\right)-\phi(\theta)}{X_{n}-\theta} \sqrt{n}\left(X_{n}-\theta\right) \rightsquigarrow \phi^{\prime}(\theta) X .
$$

This is the simplest form of the delta-method.
A more general form of the delta-method is valid for maps $\phi: \mathbb{D} \mapsto \mathbb{E}$ between normed spaces $\mathbb{D}$ and $\mathbb{E}$ or, even more generally: metrizable, topological vector spaces. ${ }^{\dagger}$ The appropriate form of differentiability of $\phi$ is Hadamard differentiability. A map $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ is called Hadamarddifferentiable at $\theta \in \mathbb{D}_{\phi}$ if there is a continuous linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that

$$
\frac{\phi\left(\theta+t_{n} h_{n}\right)-\phi(\theta)}{t_{n}} \rightarrow \phi_{\theta}^{\prime}(h), \quad n \rightarrow \infty
$$

[^13]for all converging sequences $t_{n} \rightarrow 0$ and $h_{n} \rightarrow h$ such that $\theta+t_{n} h_{n} \in \mathbb{D}_{\phi}$ for every $n$. An equivalent definition is that (for normed spaces $\mathbb{E}$ )
$$
\begin{equation*}
\sup _{h \in K, \theta+t h \in \mathbb{D}_{\phi}}\left\|\frac{\phi(\theta+t h)-\phi(\theta)}{t}-\phi_{\theta}^{\prime}(h)\right\| \rightarrow 0, \quad t \rightarrow 0 \tag{3.9.1}
\end{equation*}
$$
for every compact $K \subset \mathbb{D}$. The first definition may be refined to Hadamarddifferentiable tangentially to a set $\mathbb{D}_{0} \subset \mathbb{D}$ by requiring that every $h_{n} \rightarrow h$ in the definition has $h \in \mathbb{D}_{0}$; the derivative need then be defined on $\mathbb{D}_{0}$ only. The second definition more or less shows why Hadamard differentiability is the appropriate type of differentiability for our purposes: the compacts $K$ match up with the asymptotic tightness of weakly convergent sequences.

The domain $\mathbb{D}_{\phi}$ is allowed to be an arbitrary subset of $\mathbb{D}$. In particular, it is not necessary that it is all of $\mathbb{D}$ and it need not be an open subset. This is often important for applications, for instance when considering functions of distribution functions viewed as element of a Skorohod space.
3.9.2 Example (Hadamard and Fréchet differentiability). For maps $\phi: \mathbb{D}_{\phi} \subset \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$, Hadamard differentiability is equivalent to the usual differentiability of calculus, and the derivative $\phi_{\theta}^{\prime}: \mathbb{R}^{k} \mapsto \mathbb{R}^{m}$ is given by the matrix of partial derivatives ( $\partial \phi_{i} / \partial \theta_{j}$ ) evaluated at $\theta$. In general, a map $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$ is called Fréchet-differentiable if there exists a continuous, linear $\operatorname{map} \phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that (3.9.1) holds uniformly in $h$ in bounded subsets of $\mathbb{D}_{\phi}$. For normed spaces, this is equivalent to

$$
\left\|\phi(\theta+h)-\phi(\theta)-\phi_{\theta}^{\prime}(h)\right\|=o(\|h\|), \quad\|h\| \rightarrow 0
$$

Since a compact set is bounded, Fréchet differentiability is a stronger requirement than Hadamard differentiability. For normed spaces, they are equivalent if and only if the unit ball is compact, that is, $\mathbb{D}$ is finitedimensional.

The chain rule asserts that the composition of two differentiable maps is differentiable. It makes possible a calculus of differentiable maps, in which complicated maps can be decomposed into more basic maps. We shall use it frequently when dealing with examples.
3.9.3 Lemma (Chain rule). If $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}_{\psi}$ is Hadamarddifferentiable at $\theta \in \mathbb{D}_{\phi}$ tangentially to $\mathbb{D}_{0}$ and $\psi: \mathbb{E}_{\psi} \mapsto \mathbb{F}$ is Hadamarddifferentiable at $\phi(\theta)$ tangentially to $\phi_{\theta}^{\prime}\left(\mathbb{D}_{0}\right)$, then $\psi \circ \phi: \mathbb{D}_{\phi} \mapsto \mathbb{F}$ is Hadamard-differentiable at $\theta$ tangentially to $\mathbb{D}_{0}$ with derivative $\psi_{\phi(\theta)}^{\prime} \circ \phi_{\theta}^{\prime}$.

Proof. Rewrite the difference $\psi \circ \phi\left(\theta+t h_{t}\right)-\psi \circ \phi(\theta)$ as $\psi\left(\phi(\theta)+t k_{t}\right)- \psi(\phi(\theta))$, with $k_{t}$ given by $\left(\phi\left(\theta+t h_{t}\right)-\phi(\theta)\right) / t$. First apply Hadamard differentiability of $\phi$ to see that $k_{t}$ converges to $\phi_{\theta}^{\prime}(h)$, and next Hadamard differentiability of $\psi$.

For measurable maps $X_{n}$, the delta-method is an almost immediate consequence of the almost-sure representation theorem. If $r_{n} \rightarrow \infty, r_{n}\left(X_{n}-\right. \theta) \rightsquigarrow X$ in $\underset{\sim}{\mathbb{D}}$, and every $X_{n}$ is Borel measurable, then there are Borel measurable $\tilde{X}_{n}$ that are equal in law to $X_{n}$, take their values in the range of $X_{n}$, and satisfy $r_{n}\left(\tilde{X}_{n}-\theta\right) \xrightarrow{\text { as }} \tilde{X}$. (Apply the representation theorem to $r_{n}\left(X_{n}-\theta\right)$ and transform.) If $\phi$ is Hadamard-differentiable at $\theta$, then

$$
r_{n}\left(\phi\left(\tilde{X}_{n}\right)-\phi(\theta)\right)=\frac{\phi\left(\theta+r_{n}^{-1} r_{n}\left(\tilde{X}_{n}-\theta\right)\right)-\phi(\theta)}{r_{n}^{-1}} \xrightarrow{\text { as }} \phi_{\theta}^{\prime}(\tilde{X})
$$

If $\phi$ is measurable the left side is equal in distribution to $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)$. Moreover, the almost sure convergence implies convergence in law. Thus, we obtain that the sequence $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)$ converges in distribution to $\phi_{\theta}^{\prime}(\tilde{X})$.

Unfortunately, this argument breaks down if the measurability assumptions fail. It can be fixed by using the (refined) continuous mapping theorem for outer almost-sure convergence, or by a direct argument. The latter approach appears preferable. In any case, the delta-method "works" without the need of explicit measurability assumptions.
3.9.4 Theorem (Delta-method). Let $\mathbb{D}$ and $\mathbb{E}$ be metrizable topological vector spaces. Let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ be Hadamard-differentiable at $\theta$ tangentially to $\mathbb{D}_{0}$. Let $X_{n}: \Omega_{n} \mapsto \mathbb{D}_{\phi}$ be maps with $r_{n}\left(X_{n}-\theta\right) \rightsquigarrow X$ for some sequence of constants $r_{n} \rightarrow \infty$, where $X$ is separable and takes its values in $\mathbb{D}_{0}$. Then $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(X)$. If $\phi_{\theta}^{\prime}$ is defined and continuous on the whole of $\mathbb{D}$, then the sequence $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)-\phi_{\theta}^{\prime}\left(r_{n}\left(X_{n}-\theta\right)\right)$ converges to zero in outer probability.

Proof. The map $g_{n}(h)=r_{n}\left(\phi\left(\theta+r_{n}^{-1} h\right)-\phi(\theta)\right)$ is defined on the domain $\mathbb{D}_{n}=\left\{h: \theta+r_{n}^{-1} h \in \mathbb{D}_{\phi}\right\}$ and satisfies $g_{n}\left(h_{n}\right) \rightarrow \phi_{\theta}^{\prime}(h)$ for every $h_{n} \rightarrow h \in \mathbb{D}_{0}$. By the extended continuous mapping theorem, Theorem 1.11.1, one has $g_{n}\left(r_{n}\left(X_{n}-\theta\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(X)$. This is the first assertion of the theorem.

The second assertion follows upon applying the first to the map $\psi: \mathbb{D}_{\phi} \mapsto \mathbb{E} \times \mathbb{E}$ defined by $\psi(d)=\left(\phi(d), \phi_{\theta}^{\prime}(d)\right)$. Since this map is Hadamard-differentiable at ( $\theta, \theta$ ) with derivative ( $\phi_{\theta}^{\prime}, \phi_{\theta}^{\prime}$ ), it follows that

$$
\left(r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right), r_{n}\left(\phi_{\theta}^{\prime}\left(X_{n}\right)-\phi_{\theta}^{\prime}(\theta)\right)\right) \leadsto\left(\phi_{\theta}^{\prime}(X), \phi_{\theta}^{\prime}(X)\right) .
$$

By the continuous mapping theorem, the difference of the coordinates of these vectors converges weakly to $\phi_{\theta}^{\prime}(X)-\phi_{\theta}^{\prime}(X)=0$.

A remarkable fact about the previous theorem is that it suffices that $\phi$ is differentiable at just the single point $\theta$. This is certainly convenient for applications to abstract-valued random elements, such as the empirical process, when continuous differentiability can easily fail.

A stronger form of differentiability may be needed for a "uniform" delta-method. Suppose $\theta_{n} \rightarrow \theta$ and $r_{n}\left(X_{n}-\theta_{n}\right) \rightsquigarrow X$. Under what condition does it follow that $r_{n}\left(\phi\left(X_{n}\right)-\phi\left(\theta_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(X)$ ? Consider two cases.

First, if $\theta_{n}$ converges sufficiently fast to $\theta$-specifically if the sequence $r_{n}\left(\theta_{n}-\theta\right)$ is relatively compact-then the conditions of the previous theorem apply. Simply write the object of interest as the sum $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)+r_{n}\left(\phi(\theta)-\phi\left(\theta_{n}\right)\right)$ and apply the previous theorem to the first term and the definition of Hadamard differentiability to the second. If $r_{n}\left(\theta_{n}-\theta\right) \rightarrow h$ (along a subsequence), this yields $r_{n}\left(\phi\left(X_{n}\right)-\right. \left.\phi\left(\theta_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(X+h)+\phi_{\theta}^{\prime}(-h)=\phi_{\theta}^{\prime}(X)$.

Second, for general $\theta_{n}$, it suffices that $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$ be uniformly differentiable.
3.9.5 Theorem (Delta-method). Let $\mathbb{D}$ and $\mathbb{E}$ be metrizable topological vector spaces and $r_{n}$ constants with $r_{n} \rightarrow \infty$. Let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ satisfy

$$
r_{n}\left(\phi\left(\theta_{n}+r_{n}^{-1} h_{n}\right)-\phi\left(\theta_{n}\right)\right) \rightarrow \phi_{\theta}^{\prime}(h)
$$

for every converging sequence $h_{n}$ with $\theta_{n}+r_{n}^{-1} h_{n} \in \mathbb{D}_{\phi}$ for all $n$ and $h_{n} \rightarrow h \in \mathbb{D}_{0}$ and some arbitrary map $\phi_{\theta}^{\prime}$ on $\mathbb{D}_{0}$. If $X_{n}: \Omega_{n} \mapsto \mathbb{D}_{\phi}$ are maps with $r_{n}\left(X_{n}-\theta_{n}\right) \rightsquigarrow X$, where $X$ is separable and takes its values in $\mathbb{D}_{0}$, then $r_{n}\left(\phi\left(X_{n}\right)-\phi\left(\theta_{n}\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(X)$. If $\phi_{\theta}^{\prime}$ is defined, linear, and continuous on the whole of $\mathbb{D}$, then the sequence $r_{n}\left(\phi\left(X_{n}\right)-\phi\left(\theta_{n}\right)\right)-\phi_{\theta}^{\prime}\left(r_{n}\left(X_{n}-\theta\right)\right)$ converges to zero in outer probability.

This theorem is proved in exactly the same manner as the previous theorem. A sufficient condition for uniform differentiability is continuous differentiability in a neighborhood of $\theta$. For convex domains $\mathbb{D}_{\phi}$, a weak form of this is that $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ be differentiable at every $\vartheta \in \mathbb{D}_{\phi}$ that is sufficiently close to $\theta$, where the derivatives $\phi_{\vartheta}^{\prime}$ satisfy

$$
\begin{array}{cc}
\lim _{\substack{\eta \rightarrow \vartheta \\
\eta \in \mathbb{D}_{\phi}}} \phi_{\eta}^{\prime}(h)=\phi_{\vartheta}^{\prime}(h), & \text { for every } h \in \operatorname{lin} \mathbb{D}_{\phi},  \tag{3.9.6}\\
\lim _{\vartheta \rightarrow \theta} \phi_{\vartheta}^{\prime}(h)=\phi_{\theta}^{\prime}(h), & \text { uniformly in } h \in K,
\end{array}
$$

for every totally bounded subset $K$ of $\operatorname{lin} \mathbb{D}_{\phi}$.
3.9.7 Lemma. Let $\mathbb{D}$ and $\mathbb{E}$ be normed spaces and $\mathbb{D}_{\phi} \subset \mathbb{D}$ convex. Let $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$ be Hadamard-differentiable at every $\vartheta \in \mathbb{D}_{\phi}$ in a neighborhood around $\theta$, tangentially to $\mathbb{D}_{0}$, where the derivatives satisfy (3.9.6). Then $\phi$ is uniformly differentiable along every sequence $\theta_{n} \rightarrow \theta$ in $\mathbb{D}_{\phi}$, tangentially to $\mathbb{D}_{0}$.

Proof. Let $t_{n} \downarrow 0$ be given. Fix sufficiently large $n$ and $h$ such that $\theta_{n}+ t_{n} h \in \mathbb{D}_{\phi}$, and define a map $f_{n}(t)=\phi\left(\theta_{n}+t h\right)$ on the interval $0 \leq t \leq t_{n}$.

Since $\mathbb{D}_{\phi}$ is convex, this is well defined, and by Hadamard differentiability of $\phi$,

$$
\frac{f_{n}(t+g)-f_{n}(t)}{g} \rightarrow \phi_{\theta_{n}+t h}^{\prime}(h), \quad \text { as } g \rightarrow 0
$$

for every $t$. Thus $f_{n}$ is differentiable on the interval $\left[0, t_{n}\right]$. By assumption its derivative is continuous in $t$. Hence for every element $e^{*}$ from the dual space of $\mathbb{E}$, the fundamental theorem of calculus allows one to write $e^{*}\left(f_{n}\left(t_{n}\right)-\right. \left.f_{n}(0)\right)$ as the integral of its derivative. In other words

$$
e^{*}\left(\phi\left(\theta_{n}+t_{n} h\right)-\phi\left(\theta_{n}\right)\right)=t_{n} \int_{0}^{1} e^{*} \phi_{\theta_{n}+t t_{n} h}^{\prime}(h) d t
$$

For every $h_{n} \rightarrow h$ such that $\theta_{n}+t_{n} h_{n} \in \mathbb{D}_{\phi}$, we have by assumption that

$$
\int_{0}^{1}\left|e^{*} \phi_{\theta_{n}+t t_{n} h_{n}}^{\prime}\left(h_{n}\right)-e^{*} \phi_{\theta}^{\prime}\left(h_{n}\right)\right| d t \rightarrow 0
$$

uniformly in $\left\|e^{*}\right\| \leq 1$. The combination of the last two equations shows that the sequence $t_{n}^{-1}\left(\phi\left(\theta_{n}+t_{n} h_{n}\right)-\phi\left(\theta_{n}\right)\right)$ has the same limit as the sequence $\phi_{\theta}^{\prime}\left(h_{n}\right)$.

### 3.9.2 Gaussian Limits

The delta-method yields the conclusion that the transformed sequence of variables $r_{n}\left(\phi\left(X_{n}\right)-\phi(\theta)\right)$ converges to a limit variable $\phi_{\theta}^{\prime}(X)$ for a certain continuous, linear $\operatorname{map} \phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$. In the case that $\mathbb{D}=\mathbb{R}^{k}$ and $\mathbb{E}=\mathbb{R}^{m}$, the $\operatorname{map} \phi_{\theta}^{\prime}$ is an ( $m \times k$ )-matrix. If the limit $X$ of the original sequence is normally $N_{k}(\mu, \Sigma)$-distributed, then $\phi_{\theta}^{\prime}(X)$ is $N_{m}\left(\phi_{\theta}^{\prime} \mu, \phi_{\theta}^{\prime} \Sigma\left(\phi_{\theta}^{\prime}\right)^{t}\right)$-distributed. In particular, the asymptotic normality is retained. In this section it is noted that the same conclusion is true in the infinite-dimensional situation.

By definition, a Borel measurable random element $X$ in a Banach space $\mathbb{D}$ is normally distributed (or Gaussian) if the real-valued random variable $d^{*} X$ is normally distributed for every element $d^{*}$ of the dual space (the collection of continuous, linear real maps on $\mathbb{D}$ ). From this definition it is immediate that $\phi_{\theta}^{\prime}(X)$ is normally distributed in $\mathbb{E}$ for every continuous, linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$, whenever $X$ is normally distributed in $\mathbb{D}$. It suffices to note that $e^{*} \circ \phi_{\theta}^{\prime}$ is an element of the dual space of $\mathbb{D}$ for every element $e^{*}$ of the dual space of $\mathbb{E}$.

Many applications concern stochastic processes with bounded sample paths. By definition, a stochastic process $\left\{X_{t}: t \in T\right\}$ is Gaussian if every one of its finite-dimensional marginals ( $X_{t_{1}}, \ldots, X_{t_{k}}$ ) is multivariately normally distributed. If the stochastic process is also defined as a Borel measurable map into $\ell^{\infty}(T)$, then the definition of Gaussianity of a Banach-valued random element given in the preceding paragraph may be applied as well. Thus, $X$ is Gaussian if $d^{*} X$ is normally distributed for every element $d^{*}$ of
the dual space of $\ell^{\infty}(T)$. It is not immediately clear that these two definitions are equivalent. The second definition appears to be more stringent, as the first definition requires that $d^{*} X$ is normally distributed for every linear combination $d^{*}=\sum \alpha_{i} \pi_{t_{i}}$ of coordinate projections, but not necessarily for every element of the dual space of $\ell^{\infty}(T)$. The following lemma shows that the two definitions are equivalent if $X$ is tight.
3.9.8 Lemma. Let $X$ be a tight, Borel measurable map into $\ell^{\infty}(T)$ such that the vector $\left(X_{t_{1}}, \ldots, X_{t_{k}}\right)$ is multivariately normally distributed for every finite set $t_{1}, \ldots, t_{k}$ in $T$. Then $\phi(X)$ is normally distributed for every continuous, linear map $\phi: \ell^{\infty}(T) \mapsto \mathbb{E}$ into a Banach space $\mathbb{E}$.

Proof. It suffices to consider the case that $\mathbb{E}$ is the real line. By Lemma 1.5.9 there exists a semimetric $\rho$ on $T$ that makes $T$ totally bounded and such that almost all sample paths $t \mapsto X_{t}$ are uniformly continuous. Every bounded, uniformly continuous function $z: T \mapsto \mathbb{R}$ has a unique extension $\bar{z}$ to a continuous function on the completion $\bar{T}$ of $T$. This completion is compact for (the extension of) $\rho$. By a minor modification of the Riesz representation theorem, ${ }^{\ddagger}$ there exists a signed Borel measure $\mu$ on the completion such that

$$
\phi(z)=\int_{\bar{T}} \bar{z}(t) d \mu(t)
$$

By discretization we can construct a sequence of maps of the form $\phi_{m}= \sum \alpha_{m i} \pi_{t_{m i}}$, with every $t_{m i} \in T$, that converges pointwise to $\phi$ on $\operatorname{UC}(T, \rho)$. In particular, $\phi_{m}(X) \rightarrow \phi(X)$ almost surely. Since $\phi_{m}(X)$ is normally distributed by assumption, so is $\phi(X)$.

It is clear from the preceding proof that in applications of the deltamethod to maps $\phi: \ell^{\infty}(T) \mapsto \mathbb{R}$, the resulting limit variable $\phi_{\theta}^{\prime}(X)$ can be written as $\int_{\bar{T}} \bar{X}(t) d \mu(t)$, whenever $X$ is tight. The preceding lemma shows that $\phi_{\theta}^{\prime}(X)$ is normally distributed. With the help of Fubini's theorem, its mean and variance can be computed as

$$
\int_{\bar{T}} \mathrm{E} \bar{X}(t) d \mu(t) ; \quad \int_{\bar{T}} \int_{\bar{T}} \mathrm{E} \bar{X}(s) \bar{X}(t) d \mu(s) d \mu(t)
$$

respectively. Often mean and variance can be computed more easily from the asymptotic linear expansion guaranteed by the second assertion of Theorem 3.9.4.

### 3.9.3 The Delta-Method for the Bootstrap

The various bootstrap processes discussed in Chapter 3.6 were shown to converge conditionally in distribution given the "original" observations.

[^14]In this case, application of the delta-method should lead to a statement concerning the conditional weak convergence of the transformed processes. Proper care of measurability issues requires a separate discussion.

Consider sequences of random elements $\mathbb{P}_{n}=\mathbb{P}_{n}\left(X_{n}\right)$ and $\hat{\mathbb{P}}_{n}= \hat{\mathbb{P}}_{n}\left(X_{n}, M_{n}\right)$ in a normed space $\mathbb{D}$ such that the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ converges unconditionally and the sequence $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)$ converges conditionally given $X_{n}$ in distribution to a tight random element $\mathbb{G}$. A precise formulation of the second is that

$$
\begin{array}{r}
\sup _{h \in \mathrm{BL}_{1}(\mathbb{D})}\left|\mathrm{E}_{M} h\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)-\mathrm{E} h(\mathbb{G})\right| \rightarrow 0,  \tag{3.9.9}\\
\mathrm{E}_{M} h\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)^{*}-\mathrm{E}_{M} h\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)_{*} \rightarrow 0,
\end{array}
$$

in outer probability or outer almost surely, with $h$ ranging over the bounded Lipschitz functions. Given a map $\phi$, we wish to show that

$$
\begin{array}{r}
\sup _{h \in \mathrm{BL}_{1}(\mathbb{E})}\left|\mathrm{E}_{M} h\left(\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right)\right)-\mathrm{E} h\left(\phi_{P}^{\prime}(\mathbb{G})\right)\right| \rightarrow 0,  \tag{3.9.10}\\
\left.\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right)\right)^{*}-\mathrm{E}_{M} h\left(\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right)\right)_{*} \rightarrow 0,
\end{array}
$$

in outer probability or outer almost surely.
For statistical purposes, consistency in probability appears to be sufficient. This is retained under just Hadamard differentiability at the single point $P$.
3.9.11 Theorem (Delta-method for bootstrap in probability). Let $\mathbb{D}$ and $\mathbb{E}$ be normed spaces. Let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ be Hadamard-differentiable at $P$ tangentially to a subspace $\mathbb{D}_{0}$. Let $\mathbb{P}_{n}$ and $\hat{\mathbb{P}}_{n}$ be maps as indicated previously with values in $\mathbb{D}_{\phi}$ such that $\sqrt{n}\left(\mathbb{P}_{n}-P\right) \rightsquigarrow \mathbb{G}$ and (3.9.9) holds in outer probability, where $\mathbb{G}$ is separable and takes its values in $\mathbb{D}_{0}$. Then (3.9.10) holds in outer probability.

Thus, the weak consistency of the bootstrap estimators considered in Chapter 3.6 carries over to any Hadamard-differentiable functional: the sequence of "conditional random laws" (given $X_{1}, X_{2}, \ldots$ ) of $\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\right. \left.\phi\left(\mathbb{P}_{n}\right)\right)$ is asymptotically consistent in probability for estimating the laws of the random elements $\sqrt{n}\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)$.

For almost-sure consistency, we need a stronger differentiability property of $\phi$. The next two results impose uniform Hadamard differentiability and Fréchet differentiability with a rate, respectively. First, suppose that

$$
\sqrt{n}\left(\phi\left(\mathbb{P}_{n}+n^{-1 / 2} h_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right) \rightarrow \phi_{P}^{\prime}(h)
$$

for almost every sequence $\mathbb{P}_{n}$ and every converging sequence $h_{n} \rightarrow h \in \mathbb{D}_{0}$. Then Theorem 3.9.5 yields

$$
\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right) \rightsquigarrow \phi_{P}^{\prime}(\mathbb{G}),
$$

given almost every sequence $\mathbb{P}_{n}$ for which $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right) \rightsquigarrow \mathbb{G}$. Thus, without further effort we have obtained an almost-sure version of the preceding theorem. However, the result implies at best that the first expression in (3.9.10) converges almost surely to zero, not necessarily outer almost surely. (In particular, it does not imply the in-outer-probability statement of the preceding theorem.) In a given application the measurability of the transformed bootstrap process could be argued directly. Alternatively, outer-almost-sure convergence in (3.9.10) can be obtained directly under a stronger type of differentiability. Assume that

$$
\begin{equation*}
\frac{\phi\left(P_{n}+t_{n} h_{n}\right)-\phi\left(P_{n}\right)}{t_{n}} \rightarrow \phi_{P}^{\prime}(h), \tag{3.9.12}
\end{equation*}
$$

for all sequences $t_{n} \downarrow 0, P_{n} \rightarrow P, h_{n} \rightarrow h \in \mathbb{D}_{0}$ such that $P_{n}$ and $P_{n}+t_{n} h_{n} \in \mathbb{D}_{\phi}$ for every $n$ and a continuous, linear map $\phi_{P}^{\prime}: \mathbb{D}_{0} \mapsto \mathbb{E}$.
3.9.13 Theorem (Delta-method for bootstrap almost surely). Let $\mathbb{D}$ and $\mathbb{E}$ be normed spaces. Let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ satisfy (3.9.12) for a given measurable subspace $\mathbb{D}_{0}$. Let $\mathbb{P}_{n}$ and $\hat{\mathbb{P}}_{n}$ be maps as indicated previously with values in $\mathbb{D}_{\phi}$ such that $\sqrt{n}\left(\mathbb{P}_{n}-P\right) \rightsquigarrow \mathbb{G},\left\|\mathbb{P}_{n}-P\right\| \rightarrow 0$ outer almost surely and (3.9.9) holds outer almost surely, where $\mathbb{G}$ is tight and takes its values in $\mathbb{D}_{0}$. Then (3.9.10) holds outer almost surely.

The uniform Hadamard differentiability needed for the preceding theorem is generally satisfied by functionals on finite-dimensional spaces, but can easily fail in infinite dimensions. An alternative is to use Fréchet differentiability. It suffices to consider Fréchet differentiability at a fixed point, but we need control over the order of the remainder term. Assume that

$$
\phi(P+h)-\phi(P)=\phi_{P}^{\prime}(h)+O(q(\|h\|)), \quad h \rightarrow 0
$$

for a continuous, linear map $\phi_{P}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ and a given monotone function $q$ with (at least) $q(t)=o(t)$. The extra control over the remainder term can be exploited if there is also additional information on the almost-sure behavior of $\left\|\mathbb{P}_{n}-P\right\|$. Assume that

$$
\begin{equation*}
\limsup _{n \rightarrow \infty} \frac{\sqrt{n}\left\|\mathbb{P}_{n}-P\right\|^{*}}{b_{n}} \leq 1 \quad \text { a.s. } \tag{3.9.14}
\end{equation*}
$$

for some sequence $b_{n} \rightarrow \infty$. For $\mathbb{P}_{n}$ equal to the empirical distribution function and $b_{n}=\sqrt{2 \log \log n}\left\|P(f-P f)^{2}\right\|_{\mathcal{F}}^{1 / 2}$, this follows from the law of the iterated logarithm, which asserts equality in the preceding display. This is well known to be valid for a Donsker class $\mathcal{F}$ with square-integrable envelope function. ${ }^{b}$ The following theorem requires that $b_{n} \rightarrow \infty$ sufficiently slowly that $\sqrt{n} q\left(c b_{n} / \sqrt{n}\right) \rightarrow 0$ for some $c>1$. For $b_{n} \sim \sqrt{\log \log n}$, this condition is satisfied already for $q(t)=t /(\log \log (1 / t))^{r}$ and $r>1 / 2$.

[^15]3.9.15 Theorem (Delta-method for bootstrap almost surely). Let $\mathbb{D}$ and $\mathbb{E}$ be normed spaces. Suppose $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ is Fréchet-differentiable at $P$ with rate function $q$. Let $\mathbb{P}_{n}$ and $\hat{\mathbb{P}}_{n}$ be maps as indicated previously with values in $\mathbb{D}_{\phi}$ such that $\sqrt{n}\left(\mathbb{P}_{n}-P\right) \rightsquigarrow \mathbb{G}$, and (3.9.9) holds outer almost surely, where $\mathbb{G}$ takes its values in a separable subspace $\mathbb{D}_{0}$. Furthermore let (3.9.14) hold for a sequence $b_{n}$ such that $b_{n}=o(\sqrt{n})$ and $\sqrt{n} q\left(c b_{n} / \sqrt{n}\right) \rightarrow$ 0 for some $c>1$. Then (3.9.10) holds outer almost surely.

Proofs. Without loss of generality assume, that the derivative $\phi_{P}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ is defined and continuous on the whole space. (Otherwise, replace $\mathbb{E}$ by its second dual $\mathbb{E}^{* *}$ and the derivative by an extension $\phi_{P}^{\prime}: \mathbb{D} \mapsto \mathbb{E}^{* *}$.) For every $h \in \mathrm{BL}_{1}(\mathbb{E})$, the function $h \circ \phi_{P}^{\prime}$ is contained in $\mathrm{BL}_{\left\|\phi_{P}^{\prime}\right\|}(\mathbb{D})$. Thus (3.9.9) implies

$$
\sup _{h \in \mathrm{BL}_{1}(\mathbb{E})}\left|\mathrm{E}_{M} h\left(\phi_{P}^{\prime}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)\right)-\mathrm{E} h\left(\phi_{P}^{\prime}(\mathbb{G})\right)\right| \rightarrow 0
$$

in outer probability or outer almost surely, corresponding to which of the two assumptions is made in (3.9.9). Next

$$
\sup _{h \in \mathrm{BL}_{1}(\mathbb{E})}\left|\mathrm{E}_{M} h\left(\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right)\right)-\mathrm{E}_{M} h\left(\phi_{P}^{\prime}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)\right)\right|
$$

$$
\begin{equation*}
\leq \varepsilon+2 \mathbb{P}_{M}\left(\left\|\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi\left(\mathbb{P}_{n}\right)\right)-\phi_{P}^{\prime}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)\right\|^{*}>\varepsilon\right) \tag{3.9.16}
\end{equation*}
$$

The three theorems are proved once it has been shown that the conditional probability on the right converges to zero in outer probability (Theorem 3.9.11) or outer almost surely (Theorem 3.9.13 and 3.9.15).

Both sequences $\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ and $\sqrt{n}\left(\hat{\mathbb{P}}_{n}-P\right)$ converge (unconditionally) in distribution to separable random elements that concentrate on the space $\mathbb{D}_{0}$. By Theorem 3.9.4,

$$
\begin{aligned}
& \sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\phi(P)\right)=\phi_{P}^{\prime}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-P\right)\right)+o_{P}^{*}(1) \\
& \sqrt{n}\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)=\phi_{P}^{\prime}\left(\sqrt{n}\left(\mathbb{P}_{n}-P\right)\right)+o_{P}^{*}(1)
\end{aligned}
$$

Subtract these equations to conclude that the sequence $\sqrt{n}\left(\phi\left(\hat{\mathbb{P}}_{n}\right)-\right. \left.\phi\left(\mathbb{P}_{n}\right)\right)-\phi_{P}^{\prime}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)$ converges (unconditionally) to zero in outer probability. Thus, the conditional probability on the right in (3.9.16) converges to zero in outer mean. This concludes the proof of the first theorem.

For the proof of the second theorem, fix $\varepsilon>0$ and choose a compact set $K \subset \mathbb{D}_{0}$ such that $\mathrm{P}(\mathbb{G} \notin K)<\varepsilon$. By the uniform Hadamard differentiability of $\phi$, there exist $\delta, \eta>0$ such that for every $P^{\prime} \in \mathbb{D}_{\phi},\left\|P^{\prime}-P\right\|<\eta$, $t<\eta, P^{\prime}+t h \in \mathbb{D}_{\phi}$, and $h \in K^{\delta}$ :

$$
\left\|\frac{\phi\left(P^{\prime}+t h\right)-\phi\left(P^{\prime}\right)}{t}-\phi_{P}^{\prime}(h)\right\|<\varepsilon
$$

Consequently, for $n \geq 1 / \eta^{2}$, the right side of (3.9.16) is bounded by

$$
\varepsilon+2 \mathrm{E}_{M} 1_{\mathbb{D}-K^{\delta}}\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)^{*}+\left\{\left\|\mathbb{P}_{n}-P\right\| \geq \eta\right\}^{*}
$$

The last term converges to zero almost surely by assumption. The function $h(z)=\delta^{-1}(d(z, K) \wedge \delta)$ is bounded and Lipschitz and satisfies $1_{\mathbb{D}-K^{\delta}} \leq h \leq 1_{\mathbb{D}-K}$. Hence the conditional expectation in the middle term is bounded by

$$
\mathrm{E}_{M} h\left(\sqrt{n}\left(\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right)\right)^{*} \xrightarrow{\text { as }} \mathrm{E} h(\mathbb{G}) \leq \mathrm{P}(\mathbb{G} \notin K)<\varepsilon .
$$

Thus, the conditional probability in the right side of (3.9.16) converges to zero almost surely. This concludes the proof of the second theorem.

If $\operatorname{rem}(h)=\phi(P+h)-\phi(P)-\phi_{P}^{\prime}(h)$, then the norm in the right side of (3.9.16) can be written $\sqrt{n}\left\|\operatorname{rem}\left(\hat{\mathbb{P}}_{n}-P\right)-\operatorname{rem}\left(\mathbb{P}_{n}-P\right)\right\|$ and can be bounded above by the triangle inequality. By assumption, there exist $K$, $\eta>0$ such that $\operatorname{rem}(h) \leq K q(\|h\|)$ for every $\|h\| \leq \eta$. Thus

$$
\begin{aligned}
& \mathrm{P}_{M}\left(\sqrt{n}\left\|\mathrm{rem}\left(\mathbb{P}_{n}-P\right)\right\|>\varepsilon\right)^{*} \\
& \quad \leq\left\{\left\|\mathbb{P}_{n}-P\right\|^{*}>\eta\right\}+\left\{\sqrt{n} q\left(\left\|\mathbb{P}_{n}-P\right\|\right)>\frac{\varepsilon}{K}\right\}^{*}
\end{aligned}
$$

This converges to zero almost surely by assumption. Next, for $\eta_{n} / \sqrt{n}+ \eta / 2<\eta$, the triangle inequality and monotonicity of $q$ yield

$$
\begin{aligned}
& \mathrm{P}_{M}\left(\sqrt{n}\left\|\mathrm{rem}\left(\hat{\mathbb{P}}_{n}-P\right)\right\|^{*}>\varepsilon\right) \leq \mathrm{P}_{M}\left(\sqrt{n}\left\|\hat{\mathbb{P}}_{n}-\mathbb{P}_{n}\right\|^{*}>\eta_{n}\right) \\
& \quad+\left\{\left\|\mathbb{P}_{n}-P\right\|^{*}>\frac{\eta}{2}\right\}+\left\{\sqrt{n} q\left(\eta_{n} / \sqrt{n}+\left\|\mathbb{P}_{n}-P\right\|\right)>\frac{\varepsilon}{K}\right\}^{*}
\end{aligned}
$$

The first two terms on the right converge to zero almost surely for every $\eta_{n} \rightarrow \infty$ and $\eta>0$. The third term converges to zero for $\eta_{n}=o\left(b_{n}\right)$.

### 3.9.4 Examples of the Delta-Method

Throughout this section, $D[a, b]$ is the Banach space of all cadlag functions $z:[a, b] \mapsto \mathbb{R}$ on an interval $[a, b] \subset \overline{\mathbb{R}}$ equipped with the uniform norm. The notation $\int|d A|$ is used for the total variation of a function $A$, and $\mathrm{BV}_{M}[a, b]$ is the set of all cadlag functions of total variation bounded by M. Product spaces, such as $D[a, b] \times D[a, b]$, are always equipped with a product norm. Given an arbitrary set $\mathcal{X}$ and Banach space $\mathcal{Y}$, the Banach space $\ell^{\infty}(\mathcal{X}, \mathcal{Y})$ is the set of all maps $z: \mathcal{X} \mapsto \mathcal{Y}$ that are uniformly norm-bounded equipped with the norm $\|z\|=\sup _{x}\|z(x)\| \mathcal{Y}$.

### 3.9.4.1 The Wilcoxon Statistic

Given a cadlag function $A$ and a function of bounded variation $B$ on an interval $[a, b] \subset \overline{\mathbb{R}}$, define

$$
\phi(A, B)=\int_{(a, b]} A d B \quad \text { and } \quad \psi(A, B)(t)=\int_{(a, t]} A d B
$$

These maps are Hadamard-differentiable if the domain is restricted to pairs ( $A, B$ ) such that $B$ is of total variation bounded by some fixed constant.
3.9.17 Lemma. For each fixed $M$, the maps $\phi: D[a, b] \times \mathrm{BV}_{M}[a, b] \mapsto \mathbb{R}$ and $\psi: D[a, b] \times \mathrm{BV}_{M}[a, b] \mapsto D[a, b]$ are Hadamard-differentiable at each $(A, B) \in D_{\phi}$ such that $\int|d A|<\infty$. The derivatives are given by
$\phi_{A, B}^{\prime}(\alpha, \beta)=\int A d \beta+\int \alpha d B ; \quad \psi_{A, B}^{\prime}(\alpha, \beta)(t)=\int_{(a, t]} A d \beta+\int_{(a, t]} \alpha d B$, where $\int A d \beta$ is defined via integration by parts ${ }^{\sharp}$ if $\beta$ is not of bounded variation.

Proof. For $\alpha_{t} \rightarrow \alpha$ and $\beta_{t} \rightarrow \beta$, define $A_{t}=A+t \alpha_{t}$ and $B_{t}=B+t \beta_{t}$. By convention, we consider only perturbations such that ( $A_{t}, B_{t}$ ) is contained in the given domain. In particular, the variation of $B_{t}$ is bounded by $M$. Write
$\frac{\int A_{t} d B_{t}-\int A d B}{t}-\phi_{A, B}^{\prime}\left(\alpha_{t}, \beta_{t}\right)=\int \alpha d\left(B_{t}-B\right)+\int\left(\alpha_{t}-\alpha\right) d\left(B_{t}-B\right)$.
Since $A$ is of bounded variation, the derivative map as stated is continuous (with respect to the uniform norm). It suffices to show that the expression in the display converges to zero. The second term on the right is bounded in absolute value by $\left\|\alpha_{t}-\alpha\right\|_{\infty} 2 M$ and hence converges to zero. Since $\alpha$ is cadlag on $[a, b]$, there exists a partition $a=t_{0}<t_{1}<\cdots<t_{m}=b$ such that $\alpha$ varies less than $\varepsilon$ on each interval $\left[t_{i-1}, t_{i}\right)$. Let $\tilde{\alpha}$ be the discretization that is constant and equal to $\alpha\left(t_{i-1}\right)$ on $\left[t_{i-1}, t_{i}\right)$. Then

$$
\begin{gathered}
\left|\int \alpha d\left(B_{t}-B\right)\right| \leq\|\alpha-\tilde{\alpha}\|_{\infty} 2 M+\sum_{i=1}^{m}\left|\alpha\left(t_{i-1}\right)\right|\left|\left(B_{t}-B\right)\left[t_{i-1}, t_{i}\right)\right| \\
+|\alpha(b)|\left|\left(B_{t}-B\right)\{b\}\right|
\end{gathered}
$$

The first term on the right can be made arbitrarily small by the choice of $\varepsilon$. The second term is bounded by $(2 m+1)\left\|B_{t}-B\right\|_{\infty}\|\alpha\|_{\infty}$ and hence converges to zero for every fixed partition.

The proof for $\psi$ is basically the same as that for $\phi$.
The preceding lemma has many corollaries. Here we discuss two simple statistical consequences.
3.9.18 Example (Wilcoxon statistic). Let $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ be independent samples from distribution functions $F$ and $G$ on the real line, respectively. If $\mathbb{F}_{m}$ and $\mathbb{G}_{n}$ are the empirical distribution functions of the two samples, then

$$
\phi\left(\mathbb{F}_{m}, \mathbb{G}_{n}\right)=\int \mathbb{F}_{m} d \mathbb{G}_{n}
$$

[^16]is the Mann-Whitney form of the Wilcoxon statistic. It is an estimator of $\phi(F, G)=\int F d G=\mathrm{P}(X \leq Y)$. As a consequence of the differentiability of $\phi$, if $m /(m+n) \rightarrow \lambda$, then
$$
\begin{aligned}
\sqrt{\frac{m n}{m+n}}\left(\int \mathbb{F}_{m} d \mathbb{G}_{n}-\int F d G\right) & \rightsquigarrow \phi_{F, G}^{\prime}\left(\sqrt{1-\lambda} \mathbb{G}_{F}, \sqrt{\lambda} \mathbb{G}_{G}\right) \\
& =\sqrt{\lambda} \int F d \mathbb{G}_{G}+\sqrt{1-\lambda} \int \mathbb{G}_{F} d G
\end{aligned}
$$
where $\mathbb{G}_{F}$ and $\mathbb{G}_{G}$ are independent tight, $F$ - and $G$-Brownian bridge processes. The limit variable is zero-mean normally distributed with variance $\lambda \operatorname{var} F(Y)+(1-\lambda) \operatorname{var} G(X)$. An elementary way to see this is to use the stronger assertion of Theorem 3.9.4, which gives the weak representation
$$
\begin{aligned}
& \sqrt{\frac{m n}{m+n}}\left(\int \mathbb{F}_{m} d \mathbb{G}_{n}-\int F d G\right) \\
& \quad=\sqrt{\lambda} \int F d \mathbb{G}_{n, G}+\sqrt{1-\lambda} \int \mathbb{G}_{m, F} d G+o_{P}(1)
\end{aligned}
$$

The variable on the right is asymptotically normal by the central limit theorem and Slutsky's lemma. (Also see Problems 3.9.2 and 3.9.3.)
3.9.19 Example (Nelson-Aalen). The Nelson-Aalen estimator of a cumulative hazard function based on censored data is a Hadamarddifferentiable map of the empirical distribution function of the observations. Let $X_{1}, \ldots, X_{n}$ be i.i.d. "failure times" distributed according to the distribution function $F$ and let $C_{1}, \ldots, C_{n}$ be i.i.d. "censoring times" distributed according to the distribution function $G$. Failure times and censoring times are assumed independent. Observed are the pairs $\left(Z_{1}, \Delta_{1}\right), \ldots,\left(Z_{n}, \Delta_{n}\right)$, where $Z_{i}=X_{i} \wedge C_{i}$, and $\Delta_{i}=1\left\{X_{i} \leq C_{i}\right\}$ indicates whether a failure time is censored or not. By definition, the cumulative hazard function of the failure times is

$$
\Lambda(t)=\int_{[0, t]} \frac{1}{\bar{F}} d F=\int_{[0, t]} \frac{1}{\bar{H}} d H^{u c}
$$

where $\bar{F}(t)=\mathrm{P}(X \geq t)$ and $\bar{H}(t)=\mathrm{P}(Z \geq t)$ are (left-continuous) survival distributions, and $H^{u c}(t)=\mathrm{P}(Z \leq t, \Delta=1)$ is the subdistribution function of the uncensored observations. The Nelson-Aalen estimator is given by

$$
\Lambda_{n}(t)=\int_{[0, t]} \frac{1}{\overline{\bar{H}}_{n}} d \mathbb{H}_{n}^{u c}
$$

where

$$
\mathbb{H}_{n}^{u c}(t)=\frac{1}{n} \sum_{i=1}^{n} \Delta_{i} 1\left\{Z_{i} \leq t\right\} \quad \text { and } \quad \overline{\mathbb{H}}_{n}(t)=\frac{1}{n} \sum_{i=1}^{n} 1\left\{Z_{i} \geq t\right\}
$$

are the empirical subdistribution functions of the uncensored failure times and survival function of the observation times, respectively. The NelsonAalen estimator depends on the pair $\left(\mathbb{H}_{n}^{u c}, \overline{\mathbb{H}}_{n}\right)$ through the two maps

$$
(A, B) \mapsto\left(A, \frac{1}{B}\right) \mapsto \int_{[0, t]} \frac{1}{B} d A
$$

The composition map is Hadamard-differentiable on a domain of the type $\left\{(A, B): \int|d A| \leq M, B \geq \varepsilon\right\}$ for given $M$ and $\varepsilon>0$, at every point $(A, B)$ such that $1 / B$ is of bounded variation. If $t$ is restricted to an interval $[0, \tau]$ such that $H(\tau)<1$, then the pair $\left(\mathbb{H}_{n}^{u c}, \overline{\mathbb{H}}_{n}\right)$ is contained in this domain with probability tending to 1 for $M \geq 1$ and sufficiently small $\varepsilon$. The derivative map is given by $(\alpha, \beta) \mapsto \int(1 / B) d \alpha-\int\left(\beta / B^{2}\right) d A$.

The pair $\left(\mathbb{H}_{n}^{u c}, \mathbb{H}_{n}\right)$ can be identified with the empirical distribution of the observations indexed by the functions $\delta 1\{z \leq t\}$ and $1\{z>t\}$, when $t$ ranges over $\mathbb{R}$. Any of the main empirical central limit theorems yields

$$
\sqrt{n}\left(\mathbb{H}_{n}^{u c}-H^{u c}, \overline{\mathbb{H}}_{n}-\bar{H}\right) \rightsquigarrow\left(\mathbb{G}^{u c}, \overline{\mathbb{G}}\right), \quad \text { in }(D[0, \tau])^{2},
$$

where $\left(\mathbb{G}^{u c}, \overline{\mathbb{G}}\right)$ is a tight, zero-mean Gaussian process with covariance structure

$$
\begin{aligned}
\mathrm{EG}^{u c}(s) \mathbb{G}^{u c}(t) & =H^{u c}(s \wedge t)-H^{u c}(s) H^{u c}(t) \\
\mathrm{E} \overline{\mathbb{G}}(s) \overline{\mathbb{G}}(t) & =\bar{H}(s \vee t)-\bar{H}(s) \bar{H}(t) \\
\mathrm{EG}^{u c}(s) \overline{\mathbb{G}}(t) & =\left(H^{u c}(s)-H^{u c}(t-)\right) 1\{t \leq s\}-H^{u c}(s) \bar{H}(t)
\end{aligned}
$$

By the delta-method we conclude that

$$
\sqrt{n}\left(\Lambda_{n}-\Lambda\right) \rightsquigarrow \int_{[0, t]} \frac{1}{\bar{H}} d \mathbb{G}^{u c}-\int_{[0, t]} \frac{\overline{\mathbb{G}}}{\bar{H}^{2}} d H^{u c}
$$

where the first term on the right is to be understood via partial integration. The covariance function of the Gaussian limit may be evaluated by martingale calculus. ${ }^{\dagger}$

The process $\mathbb{M}^{u c}(t)=\mathbb{G}^{u c}(t)-\int_{[0, t]} \overline{\mathbb{G}} d \Lambda$ is a zero-mean Gaussian martingale with covariance function

$$
\operatorname{EM}^{u c}(s) \mathbb{M}^{u c}(t)=\int_{[0, s \wedge t]} \bar{H}(1-\Delta \Lambda) d \Lambda
$$

The limit variable can be expressed as the stochastic integral $\int_{[0, t]} 1 / \bar{H} d \mathbb{M}^{u c}$ and therefore is a martingale. It is distributed as $\mathbb{Z}(C)$ for a standard Brownian motion $\mathbb{Z}$ and the function $C$ given by

$$
C(t)=\int_{[0, t]} \frac{(1-\Delta \Lambda)}{\bar{H}} d \Lambda
$$

The final conclusion is that the sequence $\sqrt{n}\left(\Lambda_{n}-\Lambda\right)$ converges in distribution to $\mathbb{Z}(C)$ in $D[0, \tau]$ for every $\tau$ such that $H(\tau)<1$.

[^17]
### 3.9.4.2 The Inverse Map

For a nondecreasing function $A \in D[a, b]$ and fixed $p \in \mathbb{R}$, let $\phi(A) \in[a, b]$ be an arbitrary point in $[a, b]$ such that

$$
A(\phi(A)-) \leq p \leq A(\phi(A)) .
$$

The natural domain $\mathbb{D}_{\phi}$ of the resulting $\operatorname{map} \phi$ is the set of all nondecreasing $A$ such that there exists a solution to the pair of inequalities. If there exists more than one solution, then the precise choice of $\phi(A)$ is irrelevant. For instance, $\phi(A)$ may be taken equal to $\inf \{t: A(t) \geq p\}$.
3.9.20 Lemma. Let $A \in \mathbb{D}_{\phi}$ be differentiable at a point $\xi_{p} \in(a, b)$ such that $A\left(\xi_{p}\right)=p$, with strictly positive derivative. Then $\phi: \mathbb{D}_{\phi} \subset D[a, b] \mapsto \mathbb{R}$ is Hadamard-differentiable at $A$ tangentially to the set of functions $\alpha \in D[a, b]$ that are continuous at $\xi_{p}$. The derivative is given by $\phi_{A}^{\prime}(\alpha)=-\alpha\left(\xi_{p}\right) / A^{\prime}\left(\xi_{p}\right)$.

Proof. Let $\alpha_{t} \rightarrow \alpha$ uniformly on $[a, b]$ for a function $\alpha$ that is continuous at $\xi_{p}$. Write $\xi_{p t}$ for $\phi\left(A+t \alpha_{t}\right)$. By the definition of $\phi$, we have

$$
\left(A+t \alpha_{t}\right)\left(\xi_{p t}-\varepsilon_{t}\right) \leq p \leq\left(A+t \alpha_{t}\right)\left(\xi_{p t}\right),
$$

for every $\varepsilon_{t}>0$. Choose $\varepsilon_{t}$ positive and such that $\varepsilon_{t}=o(t)$. Since $\alpha_{t}$ converges uniformly to a bounded function, the sequence $\alpha_{t}$ is uniformly bounded. Conclude that $A\left(\xi_{p t}-\varepsilon_{t}\right)+O(t) \leq p \leq A\left(\xi_{p t}\right)+O(t)$. By assumption, the function $A$ is monotone and bounded away from $p$ outside any interval $\left(\xi_{p}-\varepsilon, \xi_{p}+\varepsilon\right)$ around $\xi_{p}$. To satisfy the preceding inequalities, the numbers $\xi_{p t}$ must be to the right of $\xi_{p}-\varepsilon$ eventually, and the numbers $\xi_{p t}-\varepsilon_{t}$ must be to the left of $\xi_{p}+\varepsilon$ eventually. In other words, $\xi_{p t} \rightarrow \xi_{p}$.

By the uniform convergence of $\alpha_{t}$ and the continuity of the limit, $\alpha_{t}\left(\xi_{p t}-\varepsilon_{t}\right) \rightarrow \alpha\left(\xi_{p}\right)$ for every $\varepsilon_{t} \rightarrow 0$. Using this and Taylor's formula on the preceding display yields

$$
\begin{aligned}
& p+\left(\xi_{p t}-\xi_{p}\right) A^{\prime}\left(\xi_{p}\right)-o\left(\xi_{p t}-\xi_{p}\right)+O\left(\varepsilon_{t}\right)+t \alpha\left(\xi_{p}\right)-o(t) \\
& \quad \leq p \leq p+\left(\xi_{p t}-\xi_{p}\right) A^{\prime}\left(\xi_{p}\right)+o\left(\xi_{p t}-\xi_{p}\right)+O\left(\varepsilon_{t}\right)+t \alpha\left(\xi_{p}\right)+o(t) .
\end{aligned}
$$

Conclude first that $\xi_{p t}-\xi_{p}=O(t)$. Next, use this to replace the $o\left(\xi_{p t}-\xi_{p}\right)$ in the display by $o(t)$-terms and conclude that $\left(\xi_{p t}-\xi_{p}\right) / t \rightarrow-\left(\alpha / A^{\prime}\right)\left(\xi_{p}\right)$.
3.9.21 Example (Empirical quantiles). Fix $0<p<1$ and consider the map that assigns to each cumulative distribution function its $p$ th quantile $F^{-1}(p)=\inf \{x: F(x) \geq p\}$. This map is Hadamard-differentiable at every cumulative distribution $F$ that is differentiable at $F^{-1}(p)$ with strictly positive derivative $f\left(F^{-1}(p)\right)$, tangentially to the set of functions that are continuous at $F^{-1}(p)$.

If $\mathbb{F}_{n}$ is the empirical distribution function of an i.i.d. sample of size $n$ from $F$, then the sequence $\sqrt{n}\left(\mathbb{F}_{n}-F\right)$ converges in $D(\overline{\mathbb{R}})$ to the process
$\mathbb{G} \circ F$, where $\mathbb{G}$ is a standard Brownian bridge. Since $F$ is continuous at $F^{-1}(p)$, almost all the sample paths of this process are continuous at the point $F^{-1}(p)$. Thus, the delta-method yields

$$
\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right) \rightsquigarrow \phi_{F}^{\prime}(\mathbb{G} \circ F)=-\frac{\mathbb{G}(p)}{f\left(F^{-1}(p)\right)} .
$$

This variable on the right is zero-mean normally distributed with its variance given by $p(1-p) / f^{2}\left(F^{-1}(p)\right)$.
3.9.22 Example. While the delta-method yields an elegant proof of the asymptotic normality of the empirical quantile function, this result can easily be obtained directly. The real attraction of the delta-method is that it separates the analysis and the probability and can be applied without much work in a variety of situations. In the preceding derivation, the empirical distribution can be replaced by any estimator $\tilde{F}_{n}$ such that the sequence $\sqrt{n}\left(\tilde{F}_{n}-F\right)$ converges weakly in $D[a, b]$ for an interval $[a, b]$ that contains $F^{-1}(p)$ as an interior point. The estimator $\tilde{F}_{n}$ need not be based on an i.i.d. sample, and $F$ may be an arbitrary centering function.

Two concrete applications are the inverse of the Nelson-Aalen estimator and the quantiles of the Kaplan-Meier estimator (see Examples 3.9.19 and 3.9.31).

Next consider the inverse function $\phi(F)=F^{-1}$ as a map from the set of distribution functions into the space $\ell^{\infty}(p, q)$ for given $0<p<q<$ 1. For definiteness, let $F^{-1}$ denote the left-continuous inverse $F^{-1}(p)= \inf \{t: F(t) \geq p\}$. Given an interval $[a, b] \subset \mathbb{R}$ let $\mathbb{D}_{1}$ be the set of all restrictions of distribution functions on $\mathbb{R}$ to $[a, b]$ and let $\mathbb{D}_{2}$ be the subset of $\mathbb{D}_{1}$ of distribution functions of measures that concentrate on $(a, b]$.

### 3.9.23 Lemma.

(i) Let $0<p<q<1$, and let $F$ be continuously differentiable on the interval $[a, b]=\left[F^{-1}(p)-\varepsilon, F^{-1}(q)+\varepsilon\right]$ for some $\varepsilon>0$, with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{1} \subset D[a, b] \mapsto \ell^{\infty}[p, q]$ is Hadamard-differentiable at $F$ tangentially to $C[a, b]$.
(ii) Let $F$ have compact support $[a, b]$ and be continuously differentiable on its support with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{2} \subset D[a, b] \mapsto \ell^{\infty}(0,1)$ is Hadamard-differentiable at $F$ tangentially to $C[a, b]$.
In both cases the derivative is the map $\alpha \mapsto-(\alpha / f) \circ F^{-1}$.
Proof. The proof follows the same pattern as the proof for the preceding lemma, but with care to keep the needed uniformity in $p$. We give the proof of (ii) only.


[^0]:    ${ }^{\ddagger}$ The notation $\lesssim$ means "is bounded above up to a universal constant". This condition is often satisfied but is unnecessarily restrictive. Theorem 3.2.5 remains true even if the numbers $d^{2}\left(\theta, \theta_{0}\right)$ do not arise from a distance but simply define an arbitrary function from $\Theta$ to the nonnegative reals.

[^1]:    ${ }^{\mathrm{b}}$ It suffices that a two-term Taylor expansion $P m_{\theta_{0}+h}=P m_{\theta_{0}}+\frac{1}{2} h^{\prime} V h+o\left(\|h\|^{2}\right)$ is valid.
    \# Condition (3.2.11) may be replaced by marginal convergence of the processes $h \mapsto r_{n}^{2} \mathbb{P}_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)$ to a process $h \mapsto G(h)$.

[^2]:    ${ }^{\dagger}$ It suffices that a two-term Taylor expansion is valid at $\theta_{0}$.

[^3]:    ${ }^{\ddagger}$ The presence of $r_{n}^{-1}$ in the remainder term of the stochastic differentiability condition of the theorem ensures that one need not worry about sequences $\tilde{\theta}_{n}$ that converge to $\theta_{0}$ too fast.
    ${ }^{b}$ It suffices that a two-term Taylor expansion is valid at $\theta_{0}$.

[^4]:    \# If any functions $\dot{m}_{n, \theta_{0}}$ work, then so do the functions $\sqrt{n}\left(m_{\theta_{0}+e_{i} n-1 / 2}-m_{\theta_{0}}\right)$.

[^5]:    ${ }^{\dagger}$ Cf., for instance, Lehmann (1983).

[^6]:    ${ }^{\ddagger}$ See, for instance, Rudin (1973), pages 99-103.

[^7]:    ${ }^{b}$ In applications $\delta_{n}$ is typically a multiple of $d\left(\theta_{n}, \theta_{0}\right)$ and $\eta=\infty$.

[^8]:    ${ }^{\#}$ In this chapter the notation $\tilde{J}$ is used for entropy integrals that are not standardized relative to an envelope function. Thus $\tilde{J}$ differs from $J$ in Chapter 2.2.

[^9]:    ${ }^{\dagger}$ Given this set-up, Problem 3.6.1 gives a way of defining bootstrap values $\hat{X}_{i}$ on $\mathcal{X}^{\infty} \times \mathcal{Z}$ such that the identities for $\hat{\mathbb{G}}_{n}$ and $\hat{\mathbb{G}}_{n, k}$ are valid.

[^10]:    ‡ Cf. Dudley (1993).

[^11]:    ${ }^{\mathrm{b}}$ Since $H_{0}$ is composite, it is perhaps more proper to call the sequence of tests asymptotically of level $\alpha$ if $\sup _{P=Q} \mathrm{P}\left(D_{m, n}>\tilde{c}_{m, n}\right)$ is asymptotically bounded by $\alpha$. We do not consider this stronger concept. In view of the results of Chapter 2.8 on uniform in $P$ Donsker classes, the present test is asymptotically of level $\alpha$ also in this stronger sense for many Donsker classes $\mathcal{F}$.

[^12]:    \# See Beran and Millar (1986), Proposition 2, page 442.

[^13]:    ${ }^{\dagger}$ A topological vector space is a vector space for which addition and scalar multiplication are continuous operations: if $x_{n} \rightarrow x, y_{n} \rightarrow y$, and $c_{n} \rightarrow c$, then $x_{n}+y_{n} \rightarrow x+y$ and $c_{n} x_{n} \rightarrow c x$. Every normed space is a topological vector space; another example is $\mathbb{R}^{\infty}$ with product topology.

[^14]:    ${ }^{\ddagger}$ E.g., Rudin (1966).

[^15]:    ${ }^{\text {b }}$ Cf. Dudley and Philipp (1983), Theorem 1.3, together with Kuelbs (1976); see also Ledoux and Talagrand (1991).

[^16]:    ${ }^{\sharp}$ Thus $\int A d \beta=(A \beta)(b)-(A \beta)(a)-\int(\beta-) d A$.

[^17]:    ${ }^{\dagger}$ See, for instance, Revuz and Yor (1994), Chapter 4, Section 2, page 138.

