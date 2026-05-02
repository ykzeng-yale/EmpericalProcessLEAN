relative efficiency of the two sequences of tests is 1 . Does it make a difference whether normal or $t$-critical values are used?
3. Let $X_{1}, \ldots, X_{n}$ be a random sample from a density $f(x-\theta)$ where $f$ is symmetric about zero. Calculate the relative efficiency of the $t$-test and the test that rejects for large values of $\sum \sum_{i<j} 1\left\{X_{i}+X_{j}>0\right\}$ for $f$ equal to the logistic, normal, Laplace, and uniform shapes.
4. Calculate the relative efficiency of the van der Waerden test with respect to the $t$-test in the two-sample problem.
5. Calculate the relative efficiency of the tests based on Kendall's $\tau$ and the sample correlation coefficient to test independence for bivariate normal pairs of observations.
6. Suppose $\phi: \mathcal{F} \mapsto \mathbb{R}$ and $\psi: \mathcal{F} \mapsto \mathbb{R}^{k}$ are arbitrary maps on an arbitrary set $\mathcal{F}$ and we wish to find the minimum value of $\phi$ over the set $\{f \in \mathcal{F}: \psi(f)=0\}$. If the map $f \mapsto \phi(f)+a^{T} \psi(f)$ attains its minimum over $\mathcal{F}$ at $f_{a}$, for each fixed $a$ in an arbitrary set $A$, and there exists $a_{0} \in A$ such that $\psi\left(f_{a_{0}}\right)=0$, then the desired minimum value is $\phi\left(f_{a_{0}}\right)$. This is a rather trivial use of Lagrange multipliers, but it is helpful to solve the next problems. $\left(\phi\left(f_{a_{0}}\right)=\phi\left(f_{a_{0}}\right)+a_{0}^{T} \psi\left(f_{a_{0}}\right)\right.$ is the minimum of $\phi(f)+a_{0}^{T} \psi(f)$ over $\mathcal{F}$ and hence smaller than the minimum of $\phi(f)+a_{0}^{T} \psi(f)$ over $\{f \in \mathcal{F}: \psi(f)=0\}$.)
7. Show that $4 f(0)^{2} \int y^{2} f(y) d y \geq 1 / 3$ for every probability density $f$ that has its mode at 0 . (The minimum is equal to the minimum of $4 \int y^{2} f(y) d y$ over all probability densities $f$ that are bounded by 1 .)
8. Show that $12\left(\int f^{2}(y) d y\right)^{2} \int y^{2} f(y) d y \geq 108 / 125$ for every probability density $f$ with mean zero. (The minimum is equal to 12 times the minimum of the square of $\phi(f)=\int f^{2}(y) d y$ over all probability densities with mean 0 and variance 1 .)
9. Study the asymptotic power function of the sign test if the observations are a sample from a distribution that has a positive mass at its median. Is it good or bad to have a nonsmooth distribution?
10. Calculate the Hellinger and total variation distance between two uniform $U[0, \theta]$ measures.
11. Calculate the Hellinger and total variation distance between two normal $N\left(\mu, \sigma^{2}\right)$ measures.
12. Let $X_{1}, \ldots, X_{n}$ be a sample from the uniform distribution on $[-\theta, \theta]$.
(i) Calculate the asymptotic power functions of the tests that reject $H_{0}: \theta=\theta_{0}$ for large values of $X_{(n)}, X_{(n)} \vee\left(-X_{(1)}\right)$ and $X_{(n)}-X_{(1)}$.
(ii) Calculate the asymptotic relative efficiencies of these tests.
13. If two sequences of test statistics satisfied (14.4) for every $\theta_{n} \downarrow 0$, but with norming rate $n^{\alpha}$ instead of $\sqrt{n}$, how would Theorem 14.19 have to be modified to find the Pitman relative efficiency?

## 15

## Efficiency of Tests

> It is shown that, given converging experiments, every limiting power function is the power function of a test in the limit experiment. Thus, uniformly most powerful tests in the limit experiment give absolute upper bounds for the power of a sequence of tests. In normal experiments such uniformly most powerful tests exist for linear hypotheses of codimension one. The one-sample location problem and the two-sample problem are discussed in detail, and appropriately designed (signed) rank tests are shown to be asymptotically optimal.

### 15.1 Asymptotic Representation Theorem

A randomized test (or test function) $\phi$ in an experiment ( $\mathcal{X}, \mathcal{A}, P_{h}: h \in H$ ) is a measurable map $\phi: \mathcal{X} \mapsto[0,1]$ on the sample space. The interpretation is that if $x$ is observed, then a null hypothesis is rejected with probability $\phi(x)$. The power function of a test $\phi$ is the function

$$
h \mapsto \pi(h)=\mathrm{E}_{h} \phi(X) .
$$

This gives the probabilities that the null hypothesis is rejected. A test is of level $\alpha$ for testing a null hypothesis $H_{0}$ if its size $\sup \left\{\pi(h): h \in H_{0}\right\}$ does not exceed $\alpha$. The quality of a test can be judged from its power function, and classical testing theory is aimed at finding, among the tests of level $\alpha$, a test with high power at every alternative.

The asymptotic quality of a sequence of tests may be judged from the limit of the sequence of local power functions. If the tests are defined in experiments that converge to a limit experiment, then a pointwise limit of power functions is necessarily a power function in the limit experiment. This follows from the following theorem, which specializes the asymptotic representation theorem, Theorem 9.3, to the testing problem. Applied to the special case of the local experiments $\mathcal{E}_{n}=\left(P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right)$ of a differentiable parametric model as considered in Chapter 7, which converge to the Gaussian experiment $\left(N\left(h, I_{\theta}^{-1}\right), h \in \mathbb{R}^{k}\right)$, the theorem is the parallel for testing of Theorem 7.10.
15.1 Theorem. Let the sequence of experiments $\mathcal{E}_{n}=\left(P_{n, h}: h \in H\right)$ converge to a dominated experiment $\mathcal{E}=\left(P_{h}: h \in H\right)$. Suppose that a sequence of power functions $\pi_{n}$ of tests in $\mathcal{E}_{n}$ converges pointwise: $\pi_{n}(h) \rightarrow \pi(h)$, for every $h$ and some arbitrary function $\pi$. Then $\pi$ is a power function in the limit experiment: There exists a test $\phi$ in $\mathcal{E}$ with $\pi(h)=\mathrm{E}_{h} \phi(X)$ for every $h$.

Proof. We give the proof for the special case of experiments that satisfy the following assumption: Every sequence of statistics $T_{n}$ that is tight under every given parameter $h$ possesses a subsequence (not depending on $h$ ) that converges in distribution to a limit under every $h$. See problem 15.2 for a method to extend the proof to the general situation.

The additional condition is valid in the case of local asymptotic normality. With the notation of the proof of Theorem 7.10, we argue first that the sequence ( $T_{n}, \Delta_{n}$ ) is uniformly tight under $h=0$ and hence possesses a weakly convergent subsequence by Prohorov's theorem. Next, by the expansion of the likelihood and Slutsky's lemma, the sequence ( $T_{n}, \log d P_{n, h} / d P_{n, 0}$ ) converges under $h=0$ along the same sequence, for every $h$. Finally, we conclude by Le Cam's third lemma that the sequence $T_{n}$ converges under $h$, along the subsequence.

Let $\phi_{n}$ be tests with power functions $\pi_{n}$. Because each $\phi_{n}$ takes its values in the compact interval $[0,1]$, the sequence of random variables $\phi_{n}$ is certainly uniformly tight. By assumption, there exists a subsequence of $\{n\}$ along which $\phi_{n}$ converges in distribution under every $h$. Thus, the assumption of the asymptotic representation theorem, Theorem 9.3 or Theorem 7.10, is satisfied along some subsequence of the statistics $\phi_{n}$. By this theorem, there exists a randomized statistic $T=T(X, U)$ in the limit experiment such that $\phi_{n} \stackrel{h}{\leadsto} T$ along the subsequence, for every $h$. The randomized statistic may be assumed to take its values in $[0,1]$. Because the $\phi_{n}$ are uniformly bounded, $\mathrm{E}_{h} \phi_{n} \rightarrow \mathrm{E}_{h} T$. Combination with the assumption yields $\pi(h)=\mathrm{E}_{h} T$ for every $h$. The randomized statistic $T$ is not a test function (it is a "doubly randomized" test). However, the test $\phi(x)=\mathrm{E}(T(X, U) \mid X=x)$ satisfies the requirements.

The theorem suggests that the best possible limiting power function is the power function of the best test in the limit experiment. In classical testing theory an "absolutely best" test is defined as a uniformly most powerful test of the required level. Depending on the experiment, such a test may or may not exist. If it does not exist, then the classical solution is to find a uniformly most powerful test in a restricted class, such as the class of all unbiased or invariant tests; to use the maximin criterion; or to use a conditional test. In combination with the preceding theorem, each of these approaches leads to a criterion for asymptotic quality. We do not pursue this in detail but note that, in general, we would avoid any sequence of tests that is matched in the limit experiment by a test that is considered suboptimal.

In the remainder of this chapter we consider the implications for locally asymptotically normal models in more detail. We start with reviewing testing in normal location models.

### 15.2 Testing Normal Means

Suppose that the observation $X$ is $N_{k}(h, \Sigma)$-distributed, for a known covariance matrix $\Sigma$ and unknown mean vector $h$. First consider testing the null hypothesis $H_{0}: c^{T} h=0$ versus the alternative $H_{1}: c^{T} h>0$, for a known vector $c$. The "natural" test, which rejects $H_{0}$ for large values of $c^{T} X$, is uniformly most powerful. In other words, if $\pi$ is a power function such that $\pi(h) \leq \alpha$ for every $h$ with $c^{T} h=0$, then for every $h$ with $c^{T} h>0$,

$$
\pi(h) \leq \mathrm{P}_{h}\left(c^{T} X>z_{\alpha} \sqrt{c^{T} \Sigma c}\right)=1-\Phi\left(z_{\alpha}-\frac{c^{T} h}{\sqrt{c^{T} \Sigma c}}\right) .
$$

15.2 Proposition. Suppose that $X$ be $N_{k}(h, \Sigma)$-distributed for a known nonnegativedefinite matrix $\Sigma$, and let $c$ be a fixed vector with $c^{T} \Sigma c>0$. Then the test that rejects $H_{0}$ if $c^{T} X>z_{\alpha} \sqrt{c^{T} \Sigma c}$ is uniformly most powerful at level $\alpha$ for testing $H_{0}: c^{T} h=0$ versus $H_{1}: c^{T} h>0$, based on $X$.

Proof. Fix $h_{1}$ with $c^{T} h_{1}>0$. Define $h_{0}=h_{1}-\left(c^{T} h_{1} / c^{T} \Sigma c\right) \Sigma c$. Then $c^{T} h_{0}=0$. By the Neyman-Pearson lemma, the most powerful test for testing the simple hypotheses $H_{0}: h= h_{0}$ and $H_{1}: h=h_{1}$ rejects $H_{0}$ for large values of

$$
\log \frac{d N\left(h_{1}, \Sigma\right)}{d N\left(h_{0}, \Sigma\right)}(X)=\frac{c^{T} h_{1}}{c^{T} \Sigma c} c^{T} X-\frac{1}{2} \frac{\left(c^{T} h_{1}\right)^{2}}{c^{T} \Sigma c}
$$

This is equivalent to the test that rejects for large values of $c^{T} X$. More precisely, the most powerful level $\alpha$ test for $H_{0}: h=h_{0}$ versus $H_{1}: h=h_{1}$ is the test given by the proposition. Because this test does not depend on $h_{0}$ or $h_{1}$, it is uniformly most powerful for testing $H_{0}: c^{T} h=0$ versus $H_{1}: c^{T} h>0$.

The natural test for the two-sided problem $H_{0}: c^{T} h=0$ versus $H_{1}: c^{T} h \neq 0$ rejects the null hypothesis for large values of $\left|c^{T} X\right|$. This test is not uniformly most powerful, because its power is dominated by the uniformly most powerful tests for the two one-sided alternatives whose union is $H_{1}$. However, the test with critical region $\left\{x:\left|c^{T} x\right| \geq z_{\alpha / 2} \sqrt{c^{T} \Sigma c}\right\}$ is uniformly most powerful among the unbiased level $\alpha$ tests (see problem 15.1).

A second problem of interest is to test a simple null hypothesis $H_{0}: h=0$ versus the alternative $H_{1}: h \neq 0$. If the parameter set is one-dimensional, then this reduces to the problem in the preceding paragraph. However, if $\theta$ is of dimension $k>1$, then there exists no uniformly most powerful test, not even among the unbiased tests. A variety of tests are reasonable, and whether a test is "good" depends on the alternatives at which we desire high power. For instance, the test that is most sensitive to detect the alternatives such that $c^{T} h>0$ (for a given $c$ ) is the test given in the preceding theorem. Probably in most situations no particular "direction" is of special importance, and we would use a test that distributes the power over all directions. It is known that any test with as critical region the complement of a closed, convex set $C$ is admissible (see, e.g., [138, p. 137]). In particular, complements of closed, convex, and symmetric sets are admissible critical regions and cannot easily be ruled out a priori. The shape of $C$ determines the power function, the directions in which $C$ extends little receiving large power (although the power also depends on $\Sigma$ ).

The most popular test rejects the null hypothesis for large values of $X^{T} \Sigma^{-1} X$. This test arises as the limit version of the Wald test, the score test, and the likelihood ratio test. One advantage is a simple choice of critical values, because $X^{T} \Sigma^{-1} X$ is chi square-distributed with $k$ degrees of freedom. The power function of this test is, with $Z$ a standard normal vector,

$$
\pi(h)=\mathrm{P}_{h}\left(X^{T} \Sigma^{-1} X>\chi_{k, \alpha}^{2}\right)=\mathrm{P}\left(\left\|Z+\Sigma^{-1 / 2} h\right\|^{2}>\chi_{k, \alpha}^{2}\right) .
$$

By the rotational symmetry of the standard normal distribution, this depends only on the noncentrality parameter $\left\|\Sigma^{-1 / 2} h\right\|$. The power is relatively large in the directions $h$ for which $\left\|\Sigma^{-1 / 2} h\right\|$ is large. In particular, it increases most steeply in the direction of the eigenvector corresponding to the smallest eigenvalue of $\Sigma$. Note that the test does not distribute the power evenly, but dependent on $\Sigma$. Two optimality properties of this test are given in problems 15.3 and 15.4, but these do not really seem convincing.

Due to the lack of an acceptable optimal test in the limit problem, a satisfactory asymptotic optimality theory of testing simple hypotheses on multidimensional parameters is impossible.

### 15.3 Local Asymptotic Normality

A normal limit experiment arises, among others, in the situation of repeated sampling from a differentiable parametric model. If the model ( $P_{\theta}: \theta \in \Theta$ ) is differentiable in quadratic mean, then the local experiments converge to a Gaussian limit:

$$
\left(P_{\theta_{0}+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}\right) \rightarrow\left(N\left(h, I_{\theta_{0}}^{-1}\right): h \in \mathbb{R}^{k}\right) .
$$

A sequence of power functions $\theta \mapsto \pi_{n}(\theta)$ in the original experiments induces the sequence of power functions $h \mapsto \pi_{n}\left(\theta_{0}+h / \sqrt{n}\right)$ in the local experiments. Suppose that $\pi_{n}\left(\theta_{0}+\right. h / \sqrt{n}) \rightarrow \pi(h)$ for every $h$ and some function $\pi$. Then, by the asymptotic representation theorem, the limit $\pi$ is a power function in the Gaussian limit experiment.

Suppose for the moment that $\theta$ is real and that the sequence $\pi_{n}$ is of asymptotic level $\alpha$ for testing $H_{0}: \theta \leq \theta_{0}$ versus $H_{1}: \theta>\theta_{0}$. Then $\pi(0)=\lim \pi_{n}\left(\theta_{0}\right) \leq \alpha$ and hence $\pi$ corresponds to a level $\alpha$ test for $H_{0}: h=0$ versus $H_{1}: h>0$ in the limit experiment. It must be bounded above by the power function of the uniformly most powerful level $\alpha$ test in the limit experiment, which is given by Proposition 15.2. Conclude that

$$
\lim _{n \rightarrow \infty} \pi_{n}\left(\theta_{0}+\frac{h}{\sqrt{n}}\right) \leq 1-\Phi\left(z_{\alpha}-h \sqrt{I_{\theta_{0}}}\right), \quad \text { every } h>0 .
$$

(Apply the proposition with $c=1$ and $\Sigma=I_{\theta_{0}}^{-1}$.) We have derived an absolute upper bound on the local asymptotic power of level $\alpha$ tests.

In Chapter 14 a sequence of power functions such that $\pi_{n}\left(\theta_{0}+h / \sqrt{n}\right) \rightarrow 1-\Phi\left(z_{\alpha}-h s\right)$ for every $h$ is said to have slope $s$. It follows from the present upper bound that the square root $\sqrt{I_{\theta_{0}}}$ of the Fisher information is the largest possible slope. The quantity

$$
\frac{I_{\theta_{0}}}{s^{2}}
$$

is the relative efficiency of the best test and the test with slope $s$. It can be interpreted as the number of observations needed with the given sequence of tests with slope $s$ divided by the number of observations needed with the best test to obtain the same power.

With a bit of work, the assumption that $\pi_{n}\left(\theta_{0}+h / \sqrt{n}\right)$ converges to a limit for every $h$ can be removed. Also, the preceding derivation does not use the special structure of i.i.d. observations but only uses the convergence to a Gaussian experiment. We shall rederive the result within the context of local asymptotic normality and also indicate how to construct optimal tests.

Suppose that at "time" $n$ the observation is distributed according to a distribution $P_{n, \theta}$ with parameter ranging over an open subset $\Theta$ of $\mathbb{R}^{k}$. The sequence of experiments ( $P_{n, \theta}: \theta \in \Theta$ ) is locally asymptotically normal at $\theta_{0}$ if

$$
\begin{equation*}
\log \frac{d P_{n, \theta_{0}+r_{n}^{-1} h}}{d P_{n, \theta_{0}}}=h^{T} \Delta_{n, \theta_{0}}-\frac{1}{2} h^{T} I_{\theta_{0}} h+o_{P_{n, \theta_{0}}}(1), \tag{15.3}
\end{equation*}
$$

for a sequence of statistics $\Delta_{n, \theta_{0}}$ that converges in distribution under $\theta_{0}$ to a normal $N_{k}\left(0, I_{\theta_{0}}\right)$-distribution.
15.4 Theorem. Let $\Theta \subset \mathbb{R}^{k}$ be open and let $\psi: \Theta \mapsto \mathbb{R}$ be differentiable at $\theta_{0}$, with nonzero gradient $\dot{\psi}_{\theta_{0}}$ and such that $\psi\left(\theta_{0}\right)=0$. Let the sequence of experiments $\left(P_{n, \theta}: \theta \in \Theta\right)$ be locally asymptotically normal at $\theta_{0}$ with nonsingular Fisher information, for constants $r_{n} \rightarrow \infty$. Then the power functions $\theta \mapsto \pi_{n}(\theta)$ of any sequence of level $\alpha$ tests for testing $H_{0}: \psi(\theta) \leq 0$ versus $H_{1}: \psi(\theta)>0$ satisfy, for every $h$ such that $\dot{\psi}_{\theta_{0}} h>0$,

$$
\limsup _{n \rightarrow \infty} \pi_{n}\left(\theta_{0}+\frac{h}{r_{n}}\right) \leq 1-\Phi\left(z_{\alpha}-\frac{\dot{\psi}_{\theta_{0}} h}{\sqrt{\dot{\psi}_{\theta_{0}} I_{\theta_{0}}^{-1} \dot{\psi}_{\theta_{0}}^{T}}}\right) .
$$

15.5 Addendum. Let $T_{n}$ be statistics such that

$$
T_{n}=\frac{\dot{\psi}_{\theta_{0}} I_{\theta_{0}}^{-1} \Delta_{n, \theta_{0}}}{\sqrt{\dot{\psi}_{\theta_{0}} I_{\theta_{0}}^{-1} \dot{\psi}_{\theta_{0}}^{T}}}+o_{P_{n, \theta_{0}}}(1)
$$

Then the sequence of tests that reject for values of $T_{n}$ exceeding $z_{\alpha}$ is asymptotically optimal in the sense that the sequence $\mathrm{P}_{\theta_{0}+r_{n}^{-1} h}\left(T_{n} \geq z_{\alpha}\right)$ converges to the right side of the preceding display, for every $h$.

Proofs. The sequence of localized experiments ( $P_{n, \theta_{0}+r_{n}^{-1} h}: h \in \mathbb{R}^{k}$ ) converges by Theorem 7.10, or Theorem 9.4, to the Gaussian location experiment $\left(N_{k}\left(h, I_{\theta_{0}}^{-1}\right): h \in \mathbb{R}^{k}\right)$.

Fix some $h_{1}$ such that $\dot{\psi}_{\theta_{0}} h_{1}>0$, and a subsequence of $\{n\}$ along which the lim sup $\pi\left(\theta_{0}+h_{1} / r_{n}\right)$ is taken. There exists a further subsequence along which $\pi_{n}\left(\theta_{0}+r_{n}^{-1} h\right)$ converges to a limit $\pi(h)$ for every $h \in \mathbb{R}^{k}$ (see the proof of Theorem 15.1). The function $h \mapsto \pi(h)$ is a power function in the Gaussian limit experiment. For $\dot{\psi}_{\theta_{0}} h<0$, we have $\psi\left(\theta_{0}+r_{n}^{-1} h\right)=r_{n}^{-1}\left(\dot{\psi}_{\theta_{0}} h+o(1)\right)<0$ eventually, whence $\pi(h) \leq \limsup \pi_{n}\left(\theta_{0}+r_{n}^{-1} h\right) \leq \alpha$. By continuity, the inequality $\pi(h) \leq \alpha$ extends to all $h$ such that $\dot{\psi}_{\theta_{0}} h \leq 0$. Thus, $\pi$ is of level $\alpha$ for testing $H_{0}: \dot{\psi}_{\theta_{0}} h \leq 0$ versus $H_{1}: \dot{\psi}_{\theta_{0}} h>0$. Its power function is bounded above by the power function of the uniformly most powerful test, which is given by Proposition 15.2. This concludes the proof of the theorem.

The asymptotic optimality of the sequence $T_{n}$ follows by contiguity arguments. We start by noting that the sequence ( $\Delta_{n, \theta_{0}}, \Delta_{n, \theta_{0}}$ ) converges under $\theta_{0}$ in distribution to a (degenerate) normal vector ( $\Delta, \Delta$ ). By Slutsky's lemma and local asymptotic normality,

$$
\begin{aligned}
\left(\Delta_{n, \theta_{0}}, \log \frac{d P_{n, \theta_{0}+r_{n}^{-1} h}}{d P_{n, \theta_{0}}}\right) & \stackrel{\theta_{0}}{\leadsto}\left(\Delta, h^{T} \Delta-\frac{1}{2} h^{T} I_{\theta_{0}} h\right) \\
& \sim N\left(\binom{0}{-\frac{1}{2} h^{T} I_{\theta_{0}} h},\left(\begin{array}{cc}
I_{\theta_{0}} & I_{\theta_{0}} h \\
h^{T} I_{\theta_{0}} & h^{T} I_{\theta_{0}} h
\end{array}\right)\right) .
\end{aligned}
$$

By Le Cam's third lemma, the sequence $\Delta_{n, \theta_{0}}$ converges in distribution under $\theta_{0}+r_{n}^{-1} h$ to a $N\left(I_{\theta_{0}} h, I_{\theta_{0}}\right)$-distribution. Thus, the sequence $T_{n}$ converges under $\theta_{0}+r_{n}^{-1} h$ in distribution to a normal distribution with mean $\dot{\psi}_{\theta_{0}} h /\left(\dot{\psi}_{\theta_{0}} I_{\theta_{0}}^{-1} \dot{\psi}_{\theta_{0}}^{T}\right)^{1 / 2}$ and variance 1 .

The point $\theta_{0}$ in the preceding theorem is on the boundary of the null and the alternative hypotheses. If the dimension $k$ is larger than 1 , then this boundary is typically $(k-1)$-dimensional, and there are many possible values for $\theta_{0}$. The upper bound is valid at every possible choice.

If $k=1$, the boundary point $\theta_{0}$ is typically unique and hence known, and we could use $T_{n}=I_{\theta_{0}}^{-1 / 2} \Delta_{n, \theta_{0}}$ to construct an optimal sequence of tests for the problem $H_{0}: \theta=\theta_{0}$. These are known as score tests.

Another possibility is to base a test on an estimator sequence. Not surprisingly, efficient estimators yield efficient tests.
15.6 Example (Wald tests). Let $X_{1}, \ldots, X_{n}$ be a random sample in an experiment $\left(P_{\theta}: \theta \in \Theta\right)$ that is differentiable in quadratic mean with nonsingular Fisher information. Then the sequence of local experiments ( $P_{\theta+h / \sqrt{n}}^{n}: h \in \mathbb{R}^{k}$ ) is locally asymptotically normal with $r_{n}=\sqrt{n}, I_{\theta}$ the Fisher information matrix, and

$$
\Delta_{n, \theta}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \dot{l}_{\theta}\left(X_{i}\right) .
$$

A sequence of estimators $\hat{\theta}_{n}$ is asymptotically efficient for estimating $\theta$ if (see Chapter 8)

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=I_{\theta}^{-1} \Delta_{n, \theta}+o_{P_{\theta}}(1) .
$$

Under regularity conditions, the maximum likelihood estimator qualifies. Suppose that $\theta \mapsto I_{\theta}$ is continuous, and that $\psi$ is continuously differentiable with nonzero gradient. Then the sequence of tests that reject $H_{0}: \psi(\theta) \leq 0$ if

$$
\sqrt{n} \psi\left(\hat{\theta}_{n}\right) \geq z_{\alpha} \sqrt{\dot{\psi}_{\hat{\theta}_{n}} I_{\hat{\theta}_{n}}^{-1} \dot{\psi}_{\hat{\theta}_{n}}^{T}}
$$

is asymptotically optimal at every point $\theta_{0}$ on the boundary of $H_{0}$. Furthermore, this sequence of tests is consistent at every $\theta$ with $\psi(\theta)>0$.

These assertions follow from the preceding theorem, upon using the delta method and Slutsky's lemma. The resulting tests are called Wald tests if $\hat{\theta}_{n}$ is the maximum likelihood estimator.

### 15.4 One-Sample Location

Let $X_{1}, \ldots, X_{n}$ be a sample from a density $f(x-\theta)$, where $f$ is symmetric about zero and has finite Fisher information for location $I_{f}$. It is required to test $H_{0}: \theta=0$ versus $H_{1}: \theta>0$. The density $f$ may be known or (partially) unknown. For instance, it may be known to belong to the normal scale family.

For fixed $f$, the sequence of experiments $\left(\prod_{i=1}^{n} f\left(x_{i}-\theta\right): \theta \in \mathbb{R}\right)$ is locally asymptotically normal at $\theta=0$ with $\Delta_{n, 0}=-n^{-1 / 2} \sum_{i=1}^{n}\left(f^{\prime} / f\right)\left(X_{i}\right)$, norming rate $\sqrt{n}$, and Fisher information $I_{f}$. By the results of the preceding section, the best asymptotic level $\alpha$ power function (for known $f$ ) is

$$
1-\Phi\left(z_{\alpha}-h \sqrt{I_{f}}\right)
$$

This function is an upper bound for $\lim \sup \pi_{n}(h / \sqrt{n})$, for every $h>0$, for every sequence of level $\alpha$ power functions. Suppose that $T_{n}$ are statistics with

$$
\begin{equation*}
T_{n}=-\frac{1}{\sqrt{n}} \frac{1}{\sqrt{I_{f}}} \sum_{i=1}^{n} \frac{f^{\prime}}{f}\left(X_{i}\right)+o_{P_{0}}(1) . \tag{15.7}
\end{equation*}
$$

Then, according to the second assertion of Theorem 15.4, the sequence of tests that reject the null hypothesis if $T_{n} \geq z_{\alpha}$ attains the bound and hence is asymptotically optimal. We shall discuss several ways of constructing test statistics with this property.

If the shape of the distribution is completely known, then the test statistics $T_{n}$ can simply be taken equal to the right side of (15.7), without the remainder term, and we obtain the score test. It is more realistic to assume that the underlying distribution is only known up to scale. If the underlying density takes the form $f(x)=f_{0}(x / \sigma) / \sigma$ for a known density $f_{0}$ that is symmetric about zero, but for an unknown scale parameter $\sigma$, then

$$
\frac{f^{\prime}}{f}(x)=\frac{1}{\sigma} \frac{f_{0}^{\prime}}{f_{0}}\left(\frac{x}{\sigma}\right), \quad I_{f}=\frac{1}{\sigma^{2}} I_{f_{0}}, \quad \frac{1}{\sqrt{I_{f}}} \frac{f^{\prime}}{f}(x)=\frac{1}{\sqrt{I_{f_{0}}}} \frac{f_{0}^{\prime}}{f_{0}}\left(\frac{x}{\sigma}\right) .
$$

15.8 Example ( $t$-test). The standard normal density $f_{0}$ possesses score function $f_{0}^{\prime} / f_{0} (x)=-x$ and Fisher information $I_{f_{0}}=1$. Consequently, if the underlying distribution is normal, then the optimal test statistics should satisfy $T_{n}=\sqrt{n} \bar{X}_{n} / \sigma+o_{P_{0}}\left(n^{-1 / 2}\right)$. The $t$-statistics $\bar{X}_{n} / S_{n}$ fulfill this requirement. This is not surprising, because in the case of normally distributed observations the $t$-test is uniformly most powerful for every finite $n$ and hence is certainly asymptotically optimal.

The $t$-statistic in the preceding example simply replaces the unknown standard deviation $\sigma$ by an estimate. This approach can be followed for most scale families. Under some regularity conditions, the statistics

$$
T_{n}=-\frac{1}{\sqrt{n}} \frac{1}{\sqrt{I_{f_{0}}}} \sum_{i=1}^{n} \frac{f_{0}^{\prime}}{f_{0}}\left(\frac{X_{i}}{\hat{\sigma}_{n}}\right)
$$

should yield asymptotically optimal tests, given a consistent sequence of scale estimators $\hat{\sigma}_{n}$.

Rather than using score-type tests, we could use a test based on an efficient estimator for the unknown symmetry point and efficient estimators for possible nuisance parameters, such as the scale-for instance, the maximum likelihood estimators. This method is indicated in general in Example 15.8 and leads to the Wald test.

Perhaps the most attractive approach is to use signed rank statistics. We summarize some definitions and conclusions from Chapter 13. Let $R_{n 1}^{+}, \ldots, R_{n n}^{+}$be the ranks of the absolute values $\left|X_{1}\right|, \ldots,\left|X_{n}\right|$ in the ordered sample of absolute values. A linear signed rank statistic takes the form

$$
T_{n}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} a_{n, R_{n i}^{+}} \operatorname{sign}\left(X_{i}\right),
$$

for given numbers $a_{n 1}, \ldots, a_{n n}$, which are called the scores of the statistic. Particular examples are the Wilcoxon signed rank statistic, which has scores $a_{n i}=i$, and the sign statistic, which corresponds to scores $a_{n i}=1$. In general, the scores can be chosen to weigh
the influence of the different observations. A convenient method of generating scores is through a fixed function $\phi:[0,1] \mapsto \mathbb{R}$, by

$$
a_{n i}=\mathrm{E} \phi\left(U_{n(i)}\right) .
$$

(Here $U_{n(1)}, \ldots, U_{n(n)}$ are the order statistics of a random sample of size $n$ from the uniform distribution on $[0,1]$.) Under the condition that $\int_{0}^{1} \phi^{2}(u) d u<\infty$, Theorem 13.18 shows that, under the null hypothesis, and with $F^{+}(x)=2 F(x)-1$ denoting the distribution function of $\left|X_{1}\right|$,

$$
T_{n}=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \phi\left(F^{+}\left(\left|X_{i}\right|\right)\right) \operatorname{sign}\left(X_{i}\right)+o_{P_{0}}(1)
$$

Because the score-generating function $\phi$ can be chosen freely, this allows the construction of an asymptotically optimal rank statistic for any given shape $f$. The choice

$$
\begin{equation*}
\phi(u)=-\frac{1}{\sqrt{I_{f}}} \frac{f^{\prime}}{f}\left(\left(F^{+}\right)^{-1}(u)\right) \tag{15.9}
\end{equation*}
$$

yields the locally most powerful scores, as discussed in Chapter 13. Because $f^{\prime} / f(|x|)$ sign $(x)=f^{\prime} / f(x)$ by the symmetry of $f$, it follows that the signed rank statistics $T_{n}$ satisfy (15.7). Thus, the locally most powerful scores yield asymptotically optimal signed rank tests. This surprising result, that the class of signed rank statistics contains asymptotically efficient tests for every given (symmetric) shape of the underlying distribution, is sometimes expressed by saying that the signs and absolute ranks are "asymptotically sufficient" for testing the location of a symmetry point.
15.10 Corollary. Let $T_{n}$ be the simple linear signed rank statistic with scores $a_{n i}= \mathrm{E} \phi\left(U_{n(i)}\right)$ generated by the function $\phi$ defined in (15.9). Then $T_{n}$ satisfies (15.7) and hence the sequence of tests that reject $H_{0}: \theta=0$ if $T_{n} \geq z_{\alpha}$ is asymptotically optimal at $\theta=0$.

Signed rank statistics were originally constructed because of their attractive property of being distribution free under the null hypothesis. Apparently, this can be achieved without losing (asymptotic) power. Thus, rank tests are strong competitors of classical parametric tests. Note also that signed rank statistics automatically adapt to the unknown scale: Even though the definition of the optimal scores appears to depend on $f$, they are actually identical for every member of a scale family $f(x)=f_{0}(x / \sigma) / \sigma\left(\right.$ since $\left.\left(F^{+}\right)^{-1}(u)=\sigma\left(F_{0}^{+}\right)^{-1}(u)\right)$. Thus, no auxiliary estimate for $\sigma$ is necessary for their definition.
15.11 Example (Laplace). The sign statistic $T_{n}=n^{-1 / 2} \sum_{i=1}^{n} \operatorname{sign}\left(X_{i}\right)$ satisfies (15.7) for $f$ equal to the Laplace density. Thus the sign test is asymptotically optimal for testing location in the Laplace scale family.
15.12 Example (Normal). The standard normal density has score function for location $f_{0}^{\prime} / f_{0}(x)=-x$ and Fisher information $I_{f_{0}}=1$. The optimal signed rank statistic for the normal scale family has score-generating function

$$
\phi(u)=\mathrm{E}\left(\Phi^{+}\right)^{-1}\left(U_{n(i)}\right)=\mathrm{E} \Phi^{-1}\left(\frac{U_{n(i)}+1}{2}\right) \approx \Phi^{-1}\left(\frac{i}{2 n+2}+\frac{1}{2}\right) .
$$

We conclude that the corresponding sequence of rank tests has the same asymptotic slope as the $t$-test if the underlying distribution is normal. (For other distributions the two sequences of tests have different asymptotic behavior.)

Even the assumption that the underlying distribution of the observations is known up to scale is often unrealistic. Because rank statistics are distribution-free under the null hypothesis, the level of a rank test is independent of the underlying distribution, which is the best possible protection of the level against misspecification of the model. On the other hand, the power of a rank test is not necessarily robust against deviations from the postulated model. This might lead to the use of the best test for the wrong model. The dependence of the power on the underlying distribution may be relaxed as well, by a procedure known as adaptation. This entails estimating the underlying density from the data and next using an optimal test for the estimated density. A remarkable fact is that this approach can be completely successful: There exist test statistics that are asymptotically optimal for any shape $f$. In fact, without prior knowledge of $f$ (other than that it is symmetric with finite and positive Fisher information for location), estimators $\hat{\theta}_{n}$ and $I_{n}$ can be constructed such that, for every $\theta$ and $f$,

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=-\frac{1}{\sqrt{n}} \frac{1}{I_{f}} \sum_{i=1}^{n} \frac{f^{\prime}}{f}\left(X_{i}-\theta\right)+o_{P_{\theta}}(1) ; \quad I_{n} \stackrel{P_{\theta}}{\leadsto} I_{f} .
$$

We give such a construction in section 25.8.1. Then the test statistics $T_{n}=\sqrt{n} \hat{\theta}_{n} I_{n}^{1 / 2}$ satisfy (15.7) and hence are asymptotically (locally) optimal at $\theta=0$ for every given shape $f$. Moreover, for every $\theta>0$, and every $f$,

$$
\mathrm{P}_{\theta}\left(T_{n}>z_{\alpha}\right)=\mathrm{P}_{\theta}\left(\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)>z_{\alpha} I_{n}^{-1 / 2}-\sqrt{n} \theta\right) \rightarrow 1 .
$$

Hence, the sequence of tests based on $T_{n}$ is also consistent at every $(\theta, f)$ in the alternative hypothesis $H_{1}: \theta>0$.

### 15.5 Two-Sample Problems

Suppose we observe two independent random samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ from densities $p_{\mu}$ and $q_{\nu}$, respectively. The problem is to test the null hypothesis $H_{0}: \nu \leq \mu$ versus the alternative $H_{1}: v>\mu$. There may be other unknown parameters in the model besides $\mu$ and $\nu$, but we shall initially ignore such "nuisance parameters" and parametrize the model by $(\mu, \nu) \in \mathbb{R}^{2}$. Null and alternative hypotheses are shown graphically in Figure 15.1. We let $N=m+n$ be the total number of observations and assume that $m / N \rightarrow \lambda$ as $m, n \rightarrow \infty$.
15.13 Example (Testing shift). If $p_{\mu}(x)=f(x-\mu)$ and $q_{\nu}(y)=g(y-v)$ for two densities $f$ and $g$ that have the same "location," then we obtain the two-sample location problem. The alternative hypothesis asserts that the second sample is "stochastically larger."

The alternatives of greatest interest for the study of the asymptotic performance of tests are sequences $\left(\mu_{N}, \nu_{N}\right)$ that converge to the boundary between null and alternative hypotheses. In the study of relative efficiency, in Chapter 14, we restricted ourselves to

![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-011.jpg?height=2617&width=2997&top_left_y=541&top_left_x=1314)
Figure 15.1. Null and alternative hypothesis.

vertical perturbations $(\theta, \theta+h / \sqrt{N})$. Here we shall use the sequences $(\theta+g / \sqrt{N}, \theta+ h / \sqrt{N}$ ), which approach the boundary in the direction of a general vector ( $g, h$ ).

If both $p_{\mu}$ and $q_{\nu}$ define differentiable models, then the sequence of experiments ( $P_{\mu}^{m} \otimes \left.P_{\nu}^{n}:(\mu, \nu) \in \mathbb{R}^{2}\right)$ is locally asymptotically normal with norming rate $\sqrt{N}$. If the score functions are denoted by $\dot{\kappa}_{\mu}$ and $\dot{\ell}_{\nu}$, and the Fisher informations by $I_{\mu}$ and $J_{\nu}$, respectively, then the parameters of local asymptotic normality are

$$
\Delta_{n,(\mu, \nu)}=\binom{\frac{\sqrt{\lambda}}{\sqrt{m}} \sum_{i=1}^{m} \dot{\kappa}_{\mu}\left(X_{i}\right)}{\frac{\sqrt{1-\lambda}}{\sqrt{n}} \sum_{j=1}^{n} \dot{\ell}_{\nu}\left(Y_{j}\right)}, \quad I_{(\mu, \nu)}=\left(\begin{array}{cc}
\lambda I_{\mu} & 0 \\
0 & (1-\lambda) J_{\nu}
\end{array}\right) .
$$

The corresponding limit experiment consists of observing two independent normally distributed variables with means $g$ and $h$ and variances $\lambda^{-1} I_{\mu}^{-1}$ and $(1-\lambda)^{-1} J_{\nu}^{-1}$, respectively.
15.14 Corollary. Suppose that the models ( $P_{\mu}: \mu \in \mathbb{R}$ ) and ( $Q_{\nu}: \nu \in \mathbb{R}$ ) are differentiable in quadratic mean, and let $m, n \rightarrow \infty$ such that $m / N \rightarrow \lambda \in(0,1)$. Then the power functions of any sequence of level $\alpha$ tests for $H_{0}: \nu=\mu$ satisfies, for every $\mu$ and for every $h>g$,

$$
\limsup _{n, m \rightarrow \infty} \pi_{m, n}\left(\mu+\frac{g}{\sqrt{N}}, \mu+\frac{h}{\sqrt{N}}\right) \leq 1-\Phi\left(z_{\alpha}-(h-g) \sqrt{\frac{\lambda(1-\lambda) I_{\mu} J_{\mu}}{\lambda I_{\mu}+(1-\lambda) J_{\mu}}}\right) .
$$

Proof. This is a special case of Theorem 15.4, with $\psi(\mu, v)=v-\mu$ and Fisher information matrix $\operatorname{diag}\left(\lambda I_{\mu},(1-\lambda) J_{\mu}\right)$. It is slightly different in that the null hypothesis $H_{0}: \psi(\theta)=0$ takes the form of an equality, which gives a weaker requirement on the sequence $T_{n}$. The proof goes through because of the linearity of $\psi$.

It follows that the optimal slope of a sequence of tests is equal to

$$
s_{\mathrm{opt}}(\mu)=\sqrt{\frac{\lambda(1-\lambda) I_{\mu} J_{\mu}}{\lambda I_{\mu}+(1-\lambda) J_{\mu}}}
$$

The square of the quotient of the actual slope of a sequence of tests and this number is a good absolute measure of the asymptotic quality of the sequence of tests.

According to the second assertion of Theorem 15.4, an optimal sequence of tests can be based on any sequence of statistics such that

$$
T_{N}=s_{\mathrm{opt}}(\mu)\left(\frac{1}{\sqrt{1-\lambda} J_{\mu}} \frac{1}{\sqrt{n}} \sum_{j=1}^{n} \dot{\ell}_{\mu}\left(Y_{j}\right)-\frac{1}{\sqrt{\lambda} I_{\mu}} \frac{1}{\sqrt{m}} \sum_{i=1}^{m} \dot{\kappa}_{\mu}\left(X_{i}\right)\right)+o_{P}(1) .
$$

(The multiplicative factor $s_{\text {opt }}(\mu)$ ensures that the sequence $T_{N}$ is asymptotically normally distributed with variance 1.) Test statistics with this property can be constructed using a variety of methods. For instance, in many cases we can use asymptotically efficient estimators for the parameters $\mu$ and $\nu$, combined with estimators for possible nuisance parameters, along the lines of Example 15.6.

If $p_{\mu}=q_{\mu}=f_{\mu}$ are equal and are densities on the real line, then rank statistics are attractive. Let $R_{N 1}, \ldots, R_{N N}$ be the ranks of the pooled sample $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$. Consider the two-sample rank statistics

$$
T_{N}=\frac{1}{\sqrt{N}} \sum_{i=m+1}^{N} a_{N, R_{N i}}, \quad a_{N i}=\mathrm{E} \phi\left(U_{N(i)}\right)
$$

for the score generating function

$$
\phi(u)=\frac{1}{\sqrt{\lambda(1-\lambda)} \sqrt{I_{\mu}}} \dot{\ell}_{\mu}\left(F_{\mu}^{-1}(u)\right) .
$$

Up to a constant these are the locally most powerful scores introduced in Chapter 13. By Theorem 13.5, because $\bar{a}_{N}=\int_{0}^{1} \phi(u) d u=0$,

$$
T_{N}=-\frac{1}{\sqrt{I} \mu}\left(\sqrt{1-\lambda} \frac{1}{\sqrt{m}} \sum_{i=1}^{m} \dot{\ell}_{\mu}\left(X_{i}\right)-\sqrt{\lambda} \frac{1}{\sqrt{n}} \sum_{j=1}^{n} \dot{\ell}_{\mu}\left(Y_{j}\right)\right)+o_{P_{\mu}}(1) .
$$

Thus, the locally most powerful rank statistics yield asymptotically optimal tests. In general, the optimal rank test depends on $\mu$, and other parameters in the model, which must be estimated from the data, but in the most interesting cases this is not necessary.
15.15 Example (Wilcoxon statistic). For $f_{\mu}$ equal to the logistic density with mean $\mu$, the scores $a_{N, i}$ are proportional to $i$. Thus, the Wilcoxon (or Mann-Whitney) two-sample statistic is asymptotically uniformly most powerful for testing a difference in location between two samples from logistic densities with different means.
15.16 Example (Log rank test). The log rank test is asymptotically optimal for testing proportional hazard alternatives, given any baseline distribution.

## Notes

Absolute bounds on asymptotic power functions as developed in this chapter are less known than the absolute bounds on estimator sequences given in Chapter 8. Testing problems were nevertheless an important subject in Wald [149], who is credited by Le Cam for having first conceived of the method of approximating experiments by Gaussian experiments, albeit in a somewhat different way than later developed by Le Cam. From the point of view of statistical decision theory, there is no difference between testing and estimating, and hence the asymptotic bounds for tests in this chapter fit in the general theory developed in [99]. Wald appears to use the Gaussian approximation to transfer the optimality of the likelihood ratio and the Wald test (that is now named for him) in the Gaussian experiment to the sequence of experiments. In our discussion we use the Gaussian approximation to show that, in the multidimensional case, "asymptotic optimality" can only be defined in a somewhat arbitrary manner, because optimality in the Gaussian experiment is not easy to define. That is a difference of taste.

## PROBLEMS

1. Consider the two-sided testing problem $H_{0}: c^{T} h=0$ versus $H_{1}: c^{T} h \neq 0$ based on an $N_{k}(h, \Sigma)$ distributed observation $X$. A test for testing $H_{0}$ versus $H_{1}$ is called unbiased if $\sup _{h \in H_{0}} \pi(h) \leq \inf _{h \in H_{1}} \pi(h)$. The test that rejects $H_{0}$ for large values of $\left|c^{T} X\right|$ is uniformly most powerful among the unbiased tests. More precisely, for every power function $\pi$ of a test based on $X$ the conditions

$$
\pi(h) \leq \alpha \quad \text { if } h^{T} c=0 \quad \text { and } \quad \pi(h) \geq \alpha \quad \text { if } h^{T} c \neq 0,
$$

imply that, for every $c^{T} h \neq 0$,

$$
\pi(h) \leq \mathrm{P}\left(\left|c^{T} X\right|>z_{\alpha / 2} \sqrt{c^{T} \Sigma c}\right)=1-\Phi\left(z_{\alpha / 2}-\frac{c^{T} h}{\sqrt{c^{T} \Sigma c}}\right)+1-\Phi\left(z_{\alpha / 2}+\frac{c^{T} h}{\sqrt{c^{T} \Sigma c}}\right) .
$$

Formulate an asymptotic upper bound theorem for two-sided testing problems in the spirit of Theorem 15.4.
2. (i) Show that the set of power functions $h \mapsto \pi_{n}(h)$ in a dominated experiment ( $P_{h}: h \in H$ ) is compact for the topology of pointwise convergence (on $H$ ).
(ii) Give a full proof of Theorem 15.1 along the following lines. First apply the proof as given for every finite subset $I \subset H$. This yields power functions $\pi_{I}$ in the limit experiment that coincide with $\pi$ on $I$.
3. Consider testing $H_{0}: h=0$ versus $H_{1}: h \neq 0$ based on an observation $X$ with an $N(h, \Sigma)$-distribution. Show that the testing problem is invariant under the transformations $x \mapsto \Sigma^{1 / 2} O \Sigma^{-1 / 2} x$ for $O$ ranging over the orthonormal group. Find the best invariant test.
4. Consider testing $H_{0}: h=0$ versus $H_{1}: h \neq 0$ based on an observation $X$ with an $N(h, \Sigma)$ distribution. Find the test that maximizes the minimum power over $\left\{h:\left\|\Sigma^{-1 / 2} h\right\|=c\right\}$. (By the Hunt-Stein theorem the best invariant test is maximin, so one can apply the preceding problem. Alternatively, one can give a direct derivation along the following lines. Let $\pi$ be the distribution of $\Sigma^{1 / 2} U$ if $U$ is uniformly distributed on the set $\{h:\|h\|=c\}$. Derive the Neyman-Pearson test for testing $H_{0}: N(0, \Sigma)$ versus $H_{1}: \int N(h, \Sigma) d \pi(h)$. Show that its power is constant on $\left\{h:\left\|\Sigma^{-1 / 2} h\right\|=c\right\}$. The minimum power of any test on this set is always smaller than the average power over this set, which is the power at $\int N(h, \Sigma) d \pi(h)$.)

## 16

## Likelihood Ratio Tests

> The critical values of the likelihood ratio test are usually based on an asymptotic approximation. We derive the asymptotic distribution of the likelihood ratio statistic and investigate its asymptotic quality through its asymptotic power function and its Bahadur efficiency.

### 16.1 Introduction

Suppose that we observe a sample $X_{1}, \ldots, X_{n}$ from a density $p_{\theta}$, and wish to test the null hypothesis $H_{0}: \theta \in \Theta_{0}$ versus the alternative $H_{1}: \theta \in \Theta_{1}$. If both the null and the alternative hypotheses consist of single points, then a most powerful test can be based on the $\log$ likelihood ratio, by the Neyman-Pearson theory. If the two points are $\theta_{0}$ and $\theta_{1}$, respectively, then the optimal test statistic is given by

$$
\log \frac{\prod_{i=1}^{n} p_{\theta_{1}}\left(X_{i}\right)}{\prod_{i=1}^{n} p_{\theta_{0}}\left(X_{i}\right)} .
$$

For certain special models and hypotheses, the most powerful test turns out not to depend on $\theta_{1}$, and the test is uniformly most powerful for a composite hypothesis $\Theta_{1}$. Sometimes the null hypothesis can be extended as well, and the testing problem has a fully satisfactory solution. Unfortunately, in many situations there is no single best test, not even in an asymptotic sense (see Chapter 15). A variety of ideas lead to reasonable tests. A sensible extension of the idea behind the Neyman-Pearson theory is to base a test on the log likelihood ratio

$$
\tilde{\Lambda}_{n}=\log \frac{\sup _{\theta \in \Theta_{1}} \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right)}{\sup _{\theta \in \Theta_{0}} \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right)}
$$

The single points are replaced by maxima over the hypotheses. As before, the null hypothesis is rejected for large values of the statistic.

Because the distributional properties of $\tilde{\Lambda}_{n}$ can be somewhat complicated, one usually replaces the supremum in the numerator by a supremum over the whole parameter set $\Theta=\Theta_{0} \cup \Theta_{1}$. This changes the test statistic only if $\tilde{\Lambda}_{n} \leq 0$, which is inessential, because in most cases the critical value will be positive. We study the asymptotic properties of the
(log) likelihood ratio statistic

$$
\Lambda_{n}=2 \log \frac{\sup _{\theta \in \Theta} \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right)}{\sup _{\theta \in \Theta_{0}} \prod_{i=1}^{n} p_{\theta}\left(X_{i}\right)}=2\left(\tilde{\Lambda}_{n} \vee 0\right)
$$

The most important conclusion of this chapter is that, under the null hypothesis, the sequence $\Lambda_{n}$ is asymptotically chi squared-distributed. The main conditions are that the model is differentiable in $\theta$ and that the null hypothesis $\Theta_{0}$ and the full parameter set $\Theta$ are (locally) equal to linear spaces. The number of degrees of freedom is equal to the difference of the (local) dimensions of $\Theta$ and $\Theta_{0}$. Then the test that rejects the null hypothesis if $\Lambda_{n}$ exceeds the upper $\alpha$-quantile of the chi-square distribution is asymptotically of level $\alpha$. Throughout the chapter we assume that $\Theta \subset \mathbb{R}^{k}$.

The "local linearity" of the hypotheses is essential for the chi-square approximation, which fails already in a number of simple examples. An open set is certainly locally linear at every of its points, and so is a relatively open subset of an affine subspace. On the other hand, a half line or space, which arises, for instance, if testing a one-sided hypothesis $H_{0}: \mu_{\theta} \leq 0$, or a ball $H_{0}:\|\theta\| \leq 1$, is not locally linear at its boundary points. In that case the asymptotic null distribution of the likelihood ratio statistic is not chi-square, but the distribution of a certain functional of a Gaussian vector.

Besides for testing, the likelihood ratio statistic is often used for constructing confidence regions for a parameter $\psi(0)$. These are defined, as usual, as the values $\tau$ for which a null hypothesis $H_{0}: \psi(\theta)=\tau$ is not rejected. Asymptotic confidence sets obtained by using the chi-square approximation are thought to be of better coverage accuracy than those obtained by other asymptotic methods.

The likelihood ratio test has the desirable property of automatically achieving reduction of the data by sufficiency: The test statistic depends on a minimal sufficient statistic only. This is immediate from its definition as a quotient and the characterization of sufficiency by the factorization theorem. Another property of the test is also immediate: The likelihood ratio statistic is invariant under transformations of the parameter space that leave the null and alternative hypotheses invariant. This requirement is often imposed on test statistics but is not necessarily desirable.
16.1 Example (Multinomial vector). A vector $N=\left(N_{1}, \ldots, N_{k}\right)$ that possesses the multinomial distribution with parameters $n$ and $p=\left(p_{1}, \ldots, p_{k}\right)$ can be viewed as the sum of $n$ independent multinomial vectors with parameters 1 and $p$. By the sufficiency reduction, the likelihood ratio statistic based on $N$ is the same as the statistic based on the single observations. Thus our asymptotic results apply to the likelihood ratio statistic based on $N$, if $n \rightarrow \infty$.

If the success probabilities are completely unknown, then their maximum likelihood estimator is $N / n$. Thus, the log likelihood ratio statistic for testing a null hypothesis $H_{0}: p \in \mathcal{P}_{0}$ against the alternative $H_{1}: p \notin \mathcal{P}_{0}$ is given by

$$
2 \log \frac{\binom{n}{N_{1} \cdots N_{k}}\left(N_{1} / n\right)^{N_{1}} \cdots\left(N_{k} / n\right)^{N_{k}}}{\sup _{p \in \mathcal{P}_{0}}\binom{n}{N_{1} \cdots N_{k}} p_{1}^{N_{1}} \cdots p_{k}^{N_{k}}}=2 \inf _{p \in \mathcal{P}_{0}} \sum_{i=1}^{k} N_{i} \log \left(\frac{N_{i}}{n p_{i}}\right) .
$$

The full parameter set can be identified with an open subset of $\mathbb{R}^{k-1}$, if $p$ with zero coordinates are excluded. The null hypothesis may take many forms. For a simple null hypothesis
the statistic is asymptotically chi-square distributed with $k-1$ degrees of freedom. This follows from the general results in this chapter. ${ }^{\dagger}$

Multinomial variables arise, among others, in testing goodness-of-fit. Suppose we wish to test that the true distribution of a sample of size $n$ belongs to a certain parametric model $\left\{P_{\theta}: \theta \in \Theta\right\}$. Given a partition of the sample space into sets $\mathcal{X}_{1}, \ldots, \mathcal{X}_{k}$, define $N_{1}, \ldots, N_{k}$ as the numbers of observations falling into each of the sets of the partition. Then the vector $N=\left(N_{1}, \ldots, N_{k}\right)$ possesses a multinomial distribution, and the original problem can be translated in testing the null hypothesis that the success probabilities $p$ have the form $\left(P_{\theta}\left(\mathcal{X}_{1}\right), \ldots, P_{\theta}\left(\mathcal{X}_{k}\right)\right)$ for some $\theta$.
16.2 Example (Exponential families). Suppose that the observations are sampled from a density $p_{\theta}$ in the $k$-dimensional exponential family

$$
p_{\theta}(x)=c(\theta) h(x) e^{\theta^{T} t(x)}
$$

Let $\Theta \subset \mathbb{R}^{k}$ be the natural parameter space, and consider testing a null hypothesis $\Theta_{0} \subset \Theta$ 臽 versus its complement $\Theta-\Theta_{0}$. The log likelihood ratio statistic is given by

$$
\Lambda_{n}=2 n \sup _{\theta \in \Theta} \inf _{\theta \in \Theta_{0}}\left[\left(\theta-\theta_{0}\right)^{T} \bar{t}_{n}+\log c(\theta)-\log c\left(\theta_{0}\right)\right]
$$

This is closely related to the Kullback-Leibler divergence of the measures $P_{\theta_{0}}$ and $P_{\theta}$, which is equal to

$$
K\left(\theta, \theta_{0}\right)=P_{\theta} \log \frac{p_{\theta}}{p_{\theta_{0}}}=\left(\theta-\theta_{0}\right)^{T} P_{\theta} t+\log c(\theta)-\log c\left(\theta_{0}\right)
$$

If the maximum likelihood estimator $\hat{\theta}$ exists and is contained in the interior of $\Theta$, which is the case with probability tending to 1 if the true parameter is contained in $\stackrel{\circ}{\Theta}$, then $\hat{\theta}$ is the moment estimator that solves the equation $P_{\theta} t=\bar{t}_{n}$. Comparing the two preceding displays, we see that the likelihood ratio statistic can be written as $\Lambda_{n}=2 n K\left(\hat{\theta}, \Theta_{0}\right)$, where $K\left(\theta, \Theta_{0}\right)$ is the infimum of $K\left(\theta, \theta_{0}\right)$ over $\theta_{0} \in \Theta_{0}$. This pretty formula can be used to study the asymptotic properties of the likelihood ratio statistic directly. Alternatively, the general results obtained in this chapter are applicable to exponential families.

## *16.2 Taylor Expansion

Write $\hat{\theta}_{n, 0}$ and $\hat{\theta}_{n}$ for the maximum likelihood estimators for $\theta$ if the parameter set is taken equal to $\Theta_{0}$ or $\Theta$, respectively, and set $\ell_{\theta}=\log p_{\theta}$. In this section assume that the true value of the parameter $\vartheta$ is an inner point of $\Theta$. The likelihood ratio statistic can be rewritten as

$$
\Lambda_{n}=-2 \sum_{i=1}^{n}\left(\ell_{\hat{\theta}_{n, 0}}\left(X_{i}\right)-\ell_{\hat{\theta}_{n}}\left(X_{i}\right)\right) .
$$

To find the limit behavior of this sequence of random variables, we might replace $\sum \ell_{\theta}\left(X_{i}\right)$ by its Taylor expansion around the maximum likelihood estimator $\theta=\hat{\theta}_{n}$. If $\theta \mapsto \ell_{\theta}(x)$

[^0]is twice continuously differentiable for every $x$, then there exists a vector $\tilde{\theta}_{n}$ between $\hat{\theta}_{n, 0}$ and $\hat{\theta}_{n}$ such that the preceding display is equal to
$$
-2\left(\hat{\theta}_{n, 0}-\hat{\theta}_{n}\right) \sum_{i=1}^{n} \dot{\ell}_{\hat{\theta}_{n}}\left(X_{i}\right)-\left(\hat{\theta}_{n, 0}-\hat{\theta}_{n}\right)^{T} \sum \ddot{\ell}_{\tilde{\theta}_{n}}\left(X_{i}\right)\left(\hat{\theta}_{n, 0}-\hat{\theta}_{n}\right)
$$

Because $\hat{\theta}_{n}$ is the maximum likelihood estimator in the unrestrained model, the linear term in this expansion vanishes as soon as $\hat{\theta}_{n}$ is an inner point of $\Theta$. If the averages $-n^{-1} \sum \ddot{\ell}_{\tilde{\theta}}\left(X_{i}\right)$ converge in probability to the Fisher information matrix $I_{\vartheta}$ and the sequence $\sqrt{n}\left(\hat{\theta}_{n, 0}-\hat{\theta}_{n}\right)$ is bounded in probability, then we obtain the approximation

$$
\begin{equation*}
\Lambda_{n}=\sqrt{n}\left(\hat{\theta}_{n}-\hat{\theta}_{n, 0}\right)^{T} I_{\vartheta} \sqrt{n}\left(\hat{\theta}_{n}-\hat{\theta}_{n, 0}\right)+o_{P_{\vartheta}}(1) . \tag{16.3}
\end{equation*}
$$

In view of the results of Chapter 5, the latter conditions are reasonable if $\vartheta \in \Theta_{0}$, for then both $\hat{\theta}_{n}$ and $\hat{\theta}_{n, 0}$ can be expected to be $\sqrt{n}$-consistent. The preceding approximation, if it can be justified, sheds some light on the quality of the likelihood ratio test. It shows that, asymptotically, the likelihood ratio test measures a certain distance between the maximum likelihood estimators under the null and the full hypotheses. Such a procedure is intuitively reasonable, even though many other distance measures could be used as well. The use of the likelihood ratio statistic entails a choice as to how to weigh the different "directions" in which the estimators may differ, and thus a choice of weights for "distributing power" over different deviations. This is further studied in section 16.4.

If the null hypothesis is a single point $\Theta_{0}=\left\{\theta_{0}\right\}$, then $\hat{\theta}_{n, 0}=\theta_{0}$, and the quadratic form in the preceding display reduces under $H_{0}: \theta=\theta_{0}$ (i.e., $\vartheta=\theta_{0}$ ) to $\hat{h}_{n} I_{\vartheta} \hat{h}_{n}$ for $\hat{h}_{n}=\sqrt{n}\left(\hat{\theta}_{n}-\right. \vartheta)^{T}$. In view of the results of Chapter 5, the sequence $\hat{h}_{n}$ can be expected to converge in distribution to a variable $\hat{h}$ with a normal $N\left(0, I_{\vartheta}^{-1}\right)$-distribution. Then the sequence $\Lambda_{n}$ converges under the null hypothesis in distribution to the quadratic form $\hat{h}^{T} I_{\vartheta} \hat{h}$. This is the squared length of the standard normal vector $I_{\vartheta}^{1 / 2} \hat{h}$, and possesses a chi-square distribution with $k$ degrees of freedom. Thus the chi-square approximation announced in the introduction follows.

The situation is more complicated if the null hypothesis is composite. If the sequence $\sqrt{n}\left(\hat{\theta}_{n, 0}-\vartheta, \hat{\theta}_{n}-\vartheta\right)$ converges jointly to a variable $\left(\hat{h}_{0}, \hat{h}\right)$, then the sequence $\Lambda_{n}$ is asymptotically distributed as $\left(\hat{h}-\hat{h}_{0}\right)^{T} I_{\vartheta}\left(\hat{h}-\hat{h}_{0}\right)$. A null hypothesis $\Theta_{0}$ that is (a segment of) a lower dimensional affine linear subspace is itself a "regular" parametric model. If it contains $\vartheta$ as a relative inner point, then the maximum likelihood estimator $\hat{\theta}_{n, 0}$ may be expected to be asymptotically normal within this affine subspace, and the pair $\sqrt{n}\left(\hat{\theta}_{n, 0}-\vartheta, \hat{\theta}_{n}-\vartheta\right)$ may be expected to be jointly asymptotically normal. Then the likelihood ratio statistic is asymptotically distributed as a quadratic form in normal variables. Closer inspection shows that this quadratic form possesses a chi-square distribution with $k-l$ degrees of freedom, where $k$ and $l$ are the dimensions of the full and null hypotheses. In comparison with the case of a simple null hypothesis, $l$ degrees of freedom are "lost."

Because we shall rigorously derive the limit distribution by a different approach in the next section, we make this argument precise only in the particular case that the null hypothesis $\Theta_{0}$ consists of all points $\left(\theta_{1}, \ldots, \theta_{l}, 0, \ldots, 0\right)$, if $\theta$ ranges over an open subset $\Theta$ of $\mathbb{R}^{k}$. Then the score function for $\theta$ under the null hypothesis consists of the first $l$ coordinates of the score function $\dot{\ell}_{\vartheta}$ for the whole model, and the information matrix under the null hypothesis is equal to the ( $l \times l$ ) principal submatrix of $I_{\vartheta}$. Write these as $\dot{\ell}_{\vartheta, \leq l}$ and $I_{\vartheta, \leq l, \leq l}$, respectively, and use a similar partitioning notation for other vectors and matrices.

Under regularity conditions we have the linear approximations (see Theorem 5.39)

$$
\begin{aligned}
\sqrt{n}\left(\hat{\theta}_{n, 0, \leq l}-\vartheta_{\leq l}\right) & =\frac{1}{\sqrt{n}} \sum_{i=1}^{n} I_{\vartheta, \leq l, \leq l}^{-1} \dot{\ell}_{\vartheta, \leq l}\left(X_{i}\right)+o_{P_{\vartheta}}(1), \\
\sqrt{n}\left(\hat{\theta}_{n}-\vartheta\right) & =\frac{1}{\sqrt{n}} \sum_{i=1}^{n} I_{\vartheta}^{-1} \dot{\ell}_{\vartheta}\left(X_{i}\right)+o_{P_{\vartheta}}(1) .
\end{aligned}
$$

Given these approximations, the multivariate central limit theorem and Slutsky's lemma yield the joint asymptotic normality of the maximum likelihood estimators. From the form of the asymptotic covariance matrix we see, after some matrix manipulation,

$$
\sqrt{n}\left(\hat{\theta}_{n, \leq l}-\hat{\theta}_{n, 0, \leq l}\right)=-I_{\vartheta, \leq l, \leq l}^{-1} I_{\vartheta, \leq l,>l} \sqrt{n} \hat{\theta}_{n,>l}+o_{P}(1) .
$$

(Alternatively, this approximation follows from a Taylor expansion of $0=\sum_{i=1}^{n} \dot{\ell}_{\hat{\theta}_{n}, \leq l}$ around $\hat{\theta}_{n, 0, \leq l}$.) Substituting this in (16.3) and again carrying out some matrix manipulations, we find that the likelihood ratio statistic is asymptotically equivalent to (see problem 16.5)

$$
\begin{equation*}
\sqrt{n} \hat{\theta}_{n,>l}^{T}\left(\left(I_{\vartheta}^{-1}\right)_{>l,>l}\right)^{-1} \sqrt{n} \hat{\theta}_{n,>l} \tag{16.4}
\end{equation*}
$$

The matrix $\left(I_{\vartheta}^{-1}\right)_{>l,>l}$ is the asymptotic covariance matrix of the sequence $\sqrt{n} \hat{\theta}_{n,>l}$, whence we obtain an asymptotic chi-square distribution with $k-l$ degrees of freedom, by the same argument as before.

We close this section by relating the likelihood ratio statistic to two other test statistics.
Under the simple null hypothesis $\Theta_{0}=\left\{\theta_{0}\right\}$, the likelihood ratio statistic is asymptotically equivalent to both the maximum likelihood statistic (or Wald statistic) and the score statistic. These are given by

$$
n\left(\hat{\theta}_{n}-\theta_{0}\right)^{T} I_{\theta_{0}}\left(\hat{\theta}_{n}-\theta_{0}\right) \quad \text { and } \quad \frac{1}{n}\left[\sum_{i=1}^{n} \dot{\ell}_{\theta_{0}}\left(X_{i}\right)\right]^{T} I_{\theta_{0}}^{-1}\left[\sum_{i=1}^{n} \dot{\ell}_{\theta_{0}}\left(X_{i}\right)\right] .
$$

The Wald statistic is a natural statistic, but it is often criticized for necessarily yielding ellipsoidal confidence sets, even if the data are not symmetric. The score statistic has the advantage that calculation of the supremum of the likelihood is unnecessary, but it appears to perform less well for smaller values of $n$.

In the case of a composite hypothesis, a Wald statistic is given in (16.4) and a score statistic can be obtained by substituting the approximation $n \hat{\theta}_{n,>l} \approx\left(I_{\vartheta}^{-1}\right)_{>l,>l} \sum \dot{\ell}_{\hat{\theta}_{n, 0,>l}}\left(X_{i}\right)$ in (16.4). (This approximation is obtainable from linearizing $\sum\left(\dot{\ell}_{\hat{\theta}_{n}}-\dot{\ell}_{\hat{\theta}_{n, o}}\right)$.) In both cases we also replace the unknown parameter $\vartheta$ by an estimator.

### 16.3 Using Local Asymptotic Normality

An insightful derivation of the asymptotic distribution of the likelihood ratio statistic is based on convergence of experiments. This approach is possible for general experiments, but this section is restricted to the case of local asymptotic normality. The approach applies also in the case that the (local) parameter spaces are not linear.

Introducing the local parameter spaces $H_{n}=\sqrt{n}(\Theta-\vartheta)$ and $H_{n, 0}=\sqrt{n}\left(\Theta_{0}-\vartheta\right)$, we can write the likelihood ratio statistic in the form

$$
\Lambda_{n}=2 \sup _{h \in H_{n}} \log \frac{\prod_{i=1}^{n} p_{\vartheta+h / \sqrt{n}}\left(X_{i}\right)}{\prod_{i=1}^{n} p_{\vartheta}\left(X_{i}\right)}-2 \sup _{h \in H_{n, 0}} \log \frac{\prod_{i=1}^{n} p_{\vartheta+h / \sqrt{n}}\left(X_{i}\right)}{\prod_{i=1}^{n} p_{\vartheta}\left(X_{i}\right)} .
$$

In Chapter 7 it is seen that, for large $n$, the rescaled likelihood ratio process in this display is similar to the likelihood ratio process of the normal experiment $\left(N\left(h, I_{\vartheta}^{-1}\right): h \in \mathbb{R}^{k}\right)$. This suggests that, if the sets $H_{n}$ and $H_{n, 0}$ converge in a suitable sense to sets $H$ and $H_{0}$, the sequence $\Lambda_{n}$ converges in distribution to the random variable $\Lambda$ obtained by substituting the normal likelihood ratios, given by

$$
\Lambda=2 \sup _{h \in H} \log \frac{d N\left(h, I_{\vartheta}^{-1}\right)}{d N\left(0, I_{\vartheta}^{-1}\right)}(X)-2 \sup _{h \in H_{0}} \log \frac{d N\left(h, I_{\vartheta}^{-1}\right)}{d N\left(0, I_{\vartheta}^{-1}\right)}(X) .
$$

This is exactly the likelihood ratio statistic for testing the null hypothesis $H_{0}: h \in H_{0}$ versus the alternative $H_{1}: h \in H-H_{0}$ based on the observation $X$ in the normal experiment. Because the latter experiment is simple, this heuristic is useful not only to derive the asymptotic distribution of the sequence $\Lambda_{n}$, but also to understand the asymptotic quality of the corresponding sequence of tests.

The likelihood ratio statistic for the normal experiment is

$$
\begin{align*}
\Lambda & =\inf _{h \in H_{0}}(X-h)^{T} I_{\vartheta}(X-h)-\inf _{h \in H}(X-h)^{T} I_{\vartheta}(X-h) \\
& =\left\|I_{\vartheta}^{1 / 2} X-I_{\vartheta}^{1 / 2} H_{0}\right\|^{2}-\left\|I_{\vartheta}^{1 / 2} X-I_{\vartheta}^{1 / 2} H\right\|^{2} \tag{16.5}
\end{align*}
$$

The distribution of the sequence $\Lambda_{n}$ under $\vartheta$ corresponds to the distribution of $\Lambda$ under $h=0$. Under $h=0$ the vector $I_{\vartheta}^{1 / 2} X$ possesses a standard normal distribution. The following lemma shows that the squared distance of a standard normal variable to a linear subspace is chi square-distributed and hence explains the chi-square limit when $H_{0}$ is a linear space.
16.6 Lemma. Let $X$ be a $k$-dimensional random vector with a standard normal distribution and let $H_{0}$ be an l-dimensional linear subspace of $\mathbb{R}^{k}$. Then $\left\|X-H_{0}\right\|^{2}$ is chi square-distributed with $k-l$ degrees of freedom.

Proof. Take an orthonormal base of $\mathbb{R}^{k}$ such that the first $l$ elements span $H_{0}$. By Pythagoras' theorem, the squared distance of a vector $z$ to the space $H_{0}$ equals the sum of squares $\sum_{i>l} z_{i}^{2}$ of its last $k-l$ coordinates with respect to this basis. A change of base corresponds to an orthogonal transformation of the coordinates. Because the standard normal distribution is invariant under orthogonal transformations, the coordinates of $X$ with respect to any orthonormal base are independent standard normal variables. Thus $\left\|X-H_{0}\right\|^{2}=\sum_{i>l} X_{i}^{2}$ is chi square-distributed.

If $\vartheta$ is an inner point of $\Theta$, then the set $H$ is the full space $\mathbb{R}^{k}$ and the second term on the right of (16.5) is zero. Thus, if the local null parameter spaces $\sqrt{n}\left(\Theta_{0}-\vartheta\right)$ converge to a linear subspace of dimension $l$, then the asymptotic null distribution of the likelihood ratio statistic is chi-square with $k-l$ degrees of freedom.

The following theorem makes the preceding informal derivation rigorous under the same mild conditions employed to obtain the asymptotic normality of the maximum likelihood estimator in Chapter 5. It uses the following notion of convergence of sets. Write $H_{n} \rightarrow H$ if $H$ is the set of all limits $\lim h_{n}$ of converging sequences $h_{n}$ with $h_{n} \in H_{n}$ for every $n$ and, moreover, the limit $h=\lim _{i} h_{n_{i}}$ of every converging sequence $h_{n_{i}}$ with $h_{n_{i}} \in H_{n_{i}}$ for every $i$ is contained in $H$.
16.7 Theorem. Let the model ( $P_{\theta}: \theta \in \Theta$ ) be differentiable in quadratic mean at $\vartheta$ with nonsingular Fisher information matrix, and suppose that for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\vartheta$ and for a measurable function $\dot{\ell}$ such that $P_{\vartheta} \dot{\ell}^{2}<\infty$,

$$
\left|\log p_{\theta_{1}}(x)-\log p_{\theta_{2}}(x)\right| \leq \dot{\ell}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

If the maximum likelihood estimators $\hat{\theta}_{n, 0}$ and $\hat{\theta}_{n}$ are consistent under $\vartheta$ and the sets $H_{n, 0}$ and $H_{n}$ converge to sets $H_{0}$ and $H$, then the sequence of likelihood ratio statistics $\Lambda_{n}$ converges under $\vartheta+h / \sqrt{n}$ in distribution to $\Lambda$ given in (16.5), for $X$ normally distributed with mean $h$ and covariance matrix $I_{\vartheta}^{-1}$.
*Proof. Let $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P_{\vartheta}\right)$ be the empirical process, and define stochastic processes $\mathbb{Z}_{n}$ by

$$
\mathbb{Z}_{n}(h)=n \mathbb{P}_{n} \log \frac{p_{\vartheta+h / \sqrt{n}}}{p_{\vartheta}}-h^{T} \mathbb{G}_{n} \dot{\ell}_{\vartheta}+\frac{1}{2} h^{T} I_{\vartheta} h .
$$

The differentiability of the model implies that $\mathbb{Z}_{n}(h) \xrightarrow{\mathrm{P}} 0$ for every $h$. In the proof of Theorem 7.12 this is strengthened to the uniform convergence

$$
\sup _{\|h\| \leq M}\left|\mathbb{Z}_{n}(h)\right| \xrightarrow{\mathrm{P}} 0, \quad \text { every } M .
$$

Furthermore, it follows from this proof that both $\hat{\theta}_{n, 0}$ and $\hat{\theta}_{n}$ are $\sqrt{n}$-consistent under $\vartheta$. (These statements can also be proved by elementary arguments, but under stronger regularity conditions.)

The preceding display is also valid for every sequence $M_{n}$ that increases to $\infty$ sufficiently slowly. Fix such a sequence. By the $\sqrt{n}$-consistency, the estimators $\hat{\theta}_{n, 0}$ and $\hat{\theta}_{n}$ are contained in the ball of radius $M_{n} / \sqrt{n}$ around $\vartheta$ with probability tending to 1 . Thus, the limit distribution of $\Lambda_{n}$ does not change if we replace the sets $H_{n}$ and $H_{n, 0}$ in its definition by the sets $H_{n} \cap \operatorname{ball}\left(0, M_{n}\right)$ and $H_{n, 0} \cap \operatorname{ball}\left(0, M_{n}\right)$. These "truncated" sequences of sets still converge to $H$ and $H_{0}$, respectively. Now, by the uniform convergence to zero of the processes $\mathbb{Z}_{n}(h)$ on $H_{n}$ and $H_{n, 0}$, and simple algebra,

$$
\begin{aligned}
\Lambda_{n} & =2 \sup _{h \in H_{n}} n \mathbb{P}_{n} \log \frac{p_{\vartheta+h / \sqrt{n}}}{p_{\vartheta}}-2 \sup _{h \in H_{n, 0}} n \mathbb{P}_{n} \log \frac{p_{\vartheta+h / \sqrt{n}}}{p_{\vartheta}} \\
& =2 \sup _{h \in H_{n}}\left(h^{T} \mathbb{G}_{n} \dot{\ell}_{\vartheta}-\frac{1}{2} h^{T} I_{\vartheta} h\right)-2 \sup _{h \in H_{n, 0}}\left(h^{T} \mathbb{G}_{n} \dot{\ell}_{\vartheta}-\frac{1}{2} h^{T} I_{\vartheta} h\right)+o_{P}(1) \\
& =\left\|I_{\vartheta}^{-1 / 2} \mathbb{G}_{n} \dot{\ell}_{\vartheta}-I_{\vartheta}^{1 / 2} H_{0}\right\|^{2}-\left\|I_{\vartheta}^{-1 / 2} \mathbb{G}_{n} \dot{\ell}_{\vartheta}-I_{\vartheta}^{1 / 2} H\right\|^{2}+o_{P}(1)
\end{aligned}
$$

by Lemma 7.13 (ii) and (iii). The theorem follows by the continuous-mapping theorem.
16.8 Example (Generalized linear models). In a generalized linear model a typical observation $(X, Y)$, consisting of a "covariate vector" $X$ and a "response" $Y$, possesses a density of the form

$$
p_{\beta}(x, y)=e^{y k\left(\beta^{T} x\right) \phi-b \circ k\left(\beta^{T} x\right) \phi} c_{\phi}(y) p_{X}(x)
$$

(It may be more natural to model the covariates as (observed) constants, but to fit the model into our i.i.d. setup, we consider them to be a random sample from a density $p_{X}$.) Thus, given
$X$, the variable $Y$ follows an exponential family density $e^{y \theta \phi-b(\theta) \phi} c_{\phi}(y)$ with parameters $\theta= k\left(\beta^{T} X\right)$ and $\phi$. Using the identities for exponential families based on Lemma 4.5, we obtain

$$
\mathrm{E}_{\beta}(Y \mid X)=b^{\prime} \circ k\left(\beta^{T} X\right), \quad \operatorname{var}_{\beta, \phi}(Y \mid X)=\frac{b^{\prime \prime} \circ k\left(\beta^{T} X\right)}{\phi}
$$

The function $\left(b^{\prime} \circ k\right)^{-1}$ is called the link function of the model and is assumed known. To make the parameter $\beta$ identifiable, we assume that the matrix $\mathrm{E} X X^{T}$ exists and is nonsingular.

To judge the goodness-of-fit of a generalized linear model to a given set of data ( $X_{1}$, $\left.Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$, it is customary to calculate, for fixed $\phi$, the log likelihood ratio statistic for testing the model as described previously within the model in which each $Y_{i}$, given $X_{i}$, still follows the given exponential family density, but in which the parameters $\theta$ (and hence the conditional means $\mathrm{E}\left(Y_{i} \mid X_{i}\right)$ ) are allowed to be arbitrary values $\theta_{i}$, unrelated across the $n$ observations ( $X_{i}, Y_{i}$ ). This statistic, with the parameter $\phi$ set to 1 , is known as the deviance, and takes the form, with $\hat{\beta}_{n}$ the maximum likelihood estimator for $\beta,{ }^{\dagger}$

$$
\begin{aligned}
D\left(\vec{Y}_{n}, \hat{\mu}\right) & =-2 \log \frac{\sup _{\beta} \prod_{i=1}^{n} e^{Y_{i} k\left(\beta^{T} X_{i}\right)-b \circ k\left(\beta^{T} X_{i}\right)}}{\sup _{\theta_{1}, \ldots, \theta_{n}} \prod_{i=1}^{n} e^{Y_{i} \theta_{i}-b\left(\theta_{i}\right)}} \\
& =-2 \sum_{i=1}^{n}\left[Y_{i}\left(k\left(\hat{\beta}_{n}^{T} X_{i}\right)-\left(b^{\prime}\right)^{-1}\left(Y_{i}\right)\right)-b \circ k\left(\hat{\beta}_{n}^{T} X_{i}\right)+b \circ\left(b^{\prime}\right)^{-1}\left(Y_{i}\right)\right]
\end{aligned}
$$

In our present setup, the codimension of the null hypothesis within the "full model" is equal to $n-k$, if $\beta$ is $k$-dimensional, and hence the preceding theory does not apply to the deviance. (This could be different if there are multiple responses for every given covariate and the asymptotics are relative to the number of responses.) On the other hand, the preceding theory allows an "analysis of deviance" to test nested sequences of regression models corresponding to inclusion or exclusion of a given covariate (i.e., column of the regression matrix). For instance, if $D_{i}\left(\vec{Y}_{n}, \hat{\mu}_{(i)}\right)$ is the deviance of the model in which the $i+1, i+2, \ldots, k$ th coordinates of $\beta$ are a priori set to zero, then the difference $D_{i-1}\left(\vec{Y}_{n}, \hat{\mu}_{(i-1)}\right)-D_{i}\left(\vec{Y}_{n}, \hat{\mu}_{(i)}\right)$ is the log likelihood ratio statistic for testing that the $i$ th coordinate of $\beta$ is zero within the model in which all higher coordinates are zero. According to the theory of this chapter, $\phi$ times this statistic is asymptotically chi square-distributed with one degree of freedom under the smaller of the two models.

To see this formally, it suffices to verify the conditions of the preceding theorem. Using the identities for exponential families based on Lemma 4.5, the score function and Fisher information matrix can be computed to be

$$
\begin{aligned}
\dot{\ell}_{\beta}(x, y) & =\left(y-b^{\prime} \circ k\left(\beta^{T} x\right)\right) k^{\prime}\left(\beta^{T} x\right) x, \\
I_{\beta} & =\mathrm{E} b^{\prime \prime} \circ k\left(\beta^{T} X\right) k^{\prime}\left(\beta^{T} X\right)^{2} X X^{T} .
\end{aligned}
$$

Depending on the function $k$, these are very well-behaved functions of $\beta$, because $b$ is a strictly convex, analytic function on the interior of the natural parameter space of the family, as is seen in section 4.2. Under reasonable conditions the function $\sup _{\beta \in U}\left\|\dot{\ell}_{\beta}\right\|$ is

[^1]square-integrable, for every small neighborhood $U$, and the Fisher information is continuous. Thus, the local conditions on the model are easily satisfied.

Proving the consistency of the maximum likelihood estimator may be more involved, depending on the link function. If the parameter $\beta$ is restricted to a compact set, then most approaches to proving consistency apply without further work, including Wald's method, Theorem 5.7, and the classical approach of section 5.7. The last is particularly attractive in the case of canonical link functions, which correspond to setting $k$ equal to the identity. Then the second-derivative matrix $\ddot{\ell}_{\beta}$ is equal to $-b^{\prime \prime}\left(\beta^{T} x\right) x x^{T}$, whence the likelihood is a strictly concave function of $\beta$ whenever the observed covariate vectors are of full rank. Consequently, the point of maximum of the likelihood function is unique and hence consistent under the conditions of Theorem 5.14. †
16.9 Example (Location scale). Suppose we observe a sample from the density $f((x- \mu) / \sigma) / \sigma$ for a given probability density $f$, and a location-scale parameter $\theta=(\mu, \sigma)$ ranging over the set $\Theta=\mathbb{R} \times \mathbb{R}^{+}$. We consider two testing problems.
(i). Testing $H_{0}: \mu=0$ versus $H_{1}: \mu \neq 0$ corresponds to setting $\Theta_{0}=\{0\} \times \mathbb{R}^{+}$. For a given point $\vartheta=(0, \sigma)$ from the null hypothesis the set $\sqrt{n}\left(\Theta_{0}-\vartheta\right)$ equals $\{0\} \times(-\sqrt{n} \sigma, \infty)$ and converges to the linear space $\{0\} \times \mathbb{R}$. Under regularity conditions on $f$, the sequence of likelihood ratio statistics is asymptotically chi square-distributed with 1 degree of freedom.
(ii). Testing $H_{0}: \mu \leq 0$ versus $H_{1}: \mu>0$ corresponds to setting $\Theta_{0}=(-\infty, 0] \times \mathbb{R}^{+}$. For a given point $\vartheta=(0, \sigma)$ on the boundary of the null hypothesis, the sets $\sqrt{n}\left(\Theta_{0}-\right. \vartheta)$ converge to $H_{0}=(-\infty, 0] \times \mathbb{R}$. In this case, the limit distribution of the likelihood ratio statistics is not chi-square but equals the distribution of the square distance of a standard normal vector to the set $I_{\vartheta}^{1 / 2} H_{0}=\left\{h:\left\langle h, I_{\vartheta}^{-1 / 2} e_{1}\right\rangle \leq 0\right\}$. The latter is a half-space with boundary line through the origin. Because a standard normal vector is rotationally symmetric, the distribution of its distance to a half-space of this type does not depend on the orientation of the half-space. Thus the limit distribution is equal to the distribution of the squared distance of a standard normal vector to the half-space $\left\{h: h_{2} \leq 0\right\}$ : the distribution of $(Z \vee 0)^{2}$ for a standard normal variable $Z$. Because $\mathrm{P}\left((Z \vee 0)^{2}>c\right)=\frac{1}{2} \mathrm{P}\left(Z^{2}>c\right)$ for every $c>0$, we must choose the critical value of the test equal to the upper $2 \alpha$-quantile of the chi-square distribution with 1 degree of freedom. Then the asymptotic level of the test is $\alpha$ for every $\vartheta$ on the boundary of the null hypothesis (provided $\alpha<1 / 2$ ).

For a point $\vartheta$ in the interior of the null hypothesis $H_{0}: \mu \leq 0$ the sets $\sqrt{n}\left(\Theta_{0}-\vartheta\right)$ converge to $\mathbb{R} \times \mathbb{R}$ and the sequence of likelihood ratio statistics converges in distribution to the squared distance to the whole space, which is zero. This means that the probability of an error of the first kind converges to zero for every $\vartheta$ in the interior of the null hypothesis. $\square$
16.10 Example (Testing a ball). Suppose we wish to test the null hypothesis $H_{0}:\|\theta\| \leq 1$ that the parameter belongs to the unit ball versus the alternative $H_{1}:\|\theta\|>1$ that this is not case.

If the true parameter $\vartheta$ belongs to the interior of the null hypothesis, then the sets $\sqrt{n}\left(\Theta_{0}-\vartheta\right)$ converge to the whole space, whence the sequence of likelihood ratio statistics converges in distribution to zero.

[^2]For $\vartheta$ on the boundary of the unit ball, the sets $\sqrt{n}\left(\Theta_{0}-\vartheta\right)$ grow to the half-space $H_{0}=\{h:\langle h, \vartheta\rangle \leq 0\}$. The sequence of likelihood ratio statistics converges in distribution to the distribution of the square distance of a standard normal vector to the half-space $I_{\vartheta}^{1 / 2} H_{0}=\left\{h:\left\langle h, I_{\vartheta}^{-1 / 2} \vartheta\right\rangle \leq 0\right\}$. By the same argument as in the preceding example, this is the distribution of $(Z \vee 0)^{2}$ for a standard normal variable $Z$. Once again we find an asymptotic level- $\alpha$ test by using a $2 \alpha$-quantile.
16.11 Example (Testing a range). Suppose that the null hypothesis is equal to the image $\Theta_{0}=g(T)$ of an open subset $T$ of a Euclidean space of dimension $l \leq k$. If $g$ is a homeomorphism, continuously differentiable, and of full rank, then the sets $\sqrt{n}\left(\Theta_{0}-g(\tau)\right)$ converge to the range of the derivative of $g$ at $\tau$, which is a subspace of dimension $l$.

Indeed, for any $\eta \in \mathbb{R}^{l}$ the vectors $\tau+\eta / \sqrt{n}$ are contained in $T$ for sufficiently large $n$, and the sequence $\sqrt{n}(g(\tau+\eta / \sqrt{n})-g(\tau))$ converges to $g_{\tau}^{\prime} \eta$. Furthermore, if a subsequence of $\sqrt{n}\left(g\left(t_{n}\right)-g(\tau)\right)$ converges to a point $h$ for a given sequence $t_{n}$ in $T$, then the corresponding subsequence of $\sqrt{n}\left(t_{n}-\tau\right)$ converges to $\eta=\left(g^{-1}\right)_{g(\tau)}^{\prime} h$ by the differentiability of the inverse mapping $g^{-1}$ and hence $\sqrt{n}\left(g\left(t_{n}\right)-g(\tau)\right) \rightarrow g_{\tau}^{\prime} \eta$. (We can use the rank theorem to give a precise definition of the differentiability of the map $g^{-1}$ on the manifold $g(T)$.)

### 16.4 Asymptotic Power Functions

Because the sequence of likelihood ratio statistics converges to the likelihood ratio statistic in the Gaussian limit experiment, the likelihood ratio test is "asymptotically efficient" in the same way as the likelihood ratio statistic in the limit experiment is "efficient." If the local limit parameter set $H_{0}$ is a half-space or a hyperplane, then the latter test is uniformly most powerful, and hence the likelihood ratio tests are asymptotically optimal (see Proposition 15.2). This is the case, in particular, for testing a simple null hypothesis in a one-dimensional parametric model. On the other hand, if the hypotheses are higherdimensional, then there is often no single best test, not even under reasonable restrictions on the class of admitted tests. For different (one-dimensional) deviations of the null hypothesis, different tests are optimal (see the discussion in Chapter 15). The likelihood ratio test is an omnibus test that gives reasonable power in all directions. In this section we study its local asymptotic power function more closely.

We assume that the parameter $\vartheta$ is an inner point of the parameter set and denote the true parameter by $\vartheta+h / \sqrt{n}$. Under the conditions of Theorem 16.7, the sequence of likelihood ratio statistics is asymptotically distributed as

$$
\Lambda=\left\|Z+I_{\vartheta}^{1 / 2} h-I_{\vartheta}^{1 / 2} H_{0}\right\|^{2}
$$

for a standard normal vector $Z$. Suppose that the limiting local parameter set $H_{0}$ is a linear subspace of dimension $l$, and that the null hypothesis is rejected for values of $\Lambda_{n}$ exceeding the critical value $\chi_{k-l, \alpha}^{2}$. Then the local power functions of the resulting tests satisfy

$$
\pi_{n}\left(\vartheta+\frac{h}{\sqrt{n}}\right)=\mathrm{P}_{\vartheta+h / \sqrt{n}}\left(\Lambda_{n}>\chi_{k-l, \alpha}^{2}\right) \rightarrow \mathrm{P}_{h}\left(\Lambda>\chi_{k-l, \alpha}^{2}\right)=: \pi(h) .
$$

The variable $\Lambda$ is the squared distance of the vector $Z$ to the affine subspace $-I_{\vartheta}^{1 / 2} h+I_{\vartheta}^{1 / 2} H_{0}$. By the rotational invariance of the normal distribution, the distribution of $\Lambda$ does not depend on the orientation of the affine subspace, but only on its codimension and its distance
$\delta=\left\|I_{\vartheta}^{1 / 2} h-I_{\vartheta}^{1 / 2} H_{0}\right\|$ to the origin. This distribution is known as the noncentral chi-square distribution with noncentrality parameter $\delta$. Thus

$$
\pi(h)=\mathrm{P}\left(\chi_{k-l}^{2}\left(\left\|I_{\vartheta}^{1 / 2} h-I_{\vartheta}^{1 / 2} H_{0}\right\|\right)>\chi_{k-l, \alpha}^{2}\right) .
$$

The noncentral chi-square distributions are stochastically increasing in the noncentrality parameter. It follows that the likelihood ratio test has good (local) power at $h$ that yield a large value of the noncentrality parameter.

The shape of the asymptotic power function is easiest to understand in the case of a simple null hypothesis. Then $H_{0}=\{0\}$, and the noncentrality parameter reduces to the square root of $h^{T} I_{\vartheta} h$. For $h=\mu h_{e}$ equal to a multiple of an eigenvector $h_{e}$ (of unit norm) of $I_{\vartheta}$ with eigenvalue $\lambda_{e}$, the noncentrality parameter equals $\sqrt{\lambda_{e}} \mu$. The asymptotic power function in the direction of $h_{e}$ equals

$$
\pi\left(\mu h_{e}\right)=\mathrm{P}\left(\chi_{k}^{2}\left(\sqrt{\lambda}_{e} \mu\right)>\chi_{k, \alpha}^{2}\right) .
$$

The test performs best for departures from the null hypothesis in the direction of the eigenvector corresponding to the largest eigenvalue. Even though the likelihood ratio test gives power in all directions, it does not treat the directions equally. This may be worrisome if the eigenvalues are very inhomogeneous.

Further insight is gained by comparing the likelihood ratio test to tests that are designed to be optimal in given directions. Let $X$ be an observation in the limit experiment, having a $N\left(h, I_{\vartheta}^{-1}\right)$-distribution. The test that rejects the null hypothesis $H_{0}=\{0\}$ if $\left|\sqrt{\lambda_{e}} h_{e}^{T} X\right|> z_{\alpha / 2}$ has level $\alpha$ and power function

$$
\pi_{h_{e}}\left(\mu h_{e}\right)=\mathrm{P}\left(\chi_{1}^{2}\left(\sqrt{\lambda}_{e} \mu\right)>\chi_{1, \alpha}^{2}\right) .
$$

For large $k$ this is a considerably better power function than the power function of the likelihood ratio test (Figure 16.1), but the forms of the power functions are similar. In particular, the optimal power functions show a similar dependence on the eigenvalues of

![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-024.jpg?height=2378&width=3784&top_left_y=6018&top_left_x=984)
Figure 16.1. The functions $\mu^{2} \rightarrow \mathbf{P}\left(\chi_{k}^{2}(\mu)>\chi_{k, \alpha}^{2}\right)$ for $k=1$ (solid), $k=5$ (dotted) and $k=15$ (dashed), respectively, for $\alpha=0.05$.

the covariance matrix. In this sense, the apparently unequal distribution of power over the different directions is not unfair in that it reflects the intrinsic difficulty of detecting changes in different directions. This is not to say that we should never change the (automatic) emphasis given by the likelihood ratio test.

### 16.5 Bartlett Correction

The chi-square approximation to the distribution of the likelihood ratio statistic is relatively accurate but can be much improved by a correction. This was first noted in the example of testing for inequality of the variances in the one-way layout by Bartlett and has since been generalized. Although every approximation can be improved, the Bartlett correction appears to enjoy a particular popularity.

The correction takes the form of a correction of the (asymptotic) mean of the likelihood ratio statistic. In regular cases the distribution of the likelihood ratio statistic is asymptotically chi-square with, say, $r$ degrees of freedom, whence its mean ought to be approximately equal to $r$. Bartlett's correction is intended to make the mean exactly equal to $r$, by replacing the likelihood ratio statistic $\Lambda_{n}$ by

$$
\frac{r \Lambda_{n}}{\mathrm{E}_{\theta_{0}} \Lambda_{n}} .
$$

The distribution of this statistic is next approximated by a chi-square distribution with $r$ degrees of freedom. Unfortunately, the mean $\mathrm{E}_{\theta_{0}} \Lambda_{n}$ may be hard to calculate, and may depend on an unknown null parameter $\theta_{0}$. Therefore, one first obtains an expression for the mean of the form

$$
\mathrm{E}_{\theta_{0}} \Lambda_{n}=1+\frac{b\left(\theta_{0}\right)}{n}+\cdots .
$$

Next, with $\hat{b}_{n}$ an appropriate estimator for the parameter $b\left(\theta_{0}\right)$, the corrected statistic takes the form

$$
\frac{r \Lambda_{n}}{1+\hat{b}_{n} / n} .
$$

The surprising fact is that this recipe works in some generality. Ordinarily, improved approximations would be obtained by writing down and next inverting an Edgeworth expansion of the probabilities $\mathrm{P}\left(\Lambda_{n} \leq x\right)$; the correction would depend on $x$. In the present case this is equivalent to a simple correction of the mean, independent of $x$. The technical reason is that the polynomial in $x$ in the ( $1 / n$ )-term of the Edgeworth expansion is of degree $1 .^{\dagger}$

## *16.6 Bahadur Efficiency

The claim in the Section 16.4 that in many situations "asymptotically optimal" tests do not exist refers to the study of efficiency relative to the local Gaussian approximations described

[^3]in Chapter 7. The purpose of this section is to show that, under regularity conditions, the likelihood ratio test is asymptotically optimal in a different setting, the one of Bahadur efficiency.

For simplicity we restrict ourselves to the testing of finite hypotheses. Given finite sets $\mathcal{P}_{0}$ and $\mathcal{P}_{1}$ of probability measures on a measurable space ( $\mathcal{X}, \mathcal{A}$ ) and a random sample $X_{1}, \ldots, X_{n}$, we study the log likelihood ratio statistic

$$
\tilde{\Lambda}_{n}=\log \frac{\sup _{Q \in \mathcal{P}_{1}} \prod_{i=1}^{n} q\left(X_{i}\right)}{\sup _{P \in \mathcal{P}_{0}} \prod_{i=1}^{n} p\left(X_{i}\right)}
$$

More general hypotheses can be treated, under regularity conditions, by finite approximation (see e.g., Section 10 of [4]).

The observed level of a test that rejects for large values of a statistic $T_{n}$ is defined as

$$
L_{n}=\sup _{P \in \mathcal{P}_{0}} \mathrm{P}_{P}\left(T_{n} \geq t\right)_{\mid t=T_{n}}
$$

The test that rejects the null hypothesis if $L_{n} \leq \alpha$ has level $\alpha$. The power of this test is maximal if $L_{n}$ is "minimal" under the alternative (in a stochastic sense). The Bahadur slope under the alternative $Q$ is defined as the limit in probability under $Q$ (if it exists) of the sequence $(-2 / n) \log L_{n}$. If this is "large," then $L_{n}$ is small and hence we prefer sequences of test statistics that have a large slope. The same conclusion is reached in section 14.4 by considering the asymptotic relative Bahadur efficiencies. It is indicated there that the Neyman-Pearson tests for testing the simple null and alternative hypotheses $P$ and $Q$ have Bahadur slope $-2 Q \log (p / q)$. Because these are the most powerful tests, this is the maximal slope for testing $P$ versus $Q$. (We give a precise proof in the following theorem.) Consequently, the slope for a general null hypothesis cannot be bigger than $\inf _{P \in \mathcal{P}_{0}}-2 Q \log (p / q)$. The sequence of likelihood ratio statistics attains equality, even if the alternative hypothesis is composite.
16.12 Theorem. The Bahadur slope of any sequence of test statistics for testing an arbitrary null hypothesis $H_{0}: P \in \mathcal{P}_{0}$ versus a simple alternative $H_{1}: P=Q$ is bounded above by $\inf _{P \in \mathcal{P}_{0}}-2 Q \log (p / q)$, for any probability measure $Q$. If $\mathcal{P}_{0}$ and $\mathcal{P}_{1}$ are finite sets of probability measures, then the sequence of likelihood ratio statistics for testing $H_{0}: P \in \mathcal{P}_{0}$ versus $H_{1}: P \in \mathcal{P}_{1}$ attains equality for every $Q \in \mathcal{P}_{1}$.

Proof. Because the observed level is a supremum over $\mathcal{P}_{0}$, it suffices to prove the upper bound of the theorem for a simple null hypothesis $\mathcal{P}_{0}=\{P\}$. If $-2 Q \log (p / q)=\infty$, then there is nothing to prove. Thus, we can assume without loss of generality that $Q$ is absolutely continuous with respect to $P$. Write $\Lambda_{n}$ for $\log \prod_{i=1}^{n}(q / p)\left(X_{i}\right)$. Then, for any constants $B>A>Q \log (q / p)$,

$$
\begin{aligned}
\mathrm{P}_{Q}\left(L_{n}<e^{-n B}, \Lambda_{n}<n A\right) & =\mathrm{E}_{P} 1\left\{L_{n}<e^{-n B}, \Lambda_{n}<n A\right\} e^{\Lambda_{n}} \\
& \leq e^{n A} \mathrm{P}_{P}\left(L_{n}<e^{-n B}\right) .
\end{aligned}
$$

Because $L_{n}$ is superuniformly distributed under the null hypothesis, the last expression is bounded above by $\exp -n(B-A)$. Thus, the sum of the probabilities on the left side over $n \in \mathbb{N}$ is finite, whence $-(2 / n) \log L_{n} \leq 2 B$ or $\Lambda_{n} \geq n A$ for all sufficiently large $n$, almost surely under $Q$, by the Borel-Cantelli lemma. Because the sequence $n^{-1} \Lambda_{n}$
converges almost surely under $Q$ to $Q \log (q / p)<A$, by the strong law of large numbers, the second possibility can occur only finitely many times. It follows that $-(2 / n) \log L_{n} \leq 2 B$ eventually, almost surely under $Q$. This having been established for any $B>Q \log (q / p)$, the proof of the first assertion is complete.

To prove that the likelihood ratio statistic attains equality, it suffices to prove that its slope is bigger than the upper bound. Write $\tilde{\Lambda}_{n}$ for the log likelihood ratio statistic, and write $\sup _{P}$ and $\sup _{Q}$ for suprema over the null and alternative hypotheses. Because $(1 / n) \tilde{\Lambda}_{n}$ is bounded above by $\sup _{Q} \mathbb{P}_{n} \log (q / p)$, we have, by Markov's inequality,

$$
\mathrm{P}_{P}\left(\frac{1}{n} \tilde{\Lambda}_{n} \geq t\right) \leq \sum_{Q} \mathrm{P}_{P}\left(\mathbb{P}_{n} \log \frac{q}{p} \geq t\right) \leq\left|\mathcal{P}_{1}\right| \max _{Q} e^{-n t} \mathrm{E}_{P} e^{n \mathbb{P}_{n} \log (q / p)}
$$

The expectation on the right side is the $n$th power of the integral $\int(q / p) d P=Q(p>0) \leq$ 1. Take logarithms left and right and multiply with $-(2 / n)$ to find that

$$
-\frac{2}{n} \log P_{P}\left(\frac{1}{n} \tilde{\Lambda}_{n} \geq t\right) \geq 2 t-\frac{2 \log \left|\mathcal{P}_{1}\right|}{n}
$$

Because this is valid uniformly in $t$ and $P$, we can take the infimum over $P$ on the left side; next evaluate the left and right sides at $t=(1 / n) \tilde{\Lambda}_{n}$. By the law of large numbers, $\mathbb{P}_{n} \log (q / p) \rightarrow Q \log (q / p)$ almost surely under $Q$, and this remains valid if we first add the infimum over the (finite) set $\mathcal{P}_{0}$ on both sides. Thus, the limit inferior of the sequence $(1 / n) \tilde{\Lambda}_{n} \geq \inf _{p} \mathbb{P}_{n} \log (q / p)$ is bounded below by $\inf _{P} Q \log (q / p)$ almost surely under $Q$, where we interpret $Q \log (q / p)$ as $\infty$ if $Q(p=0)>0$. Insert this lower bound in the preceding display to conclude that the Bahadur slope of the likelihood ratio statistics is bounded below by $2 \inf _{P} Q \log (q / p)$.

## Notes

The classical references on the asymptotic null distribution of likelihood ratio statistic are papers by Chernoff [21] and Wilks [150]. Our main theorem appears to be better than Chernoff's, who uses the "classical regularity conditions" and a different notion of approximation of sets, but is not essentially different. Wilks' treatment would not be acceptable to present-day referees but maybe is not so different either. He appears to be saying that we can replace the original likelihood by the likelihood for having observed only the maximum likelihood estimator (the error is asymptotically negligible), next refers to work by Doob to infer that this is a Gaussian likelihood, and continues to compute the likelihood ratio statistic for a Gaussian likelihood, which is easy, as we have seen. The approach using a Taylor expansion and the asymptotic distributions of both likelihood estimators is one way to make the argument rigorous, but it seems to hide the original intuition.

Bahadur [3] presented the efficiency of the likelihood ratio statistic at the fifth Berkeley symposium. Kallenberg [84] shows that the likelihood ratio statistic remains asymptotically optimal in the setting in which both the desired level and the alternative tend to zero, at least in exponential families. As the proof of Theorem 16.12 shows, the composite nature of the alternative hypothesis "disappears" elegantly by taking $(1 / n) \log$ of the error probabilities too elegantly to attach much value to this type of optimality?

## PROBLEMS

1. Let $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ be a sample from the bivariate normal distribution with mean vector ( $\mu, \nu$ ) and covariance matrix the diagonal matrix with entries $\sigma^{2}$ and $\tau^{2}$. Calculate (or characterize) the likelihood ratio statistic for testing $H_{0}: \mu=\nu$ versus $H_{1}: \mu \neq \nu$.
2. Let $N$ be a $k r$-dimensional multinomial variable written as a ( $k \times r$ ) matrix ( $N_{i j}$ ). Calculate the likelihood ratio statistic for testing the null hypothesis of independence $H_{0}: p_{i j}=p_{i \cdot} p_{\cdot j}$ for every $i$ and $j$. Here the dot denotes summation over all columns and rows, respectively. What is the limit distribution under the null hypothesis?
3. Calculate the likelihood ratio statistic for testing $H_{0}: \mu=\nu$ based on independent samples of size $n$ from multivariate normal distributions $N_{r}(\mu, \Sigma)$ and $N_{r}(\nu, \Sigma)$. The matrix $\Sigma$ is unknown. What is the limit distribution under the null hypothesis?
4. Calculate the likelihood ratio statistic for testing $H_{0}: \mu_{1}=\cdots=\mu_{k}$ based on $k$ independent samples of size $n$ from $N\left(\mu_{j}, \sigma^{2}\right)$-distributions. What is the asymptotic distribution under the null hypothesis?
5. Show that $\left(I_{\vartheta}^{-1}\right)_{>l,>l}$ is the inverse of the matrix $I_{\vartheta,>l,>l}-I_{\vartheta,>l, \leq l} I_{\vartheta, \leq l, \leq l}^{-1} I_{\vartheta, \leq l,>l}$.
6. Study the asymptotic distribution of the sequence $\tilde{\Lambda}_{n}$ if the true parameter is contained in both the null and alternative hypotheses.
7. Study the asymptotic distribution of the likelihood ratio statistics for testing the hypothesis $H_{0}: \sigma=-\tau$ based on a sample of size $n$ from the uniform distribution on $[\sigma, \tau]$. Does the asymptotic distribution correspond to a likelihood ratio statistic in a limit experiment?

## 17

## Chi-Square Tests

> The chi-square statistic for testing hypotheses concerning multinomial distributions derives its name from the asymptotic approximation to its distribution. Two important applications are the testing of independence in a two-way classification and the testing of goodness-of-fit. In the second application the multinomial distribution is created artificially by grouping the data, and the asymptotic chi-square approximation may be lost if the original data are used to estimate nuisance parameters.

### 17.1 Quadratic Forms in Normal Vectors

The chi-square distribution with $k$ degrees of freedom is (by definition) the distribution of $\sum_{i=1}^{k} Z_{i}^{2}$ for i.i.d. $N(0,1)$-distributed variables $Z_{1}, \ldots, Z_{k}$. The sum of squares is the squared norm $\|Z\|^{2}$ of the standard normal vector $Z=\left(Z_{1}, \ldots, Z_{k}\right)$. The following lemma gives a characterization of the distribution of the norm of a general zero-mean normal vector.
17.1 Lemma. If the vector $X$ is $N_{k}(0, \Sigma)$-distributed, then $\|X\|^{2}$ is distributed as $\sum_{i=1}^{k} \lambda_{i} Z_{i}^{2}$ for i.i.d. $N(0,1)$-distributed variables $Z_{1}, \ldots, Z_{k}$ and $\lambda_{1}, \ldots, \lambda_{k}$ the eigenvalues of $\Sigma$.

Proof. There exists an orthogonal matrix $O$ such that $O \Sigma O^{T}=\operatorname{diag}\left(\lambda_{i}\right)$. Then the vector $O X$ is $N_{k}\left(0, \operatorname{diag}\left(\lambda_{i}\right)\right)$-distributed, which is the same as the distribution of the vector $\left(\sqrt{\lambda_{1}} Z_{1}, \ldots, \sqrt{\lambda_{k}} Z_{k}\right)$. Now $\|X\|^{2}=\|O X\|^{2}$ has the same distribution as $\sum\left(\sqrt{\lambda_{i}} Z_{i}\right)^{2}$. $\square$

The distribution of a quadratic form of the type $\sum_{i=1}^{k} \lambda_{i} Z_{i}^{2}$ is complicated in general. However, in the case that every $\lambda_{i}$ is either 0 or 1 , it reduces to a chi-square distribution. If this is not naturally the case in an application, then a statistic is often transformed to achieve this desirable situation. The definition of the Pearson statistic illustrates this.

### 17.2 Pearson Statistic

Suppose that we observe a vector $X_{n}=\left(X_{n, 1}, \ldots, X_{n, k}\right)$ with the multinomial distribution corresponding to $n$ trials and $k$ classes having probabilities $p=\left(p_{1}, \ldots, p_{k}\right)$. The Pearson
statistic for testing the null hypothesis $H_{0}: p=a$ is given by

$$
C_{n}(a)=\sum_{i=1}^{k} \frac{\left(X_{n, i}-n a_{i}\right)^{2}}{n a_{i}} .
$$

We shall show that the sequence $C_{n}(a)$ converges in distribution to a chi-square distribution if the null hypothesis is true. The practical relevance is that we can use the chi-square table to find critical values for the test. The proof shows why Pearson divided the squares by $n a_{i}$ and did not propose the simpler statistic $\left\|X_{n}-n a\right\|^{2}$.
17.2 Theorem. If the vectors $X_{n}$ are multinomially distributed with parameters $n$ and $a=\left(a_{1}, \ldots, a_{k}\right)>0$, then the sequence $C_{n}(a)$ converges under $a$ in distribution to the $\chi_{k-1}^{2}$-distribution.

Proof. The vector $X_{n}$ can be thought of as the sum of $n$ independent multinomial vectors $Y_{1}, \ldots, Y_{n}$ with parameters 1 and $a=\left(a_{1}, \ldots, a_{k}\right)$. Then

$$
\mathrm{E} Y_{i}=a, \quad \operatorname{Cov} Y_{i}=\left(\begin{array}{cccc}
a_{1}\left(1-a_{1}\right) & -a_{1} a_{2} & \cdots & -a_{1} a_{k} \\
-a_{2} a_{1} & a_{2}\left(1-a_{2}\right) & \cdots & -a_{2} a_{k} \\
\vdots & \vdots & & \vdots \\
-a_{k} a_{1} & -a_{k} a_{2} & \cdots & a_{k}\left(1-a_{k}\right)
\end{array}\right) .
$$

By the multivariate central limit theorem, the sequence $n^{-1 / 2}\left(X_{n}-n a\right)$ converges in distribution to the $N_{k}\left(0, \operatorname{Cov} Y_{1}\right)$-distribution. Consequently, with $\sqrt{a}$ the vector with coordinates $\sqrt{a_{i}}$,

$$
\left(\frac{X_{n, 1}-n a_{1}}{\sqrt{n a_{1}}}, \ldots, \frac{X_{n, k}-n a_{k}}{\sqrt{n a_{k}}}\right) \rightsquigarrow N\left(0, I-\sqrt{a} \sqrt{a}^{T}\right) .
$$

Because $\sum a_{i}=1$, the matrix $I-\sqrt{a} \sqrt{a}^{T}$ has eigenvalue 0 , of multiplicity 1 (with eigenspace spanned by $\sqrt{a}$ ), and eigenvalue 1 , of multiplicity ( $k-1$ ) (with eigenspace equal to the orthocomplement of $\sqrt{a}$ ). An application of the continuous-mapping theorem and next Lemma 17.1 conclude the proof.

The number of degrees of freedom in the chi-squared approximation for Pearson's statistic is the number of cells of the multinomial vector that have positive probability. However, the quality of the approximation also depends on the size of the cell probabilities $a_{j}$. For instance, if 1001 cells have null probabilities $10^{-23}, \ldots, 10^{-23}, 1-10^{-20}$, then it is clear that for moderate values of $n$ all cells except one are empty, and a huge value of $n$ is necessary to make a $\chi_{1000}^{2}$-approximation work. As a rule of thumb, it is often advised to choose the partitioning sets such that each number $n a_{j}$ is at least 5 . This criterion depends on the (possibly unknown) null distribution and is not the same as saying that the number of observations in each cell must satisfy an absolute lower bound, which could be very unlikely if the null hypothesis is false. The rule of thumb means to protect the level.

The Pearson statistic is oddly asymmetric in the observed and the true frequencies (which is motivated by the form of the asymptotic covariance matrix). One method to symmetrize
the statistic leads to the Hellinger statistic

$$
H_{n}^{2}(a)=4 \sum_{i=1}^{k} \frac{\left(X_{n, i}-n a_{i}\right)^{2}}{\left(\sqrt{X_{n, i}}+\sqrt{n a_{i}}\right)^{2}}=4 \sum_{i=1}^{n}\left(\sqrt{X_{n, i}}-\sqrt{n a_{i}}\right)^{2} .
$$

Up to a multiplicative constant this is the Hellinger distance between the discrete probability distributions on $\{1, \ldots, k\}$ with probability vectors $a$ and $X_{n} / n$, respectively. Because $X_{n} / n-a \xrightarrow{\mathrm{P}} 0$, the Hellinger statistic is asymptotically equivalent to the Pearson statistic.

### 17.3 Estimated Parameters

Chi-square tests are used quite often, but usually to test more complicated hypotheses. If the null hypothesis of interest is composite, then the parameter $a$ is unknown and cannot be used in the definition of a test statistic. A natural extension is to replace the parameter by an estimate $\hat{a}_{n}$ and use the statistic

$$
C_{n}\left(\hat{a}_{n}\right)=\sum_{i=1}^{k} \frac{\left(X_{n, i}-n \hat{a}_{n, i}\right)^{2}}{n \hat{a}_{n, i}}
$$

The estimator $\hat{a}_{n}$ is constructed to be a good estimator if the null hypothesis is true. The asymptotic distribution of this modified Pearson statistic is not necessarily chi-square but depends on the estimators $\hat{a}_{n}$ being used. Most often the estimators are asymptotically normal, and the statistics

$$
\frac{X_{n, i}-n \hat{a}_{n, i}}{\sqrt{n \hat{a}_{n, i}}}=\frac{X_{n, i}-n a_{n, i}}{\sqrt{n \hat{a}_{n, i}}}-\frac{\sqrt{n}\left(\hat{a}_{n, i}-a_{n, i}\right)}{\sqrt{\hat{a}_{n, i}}}
$$

are asymptotically normal as well. Then the modified chi-square statistic is asymptotically distributed as a quadratic form in a multivariate-normal vector. In general, the eigenvalues determining this form are not restricted to 0 or 1 , and their values may depend on the unknown parameter. Then the critical value cannot be taken from a table of the chi-square distribution. There are two popular possibilities to avoid this problem.

First, the Pearson statistic is a certain quadratic form in the observations that is motivated by the asymptotic covariance matrix of a multinomial vector. If the parameter $a$ is estimated, the asymptotic covariance matrix changes in form, and it is natural to change the quadratic form in such a way that the resulting statistic is again chi-square distributed. This idea leads to the Rao-Robson-Nikulin modification of the Pearson statistic, of which we discuss an example in section 17.5.

Second, we can retain the form of the Pearson statistic but use special estimators $\hat{a}$. In particular, the maximum likelihood estimator based on the multinomial vector $X_{n}$, or the minimum-chi square estimator $\bar{a}_{n}$ defined by, with $\mathcal{P}_{0}$ being the null hypothesis,

$$
\sum_{i=1}^{k} \frac{\left(X_{n, i}-n \bar{a}_{n, i}\right)^{2}}{n \bar{a}_{n, i}}=\inf _{p \in \mathcal{P}_{0}} \sum_{i=1}^{k} \frac{\left(X_{n, i}-n p_{i}\right)^{2}}{n p_{i}}
$$

The right side of this display is the "minimum-chi square distance" of the observed frequencies to the null hypothesis and is an intuitively reasonable test statistic. The null hypothesis
is rejected if the distance of the observed frequency vector $X_{n} / n$ to the set $\mathcal{P}_{0}$ is large. A disadvantage is greater computational complexity.

These two modifications, using the minimum-chi square estimator or the maximum likelihood estimator based on $X_{n}$, may seem natural but are artificial in some applications. For instance, in goodness-of-fit testing, the multinomial vector is formed by grouping the "raw data," and it is more natural to base the estimators on the raw data rather than on the grouped data. On the other hand, using the maximum likelihood or minimum-chi square estimator based on $X_{n}$ has the advantage of a remarkably simple limit theory: If the null hypothesis is "locally linear," then the modified Pearson statistic is again asymptotically chi-square distributed, but with the number of degrees of freedom reduced by the (local) dimension of the estimated parameter.

This interesting asymptotic result is most easily explained in terms of the minimumchi square statistic, as the loss of degrees of freedom corresponds to a projection (i.e., a minimum distance) of the limiting normal vector. We shall first show that the two types of modifications are asymptotically equivalent and are asymptotically equivalent to the likelihood ratio statistic as well. The likelihood ratio statistic for testing the null hypothesis $H_{0}: p \in \mathcal{P}_{0}$ is given by (see Example 16.1)

$$
L_{n}\left(\hat{a}_{n}\right)=\inf _{p \in \mathcal{P}_{0}} L_{n}(p), \quad L_{n}(p)=2 \sum_{i=1}^{k} X_{n, i} \log \frac{X_{n, i}}{n p_{i}}
$$

17.3 Lemma. Let $\mathcal{P}_{0}$ be a closed subset of the unit simplex, and let $\hat{a}_{n}$ be the maximum likelihood estimator of $a$ under the null hypothesis $H_{0}: a \in \mathcal{P}_{0}$ (based on $X_{n}$ ). Then

$$
\inf _{p \in \mathcal{P}_{0}} \sum_{i=1}^{k} \frac{\left(X_{n, i}-n p_{i}\right)^{2}}{n p_{i}}=C_{n}\left(\hat{a}_{n}\right)+o_{P}(1)=L_{n}\left(\hat{a}_{n}\right)+o_{P}(1)
$$

Proof. Let $\bar{a}_{n}$ be the minimum-chi square estimator of $a$ under the null hypothesis. Both sequences of estimators $\bar{a}_{n}$ and $\hat{a}_{n}$ are $\sqrt{n}$-consistent. For the maximum likelihood estimator this follows from Corollary 5.53. The minimum-chi square estimator satisfies by its definition

$$
\sum_{i=1}^{k} \frac{\left(X_{n, i}-n \bar{a}_{n, i}\right)^{2}}{n \bar{a}_{n, i}} \leq \sum_{i=1}^{k} \frac{\left(X_{n, i}-n a_{i}\right)^{2}}{n a_{i}}=O_{P}(1) .
$$

This implies that each term in the sum on the left is $O_{P}(1)$, whence $n\left|\bar{a}_{n, i}-a_{i}\right|^{2}= O_{P}\left(\bar{a}_{n, i}\right)+O_{P}\left(\left|X_{n, i}-n a_{i}\right|^{2} / n\right)$ and hence the $\sqrt{n}$-consistency.

Next, the two-term Taylor expansion $\log (1+x)=x-\frac{1}{2} x^{2}+o\left(x^{2}\right)$ combined with Lemma 2.12 yields, for any $\sqrt{n}$-consistent estimator sequence $\hat{p}_{n}$,

$$
\begin{aligned}
\sum_{i=1}^{k} X_{n, i} \log \frac{X_{n, i}}{n \hat{p}_{n, i}} & =-\sum_{i=1}^{k} X_{n, i}\left(\frac{n \hat{p}_{n, i}}{X_{n, i}}-1\right)+\frac{1}{2} \sum_{i=1}^{k} X_{n, i}\left(\frac{n \hat{p}_{n, i}}{X_{n, i}}-1\right)^{2}+o_{P}(1) \\
& =0+\frac{1}{2} \sum_{i=1}^{k} \frac{\left(X_{n, i}-n \hat{p}_{n, i}\right)^{2}}{X_{n, i}}+o_{P}(1)
\end{aligned}
$$

In the last expression we can also replace $X_{n, i}$ in the denominator by $n \hat{p}_{n, i}$, so that we find the relation $L_{n}\left(\hat{p}_{n}\right)=C_{n}\left(\hat{p}_{n}\right)$ between the likelihood ratio and the Pearson statistic, for
every $\sqrt{n}$-consistent estimator sequence $\hat{p}_{n}$. By the definitions of $\bar{a}_{n}$ and $\hat{a}_{n}$, we conclude that, up to $o_{P}(1)$-terms, $C_{n}\left(\bar{a}_{n}\right) \leq C_{n}\left(\hat{a}_{n}\right)=L_{n}\left(\hat{a}_{n}\right) \leq L_{n}\left(\bar{a}_{n}\right)=C_{n}\left(\bar{a}_{n}\right)$. The lemma follows.

The asymptotic behavior of likelihood ratio statistics is discussed in general in Chapter 16. In view of the preceding lemma, we can now refer to this chapter to obtain the asymptotic distribution of the chi-square statistics. Alternatively, a direct study of the minimum-chi square statistic gives additional insight (and a more elementary proof).

As in Chapter 16, say that a sequence of sets $H_{n}$ converges to a set $H$ if $H$ is the set of all limits $\lim h_{n}$ of converging sequences $h_{n}$ with $h_{n} \in H_{n}$ for every $n$ and, moreover, the limit $h=\lim _{i} h_{n_{i}}$ of every converging subsequence $h_{n_{i}}$ with $h_{n_{i}} \in H_{n_{i}}$ for every $i$ is contained in $H$.
17.4 Theorem. Let $\mathcal{P}_{0}$ be a subset of the unit simplex such that the sequence of sets $\sqrt{n}\left(\mathcal{P}_{0}-a\right)$ converges to a set $H$ (in $\mathbb{R}^{k}$ ), and suppose that $a>0$. Then, under $a$,

$$
\inf _{p \in \mathcal{P}_{0}} \sum_{i=1}^{k} \frac{\left(X_{n, i}-n p_{i}\right)^{2}}{n p_{i}} \leadsto \inf _{h \in H}\left\|X-\frac{1}{\sqrt{a}} H\right\|^{2},
$$

for a vector $X$ with the $N\left(0, I-\sqrt{a} \sqrt{a}^{T}\right)$-distribution. Here $(1 / \sqrt{a}) H$ is the set of vectors $\left(h_{1} / \sqrt{a_{1}}, \ldots, h_{k} / \sqrt{a_{k}}\right)$ as $h$ ranges over $H$.
17.5 Corollary. Let $\mathcal{P}_{0}$ be a subset of the unit simplex such that the sequence of sets $\sqrt{n}\left(\mathcal{P}_{0}-a\right)$ converges to a linear subspace of dimension $l\left(\right.$ of $\left.\mathbb{R}^{k}\right)$, and let $a>0$. Then both the sequence of minimum-chi square statistics and the sequence of modified Pearson statistics $C_{n}\left(\hat{a}_{n}\right)$ converge in distribution to the chi-square distribution with $k-1-l$ degrees of freedom.

Proof. Because the minimum-chi square estimator $\bar{a}_{n}$ (relative to $\overline{\mathcal{P}}_{0}$ ) is $\sqrt{n}$-consistent, the asymptotic distribution of the minimum-chi square statistic is not changed if we replace $n \bar{a}_{n, i}$ in its denominator by the true value $n a_{i}$. Next, we decompose,

$$
\frac{X_{n, i}-n p_{i}}{\sqrt{n a_{i}}}=\frac{X_{n, i}-n a_{i}}{\sqrt{n a_{i}}}-\frac{\sqrt{n}\left(p_{i}-a_{i}\right)}{\sqrt{a_{i}}} .
$$

The first vector on the right converges in distribution to $X$. The (modified) minimum-chi square statistics are the distances of these vectors to the sets $H_{n}=\sqrt{n}\left(\mathcal{P}_{0}-a\right) / \sqrt{a}$, which converge to the set $H / \sqrt{a}$. The theorem now follows from Lemma 7.13.

The vector $X$ is distributed as $Z-\Pi_{\sqrt{a}} Z$ for $\Pi_{\sqrt{a}}$ the projection onto the linear space spanned by the vector $\sqrt{a}$ and $Z$ a $k$-dimensional standard normal vector. Because every element of $H$ is the limit of a multiple of differences of probability vectors, $1^{T} h=0$ for every $h \in H$. Therefore, the space $(1 / \sqrt{a}) H$ is orthogonal to the vector $\sqrt{a}$, and $\Pi_{\sqrt{a}}=0$ for $\Pi$ the projection onto the space $(1 / \sqrt{a}) H$. The distance of $X$ to the space $(1 / \sqrt{a}) H$ is equal to the norm of $X-\Pi X$, which is distributed as the norm of $Z-\Pi_{\sqrt{a}} Z-\Pi Z$. The latter projection is multivariate normally distributed with mean zero and covariance matrix the projection matrix $I-\Pi_{\sqrt{a}}-\Pi$ with $k-l-1$ eigenvalues 1 . The corollary follows from Lemma 17.1 or 16.6.
17.6 Example (Parametric model). If the null hypothesis is a parametric family $\mathcal{P}_{0}= \left\{p_{\theta}: \theta \in \Theta\right\}$ indexed by a subset $\Theta$ of $\mathbb{R}^{l}$ with $l \leq k$ and the maps $\theta \mapsto p_{\theta}$ from $\Theta$ into the unit simplex are differentiable and of full rank, then $\sqrt{n}\left(\mathcal{P}_{0}-p_{\theta}\right) \rightarrow \dot{p}_{\theta}\left(\mathbb{R}^{l}\right)$ for every $\theta \in \AA$ (see Example 16.11). Then the chi-square statistics $C_{n}\left(\hat{p}_{\theta}\right)$ are asymptotically $\chi_{k-l-1}^{2}$-distributed.

This situation is common in testing the goodness-of-fit of parametric families, as discussed in section 17.5 and Example 16.1.

### 17.4 Testing Independence

Suppose that each element of a population can be classified according to two characteristics, having $k$ and $r$ levels, respectively. The full information concerning the classification can be given by a ( $k \times r$ ) table of the form given in Table 17.1.

Often the full information is not available, but we do know the classification $X_{n, i j}$ for a random sample of size $n$ from the population. The matrix $X_{n, i j}$, which can also be written in the form of a ( $k \times r$ ) table, is multinomially distributed with parameters $n$ and probabilities $p_{i j}=N_{i j} / N$. The null hypothesis of independence asserts that the two categories are independent: $H_{0}: p_{i j}=a_{i} b_{j}$ for (unknown) probability vectors $a_{i}$ and $b_{j}$.

The maximum likelihood estimators for the parameters $a$ and $b$ (under the null hypothesis) are $\hat{a}_{i}=X_{n, i .} / n$ and $\hat{b}_{j}=X_{n, . j} / n$. With these estimators the modified Pearson statistic takes the form

$$
C_{n}\left(\hat{a}_{n} \otimes \hat{b}_{n}\right)=\sum_{i=1}^{k} \sum_{j=1}^{r} \frac{\left(X_{n, i j}-n \hat{a}_{i} \hat{b}_{j}\right)^{2}}{n \hat{a}_{i} \hat{b}_{j}} .
$$

The null hypothesis is a $(k+r-2)$-dimensional submanifold of the unit simplex in $\mathbb{R}^{k r}$. In a shrinking neighborhood of a parameter in its interior this manifold looks like its tangent space, a linear space of dimension $k+r-2$. Thus, the sequence $C_{n}\left(\hat{a}_{n} \otimes \hat{b}_{n}\right)$ is asymptotically chi square-distributed with $k r-1-(k+r-2)=(k-1)(r-1)$ degrees of freedom.

Table 17.1. Classification of a population of $N$ elements according to two categories, $N_{i j}$ elements having value $i$ on the first category and value $j$ on the second. The borders give the sums over each row and column, respectively.
| $N_{11}$ | $N_{12}$ | $\cdots$ | $N_{1 r}$ | $N_{1 .}$ |
| :---: | :---: | :---: | :---: | :---: |
| $N_{21}$ | $N_{22}$ | $\cdots$ | $N_{1 r}$ | $N_{2 .}$ |
| $\vdots$ | $\vdots$ |  | $\vdots$ | $\vdots$ |
| $N_{k 1}$ | $N_{k 2}$ | $\cdots$ | $N_{1 r}$ | $N_{k .}$ |
| $N_{.1}$ | $N_{.2}$ | $\cdots$ | $N_{. r}$ | $N$ |


17.7 Corollary. If the $(k \times r)$ matrices $X_{n}$ are multinomially distributed with parameters $n$ and $p_{i j}=a_{i} b_{j}>0$, then the sequence $C_{n}\left(\hat{a}_{n} \otimes \hat{b}_{n}\right)$ converges in distribution to the $\chi_{(k-1)(r-1)}^{2}$-distribution.

Proof. The map $\left(a_{1}, \ldots, a_{k-1}, b_{1}, \ldots, b_{r-1}\right) \mapsto(a \times b)$ from $\mathbb{R}^{k+r-2}$ into $\mathbb{R}^{k r}$ is continuously differentiable and of full rank. The true values ( $a_{1}, \ldots, a_{k-1}, b_{1} \ldots, b_{r-1}$ ) are interior to the domain of this map. Thus the sequence of sets $\sqrt{n}\left(\mathcal{P}_{0}-a \times b\right)$ converges to a ( $k+r-2$ )-dimensional linear subspace of $\mathbb{R}^{k r}$.

## *17.5 Goodness-of-Fit Tests

Chi-square tests are often applied to test goodness-of-fit. Given a random sample $X_{1}, \ldots, X_{n}$ from a distribution $P$, we wish to test the null hypothesis $H_{0}: P \in \mathcal{P}_{0}$ that $P$ belongs to a given class $\mathcal{P}_{0}$ of probability measures. There are many possible test statistics for this problem, and a particular statistic might be selected to attain high power against certain alternatives. Testing goodness-of-fit typically focuses on no particular alternative. Then chi-square statistics are intuitively reasonable.

The data can be reduced to a multinomial vector by "grouping." We choose a partition $\mathcal{X}=\cup_{j} \mathcal{X}_{j}$ of the sample space into finitely many sets and base the test only on the observed numbers of observations falling into each of the sets $\mathcal{X}_{j}$. For ease of notation, we express these numbers into the empirical measure of the data. For a given set $A$ we denote by $\mathbb{P}_{n}(A)=n^{-1}\left(1 \leq i \leq n: X_{i} \in A\right)$ the fraction of observations that fall into $A$. Then the vector $n\left(\mathbb{P}_{n}\left(\mathcal{X}_{1}\right), \ldots, \mathbb{P}_{n}\left(\mathcal{X}_{k}\right)\right)$ possesses a multinomial distribution, and the corresponding modified chi-square statistic is given by

$$
\sum_{i=1}^{k} \frac{n\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-\hat{P}\left(\mathcal{X}_{j}\right)\right)^{2}}{\hat{P}\left(\mathcal{X}_{j}\right)}
$$

Here $\hat{P}\left(\mathcal{X}_{j}\right)$ is an estimate of $P\left(\mathcal{X}_{j}\right)$ under the null hypothesis and can take a variety of forms.

Theorem 17.4 applies but is restricted to the case that the estimates $\hat{P}\left(\mathcal{X}_{j}\right)$ are based on the frequencies $n\left(\mathbb{P}_{n}\left(\mathcal{X}_{1}\right), \ldots, \mathbb{P}_{n}\left(\mathcal{X}_{k}\right)\right)$ only. In the present situation it is more natural to base the estimates on the original observations $X_{1}, \ldots, X_{n}$. Usually, this results in a non-chi square limit distribution. For instance, Table 17.2 shows the "errors" in the level of a chi-square test for testing normality, if the unknown mean and variance are estimated by the sample mean and the sample variance but the critical value is chosen from the chi-square distribution. The size of the errors depends on the numbers of cells, the errors being small if there are many cells and few estimated parameters.
17.8 Example (Parametric model). Consider testing the null hypothesis that the true distribution belongs to a regular parametric model $\left\{P_{\theta}: \theta \in \Theta\right\}$. It appears natural to estimate the unknown parameter $\theta$ by an estimator $\hat{\theta}_{n}$ that is asymptotically efficient under the null hypothesis and is based on the original sample $X_{1}, \ldots, X_{n}$, for instance the maximum likelihood estimator. If $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta}\right)$ denotes the empirical process, then efficiency entails the approximation $\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=I_{\theta}^{-1} \mathbb{G}_{n} \dot{\ell}_{\theta}+o_{P}(1)$. Applying the delta method to

Table 17.2. True levels of the chi-square test for normality using $\chi_{k-3, \alpha}^{2}$-quantiles as critical values but estimating unknown mean and variance by sample mean and sample variance. Chi square statistic based on partitions of $[-10,10]$ into $k=5,10$, or 20 equiprobable cells under the standard normal law.
|  | $\alpha=0.20$ | $\alpha=0.10$ | $\alpha=0.05$ | $\alpha=0.01$ |
| :--- | :---: | :---: | :---: | :---: |
| $k=5$ | 0.30 | 0.15 | 0.08 | 0.02 |
| $k=10$ | 0.22 | 0.11 | 0.06 | 0.01 |
| $k=20$ | 0.21 | 0.10 | 0.05 | 0.01 |


Note: Values based on 2000 simulations of standard normal samples of size 100.
the variables $\sqrt{n}\left(P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)-P_{\theta}\left(\mathcal{X}_{j}\right)\right)$ and using Slutsky's lemma, we find

$$
\frac{\sqrt{n}\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)\right)}{\sqrt{P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)}}=\frac{\mathbb{G}_{n} 1_{\mathcal{X}_{j}}-\left(P_{\theta} 1_{\mathcal{X}_{j}} \dot{\ell}_{\theta}\right)^{T} I_{\theta}^{-1} \mathbb{G}_{n} \dot{\ell}_{\theta}}{\sqrt{P_{\theta}\left(\mathcal{X}_{j}\right)}}+o_{P}(1) .
$$

(The map $\theta \mapsto P_{\theta}(A)$ has derivative $P_{\theta} 1_{A} \dot{\ell}_{\theta}$.) The sequence of vectors ( $\mathbb{G}_{n} 1_{\mathcal{X}_{j}}, \mathbb{G}_{n} \dot{\ell}_{\theta}$ ) converges in distribution to a multivariate-normal distribution. Some matrix manipulations show that the vectors in the preceding display are asymptotically distributed as a Gaussian vector $X$ with mean zero and covariance matrix

$$
I-\sqrt{a_{\theta}}{\sqrt{a_{\theta}}}^{T}-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}, \quad\left(a_{\theta}\right)_{j}=P_{\theta}\left(\mathcal{X}_{j}\right), \quad\left(C_{\theta}\right)_{i j}=\frac{P_{\theta} 1_{\mathcal{X}_{j}} \dot{\ell}_{\theta, i}}{\sqrt{\left(a_{\theta}\right)_{j}}} .
$$

In general, the covariance matrix of $X$ is not a projection matrix, and the variable $\|X\|^{2}$ does not possess a chi-square distribution.

Because $P_{\theta} \dot{\ell}_{\theta}=0$, we have that $C_{\theta} \sqrt{a_{\theta}}=0$ and hence the covariance matrix of $X$ can be rewritten as the product $\left(I-\sqrt{a_{\theta}}{\sqrt{a_{\theta}}}^{T}\right)\left(I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}\right)$. Here the first matrix is the projection onto the orthocomplement of the vector $\sqrt{a_{\theta}}$ and the second matrix is a positivedefinite transformation that leaves $\sqrt{a_{\theta}}$ invariant, thus acting only on the orthocomplement $\sqrt{a_{\theta}}{ }^{\perp}$. This geometric picture shows that $\operatorname{Cov}_{\theta} X$ has the same system of eigenvectors as the matrix $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$, and also the same eigenvalues, except for the eigenvalue corresponding to the eigenvector $\sqrt{a_{\theta}}$, which is 0 for $\operatorname{Cov}_{\theta} X$ and 1 for $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$. Because both matrices $C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$ and $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$ are nonnegative-definite, the eigenvalues are contained in $[0,1]$. One eigenvalue (corresponding to eigenvector $\sqrt{a_{\theta}}$ ) is $0, \operatorname{dim} \mathrm{~N}\left(C_{\theta}\right)-1$ eigenvalues (corresponding to eigenspace $\mathrm{N}\left(C_{\theta}\right) \cap \sqrt{a_{\theta}}{ }^{\perp}$ ) are 1 , but the other eigenvalues may be contained in $(0,1)$ and then typically depend on $\theta$. By Lemma 17.1, the variable $\|X\|^{2}$ is distributed as

$$
\sum_{i=1}^{\operatorname{dim} \mathrm{N}\left(C_{\theta}\right)-1} Z_{i}^{2}+\sum_{i=\operatorname{dim} \mathrm{N}\left(C_{\theta}\right)}^{k-1} \lambda_{i}(\theta) Z_{i}^{2} .
$$

This means that it is stochastically "between" the chi-square distributions with $\operatorname{dim} \mathrm{N}\left(C_{\theta}\right)-$ 1 and $k-1$ degrees of freedom.

The inconvenience that this distribution is not standard and depends on $\theta$ can be remedied by not using efficient estimators $\hat{\theta}_{n}$ or, alternatively, by not using the Pearson statistic.

The square root of the matrix $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$ is the positive-definite matrix with the same eigenvectors, but with the square roots of the eigenvalues. Thus, it also leaves the vector $\sqrt{a_{\theta}}$ invariant and acts only on the orthocomplement $\sqrt{a_{\theta}}$. It follows that this square root commutes with the matrix $I-\sqrt{a_{\theta}}{\sqrt{a_{\theta}}}^{T}$ and hence

$$
\left(I-C_{\hat{\theta}}^{T} I_{\hat{\theta}}^{-1} C_{\hat{\theta}}\right)^{-1 / 2} \frac{\sqrt{n}\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)\right)}{\sqrt{P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)}} \leadsto N_{k}\left(0, I-\sqrt{a_{\theta}}{\sqrt{a_{\theta}}}^{T}\right) .
$$

(We assume that the matrix $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$ is nonsingular, which is typically the case; see problem 17.6). By the continuous-mapping theorem, the squared norm of the left side is asymptotically chi square-distributed with $k-1$ degrees of freedom. This squared norm is the Rao-Robson-Nikulin statistic.

It is tempting to choose the partitioning sets $\mathcal{X}_{j}$ dependent on the observed data $X_{1}, \ldots$, $X_{n}$, for instance to ensure that all cells have positive probability under the null hypothesis. This is permissible under some conditions: The choice of a "random partition" typically does not change the distributional properties of the chi-square statistic. Consider partitioning sets $\hat{\mathcal{X}}_{j}=\mathcal{X}_{j}\left(X_{1}, \ldots, X_{n}\right)$ that possibly depend on the data, and a further modified Pearson statistic of the type

$$
\sum_{i=1}^{k} \frac{n\left(\mathbb{P}_{n}\left(\hat{\mathcal{X}}_{j}\right)-\hat{P}\left(\hat{\mathcal{X}}_{j}\right)\right)^{2}}{\hat{P}\left(\hat{\mathcal{X}}_{j}\right)} .
$$

If the random partitions settle down to a fixed partition eventually, then this statistic is asymptotically equivalent to the statistic for which the partition had been set equal to the limit partition in advance. We discuss this for the case that the null hypothesis is a model $\left\{P_{\theta}: \theta \in \Theta\right\}$ indexed by a subset $\Theta$ of a normed space. We use the language of Donsker classes as discussed in Chapter 19.
17.9 Theorem. Suppose that the sets $\hat{\mathcal{X}}_{j}$ belong to a $P_{\theta_{0}}$-Donsker class $\mathcal{C}$ of sets and that $P_{\theta_{0}}\left(\hat{X}_{j} \Delta \mathcal{X}_{j}\right) \xrightarrow{\mathrm{P}} 0$ under $P_{\theta_{0}}$, for given nonrandom sets $\mathcal{X}_{j}$ such that $P_{\theta_{0}}\left(\mathcal{X}_{j}\right)>0$. Furthermore, assume that $\sqrt{n}\left\|\hat{\theta}-\theta_{0}\right\|=O_{P}(1)$, and suppose that the map $\theta \mapsto P_{\theta}$ from $\Theta$ into $\ell^{\infty}(\mathcal{C})$ is differentiable at $\theta_{0}$ with derivative $\dot{P}_{\theta_{0}}$ such that $\dot{P}_{\theta_{0}}\left(\hat{\mathcal{X}}_{j}\right)-\dot{P}_{\theta_{0}}(\mathcal{X})^{\mathrm{P}} \rightarrow 0$ for every $j$. Then

$$
\sum_{i=1}^{k} \frac{n\left(\mathbb{P}_{n}\left(\hat{\mathcal{X}}_{j}\right)-P_{\hat{\theta}}\left(\hat{\mathcal{X}}_{j}\right)\right)^{2}}{P_{\hat{\theta}}\left(\hat{\mathcal{X}}_{j}\right)}=\sum_{i=1}^{k} \frac{n\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)\right)^{2}}{P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)}+o_{P}(1) .
$$

Proof. Let $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta_{0}}\right)$ be the empirical process and define $\mathbb{H}_{n}=\sqrt{n}\left(P_{\hat{\theta}}-P_{\theta_{0}}\right)$. Then $\sqrt{n}\left(\mathbb{P}_{n}\left(\hat{\mathcal{X}}_{j}\right)-P_{\hat{\theta}}\left(\hat{\mathcal{X}}_{j}\right)\right)=\left(\mathbb{G}_{n}-\mathbb{H}_{n}\right)\left(\hat{\mathcal{X}}_{j}\right)$, and similarly with $\mathcal{X}_{j}$ replacing $\hat{\mathcal{X}}_{j}$. The condition that the sets $\mathcal{X}_{j}$ belong to a Donsker class combined with the continuity condition $P_{\theta_{0}}\left(\hat{X}_{j} \Delta \mathcal{X}_{j}\right) \xrightarrow{P} 0$, imply that $\mathbb{G}_{n}\left(\hat{\mathcal{X}}_{j}\right)-\mathbb{G}_{n}\left(\mathcal{X}_{j}\right) \xrightarrow{\mathrm{P}} 0$ (see Lemma 19.24). The differentiability of the map $\theta \mapsto P_{\theta}$ implies that

$$
\sup _{C}\left|P_{\hat{\theta}}(C)-P_{\theta_{0}}(C)-\dot{P}_{\theta_{0}}(C)\left(\hat{\theta}-\theta_{0}\right)\right|=o_{P}\left(\left\|\hat{\theta}-\theta_{0}\right\|\right) .
$$

Together with the continuity $\dot{P}_{\theta_{0}}\left(\hat{\mathcal{X}}_{j}\right)-\dot{P}_{\theta_{0}}(\mathcal{X}) \xrightarrow{\mathrm{P}} 0$ and the $\sqrt{n}$-consistency of $\hat{\theta}$, this
shows that $\mathbb{H}_{n}\left(\hat{\mathcal{X}}_{j}\right)-\mathbb{H}_{n}(\mathcal{X})^{\mathrm{P}} 0$. In particular, because $\left.P_{\theta_{0}}\left(\hat{\mathcal{X}}_{j}\right) \xrightarrow{\mathrm{P}} P_{\theta_{0}}(\mathcal{X})\right)$, both $P_{\hat{\theta}}\left(\hat{\mathcal{X}}_{j}\right)$ and $P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)$ converge in probability to $P_{\theta_{0}}\left(\mathcal{X}_{j}\right)>0$. The theorem follows.

The conditions on the random partitions that are imposed in the preceding theorem are mild. An interesing choice is a partition in sets $\mathcal{X}_{j}(\hat{\theta})$ such that $P_{\theta}\left(\mathcal{X}_{j}(\theta)\right)=a_{j}$ is independent of $\theta$. The corresponding modified Pearson statistic is known as the Watson-Roy statistic and takes the form

$$
\sum_{i=1}^{k} \frac{n\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}(\hat{\theta})\right)-a_{j}\right)^{2}}{a_{j}} .
$$

Here the null probabilities have been reduced to fixed values again, but the cell frequencies are "doubly random." If the model is smooth and the parameter and the sets $\mathcal{X}_{j}(\theta)$ are not too wild, then this statistic has the same null limit distribution as the modified Pearson statistic with a fixed partition.
17.10 Example (Location-scale). Consider testing a null hypothesis that the true underlying measure of the observations belongs to a location-scale family $\left\{F_{0}((\cdot-\mu) / \sigma): \mu \in\right. \mathbb{R}, \sigma>0\}$, given a fixed distribution $F_{0}$ on $\mathbb{R}$. It is reasonable to choose a partition in sets $\hat{\mathcal{X}}_{j}=\hat{\mu}+\hat{\sigma}\left(c_{j-1}, c_{j}\right]$, for a fixed partition $-\infty=c_{0}<c_{1}<\cdots<c_{k}=\infty$ and estimators $\hat{\mu}$ and $\hat{\sigma}$ of the location and scale parameter. The partition could, for instance, be chosen equal to $c_{j}=F_{0}^{-1}(j / k)$, although, in general, the partition should depend on the type of deviation from the null hypothesis that one wants to detect.

If we use the same location and scale estimators to "estimate" the null probabilities $F_{0}\left(\left(\hat{\mathcal{X}}_{j}-\mu\right) / \sigma\right)$ of the random cells $\hat{\mathcal{X}}_{j}=\hat{\mu}+\hat{\sigma}\left(c_{j-1}, c_{j}\right]$, then the estimators cancel, and we find the fixed null probabilities $F_{0}\left(c_{j}\right)-F_{0}\left(c_{j-1}\right)$. $\square$

## *17.6 Asymptotic Efficiency

The asymptotic null distributions of various versions of the Pearson statistic enable us to set critical values but by themselves do not give information on the asymptotic power of the tests. Are these tests, which appear to be mostly motivated by their asymptotic null distribution, sufficiently powerful?

The asymptotic power can be measured in various ways. Probably the most important method is to consider local limiting power functions, as in Chapter 14. For the likelihood ratio test these are obtained in Chapter 16. Because, in the local experiments, chi-square statistics are asymptotically equivalent to the likelihood ratio statistics (see Theorem 17.4), the results obtained there also apply to the present problem, and we shall not repeat the discussion.

A second method to evaluate the asymptotic power is by Bahadur efficiencies. For this nonlocal criterion, chi-square tests and likelihood ratio tests are not equivalent, the second being better and, in fact, optimal (see Theorem 16.12).

We shall compute the slopes of the Pearson and likelihood ratio tests for testing the simple hypothesis $H_{0}: p=a$. A multinomial vector $X_{n}$ with parameters $n$ and $p=\left(p_{1}, \ldots, p_{k}\right)$ can be thought of as $n$ times the empirical measure $\mathbb{P}_{n}$ of a random sample of size $n$ from the distribution $P$ on the set $\{1, \ldots, k\}$ defined by $P\{i\}=p_{i}$. Thus we can view both the

Pearson and the likelihood ratio statistics as functions of an empirical measure and next can apply Sanov's theorem to compute the desired limits of large deviations probabilities. Define maps $C$ and $K$ by

$$
\begin{aligned}
C(p, a) & =\sum_{i=1}^{k} \frac{\left(p_{i}-a_{i}\right)^{2}}{a_{i}}, \\
K(p, a) & =-P \log \frac{a}{p}=\sum_{i=1}^{k} p_{i} \log \frac{p_{i}}{a_{i}} .
\end{aligned}
$$

Then the Pearson and likelihood ratio statistics are equivalent to $C\left(\mathbb{P}_{n}, a\right)$ and $K\left(\mathbb{P}_{n}, a\right)$, respectively.

Under the assumption that $a>0$, both maps are continuous in $p$ on the $k$-dimensional unit simplex. Furthermore, for $t$ in the interior of the ranges of $C$ and $K$, the sets $B_{t}= \{p: C(p, a) \geq t\}$ and $\tilde{B}_{t}=\{p: K(p, a) \geq t\}$ are equal to the closures of their interiors. Two applications of Sanov's theorem yield

$$
\begin{aligned}
& \frac{1}{n} \log \mathrm{P}_{a}\left(C\left(\mathbb{P}_{n}, a\right) \geq t\right) \rightarrow-\inf _{p \in B_{t}} K(p, a), \\
& \frac{1}{n} \log \mathrm{P}_{a}\left(K\left(\mathbb{P}_{n}, a\right) \geq t\right) \rightarrow-\inf _{p \in \tilde{B}_{t}} K(p, a)=-t .
\end{aligned}
$$

We take the function $e(t)$ of (14.20) equal to minus two times the right sides. Because $\mathbb{P}_{n}\{i\} \rightarrow p_{i}$ by the law of large numbers, whence $C\left(\mathbb{P}_{n}, a\right) \xrightarrow{\mathrm{P}} C(P, a)$ and $K\left(\mathbb{P}_{n}, a\right) \xrightarrow{\mathrm{P}} K(P, a)$, the Bahadur slopes of the Pearson and likelihood ratio tests at the alternative $H_{1}: p=q$ are given by

$$
2 \inf _{p: C(p, a) \geq C(q, a)} K(p, a)
$$

and

$$
2 K(q, a) .
$$

It is clear from these expressions that the likelihood ratio test has a bigger slope. This is in agreement with the fact that the likelihood ratio test is asymptotically Bahadur optimal in any smooth parametric model. Figure 17.1 shows the difference of the slopes in one particular case. The difference is small in a neighborhood of the null hypothesis $a$, in agreement with the fact that the Pitman efficiency is equal to 1 , but can be substantial for alternatives away from $a$.

## Notes

Pearson introduced his statistic in 1900 in [112] The modification with estimated parameters, using the multinomial frequencies, was considered by Fisher [49], who corrected the mistaken belief that estimating the parameters does not change the limit distribution. Chernoff and Lehmann [22] showed that using maximum likelihood estimators based on the original data for the parameter in a goodness-of-fit statistic destroys the asymptotic chi-square distribution. They note that the errors in the level are small in the case of testing a Poisson distribution and somewhat larger when testing normality.

![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-040.jpg?height=2504&width=3559&top_left_y=569&top_left_x=1033)
Figure 17.1. The difference of the Bahadur slopes of the likelihood ratio and Pearson tests for testing $H_{0}: p=(1 / 3,1 / 3,1 / 3)$ based on a multinomial vector with parameters $n$ and $p=\left(p_{1}, p_{2}, p_{3}\right)$, as a function of $\left(p_{1}, p_{2}\right)$.

The choice of the partition in chi-square goodness-of-fit tests is an important issue that we have not discussed. Several authors have studied the optimal number of cells in the partition. This number depends, of course, on the alternative for which one desires large power. The conclusions of these studies are not easily summarized. For alternatives $p$ such that the likelihood ratio $p / p_{\theta_{0}}$ with respect to the null distribution is "wild," the number of cells $k$ should tend to infinity with $n$. Then the chi-square approximation of the null distribution needs to be modified. Normal approximations are used, because a chi-square distribution with a large number of degrees of freedom is approximately a normal distribution. See [40], [60], and [86] for results and further references.

## PROBLEMS

1. Let $N=\left(N_{i j}\right)$ be a multinomial matrix with success probabilities $p_{i j}$. Design a test statistic for the null hypothesis of symmetry $H_{0}: p_{i j}=p_{j i}$ and derive its asymptotic null distribution.
2. Derive the limit distribution of the chi-square goodness-of-fit statistic for testing normality if using the sample mean and sample variance as estimators for the unknown mean and variance. Use two or three cells to keep the calculations simple. Show that the limit distribution is not chi-square.
3. Suppose that $X_{m}$ and $Y_{n}$ are independent multinomial vectors with parameters ( $m, a_{1}, \ldots, a_{k}$ ) and $\left(n, b_{1}, \ldots, b_{k}\right)$, respectively. Under the null hypothesis $H_{0}: a=b$, a natural estimator of the unknown probability vector $a=b$ is $\hat{c}=(m+n)^{-1}\left(X_{m}+Y_{n}\right)$, and a natural test statistic is given by

$$
\sum_{i=1}^{k} \frac{\left(X_{m, i}-m \hat{c}_{i}\right)^{2}}{m \hat{c}_{i}}+\sum_{i=1}^{k} \frac{\left(Y_{n, i}-n \hat{c}_{i}\right)^{2}}{n \hat{c}_{i}}
$$

Show that $\hat{c}$ is the maximum likelihood estimator and show that the sequence of test statistics is asymptotically chi square-distributed if $m, n \rightarrow \infty$.
4. A matrix $\Sigma^{-}$is called a generalized inverse of a matrix $\Sigma$ if $x=\Sigma^{-} y$ solves the equation $\Sigma x=y$ for every $y$ in the range of $\Sigma$. Suppose that $X$ is $N_{k}(0, \Sigma)$-distributed for a matrix $\Sigma$ of rank $r$. Show that
(i) $Y^{T} \Sigma^{-} Y$ is the same for every generalized inverse $\Sigma^{-}$, with probability one;
(ii) $Y^{T} \Sigma^{-} Y$ possesses a chi-square distribution with $r$ degrees of freedom;
(iii) if $Y^{T} C Y$ possesses a chi-square distribution with $r$ degrees of freedom and $C$ is a nonnegativedefinite symmetric matrix, then $C$ is a generalized inverse of $\Sigma$.
5. Find the limit distribution of the Dzhaparidze-Nikulin statistic

$$
n \frac{\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)\right)}{\sqrt{P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)}}\left(I-C_{\hat{\theta}}^{T}\left(C_{\hat{\theta}} C_{\hat{\theta}}^{T}\right)^{-1} C_{\hat{\theta}}\right) \frac{\left(\mathbb{P}_{n}\left(\mathcal{X}_{j}\right)-P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)\right)}{\sqrt{P_{\hat{\theta}}\left(\mathcal{X}_{j}\right)}}
$$

6. Show that the matrix $I-C_{\theta}^{T} I_{\theta}^{-1} C_{\theta}$ in Example 17.8 is nonsingular unless the empirical estimator $\left(\mathbb{P}_{n}\left(\mathcal{X}_{1}\right), \ldots, \mathbb{P}_{n}\left(\mathcal{X}_{k}\right)\right)$ is asymptotically efficient. (The estimator $\left(P_{\hat{\theta}}\left(\mathcal{X}_{1}\right), \ldots, P_{\hat{\theta}}\left(\mathcal{X}_{k}\right)\right)$ is asymptotically efficient and has asymptotic covariance matrix $\operatorname{diag}\left(\sqrt{a_{\theta}}\right) C_{\theta}^{T} I_{\theta}^{-1} C_{\theta} \operatorname{diag}\left(\sqrt{a_{\theta}}\right)$; the empirical estimator has asymptotic covariance matrix $\operatorname{diag}\left(\sqrt{a_{\theta}}\right)\left(I-\sqrt{a_{\theta}} \sqrt{a_{\theta}} T\right) \operatorname{diag}\left(\sqrt{a_{\theta}}\right)$.)

## 18

## Stochastic Convergence in Metric Spaces

> This chapter extends the concepts of convergence in distribution, in probability, and almost surely from Euclidean spaces to more abstract metric spaces. We are particularly interested in developing the theory for random functions, or stochastic processes, viewed as elements of the metric space of all bounded functions.

### 18.1 Metric and Normed Spaces

In this section we recall some basic topological concepts and introduce a number of examples of metric spaces.

A metric space is a set $\mathbb{D}$ equipped with a metric. A metric or distance function is a map $d: \mathbb{D} \times \mathbb{D} \mapsto[0, \infty)$ with the properties
(i) $d(x, y)=d(y, x)$;
(ii) $d(x, z) \leq d(x, y)+d(y, z)$ (triangle inequality);
(iii) $d(x, y)=0$ if and only if $x=y$.

A semimetric satisfies (i) and (ii), but not necessarily (iii). An open ball is a set of the form $\{y: d(x, y)<r\}$. A subset of a metric space is open if and only if it is the union of open balls; it is closed if and only if its complement is open. A sequence $x_{n}$ converges to $x$ if and only if $d\left(x_{n}, x\right) \rightarrow 0$; this is denoted by $x_{n} \rightarrow x$. The closure $\bar{A}$ of a set $A \subset \mathbb{D}$ consists of all points that are the limit of a sequence in A ; it is the smallest closed set containing $A$. The interior $\AA$ is the collection of all points $x$ such that $x \in G \subset A$ for some open set $G$; it is the largest open set contained in $A$. A function $f: \mathbb{D} \mapsto \mathbb{E}$ between two metric spaces is continuous at a point $x$ if and only if $f\left(x_{n}\right) \rightarrow f(x)$ for every sequence $x_{n} \rightarrow x$; it is continuous at every $x$ if and only if the inverse image $f^{-1}(G)$ of every open set $G \subset \mathbb{E}$ is open in $\mathbb{D}$. A subset of a metric space is dense if and only if its closure is the whole space. A metric space is separable if and only if it has a countable dense subset. A subset $K$ of a metric space is compact if and only if it is closed and every sequence in $K$ has a converging subsequence. A subset $K$ is totally bounded if and only if for every $\varepsilon>0$ it can be covered by finitely many balls of radius $\varepsilon$. A semimetric space is complete if every Cauchy sequence, a sequence such that $d\left(x_{n}, x_{m}\right) \rightarrow 0$ as $n, m \rightarrow \infty$, has a limit. A subset of a complete semimetric space is compact if and only if it is totally bounded and closed.

A normed space $\mathbb{D}$ is a vector space equipped with a norm. A norm is a map $\|\cdot\|: \mathbb{D} \mapsto [0, \infty)$ such that, for every $x, y$ in $\mathbb{D}$, and $\alpha \in \mathbb{R}$,
(i) $\|x+y\| \leq\|x\|+\|y\|$ (triangle inequality);
(ii) $\|\alpha x\|=|\alpha|\|x\|$;
(iii) $\|x\|=0$ if and only if $x=0$.

A seminorm satisfies (i) and (ii), but not necessarily (iii). Given a norm, a metric can be defined by $d(x, y)=\|x-y\|$.
18.1 Definition. The Borel $\sigma$-field on a metric space $\mathbb{D}$ is the smallest $\sigma$-field that contains the open sets (and then also the closed sets). A function defined relative to (one or two) metric spaces is called Borel-measurable if it is measurable relative to the Borel $\sigma$-field(s). A Borel-measurable map $X: \Omega \mapsto \mathbb{D}$ defined on a probability space ( $\Omega, \mathcal{U}, \mathrm{P}$ ) is referred to as a random element with values in $\mathbb{D}$.

For Euclidean spaces, Borel measurability is just the usual measurability. Borel measurability is probably the natural concept to use with metric spaces. It combines well with the topological structure, particularly if the metric space is separable. For instance, continuous maps are Borel-measurable.

### 18.2 Lemma. A continuous map between metric spaces is Borel-measurable.

Proof. A map $g: \mathbb{D} \mapsto \mathbb{E}$ is continuous if and only if the inverse image $g^{-1}(G)$ of every open set $G \subset \mathbb{E}$ is open in $\mathbb{D}$. In particular, for every open $G$ the set $g^{-1}(G)$ is a Borel set in $\mathbb{D}$. By definition, the open sets in $\mathbb{E}$ generate the Borel $\sigma$-field. Thus, the inverse image of a generator of the Borel sets in $\mathbb{E}$ is contained in the Borel $\sigma$-field in $\mathbb{D}$. Because the inverse image $g^{-1}(\mathcal{G})$ of a generator $\mathcal{G}$ of a $\sigma$-field $\mathcal{B}$ generates the $\sigma$-field $g^{-1}(\mathcal{B})$, it follows that the inverse image of every Borel set is a Borel set.
18.3 Example (Euclidean spaces). The Euclidean space $\mathbb{R}^{k}$ is a normed space with respect to the Euclidean norm (whose square is $\|x\|^{2}=\sum_{i=1}^{k} x_{i}^{2}$ ), but also with respect to many other norms, for instance $\|x\|=\max _{i}\left|x_{i}\right|$, all of which are equivalent. By the HeineBorel theorem a subset of $\mathbb{R}^{k}$ is compact if and only if it is closed and bounded. A Euclidean space is separable, with, for instance, the vectors with rational coordinates as a countable dense subset.

The Borel $\sigma$-field is the usual $\sigma$-field, generated by the intervals of the type $(-\infty, x]$.
18.4 Example (Extended real line). The extended real line $\overline{\mathbb{R}}=[-\infty, \infty]$ is the set consisting of all real numbers and the additional elements $-\infty$ and $\infty$. It is a metric space with respect to

$$
d(x, y)=|\Phi(x)-\Phi(y)| .
$$

Here $\Phi$ can be any fixed, bounded, strictly increasing continuous function. For instance, the normal distribution function (with $\Phi(-\infty)=0$ and $\Phi(\infty)=1$ ). Convergence of a sequence $x_{n} \rightarrow x$ with respect to this metric has the usual meaning, also if the limit $x$ is $-\infty$ or $\infty$ (normally we would say that $x_{n}$ "diverges"). Consequently, every sequence has a converging subsequence and hence the extended real line is compact.
18.5 Example (Uniform norm). Given an arbitrary set $T$, let $\ell^{\infty}(T)$ be the collection of all bounded functions $z: T \mapsto \mathbb{R}$. Define sums $z_{1}+z_{2}$ and products with scalars $\alpha z$ pointwise. For instance, $z_{1}+z_{2}$ is the element of $\ell^{\infty}(T)$ such that $\left(z_{1}+z_{2}\right)(t)= z_{1}(t)+z_{2}(t)$ for every $t$. The uniform norm is defined as

$$
\|z\|_{T}=\sup _{t \in T}|z(t)|
$$

With this notation the space $\ell^{\infty}(T)$ consists exactly of all functions $z: T \mapsto \mathbb{R}$ such that $\|z\|_{T}<\infty$. The space $\ell^{\infty}(T)$ is separable if and only if $T$ is countable.
18.6 Example (Skorohod space). Let $T=[a, b]$ be an interval in the extended real line. We denote by $C[a, b]$ the set of all continuous functions $z:[a, b] \mapsto \mathbb{R}$ and by $D[a, b]$ the set of all functions $z:[a, b] \mapsto \mathbb{R}$ that are right continuous and whose limits from the left exist everywhere in $[a, b]$. (The functions in $D[a, b]$ are called cadlag: continue à droite, limites à gauche.) It can be shown that $C[a, b] \subset D[a, b] \subset \ell^{\infty}[a, b]$. We always equip the spaces $C[a, b]$ and $D[a, b]$ with the uniform norm $\|z\|_{T}$, which they "inherit" from $\ell^{\infty}[a, b]$.

The space $D[a, b]$ is referred to here as the Skorohod space, although Skorohod did not consider the uniform norm but equipped the space with the "Skorohod metric" (which we do not use or discuss).

The space $C[a, b]$ is separable, but the space $D[a, b]$ is not (relative to the uniform norm).
18.7 Example (Uniformly continuous functions). Let $T$ be a totally bounded semimetric space with semimetric $\rho$. We denote by $U C(T, \rho)$ the collection of all uniformly continuous functions $z: T \mapsto \mathbb{R}$. Because a uniformly continuous function on a totally bounded set is necessarily bounded, the space $U C(T, \rho)$ is a subspace of $\ell^{\infty}(T)$. We equip $U C(T, \rho)$ with the uniform norm.

Because a compact semimetric space is totally bounded, and a continuous function on a compact space is automatically uniformly continuous, the spaces $C(T, \rho)$ for a compact semimetric space $T$, for instance $C[a, b]$, are special cases of the spaces $U C(T, \rho)$. Actually, every space $U C(T, \rho)$ can be identified with a space $C(\bar{T}, \rho)$, because the completion $\bar{T}$ of a totally bounded semimetric $T$ space is compact, and every uniformly continuous function on $T$ has a unique continuous extension to the completion.

The space $U C(T, \rho)$ is separable. Furthermore, the Borel $\sigma$-field is equal to the $\sigma$-field generated by all coordinate projections (see Problem 18.3). The coordinate projections are the maps $z \mapsto z(t)$ with $t$ ranging over $T$. These are continuous and hence always Borel-measurable.
18.8 Example (Product spaces). Given a pair of metric spaces $\mathbb{D}$ and $\mathbb{E}$ with metrics $d$ and $e$, the Cartesian product $\mathbb{D} \times \mathbb{E}$ is a metric space with respect to the metric

$$
f\left(\left(x_{1}, y_{1}\right),\left(x_{2}, y_{2}\right)\right)=d\left(x_{1}, x_{2}\right) \vee e\left(y_{1}, y_{2}\right) .
$$

For this metric, convergence of a sequence $\left(x_{n}, y_{n}\right) \rightarrow(x, y)$ is equivalent to both $x_{n} \rightarrow x$ and $y_{n} \rightarrow y$.

For a product metric space, there exist two natural $\sigma$-fields: The product of the Borel $\sigma$-fields and the Borel $\sigma$-field of the product metric. In general, these are not the same,
the second one being bigger. A sufficient condition for them to be equal is that the metric spaces $\mathbb{D}$ and $\mathbb{E}$ are separable (e.g., Chapter 1.4 in [146])).

The possible inequality of the two $\sigma$-fields causes an inconvenient problem. If $X: \Omega \mapsto \mathbb{D}$ and $Y: \Omega \mapsto \mathbb{E}$ are Borel-measurable maps, defined on some measurable space $(\Omega, \mathcal{U})$, then $(X, Y): \Omega \mapsto D \times \mathbb{E}$ is always measurable for the product of the Borel $\sigma$-fields. This is an easy fact from measure theory. However, if the two $\sigma$-fields are different, then the map ( $X, Y$ ) need not be Borel-measurable. If they have separable range, then they are.

### 18.2 Basic Properties

In Chapter 2 convergence in distribution of random vectors is defined by reference to their distribution functions. Distribution functions do not extend in a natural way to random elements with values in metric spaces. Instead, we define convergence in distribution using one of the characterizations given by the portmanteau lemma.

A sequence of random elements $X_{n}$ with values in a metric space $\mathbb{D}$ is said to converge in distribution to a random element $X$ if $\mathrm{E} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for every bounded, continuous function $f: \mathbb{D} \mapsto \mathbb{R}$. In some applications the "random elements" of interest turn out not to be Borel-measurable. To accomodate this situation, we extend the preceding definition to a sequence of arbitrary maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}$, defined on probability spaces ( $\Omega_{n}, \mathcal{U}_{n}, \mathrm{P}_{n}$ ). Because $\mathrm{E} f\left(X_{n}\right)$ need no longer make sense, we replace expectations by outer expectations. For an arbitrary map $X: \Omega \mapsto \mathbb{D}$, define

$$
\mathrm{E}^{*} f(X)=\inf \{\mathrm{E} U: U: \Omega \mapsto \mathbb{R}, \text { measurable, } U \geq f(X), \mathrm{E} U \text { exists }\} .
$$

Then we say that a sequence of arbitrary maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}$ converges in distribution to a random element $X$ if $\mathrm{E}^{*} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for every bounded, continuous function $f: \mathbb{D} \mapsto \mathbb{R}$. Here we insist that the limit $X$ be Borel-measurable.

In the following, we do not stress the measurability issues. However, throughout we do write stars, if necessary, as a reminder that there are measurability issues that need to be taken care of. Although $\Omega_{n}$ may depend on $n$, we do not let this show up in the notation for $\mathrm{E}^{*}$ and $\mathrm{P}^{*}$.

Next consider convergence in probability and almost surely. An arbitrary sequence of maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}$ converges in probability to $X$ if $\mathrm{P}^{*}\left(d\left(X_{n}, X\right)>\varepsilon\right) \rightarrow 0$ for all $\varepsilon>0$. This is denoted by $X_{n} \xrightarrow{\mathrm{P}} X$. The sequence $X_{n}$ converges almost surely to $X$ if there exists a sequence of (measurable) random variables $\Delta_{n}$ such that $d\left(X_{n}, X\right) \leq \Delta_{n}$ and $\Delta_{n} \xrightarrow{\text { as }} 0$. This is denoted by $X_{n} \xrightarrow{\text { as* }} X$.

These definitions also do not require the $X_{n}$ to be Borel-measurable. In the definition of convergence of probability we solved this by adding a star, for outer probability. On the other hand, the definition of almost-sure convergence is unpleasantly complicated. This cannot be avoided easily, because, even for Borel-measurable maps $X_{n}$ and $X$, the distance $d\left(X_{n}, X\right)$ need not be a random variable.

The portmanteau lemma, the continuous-mapping theorem and the relations among the three modes of stochastic convergence extend without essential changes to the present definitions. Even the proofs, as given in Chapter 2, do not need essential modifications. However, we seize the opportunity to formulate and prove a refinement of the continuous-mapping theorem. The continuous-mapping theorem furnishes a more intuitive interpretation of
weak convergence in terms of weak convergence of random vectors: $X_{n} \leadsto X$ in the metric space $\mathbb{D}$ if and only if $g\left(X_{n}\right) \rightsquigarrow g(X)$ for every continuous map $g: \mathbb{D} \mapsto \mathbb{R}^{k}$.
18.9 Lemma (Portmanteau). For arbitrary maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}$ and every random element $X$ with values in $\mathbb{D}$, the following statements are equivalent.
(i) $\mathrm{E}^{*} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for all bounded, continuous functions $f$.
(ii) $\mathrm{E}^{*} f\left(X_{n}\right) \rightarrow \mathrm{E} f(X)$ for all bounded, Lipschitz functions $f$.
(iii) $\liminf \mathrm{P}_{*}\left(X_{n} \in G\right) \geq \mathrm{P}(X \in G)$ for every open set $G$.
(iv) $\limsup \mathrm{P}^{*}\left(X_{n} \in F\right) \leq \mathrm{P}(X \in F)$ for every closed set $F$.
(v) $\mathrm{P}^{*}\left(X_{n} \in B\right) \rightarrow \mathrm{P}(X \in B)$ for all Borel sets $B$ with $\mathrm{P}(X \in \delta B)=0$.
18.10 Theorem. For arbitrary maps $X_{n}, Y_{n}: \Omega_{n} \mapsto \mathbb{D}$ and every random element $X$ with values in $\mathbb{D}$ :
(i) $X_{n} \xrightarrow{\text { as* }} X$ implies $X_{n} \xrightarrow{\mathrm{P}} X$.
(ii) $X_{n} \xrightarrow{\mathrm{P}} X$ implies $X_{n} \rightsquigarrow X$.
(iii) $X_{n} \xrightarrow{\mathrm{P}} c$ for a constant $c$ if and only if $X_{n} \leadsto c$.
(iv) if $X_{n} \rightsquigarrow X$ and $d\left(X_{n}, Y_{n}\right) \xrightarrow{\mathrm{P}} 0$, then $Y_{n} \rightsquigarrow X$.
(v) if $X_{n} \rightsquigarrow X$ and $Y_{n} \xrightarrow{\mathrm{P}} c$ for a constant $c$, then $\left(X_{n}, Y_{n}\right) \rightsquigarrow(X, c)$.
(vi) if $X_{n} \xrightarrow{\mathrm{P}} X$ and $Y_{n} \xrightarrow{\mathrm{P}} Y$, then $\left(X_{n}, Y_{n}\right) \xrightarrow{\mathrm{P}}(X, Y)$.
18.11 Theorem (Continuous mapping). Let $\mathbb{D}_{n} \subset \mathbb{D}$ be arbitrary subsets and $g_{n}: \mathbb{D}_{n} \mapsto \mathbb{E}$ be arbitrary maps $(n \geq 0)$ such that for every sequence $x_{n} \in \mathbb{D}_{n}$ : if $x_{n^{\prime}} \rightarrow x$ along a subsequence and $x \in \mathbb{D}_{0}$, then $g_{n^{\prime}}\left(x_{n^{\prime}}\right) \rightarrow g_{0}(x)$. Then, for arbitrary maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}_{n}$ and every random element $X$ with values in $\mathbb{D}_{0}$ such that $g_{0}(X)$ is a random element in $\mathbb{E}$ :
(i) If $X_{n} \rightsquigarrow X$, then $g_{n}\left(X_{n}\right) \rightsquigarrow g_{0}(X)$.
(ii) If $X_{n} \xrightarrow{\mathrm{P}} X$, then $g_{n}\left(X_{n}\right) \xrightarrow{\mathrm{P}} g_{0}(X)$.
(iii) If $X_{n} \xrightarrow{\text { as* }} X$, then $g_{n}\left(X_{n}\right) \xrightarrow{\text { as* }} g_{0}(X)$.

Proof. The proofs for $\mathbb{D}_{n}=\mathbb{D}$ and $g_{n}=g$ fixed, where $g$ is continuous at every point of $\mathbb{D}_{0}$, are the same as in the case of Euclidean spaces. We prove the refinement only for (i). The other refinements are not needed in the following.

For every closed set $F$, we have the inclusion

$$
\bigcap_{k=1}^{\infty} \overline{\bigcup_{m=k}^{\infty}\left\{x \in \mathbb{D}_{m}: g_{m}(x) \in F\right\}} \subset g_{0}^{-1}(F) \cup\left(\mathbb{D}-\mathbb{D}_{0}\right) .
$$

Indeed, suppose that $x$ is in the set on the left side. Then for every $k$ there is an $m_{k} \geq k$ and an element $x_{m_{k}} \in g_{m_{k}}^{-1}(F)$ with $d\left(x_{m_{k}}, x\right)<1 / k$. Thus, there exist a sequence $m_{k} \rightarrow \infty$ and elements $x_{m_{k}} \in \mathbb{D}_{m_{k}}$ with $x_{m_{k}} \rightarrow x$. Then either $g_{m_{k}}\left(x_{m_{k}}\right) \rightarrow g_{0}(x)$ or $x \notin \mathbb{D}_{0}$. Because the set $F$ is closed, this implies that $g_{0}(x) \in F$ or $x \notin \mathbb{D}_{0}$.

Now, for every fixed $k$, by the portmanteau lemma,

$$
\begin{aligned}
\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(g_{n}\left(X_{n}\right) \in F\right) & \leq \limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(X_{n} \in \overline{\bigcup_{m=k}^{\infty}\left\{x \in \mathbb{D}_{m}: g_{m}(x) \in F\right\}}\right) \\
& \leq \mathrm{P}\left(X \in \overline{\bigcup_{m=k}^{\infty} g_{m}^{-1}(F)}\right)
\end{aligned}
$$

As $k \rightarrow \infty$, the last probability converges to $\mathrm{P}\left(X \in \bigcap_{k=1}^{\infty} \overline{\bigcup_{m=k}^{\infty} g_{m}^{-1}(F)}\right)$, which is smaller than or equal to $\mathrm{P}\left(g_{0}(X) \in F\right)$, by the preceding paragraph. Thus, $g_{n}\left(X_{n}\right) \rightsquigarrow g_{0}(X)$ by the portmanteau lemma in the other direction.

The extension of Prohorov's theorem requires more care. ${ }^{\dagger}$ In a Euclidean space, a set is compact if and only if it is closed and bounded. In general metric spaces, a compact set is closed and bounded, but a closed, bounded set is not necessarily compact. It is the compactness that we employ in the definition of tightness. A Borel-measurable random element $X$ into a metric space is tight if for every $\varepsilon>0$ there exists a compact set $K$ such that $\mathrm{P}(X \notin K)<\varepsilon$. A sequence of arbitrary maps $X_{n}: \Omega_{n} \mapsto \mathbb{D}$ is called asymptotically tight if for every $\varepsilon>0$ there exists a compact set $K$ such that

$$
\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(X_{n} \notin K^{\delta}\right)<\varepsilon, \quad \text { every } \delta>0 .
$$

Here $K^{\delta}$ is the $\delta$-enlargement $\{y: d(y, K)<\delta\}$ of the set $K$. It can be shown that, for Borel-measurable maps in $\mathbb{R}^{k}$, this is identical to "uniformly tight," as defined in Chapter 2. In order to obtain a theory that applies to a sufficient number of applications, again we do not wish to assume that the $X_{n}$ are Borel-measurable. However, Prohorov's theorem is true only under, at least, "measurability in the limit." An arbitrary sequence of maps $X_{n}$ is called asymptotically measurable if

$$
E^{*} f\left(X_{n}\right)-\mathrm{E}_{*} f\left(X_{n}\right) \rightarrow 0, \quad \text { every } f \in C_{b}(D)
$$

Here $\mathrm{E}_{*}$ denotes the inner expectation, which is defined in analogy with the outer expectation, and $C_{b}(\mathbb{D})$ is the collection of all bounded, continuous functions $f: \mathbb{D} \mapsto \mathbb{R}$. A Borel-measurable sequence of random elements $X_{n}$ is certainly asymptotically measurable, because then both the outer and the inner expectations in the preceding display are equal to the expectation, and the difference is identically zero.

### 18.12 Theorem (Prohorov's theorem). Let $X_{n}: \Omega_{n} \rightarrow \mathbb{D}$ be arbitrary maps into a metric space.

(i) If $X_{n} \leadsto X$ for some tight random element $X$, then $\left\{X_{n}: n \in \mathbb{N}\right\}$ is asymptotically tight and asymptotically measurable.
(ii) If $X_{n}$ is asymptotically tight and asymptotically measurable, then there is a subsequence and a tight random element $X$ such that $X_{n_{j}} \rightsquigarrow X$ as $j \rightarrow \infty$.

### 18.3 Bounded Stochastic Processes

A stochastic process $X=\left\{X_{t}: t \in T\right\}$ is a collection of random variables $X_{t}: \Omega \mapsto \mathbb{R}$, indexed by an arbitrary set $T$ and defined on the same probability space ( $\Omega, \mathcal{U}, \mathrm{P}$ ). For a fixed $\omega$, the map $t \mapsto X_{t}(\omega)$ is called a sample path, and it is helpful to think of $X$ as a random function, whose realizations are the sample paths, rather than as a collection of random variables. If every sample path is a bounded function, then $X$ can be viewed as a

[^4]map $X: \Omega \mapsto \ell^{\infty}(T)$. If $T=[a, b]$ and the sample paths are continuous or cadlag, then $X$ is also a map with values in $C[a, b]$ or $D[a, b]$.

Because $C[a, b] \subset D[a, b] \subset \ell^{\infty}[a, b]$, we can consider the weak convergence of a sequence of maps with values in $C[a, b]$ relative to $C[a, b]$, but also relative to $D[a, b]$, or $\ell^{\infty}[a, b]$. The following lemma shows that this does not make a difference, as long as we use the uniform norm for all three spaces.
18.13 Lemma. Let $\mathbb{D}_{0} \subset \mathbb{D}$ be arbitrary metric spaces equipped with the same metric. If $X$ and every $X_{n}$ take their values in $\mathbb{D}_{0}$, then $X_{n} \leadsto X$ as maps in $\mathbb{D}_{0}$ if and only if $X_{n} \leadsto X$ as maps in $\mathbb{D}$.

Proof. Because a set $G_{0}$ in $\mathbb{D}_{0}$ is open if and only if it is of the form $G \cap \mathbb{D}_{0}$ for an open set $G$ in $\mathbb{D}$, this is an easy corollary of (iii) of the portmanteau lemma.

Thus, we may concentrate on weak convergence in the space $\ell^{\infty}(T)$, and automatically obtain characterizations of weak convergence in $C[a, b]$ or $D[a, b]$. The next theorem gives a characterization by finite approximation. It is required that, for any $\varepsilon>0$, the index set $T$ can be partitioned into finitely many sets $T_{1}, \ldots, T_{k}$ such that (asymptotically) the variation of the sample paths $t \mapsto X_{n, t}$ is less than $\varepsilon$ on every one of the sets $T_{i}$, with large probability. Then the behavior of the process can be described, within a small error margin, by the behavior of the marginal vectors ( $X_{n, t_{1}}, \ldots, X_{n, t_{k}}$ ) for arbitrary fixed points $t_{i} \in T_{i}$. If these marginals converge, then the processes converge.
18.14 Theorem. A sequence of arbitrary maps $X_{n}: \Omega_{n} \mapsto \ell^{\infty}(T)$ converges weakly to a tight random element if and only if both of the following conditions hold:
(i) The sequence $\left(X_{n, t_{1}}, \ldots, X_{n, t_{k}}\right)$ converges in distribution in $\mathbb{R}^{k}$ for every finite set of points $t_{1}, \ldots, t_{k}$ in $T$;
(ii) for every $\varepsilon, \eta>0$ there exists a partition of $T$ into finitely many sets $T_{1}, \ldots, T_{k}$ such that

$$
\limsup _{n \rightarrow \infty} \mathrm{P}^{*}\left(\sup _{i} \sup _{s, t \in T_{i}}\left|X_{n, s}-X_{n, t}\right| \geq \varepsilon\right) \leq \eta .
$$

Proof. We only give the proof of the more constructive part, the sufficiency of (i) and (ii). For each natural number $m$, partition $T$ into sets $T_{1}^{m}, \ldots, T_{k_{m}}^{m}$, as in (ii) corresponding to $\varepsilon=\eta=2^{-m}$. Because the probabilities in (ii) decrease if the partition is refined, we can assume without loss of generality that the partitions are successive refinements as $m$ increases. For fixed $m$ define a semimetric $\rho_{m}$ on $T$ by $\rho_{m}(s, t)=0$ if $s$ and $t$ belong to the same partioning set $T_{j}^{m}$, and by $\rho_{m}(s, t)=1$ otherwise. Every $\rho_{m}$-ball of radius $0<\varepsilon<1$ coincides with a partitioning set. In particular, $T$ is totally bounded for $\rho_{m}$, and the $\rho_{m}$-diameter of a set $T_{j}^{m}$ is zero. By the nesting of the partitions, $\rho_{1} \leq \rho_{2} \leq \cdots$. Define $\rho(s, t)=\sum_{m=1}^{\infty} 2^{-m} \rho_{m}(s, t)$. Then $\rho$ is a semimetric such that the $\rho$-diameter of $T_{j}^{m}$ is smaller than $\sum_{k>m} 2^{-k}=2^{-m}$, and hence $T$ is totally bounded for $\rho$. Let $T_{0}$ be the countable $\rho$-dense subset constructed by choosing an arbitrary point $t_{j}^{m}$ from every $T_{j}^{m}$.

By assumption (i) and Kolmogorov's consistency theorem (e.g., [133, p. 244] or [42, p. 347]), we can construct a stochastic process $\left\{X_{t}: t \in T_{0}\right\}$ on some probability space such that $\left(X_{n, t_{1}}, \ldots, X_{n, t_{k}}\right) \rightsquigarrow\left(X_{t_{1}}, \ldots, X_{t_{k}}\right)$ for every finite set of points $t_{1}, \ldots, t_{k}$ in $T_{0}$. By the
portmanteau lemma and assumption (ii), for every finite set $S \subset T_{0}$,

$$
\mathrm{P}\left(\sup _{j} \sup _{\substack{s, t \in T_{j}^{m} \\ s, t \in S}}\left|X_{s}-X_{t}\right|>2^{-m}\right) \leq 2^{-m} .
$$

By the monotone convergence theorem this remains true if $S$ is replaced by $T_{0}$. If $\rho(s, t)< 2^{-m}$, then $\rho_{m}(s, t)<1$ and hence $s$ and $t$ belong to the same partitioning set $T_{j}^{m}$. Consequently, the event in the preceding display with $S=T_{0}$ contains the event in the following display, and

$$
\mathrm{P}\left(\sup _{\substack{\rho(s, t)<2^{-m} \\ s, t \in T_{0}}}\left|X_{s}-X_{t}\right|>2^{-m}\right) \leq 2^{-m} .
$$

This sums to a finite number over $m \in \mathbb{N}$. Hence, by the Borel-Cantelli lemma, for almost all $\omega,\left|X_{s}(\omega)-X_{t}(\omega)\right| \leq 2^{-m}$ for all $\rho(s, t)<2^{-m}$ and all sufficiently large $m$. This implies that almost all sample paths of $\left\{X_{t}: t \in T_{0}\right\}$ are contained in $U C\left(T_{0}, \rho\right)$. Extend the process by continuity to a process $\left\{X_{t}: t \in T\right\}$ with almost all sample paths in $U C(T, \rho)$.

Define $\pi_{m}: T \mapsto T$ as the map that maps every partioning set $T_{j}^{m}$ onto the point $t_{j}^{m} \in T_{j}^{m}$. Then, by the uniform continuity of $X$, and the fact that the $\rho$-diameter of $T_{j}^{m}$ is smaller than $2^{-m}, X \circ \pi_{m} \rightsquigarrow X$ in $\ell^{\infty}(T)$ as $m \rightarrow \infty$ (even almost surely). The processes $\left\{X_{n} \circ\right. \left.\pi_{m}(t): t \in T\right\}$ are essentially $k_{m}$-dimensional vectors. By (i), $X_{n} \circ \pi_{m} \rightsquigarrow X \circ \pi_{m}$ in $\ell^{\infty}(T)$ as $n \rightarrow \infty$, for every fixed $m$. Consequently, for every Lipschitz function $f: \ell^{\infty}(T) \mapsto[0,1]$, $\mathrm{E}^{*} f\left(X_{n} \circ \pi_{m}\right) \rightarrow \mathrm{E} f(X)$ as $n \rightarrow \infty$, followed by $m \rightarrow \infty$. Conclude that, for every $\varepsilon>0$,

$$
\begin{aligned}
\left|\mathrm{E}^{*} f\left(X_{n}\right)-\mathrm{E} f(X)\right| & \leq\left|\mathrm{E}^{*} f\left(X_{n}\right)-\mathrm{E}^{*} f\left(X_{n} \circ \pi_{m}\right)\right|+o(1) \\
& \leq\|f\|_{\operatorname{lip}} \varepsilon+\mathrm{P}^{*}\left(\left\|X_{n}-X_{n} \circ \pi_{m}\right\|_{T}>\varepsilon\right)+o(1) .
\end{aligned}
$$

For $\varepsilon=2^{-m}$ this is bounded by $\|f\|_{\text {lip }} 2^{-m}+2^{-m}+o(1)$, by the construction of the partitions. The proof is complete.

In the course of the proof of the preceding theorem a semimetric $\rho$ is constructed such that the weak limit $X$ has uniformly $\rho$-continuous sample paths, and such that $(T, \rho)$ is totally bounded. This is surprising: even though we are discussing stochastic processes with values in the very large space $\ell^{\infty}(T)$, the limit is concentrated on a much smaller space of continuous functions. Actually, this is a consequence of imposing the condition (ii), which can be shown to be equivalent to asymptotic tightness. It can be shown, more generally, that every tight random element $X$ in $\ell^{\infty}(T)$ necessarily concentrates on $U C(T, \rho)$ for some semimetric $\rho$ (depending on $X$ ) that makes $T$ totally bounded.

In view of this connection between the partitioning condition (ii), continuity, and tightness, we shall sometimes refer to this condition as the condition of asymptotic tightness or asymptotic equicontinuity.

We record the existence of the semimetric for later reference and note that, for a Gaussian limit process, this can always be taken equal to the "intrinsic" standard deviation semimetric.
18.15 Lemma. Under the conditions (i) and (ii) of the preceding theorem there exists a semimetric $\rho$ on $T$ for which $T$ is totally bounded, and such that the weak limit of the
sequence $X_{n}$ can be constructed to have almost all sample paths in $U C(T, \rho)$. Furthermore, if the weak limit $X$ is zero-mean Gaussian, then this semimetric can be taken equal to $\rho(s, t)=\operatorname{sd}\left(X_{s}-X_{t}\right)$.

Proof. A semimetric $\rho$ is constructed explicitly in the proof of the preceding theorem. It suffices to prove the statement concerning Gaussian limits $X$.

Let $\rho$ be the semimetric obtained in the proof of the theorem and let $\rho_{2}$ be the standard deviation semimetric. Because every uniformly $\rho$-continuous function has a unique continuous extension to the $\rho$-completion of $T$, which is compact, it is no loss of generality to assume that $T$ is $\rho$-compact. Furthermore, assume that every sample path of $X$ is $\rho$-continuous.

An arbitrary sequence $t_{n}$ in $T$ has a $\rho$-converging subsequence $t_{n^{\prime}} \rightarrow t$. By the $\rho$ continuity of the sample paths, $X_{t_{n^{\prime}}} \rightarrow X_{t}$ almost surely. Because every $X_{t}$ is Gaussian, this implies convergence of means and variances, whence $\rho_{2}\left(t_{n^{\prime}}, t\right)^{2}=\mathrm{E}\left(X_{t_{n^{\prime}}}-X_{t}\right)^{2} \rightarrow 0$ by Proposition 2.29. Thus $t_{n^{\prime}} \rightarrow t$ also for $\rho_{2}$ and hence $T$ is $\rho_{2}$-compact.

Suppose that a sample path $t \mapsto X_{t}(\omega)$ is not $\rho_{2}$-continuous. Then there exists an $\varepsilon>0$ and a $t \in T$ such that $\rho_{2}\left(t_{n}, t\right) \rightarrow 0$, but $\left|X_{t_{n}}(\omega)-X_{t}(\omega)\right| \geq \varepsilon$ for every $n$. By the $\rho$-compactness and continuity, there exists a subsequence such that $\rho\left(t_{n^{\prime}}, s\right) \rightarrow 0$ and $X_{t_{n^{\prime}}}(\omega) \rightarrow X_{s}(\omega)$ for some $s$. By the argument of the preceding paragraph, $\rho_{2}\left(t_{n^{\prime}}, s\right) \rightarrow 0$, so that $\rho_{2}(s, t)=0$ and $\left|X_{s}(\omega)-X_{t}(\omega)\right| \geq \varepsilon$. Conclude that the path $t \mapsto X_{t}(\omega)$ can only fail to be $\rho_{2}$-continuous for $\omega$ for which there exist $s, t \in T$ with $\rho_{2}(s, t)=0$, but $X_{s}(\omega) \neq X_{t}(\omega)$. Let $N$ be the set of $\omega$ for which there do exist such $s, t$. Take a countable, $\rho$-dense subset $A$ of $\left\{(s, t) \in T \times T: \rho_{2}(s, t)=0\right\}$. Because $t \mapsto X_{t}(\omega)$ is $\rho$ continuous, $N$ is also the set of all $\omega$ such that there exist $(s, t) \in A$ with $X_{s}(\omega) \neq X_{t}(\omega)$. From the definition of $\rho_{2}$, it is clear that for every fixed $(s, t)$, the set of $\omega$ such that $X_{s}(\omega) \neq X_{t}(\omega)$ is a null set. Conclude that $N$ is a null set. Hence, almost all paths of $X$ are $\rho_{2}$-continuous.

## Notes

The theory in this chapter was developed in increasing generality over the course of many years. Work by Donsker around 1950 on the approximation of the empirical process and the partial sum process by the Brownian bridge and Brownian motion processes was an important motivation. The first type of approximation is discussed in Chapter 19. For further details and references concerning the material in this chapter, see, for example, [76] or [146].

## PROBLEMS

1. (i) Show that a compact set is totally bounded.
(ii) Show that a compact set is separable.
2. Show that a function $f: \mathbb{D} \mapsto \mathbb{E}$ is continuous at every $x \in \mathbb{D}$ if and only if $f^{-1}(G)$ is open in $\mathbb{D}$ for every open $G \in \mathbb{E}$.
3. (Projection $\boldsymbol{\sigma}$-field.) Show that the $\sigma$-field generated by the coordinate projections $z \mapsto z(t)$ on $C[a, b]$ is equal to the Borel $\sigma$-field generated by the uniform norm. (First, show that the space
$C[a, b]$ is separable. Next show that every open set in a separable metric space is a countable union of open balls. Next, it suffices to prove that every open ball is measurable for the projection $\sigma$-field.)
4. Show that $D[a, b]$ is not separable for the uniform norm.
5. Show that every function in $D[a, b]$ is bounded.
6. Let $h$ be an arbitrary element of $D[-\infty, \infty]$ and let $\varepsilon>0$. Show that there exists a grid $u_{0}= -\infty<u_{1}<\cdots u_{m}=\infty$ such that $h$ varies at most $\varepsilon$ on every interval $\left[u_{i}, u_{i+1}\right)$. Here "varies at most $\varepsilon$ " means that $|h(u)-h(v)|$ is less than $\varepsilon$ for every $u, v$ in the interval. (Make sure that all points at which $h$ jumps more than $\varepsilon$ are grid points.)
7. Suppose that $H_{n}$ and $H_{0}$ are subsets of a semimetric space $H$ such that $H_{n} \rightarrow H_{0}$ in the sense that
(i) Every $h \in H_{0}$ is the limit of a sequence $h_{n} \in H_{n}$;
(ii) If a subsequence $h_{n_{j}}$ converges to a limit $h$, then $h \in H_{0}$.

Suppose that $\Lambda_{n}$ are stochastic processes indexed by $H$ that converge in distribution in the space $\ell^{\infty}(H)$ to a stochastic process $\Lambda$ that has uniformly continuous sample paths. Show that $\sup _{h \in H_{n}} \Lambda_{n}(h) \rightsquigarrow \sup _{h \in H_{0}} \Lambda(h)$.

## 19

## Empirical Processes

The empirical distribution of a random sample is the uniform discrete measure on the observations. In this chapter, we study the convergence of this measure and in particular the convergence of the corresponding distribution function. This leads to laws of large numbers and central limit theorems that are uniform in classes of functions. We also discuss a number of applications of these results.

### 19.1 Empirical Distribution Functions

Let $X_{1}, \ldots, X_{n}$ be a random sample from a distribution function $F$ on the real line. The empirical distribution function is defined as

$$
\mathbb{F}_{n}(t)=\frac{1}{n} \sum_{i=1}^{n} 1\left\{X_{i} \leq t\right\}
$$

It is the natural estimator for the underlying distribution $F$ if this is completely unknown. Because $n \mathbb{F}_{n}(t)$ is binomially distributed with mean $n F(t)$, this estimator is unbiased. By the law of large numbers it is also consistent,

$$
\mathbb{F}_{n}(t) \xrightarrow{\text { as }} F(t), \quad \text { every } t
$$

By the central limit theorem it is asymptotically normal,

$$
\sqrt{n}\left(\mathbb{F}_{n}(t)-F(t)\right) \rightsquigarrow N(0, F(t)(1-F(t))) .
$$

In this chapter we improve on these results by considering $t \mapsto \mathbb{F}_{n}(t)$ as a random function, rather than as a real-valued estimator for each $t$ separately. This is of interest on its own account but also provides a useful starting tool for the asymptotic analysis of other statistics, such as quantiles, rank statistics, or trimmed means.

The Glivenko-Cantelli theorem extends the law of large numbers and gives uniform convergence. The uniform distance

$$
\left\|\mathbb{F}_{n}-F\right\|_{\infty}=\sup _{t}\left|\mathbb{F}_{n}(t)-F(t)\right|
$$

is known as the Kolmogorov-Smirnov statistic.
19.1Theorem (Glivenko-Cantelli). If $X_{1}, X_{2}, \ldots$ are i.i.d. random variables with distribution function $F$, then $\left\|\mathbb{F}_{n}-F\right\|_{\infty} \xrightarrow{\text { as }} 0$.

Proof. By the strong law of large numbers, both $\mathbb{F}_{n}(t) \xrightarrow{\text { as }} F(t)$ and $\mathbb{F}_{n}(t-) \xrightarrow{\text { as }} F(t-)$ for every $t$. Given a fixed $\varepsilon>0$, there exists a partition $-\infty=t_{0}<t_{1}<\cdots<t_{k}=\infty$ such that $F\left(t_{i}-\right)-F\left(t_{i-1}\right)<\varepsilon$ for every $i$. (Points at which $F$ jumps more than $\varepsilon$ are points of the partition.) Now, for $t_{i-1} \leq t<t_{i}$,

$$
\begin{aligned}
& \mathbb{F}_{n}(t)-F(t) \leq \mathbb{F}_{n}\left(t_{i}-\right)-F\left(t_{i}-\right)+\varepsilon, \\
& \mathbb{F}_{n}(t)-F(t) \geq \mathbb{F}_{n}\left(t_{i-1}\right)-F\left(t_{i-1}\right)-\varepsilon .
\end{aligned}
$$

The convergence of $\mathbb{F}_{n}(t)$ and $\mathbb{F}_{n}(t-)$ for every fixed $t$ is certainly uniform for $t$ in the finite set $\left\{t_{1}, \ldots, t_{k-1}\right\}$. Conclude that $\limsup \left\|\mathbb{F}_{n}-F\right\|_{\infty} \leq \varepsilon$, almost surely. This is true for every $\varepsilon>0$ and hence the limit superior is zero.

The extension of the central limit theorem to a "uniform" or "functional" central limit theorem is more involved. A first step is to prove the joint weak convergence of finitely many coordinates. By the multivariate central limit theorem, for every $t_{1}, \ldots, t_{k}$,

$$
\sqrt{n}\left(\mathbb{F}_{n}\left(t_{i}\right)-F\left(t_{i}\right), \ldots, \mathbb{F}_{n}\left(t_{k}\right)-F\left(t_{k}\right)\right) \rightsquigarrow\left(\mathbb{G}_{F}\left(t_{1}\right), \ldots, \mathbb{G}_{F}\left(t_{k}\right)\right),
$$

where the vector on the right has a multivariate-normal distribution, with mean zero and covariances

$$
\begin{equation*}
\mathrm{EG}_{F}\left(t_{i}\right) \mathbb{G}_{F}\left(t_{j}\right)=F\left(t_{i} \wedge t_{j}\right)-F\left(t_{i}\right) F\left(t_{j}\right) \tag{19.2}
\end{equation*}
$$

This suggests that the sequence of empirical processes $\sqrt{n}\left(\mathbb{F}_{n}-F\right)$, viewed as random functions, converges in distribution to a Gaussian process $\mathbb{G}_{F}$ with zero mean and covariance functions as in the preceding display. According to an extension of Donsker's theorem, this is true in the sense of weak convergence of these processes in the Skorohod space $D[-\infty, \infty]$ equipped with the uniform norm. The limit process $\mathbb{G}_{F}$ is known as an $F$ Brownian bridge process, and as a standard (or uniform) Brownian bridge if $F$ is the uniform distribution $\lambda$ on $[0,1]$. From the form of the covariance function it is clear that the $F$-Brownian bridge is obtainable as $\mathbb{G}_{\lambda} \circ F$ from a standard bridge $\mathbb{G}_{\lambda}$. The name "bridge" results from the fact that the sample paths of the process are zero (one says "tied down") at the endpoints $-\infty$ and $\infty$. This is a consequence of the fact that the difference of two distribution functions is zero at these points.
19.3 Theorem (Donsker). If $X_{1}, X_{2} \ldots$ are i.i.d. random variables with distribution function $F$, then the sequence of empirical processes $\sqrt{n}\left(\mathbb{F}_{n}-F\right)$ converges in distribution in the space $D[-\infty, \infty]$ to a tight random element $\mathbb{G}_{F}$, whose marginal distributions are zero-mean normal with covariance function (19.2).

Proof. The proof of this theorem is long. Because there is little to be gained by considering the special case of cells in the real line, we deduce the theorem from a more general result in the next section.

Figure 19.1 shows some realizations of the uniform empirical process. The roughness of the sample path for $n=5000$ is remarkable, and typical. It is carried over onto the limit

![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-054.jpg?height=6470&width=4937&top_left_y=541&top_left_x=358)
Figure 19.1. Three realizations of the uniform empirical process, of 50 (top), 500 (middle), and 5000 (bottom) observations, respectively.

process, for it can be shown that, for every $t$,

$$
0<\liminf _{h \rightarrow 0} \frac{\left|\mathbb{G}_{\lambda}(t+h)-\mathbb{G}_{\lambda}(t)\right|}{\sqrt{|h \log \log h|}} \leq \limsup _{h \rightarrow 0} \frac{\left|\mathbb{G}_{\lambda}(t+h)-\mathbb{G}_{\lambda}(t)\right|}{\sqrt{|h \log \log h|}}<\infty
$$

Thus, the increments of the sample paths of a standard Brownian bridge are close to being of the order $\sqrt{|h|}$. This means that the sample paths are continuous, but nowhere differentiable.

A related process is the Brownian motion process, which can be defined by $\mathbb{Z}_{\lambda}(t)= \mathbb{G}_{\lambda}(t)+t Z$ for a standard normal variable $Z$ independent of $\mathbb{G}_{\lambda}$. The addition of $t Z$ "liberates" the sample paths at $t=1$ but retains the "tie" at $t=0$. The Brownian motion process has the same modulus of continuity as the Brownian bridge and is considered an appropriate model for the physical Brownian movement of particles in a gas. The three coordinates of a particle starting at the origin at time 0 would be taken equal to three independent Brownian motions.

The one-dimensional empirical process and its limits have been studied extensively. ${ }^{\dagger}$ For instance, the Glivenko-Cantelli theorem can be strengthened to a law of the iterated logarithm,

$$
\limsup _{n \rightarrow \infty} \sqrt{\frac{n}{2 \log \log n}}\left\|\mathbb{F}_{n}-F\right\|_{\infty} \leq \frac{1}{2}, \quad \text { a.s. }
$$

with equality if $F$ takes on the value $\frac{1}{2}$. This can be further strengthened to Strassen's theorem

$$
\sqrt{\frac{n}{2 \log \log n}}\left(\mathbb{F}_{n}-F\right) \xrightarrow{\rightsquigarrow} \mathcal{H} \circ F, \quad \text { a.s. }
$$

Here $\mathcal{H} \circ F$ is the class of all functions $h \circ F$ if $h:[0,1] \mapsto \mathbb{R}$ ranges over the set of absolutely continuous functions ${ }^{\ddagger}$ with $h(0)=h(1)=0$ and $\int_{0}^{1} h^{\prime}(s)^{2} d s \leq 1$. The notation $h_{n} \xrightarrow{\rightsquigarrow} \mathcal{H}$ means that the sequence $h_{n}$ is relatively compact with respect to the uniform norm, with the collection of all limit points being exactly equal to $\mathcal{H}$. Strassen's theorem gives a fairly precise idea of the fluctuations of the empirical process $\sqrt{n}\left(\mathbb{F}_{n}-F\right)$, when striving in law to $\mathbb{G}_{F}$.

The preceding results show that the uniform distance of $\mathbb{F}_{n}$ to $F$ is maximally of the order $\sqrt{\log \log n / n}$ as $n \rightarrow \infty$. It is also known that

$$
\liminf _{n \rightarrow \infty} \sqrt{2 n \log \log n}\left\|\mathbb{F}_{n}-F\right\|_{\infty}=\frac{\pi}{2}, \quad \text { a.s. }
$$

Thus the uniform distance is asymptotically (along the sequence) at least $1 /(n \log \log n)$.
A famous theorem, the $D K W$ inequality after Dvoretsky, Kiefer, and Wolfowitz, gives a bound on the tail probabilities of $\left\|\mathbb{F}_{n}-F\right\|_{\infty}$. For every $x$

$$
\mathrm{P}\left(\sqrt{n}\left\|\mathbb{F}_{n}-F\right\|_{\infty}>x\right) \leq 2 e^{-2 x^{2}}
$$

The originally DKW inequality did not specify the leading constant 2, which cannot be improved. In this form the inequality was found as recently as 1990 (see [103]).

The central limit theorem can be strengthened through strong approximations. These give a special construction of the empirical process and Brownian bridges, on the same probability space, that are close not only in a distributional sense but also in a pointwise sense. One such result asserts that there exists a probability space carrying i.i.d. random variables $X_{1}, X_{2}, \ldots$ with law $F$ and a sequence of Brownian bridges $\mathbb{G}_{F, n}$ such that

$$
\limsup _{n \rightarrow \infty} \frac{\sqrt{n}}{(\log n)^{2}}\left\|\sqrt{n}\left(\mathbb{F}_{n}-F\right)-\mathbb{G}_{F, n}\right\|_{\infty}<\infty, \quad \text { a.s. }
$$

[^5]Because, by construction, every $\mathbb{G}_{F, n}$ is equal in law to $\mathbb{G}_{F}$, this implies that $\sqrt{n}\left(\mathbb{F}_{n}-\right. F) \rightsquigarrow \mathbb{G}_{F}$ as a process (Donsker's theorem), but it implies a lot more. Apparently, the distance between the sequence and its limit is of the order $O\left((\log n)^{2} / \sqrt{n}\right)$. After the method of proof and the country of origin, results of this type are also known as Hungarian embeddings. Another construction yields the estimate, for fixed constants $a, b$, and $c$ and every $x>0$,

$$
\mathrm{P}\left(\left\|\sqrt{n}\left(\mathbb{F}_{n}-F\right)-\mathbb{G}_{F, n}\right\|_{\infty}>\frac{a \log n+x}{\sqrt{n}}\right) \leq b e^{-c x}
$$

### 19.2 Empirical Distributions

Let $X_{1}, \ldots, X_{n}$ be a random sample from a probability distribution $P$ on a measurable space $(\mathcal{X}, \mathcal{A})$. The empirical distribution is the discrete uniform measure on the observations. We denote it by $\mathbb{P}_{n}=n^{-1} \sum_{i=1}^{n} \delta_{X_{i}}$, where $\delta_{x}$ is the probability distribution that is degenerate at $x$. Given a measurable function $f: \mathcal{X} \mapsto \mathbb{R}$, we write $\mathbb{P}_{n} f$ for the expectation of $f$ under the empirical measure, and $P f$ for the expectation under $P$. Thus

$$
\mathbb{P}_{n} f=\frac{1}{n} \sum_{i=1}^{n} f\left(X_{i}\right), \quad P f=\int f d P
$$

Actually, this chapter is concerned with these maps rather than with $\mathbb{P}_{n}$ as a measure.
By the law of large numbers, the sequence $\mathbb{P}_{n} f$ converges almost surely to $P f$, for every $f$ such that $P f$ is defined. The abstract Glivenko-Cantelli theorems make this result uniform in $f$ ranging over a class of functions. A class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ is called $P$-Glivenko-Cantelli if

$$
\left\|\mathbb{P}_{n} f-P f\right\|_{\mathcal{F}}=\sup _{f \in \mathcal{F}}\left|\mathbb{P}_{n} f-P f\right| \xrightarrow{\text { as* }} 0
$$

The empirical process evaluated at $f$ is defined as $\mathbb{G}_{n} f=\sqrt{n}\left(\mathbb{P}_{n} f-P f\right)$. By the multivariate central limit theorem, given any finite set of measurable functions $f_{i}$ with $P f_{i}^{2}<\infty$,

$$
\left(\mathbb{G}_{n} f_{1}, \ldots, \mathbb{G}_{n} f_{k}\right) \rightsquigarrow\left(\mathbb{G}_{P} f_{1}, \ldots, \mathbb{G}_{P} f_{k}\right)
$$

where the vector on the right possesses a multivariate-normal distribution with mean zero and covariances

$$
\mathrm{E} \mathbb{G}_{P} f \mathbb{G}_{P} g=P f g-P f P g .
$$

The abstract Donsker theorems make this result "uniform" in classes of functions. A class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ is called $P$-Donsker if the sequence of processes $\left\{\mathbb{G}_{n} f: f \in \mathcal{F}\right\}$ converges in distribution to a tight limit process in the space $\ell^{\infty}(\mathcal{F})$. Then the limit process is a Gaussian process $\mathbb{G}_{P}$ with zero mean and covariance function as given in the preceding display and is known as a $P$-Brownian bridge. Of course, the Donsker property includes the requirement that the sample paths $f \mapsto \mathbb{G}_{n} f$ are uniformly bounded for every $n$ and every realization of $X_{1}, \ldots, X_{n}$. This is the case, for instance, if the class $\mathcal{F}$
has a finite and integrable envelope function $F$ : a function such that $|f(x)| \leq F(x)<\infty$, for every $x$ and $f$. It is not required that the function $x \mapsto F(x)$ be uniformly bounded.

For convenience of terminology we define a class $\mathcal{F}$ of vector-valued functions $f: x \mapsto \mathbb{R}^{k}$ to be Glivenko-Cantelli or Donsker if each of the classes of coordinates $f_{i}: x \mapsto \mathbb{R}$ with $f=\left(f_{i}, \ldots, f_{k}\right)$ ranging over $\mathcal{F}(i=1,2, \ldots, k)$ is Glivenko-Cantelli or Donsker. It can be shown that this is equivalent to the union of the $k$ coordinate classes being GlivenkoCantelli or Donsker.

Whether a class of functions is Glivenko-Cantelli or Donsker depends on the "size" of the class. A finite class of integrable functions is always Glivenko-Cantelli, and a finite class of square-integrable functions is always Donsker. On the other hand, the class of all square-integrable functions is Glivenko-Cantelli, or Donsker, only in trivial cases. A relatively simple way to measure the size of a class $\mathcal{F}$ is in terms of entropy. We shall mainly consider the bracketing entropy relative to the $L_{r}(P)$-norm

$$
\|f\|_{P, r}=\left(P|f|^{r}\right)^{1 / r}
$$

Given two functions $l$ and $u$, the bracket $[l, u]$ is the set of all functions $f$ with $l \leq f \leq u$. An $\varepsilon$-bracket in $L_{r}(P)$ is a bracket $[l, u]$ with $P(u-l)^{r}<\varepsilon^{r}$. The bracketing number $N_{[]}\left(\varepsilon, \mathcal{F}, L_{r}(P)\right)$ is the minimum number of $\varepsilon$-brackets needed to cover $\mathcal{F}$. (The bracketing functions $l$ and $u$ must have finite $L_{r}(P)$-norms but need not belong to $\mathcal{F}_{\text {.) The entropy }}$ with bracketing is the logarithm of the bracketing number.

A simple condition for a class to be $P$-Glivenko-Cantelli is that the bracketing numbers in $L_{1}(P)$ are finite for every $\varepsilon>0$. The proof is a straightforward generalization of the proof of the classical Glivenko-Cantelli theorem, Theorem 19.1, and is omitted.
19.4 Theorem (Glivenko-Cantelli). Every class $\mathcal{F}$ of measurable functions such that $N_{[]}\left(\varepsilon, \mathcal{F}, L_{1}(P)\right)<\infty$ for every $\varepsilon>0$ is $P$-Glivenko-Cantelli.

For most classes of interest, the bracketing numbers $N_{[]}\left(\varepsilon, \mathcal{F}, L_{r}(P)\right)$ grow to infinity as $\varepsilon \downarrow 0$. A sufficient condition for a class to be Donsker is that they do not grow too fast. The speed can be measured in terms of the bracketing integral

$$
J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)=\int_{0}^{\delta} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon
$$

If this integral is finite-valued, then the class $\mathcal{F}$ is $P$-Donsker. The integrand in the integral is a decreasing function of $\varepsilon$. Hence, the convergence of the integral depends only on the size of the bracketing numbers for $\varepsilon \downarrow 0$. Because $\int_{0}^{1} \varepsilon^{-r} d \varepsilon$ converges for $r<1$ and diverges for $r \geq 1$, the integral condition roughly requires that the entropies grow of slowerorder than $(1 / \varepsilon)^{2}$.

### 19.5 Theorem (Donsker). Every class $\mathcal{F}$ of measurable functions with $J_{[]}\left(1, \mathcal{F}, L_{2}(P)\right) <\infty$ is P-Donsker.

Proof. Let $\mathcal{G}$ be the collection of all differences $f-g$ if $f$ and $g$ range over $\mathcal{F}$. With a given set of $\varepsilon$-brackets $\left[l_{i}, u_{i}\right]$ over $\mathcal{F}$ we can construct $2 \varepsilon$-brackets over $\mathcal{G}$ by taking differences $\left[l_{i}-u_{j}, u_{i}-l_{j}\right]$ of upper and lower bounds. Therefore, the bracketing numbers $N_{[]}\left(\varepsilon, \mathcal{G}, L_{2}(P)\right)$ are bounded by the squares of the bracketing numbers
$N_{[]}\left(\varepsilon / 2, \mathcal{F}, L_{2}(P)\right)$. Taking a logarithm turns the square into a multiplicative factor 2 , and hence the entropy integrals of $\mathcal{F}$ and $\mathcal{G}$ are proportional.

For a given, small $\delta>0$ choose a minimal number of brackets of size $\delta$ that cover $\mathcal{F}$, and use them to form a partition of $\mathcal{F}=\cup_{i} \mathcal{F}_{i}$ in sets diameters smaller than $\delta$. The subset of $\mathcal{G}$ consisting of differences $f-g$ of functions $f$ and $g$ belonging to the same partitioning set consists of functions of $L_{2}(P)$-norm smaller than $\delta$. Hence, by Lemma 19.34 ahead, there exists a finite number $a(\delta)$ such that

$$
\mathrm{E}^{*} \sup _{i} \sup _{f, g \in \mathcal{F}_{i}}\left|\mathbb{G}_{n}(f-g)\right| \lesssim J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)+\sqrt{n} P F 1\{F>a(\delta) \sqrt{n}\} .
$$

Here the envelope function $F$ can be taken equal to the supremum of the absolute values of the upper and lower bounds of finitely many brackets that cover $\mathcal{F}$, for instance a minimal set of brackets of size 1 . This $F$ is square-integrable.

The second term on the right is bounded by $a(\delta)^{-1} P F^{2} 1\{F>a(\delta) \sqrt{n}\}$ and hence converges to zero as $n \rightarrow \infty$ for every fixed $\delta$. The integral converges to zero as $\delta \rightarrow 0$. The theorem follows from Theorem 18.14, in view of Markov's inequality.
19.6 Example (Distribution function). If $\mathcal{F}$ is equal to the collection of all indicator functions of the form $f_{t}=1_{(-\infty, t]}$, with $t$ ranging over $\mathbb{R}$, then the empirical process $\mathbb{G}_{n} f_{t}$ is the classical empirical process $\sqrt{n}\left(\mathbb{F}_{n}(t)-F(t)\right)$. The preceding theorems reduce to the classical theorems by Glivenko-Cantelli and Donsker. We can see this by bounding the bracketing numbers of the set of indicator functions $f_{t}$.

Consider brackets of the form $\left[1_{\left(-\infty, t_{i-1}\right]}, 1_{\left(-\infty, t_{i}\right)}\right]$ for a grid of points $-\infty=t_{0}< t_{1}<\cdots<t_{k}=\infty$ with the property $F\left(t_{i}-\right)-F\left(t_{i-1}\right)<\varepsilon$ for each $i$. These brackets have $L_{1}(F)$-size $\varepsilon$. Their total number $k$ can be chosen smaller than $2 / \varepsilon$. Because $F f^{2} \leq F f$ for every $0 \leq f \leq 1$, the $L_{2}(F)$-size of the brackets is bounded by $\sqrt{\varepsilon}$. Thus $N_{[]}\left(\sqrt{\varepsilon}, \mathcal{F}, L_{2}(F)\right) \leq(2 / \varepsilon)$, whence the bracketing numbers are of the polynomial order $(1 / \varepsilon)^{2}$. This means that this class of functions is very small, because a function of the type $\log (1 / \varepsilon)$ satisfies the entropy condition of Theorem 19.5 easily.
19.7 Example (Parametric class). Let $\mathcal{F}=\left\{f_{\theta}: \theta \in \Theta\right\}$ be a collection of measurable functions indexed by a bounded subset $\Theta \subset \mathbb{R}^{d}$. Suppose that there exists a measurable function $m$ such that

$$
\left|f_{\theta_{1}}(x)-f_{\theta_{2}}(x)\right| \leq m(x)\left\|\theta_{1}-\theta_{2}\right\|, \quad \text { every } \theta_{1}, \theta_{2} .
$$

If $P|m|^{r}<\infty$, then there exists a constant $K$, depending on $\Theta$ and $d$ only, such that the bracketing numbers satisfy

$$
N_{[]}\left(\varepsilon\|m\|_{P, r}, \mathcal{F}, L_{r}(P)\right) \leq K\left(\frac{\operatorname{diam} \Theta}{\varepsilon}\right)^{d}, \quad \text { every } 0<\varepsilon<\operatorname{diam} \Theta .
$$

Thus the entropy is of smaller order than $\log (1 / \varepsilon)$. Hence the bracketing entropy integral certainly converges, and the class of functions $\mathcal{F}$ is Donsker.

To establish the upper bound we use brackets of the type $\left[f_{\theta}-\varepsilon m, f_{\theta}+\varepsilon m\right]$ for $\theta$ ranging over a suitably chosen subset of $\Theta$. These brackets have $L_{r}(P)$-size $2 \varepsilon\|m\|_{P, r}$. If $\theta$ ranges over a grid of meshwidth $\varepsilon$ over $\Theta$, then the brackets cover $\mathcal{F}$, because by the Lipschitz condition, $f_{\theta_{1}}-\varepsilon m \leq f_{\theta_{2}} \leq f_{\theta_{1}}+\varepsilon m$ if $\left\|\theta_{1}-\theta_{2}\right\| \leq \varepsilon$. Thus, we need as many brackets as we need balls of radius $\varepsilon / 2$ to cover $\Theta$.

The size of $\Theta$ in every fixed dimension is at most $\operatorname{diam} \Theta$. We can cover $\Theta$ with fewer than $(\operatorname{diam} \Theta / \varepsilon)^{d}$ cubes of size $\varepsilon$. The circumscribed balls have radius a multiple of $\varepsilon$ and also cover $\Theta$. If we replace the centers of these balls by their projections into $\Theta$, then the balls of twice the radius still cover $\Theta$.
19.8 Example (Pointwise Compact Class). The parametric class in Example 19.7 is certainly Glivenko-Cantelli, but for this a much weaker continuity condition also suffices. Let $\mathcal{F}=\left\{f_{\theta}: \theta \in \Theta\right\}$ be a collection of measurable functions with integrable envelope function $F$ indexed by a compact metric space $\Theta$ such that the map $\theta \mapsto f_{\theta}(x)$ is continuous for every $x$. Then the $L_{1}$-bracketing numbers of $\mathcal{F}$ are finite and hence $\mathcal{F}$ is Glivenko-Cantelli.

We can construct the brackets in the obvious way in the form $\left[f_{B}, f^{B}\right]$, where $B$ is an open ball and $f_{B}$ and $f^{B}$ are the infimum and supremum of $f_{\theta}$ for $\theta \in B$, respectively. Given a sequence of balls $B_{m}$ with common center a given $\theta$ and radii decreasing to 0 , we have $f^{B_{m}}-f_{B_{m}} \downarrow f_{\theta}-f_{\theta}=0$ by the continuity, pointwise in $x$ and hence also in $L_{1}$ by the dominated-convergence theorem and the integrability of the envelope. Thus, given $\varepsilon>0$, for every $\theta$ there exists an open ball $B$ around $\theta$ such that the bracket $\left[f_{B}, f^{B}\right]$ has size at most $\varepsilon$. By the compactness of $\Theta$, the collection of balls constructed in this way has a finite subcover. The corresponding brackets cover $\mathcal{F}$.

This construction shows that the bracketing numbers are finite, but it gives no control on their sizes.
19.9 Example (Smooth functions). Let $\mathbb{R}^{d}=\cup_{j} I_{j}$ be a partition in cubes of volume 1 and let $\mathcal{F}$ be the class of all functions $f: \mathbb{R}^{d} \rightarrow \mathbb{R}$ whose partial derivatives up to order $\alpha$ exist and are uniformly bounded by constants $M_{j}$ on each of the cubes $I_{j}$. (The condition includes bounds on the "zero-th derivative," which is $f$ itself.) Then the bracketing numbers of $\mathcal{F}$ satisfy, for every $V \geq d / \alpha$ and every probability measure $P$,

$$
\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{r}(P)\right) \leq K\left(\frac{1}{\varepsilon}\right)^{V}\left(\sum_{j=1}^{\infty}\left(M_{j}^{r} P\left(I_{j}\right)\right)^{\frac{V}{V+r}}\right)^{\frac{V+r}{r}} .
$$

The constant $K$ depends on $\alpha, V, r$, and $d$ only. If the series on the right converges for $r=2$ and some $d / \alpha \leq V<2$, then the bracketing entropy integral of the class $\mathcal{F}$ converges and hence the class is $P$-Donsker. ${ }^{\dagger}$ This requires sufficient smoothness $\alpha>d / 2$ and sufficiently small tail probabilities $P\left(I_{j}\right)$ relative to the uniform bounds $M_{j}$. If the functions $f$ have compact support (equivalently $M_{j}=0$ for all large $j$ ), then smoothness of order $\alpha>d / 2$ suffices.
19.10 Example (Sobolev classes). Let $\mathcal{F}$ be the set of all functions $f:[0,1] \mapsto \mathbb{R}$ such that $\|f\|_{\infty} \leq 1$ and the ( $k-1$ )-th derivative is absolutely continuous with $\int\left(f^{(k)}\right)^{2}(x) d x \leq$ 1 for some fixed $k \in \mathbb{N}$. Then there exists a constant $K$ such that, for every $\varepsilon>0, \ddagger$

$$
\log N_{[]}\left(\varepsilon, \mathcal{F},\|\cdot\|_{\infty}\right) \leq K\left(\frac{1}{\varepsilon}\right)^{1 / k} .
$$

Thus, the class $\mathcal{F}$ is Donsker for every $k \geq 1$ and every $P$.

[^6]19.11 Example (Bounded variation). Let $\mathcal{F}$ be the collection of all monotone functions $f: \mathbb{R} \mapsto[-1,1]$, or, bigger, the set of all functions that are of variation bounded by 1 . These are the differences of pairs of monotonely increasing functions that together increase at most 1. Then there exists a constant $K$ such that, for every $r \geq 1$ and probability measure $P_{,}^{\dagger}$
$$
\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right) \leq K\left(\frac{1}{\varepsilon}\right)
$$

Thus, this class of functions is $P$-Donsker for every $P$.
19.12 Example (Weighted distribution function). Let $w:(0,1) \mapsto \mathbb{R}^{+}$be a fixed, continuous function. The weighted empirical process of a sample of real-valued observations is the process

$$
t \mapsto \mathbb{G}_{n}^{w}(t)=\sqrt{n}\left(\mathbb{F}_{n}-F\right)(t) w(F(t))
$$

(defined to be zero if $F(t)=0$ or $F(t)=1$ ). For a bounded function $w$, the map $z \mapsto z \cdot w \circ F$ is continuous from $\ell^{\infty}[-\infty, \infty]$ into $\ell^{\infty}[-\infty, \infty]$ and hence the weak convergence of the weighted empirical process follows from the convergence of the ordinary empirical process and the continuous-mapping theorem. Of more interest are weight functions that are unbounded at 0 or 1 , which can be used to rescale the empirical process at its two extremes $-\infty$ and $\infty$. Because the difference $\left(\mathbb{F}_{n}-F\right)(t)$ converges to 0 as $t \rightarrow \pm \infty$, the sample paths of the process $t \mapsto \mathbb{G}_{n}^{w}(t)$ may be bounded even for unbounded $w$, and the rescaling increases our knowledge of the behavior at the two extremes.

A simple condition for the weak convergence of the weighted empirical process in $\ell^{\infty}(-\infty, \infty)$ is that the weight function $w$ is monotone around 0 and 1 and satisfies $\int_{0}^{1} w^{2}(s) d s<\infty$. The square-integrability is almost necessary, because the convergence is known to fail for $w(t)=1 / \sqrt{t(1-t)}$. The Chibisov-O'Reilly theorem gives necessary and sufficient conditions but is more complicated.

We shall give the proof for the case that $w$ is unbounded at only one endpoint and decreases from $w(0)=\infty$ to $w(1)=0$. Furthermore, we assume that $F$ is the uniform measure on $[0,1]$. (The general case can be treated in the same way, or by the quantile transformation.) Then the function $v(s)=w^{2}(s)$ with domain $[0,1]$ has an inverse $v^{-1}(t)=w^{-1}(\sqrt{t})$ with domain $[0, \infty]$. A picture of the graphs shows that $\int_{0}^{\infty} w^{-1}(\sqrt{t}) d t=\int_{0}^{1} w^{2}(t) d t$, which is finite by assumption. Thus, given an $\varepsilon>0$, we can choose partitions $0=s_{0}<s_{1}<\cdots<s_{k}=1$ and $0=t_{0}<t_{1}<\cdots<t_{l}=\infty$ such that, for every $i$,

$$
\int_{s_{i-1}}^{s_{i}} w^{2}(s) d s<\varepsilon^{2}, \quad \int_{t_{i-1}}^{t_{i}} w^{-1}(\sqrt{t}) d t<\varepsilon^{2}
$$

This corresponds to slicing the area under $w^{2}$ both horizontally and vertically in pieces of size $\varepsilon^{2}$. Let the partition $0=u_{0}<u_{1}<\cdots<u_{m}=1$ be the partition consisting of all points $s_{i}$ and all points $w^{-1}\left(\sqrt{t}_{j}\right)$. Then, for every $i$,

$$
\left(w^{2}\left(u_{i-1}\right)-w^{2}\left(u_{i}\right)\right) u_{i-1} \leq \int_{w^{2}\left(u_{i}\right)}^{w^{2}\left(u_{i-1}\right)} w^{-1}(\sqrt{t}) d t<\varepsilon^{2}
$$

[^7]It follows that the brackets

$$
\left[w^{2}\left(u_{i}\right) 1_{\left[0, u_{i-1}\right]}, w^{2}\left(u_{i-1}\right) 1_{\left[0, u_{i-1}\right]}+w^{2} 1_{\left[\left(u_{i-1}, u_{i}\right]\right.}\right]
$$

have $L_{1}(\lambda)$-size $2 \varepsilon^{2}$. Their square roots are brackets for the functions of interest $x \mapsto w(t) 1_{[0, t]}(x)$, and have $L_{2}(\lambda)$-size $\sqrt{2} \varepsilon$, because $P|\sqrt{u}-\sqrt{l}|^{2} \leq P|u-l|$. Because the number $m$ of points in the partitions can be chosen of the order $(1 / \varepsilon)^{2}$ for small $\varepsilon$, the bracketing integral of the class of functions $x \mapsto w(t) 1_{[0, t]}(x)$ converges easily.

The conditions given by the preceding theorems are not necessary, but the theorems cover many examples. Simple necessary and sufficient conditions are not known and may not exist. An alternative set of relatively simple conditions is based on "uniform covering numbers." The covering number $N\left(\varepsilon, \mathcal{F}, L_{2}(Q)\right)$ is the minimal number of $L_{2}(Q)$-balls of radius $\varepsilon$ needed to cover the set $\mathcal{F}$. The entropy is the logarithm of the covering number. The following theorems show that the bracketing numbers in the preceding Glivenko-Cantelli and Donsker theorems can be replaced by the uniform covering numbers

$$
\sup _{Q} N\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right) .
$$

Here the supremum is taken over all probability measures $Q$ for which the class $\mathcal{F}$ is not identically zero (and hence $\|F\|_{Q, r}^{r}=Q F^{r}>0$ ). The uniform covering numbers are relative to a given envelope function $F$. This is fortunate, because the covering numbers under different measures $Q$ typically are more stable if standardized by the norm $\|F\|_{Q, r}$ of the envelope function. In comparison, in the case of bracketing numbers we consider a single distribution $P$, and standardization by an envelope does not make much of a difference. The uniform entropy integral is defined as

$$
J\left(\delta, \mathcal{F}, L_{2}\right)=\int_{0}^{\delta} \sqrt{\log \sup _{Q} N\left(\varepsilon\|F\|_{Q, 2}, \mathcal{F}, L_{2}(Q)\right)} d \varepsilon
$$

19.13 Theorem (Glivenko-Cantelli). Let $\mathcal{F}$ be a suitably measurable class of measurable functions with $\sup _{Q} N\left(\varepsilon\|F\|_{Q, 1}, \mathcal{F}, L_{1}(Q)\right)<\infty$ for every $\varepsilon>0$. If $P^{*} F<\infty$, then $\mathcal{F}$ is P-Glivenko-Cantelli.
19.14 Theorem (Donsker). Let $\mathcal{F}$ be a suitably measurable class of measurable functions with $J\left(1, \mathcal{F}, L_{2}\right)<\infty$. If $P^{*} F^{2}<\infty$, then $\mathcal{F}$ is $P$-Donsker.

The condition that the class $\mathcal{F}$ be "suitably measurable" is satisfied in most examples but cannot be omitted. We do not give a general definition here but note that it suffices that there exists a countable collection $\mathcal{G}$ of functions such that each $f$ is the pointwise limit of a sequence $g_{m}$ in $\mathcal{G} .^{\dagger}$

An important class of examples for which good estimates on the uniform covering numbers are known are the so-called Vapnik-Cervonenkis classes, or VC classes, which are defined through combinatorial properties and include many well-known examples.

[^8]![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-062.jpg?height=3144&width=4304&top_left_y=576&top_left_x=689)
Figure 19.2. The subgraph of a function.

Say that a collection $\mathcal{C}$ of subsets of the sample space $\mathcal{X}$ picks out a certain subset $A$ of the finite set $\left\{x_{1}, \ldots, x_{n}\right\} \subset \mathcal{X}$ if it can be written as $A=\left\{x_{1}, \ldots, x_{n}\right\} \cap C$ for some $C \in \mathcal{C}$. The collection $\mathcal{C}$ is said to shatter $\left\{x_{1}, \ldots, x_{n}\right\}$ if $\mathcal{C}$ picks out each of its $2^{n}$ subsets. The VC index $V(\mathcal{C})$ of $\mathcal{C}$ is the smallest $n$ for which no set of size $n$ is shattered by $\mathcal{C}$. A collection $\mathcal{C}$ of measurable sets is called a VC class if its index $V(\mathcal{C})$ is finite.

More generally, we can define VC classes of functions. A collection $\mathcal{F}$ is a VC class of functions if the collection of all subgraphs $\{(x, t): f(x)<t\}$, if $f$ ranges over $\mathcal{F}$, forms a VC class of sets in $\mathcal{X} \times \mathbb{R}$ (Figure 19.2). It is not difficult to see that a collection of sets $C$ is a VC class of sets if and only if the collection of corresponding indicator functions $1_{C}$ is a VC class of functions. Thus, it suffices to consider VC classes of functions.

By definition, a VC class of sets picks out strictly less than $2^{n}$ subsets from any set of $n \geq V(\mathcal{C})$ elements. The surprising fact, known as Sauer's lemma, is that such a class can necessarily pick out only a polynomial number $O\left(n^{V(\mathcal{C})-1}\right)$ of subsets, well below the $2^{n}-1$ that the definition appears to allow. Now, the number of subsets picked out by a collection $\mathcal{C}$ is closely related to the covering numbers of the class of indicator functions $\left\{1_{C}: C \in \mathcal{C}\right\}$ in $L_{1}(Q)$ for discrete, empirical type measures $Q$. By a clever argument, Sauer's lemma can be used to bound the uniform covering (or entropy) numbers for this class.
19.15 Lemma. There exists a universal constant $K$ such that for any VC class $\mathcal{F}$ of functions, any $r \geq 1$ and $0<\varepsilon<1$,

$$
\sup _{Q} N\left(\varepsilon\|F\|_{Q, r}, \mathcal{F}, L_{r}(Q)\right) \leq K V(\mathcal{F})(16 e)^{V(\mathcal{F})}\left(\frac{1}{\varepsilon}\right)^{r(V(\mathcal{F})-1)} .
$$

Consequently, VC classes are examples of polynomial classes in the sense that their covering numbers are bounded by a polynomial in $1 / \varepsilon$. They are relatively small. The
upper bound shows that VC classes satisfy the entropy conditions for the Glivenko-Cantelli theorem and Donsker theorem discussed previously (with much to spare). Thus, they are $P$ -Glivenko-Cantelli and $P$-Donsker under the moment conditions $P^{*} F<\infty$ and $P^{*} F^{2}<\infty$ on their envelope function, if they are "suitably measurable." (The VC property does not imply the measurability.)
19.16 Example (Cells). The collection of all cells $(-\infty, t]$ in the real line is a VC class of index $V(\mathcal{C})=2$. This follows, because every one-point set $\left\{x_{1}\right\}$ is shattered, but no two-point set $\left\{x_{1}, x_{2}\right\}$ is shattered: If $x_{1}<x_{2}$, then the cells $(-\infty, t]$ cannot pick out $\left\{x_{2}\right\}$. $\square$
19.17 Example (Vector spaces). Let $\mathcal{F}$ be the set of all linear combinations $\sum \lambda_{i} f_{i}$ of a given, finite set of functions $f_{1}, \ldots, f_{k}$ on $\mathcal{X}$. Then $\mathcal{F}$ is a VC class and hence has a finite uniform entropy integral. Furthermore, the same is true for the class of all sets $\{f>c\}$ if $f$ ranges over $f$ and $c$ over $\mathbb{R}$.

For instance, we can construct $\mathcal{F}$ to be the set of all polynomials of degree less than some number, by taking basis functions $1, x, x^{2}, \ldots$ on $\mathbb{R}$ and functions $x_{1}^{i_{1}} \cdots x_{d}^{i_{d}}$ more generally. For polynomials of degree up to 2 the collection of sets $\{f>0\}$ contains already all half-spaces and all ellipsoids. Thus, for instance, the collection of all ellipsoids is Glivenko-Cantelli and Donsker for any $P$.

To prove that $\mathcal{F}$ is a VC class, consider any collection of $n=k+2$ points $\left(x_{1}, t_{1}\right), \ldots$, $\left(x_{n}, t_{n}\right)$ in $\mathcal{X} \times \mathbb{R}$. We shall show this set is not shattered by $\mathcal{F}$, whence $V(\mathcal{F}) \leq n$.

By assumption, the vectors $\left.\left(f\left(x_{1}\right)-t_{1}, \ldots, f\left(x_{n}\right)-t_{n}\right)\right)^{T}$ are contained in a $(k+1)$ dimensional subspace of $\mathbb{R}^{n}$. Any vector $a$ that is orthogonal to this subspace satisfies

$$
\sum_{i: a_{i}>0} a_{i}\left(f\left(x_{i}\right)-t_{i}\right)=\sum_{i: a_{i}<0}\left(-a_{i}\right)\left(f\left(x_{i}\right)-t_{i}\right) .
$$

(Define a sum over the empty set to be zero.) There exists a vector $a$ with at least one strictly positive coordinate. Then the set $\left\{\left(x_{i}, t_{i}\right): a_{i}>0\right\}$ is nonempty and is not picked out by the subgraphs of $\mathcal{F}$. If it were, then it would be of the form $\left\{\left(x_{i}, t_{i}\right): t_{i}<f\left(t_{i}\right)\right\}$ for some $f$, but then the left side of the display would be strictly positive and the right side nonpositive. $\square$

A number of operations allow to build new VC classes or Donsker classes out of known VC classes or Donsker classes.
19.18 Example (Stability properties). The class of all complements $C^{c}$, all intersections $C \cap D$, all unions $C \cup D$, and all Cartesian products $C \times D$ of sets $C$ and $D$ that range over VC classes $\mathcal{C}$ and $\mathcal{D}$ is VC.

The class of all suprema $f \vee g$ and infima $f \wedge g$ of functions $f$ and $g$ that range over VC classes $\mathcal{F}$ and $\mathcal{G}$ is VC.

The proof that the collection of all intersections is VC is easy upon using Sauer's lemma, according to which a VC class can pick out only a polynomial number of subsets. From $n$ given points $\mathcal{C}$ can pick out at most $O\left(n^{V(\mathcal{C})}\right)$ subsets. From each of these subsets $\mathcal{D}$ can pick out at most $O\left(n^{V(\mathcal{D})}\right)$ further subsets. A subset picked out by $C \cap D$ is equal to the subset picked out by $C$ intersected with $D$. Thus we get all subsets by following the
two-step procedure and hence $\mathcal{C} \cap \mathcal{D}$ can pick out at most $\mathcal{O}\left(n^{V(\mathcal{C})+V(\mathcal{D})}\right)$ subsets. For large $n$ this is well below $2^{n}$, whence $\mathcal{C} \cap \mathcal{D}$ cannot pick out all subsets.

That the set of all complements is VC is an immediate consequence of the definition. Next the result for the unions follows by combination, because $C \cup D=\left(C^{c} \cap D^{c}\right)^{c}$.

The results for functions are consequences of the results for sets, because the subgraphs of suprema and infima are the intersections and unions of the subgraphs, respectively.
19.19 Example (Uniform entropy). If $\mathcal{F}$ and $\mathcal{G}$ possess a finite uniform entropy integral, relative to envelope functions $F$ and $G$, then so does the class $\mathcal{F} \mathcal{G}$ of all functions $x \mapsto f(x) g(x)$, relative to the envelope function $F G$.

More generally, suppose that $\phi: \mathbb{R}^{2} \mapsto \mathbb{R}$ is a function such that, for given functions $L_{f}$ and $L_{g}$ and every $x$,

$$
\left|\phi\left(f_{1}(x), g_{1}(x)\right)-\phi\left(f_{2}(x), g_{2}(x)\right)\right| \leq L_{f}(x)\left|f_{1}-f_{2}\right|(x)+L_{g}(x)\left|g_{1}-g_{2}\right|(x) .
$$

Then the class of all functions $\phi(f, g)-\phi\left(f_{0}, g_{0}\right)$ has a finite uniform entropy integral relative to the envelope function $L_{f} F+L_{g} G$, whenever $\mathcal{F}$ and $\mathcal{G}$ have finite uniform entropy integrals relative to the envelopes $F$ and $G$. $\square$
19.20 Example (Lipschitz transformations). For any fixed Lipschitz function $\phi: \mathbb{R}^{2} \mapsto \mathbb{R}$, the class of all functions of the form $\phi(f, g)$ is Donsker, if $f$ and $g$ range over Donsker classes $\mathcal{F}$ and $\mathcal{G}$ with integrable envelope functions.

For example, the class of all sums $f+g$, all minima $f \wedge g$, and all maxima $f \vee g$ are Donsker. If the classes $\mathcal{F}$ and $\mathcal{G}$ are uniformly bounded, then also the products $f g$ form a Donsker class, and if the functions $f$ are uniformly bounded away from zero, then the functions $1 / f$ form a Donsker class. $\square$

### 19.3 Goodness-of-Fit Statistics

An important application of the empirical distribution is the testing of goodness-of-fit. Because the empirical distribution $\mathbb{P}_{n}$ is always a reasonable estimator for the underlying distribution $P$ of the observations, any measure of the discrepancy between $\mathbb{P}_{n}$ and $P$ can be used as a test statistic for testing the hypothesis that the true underlying distribution is $P$.

Some popular global measures of discrepancy for real-valued observations are

$$
\begin{array}{lr}
\sqrt{n}\left\|\mathbb{F}_{n}-F\right\|_{\infty}, & (\text { Kolmogorov-Smirnov }) \\
n \int\left(\mathbb{F}_{n}-F\right)^{2} d F, & (\text { Cramér-von Mises })
\end{array}
$$

These statistics, as well as many others, are continuous functions of the empirical process. The continuous-mapping theorem and Theorem 19.3 immediately imply the following result.
19.21 Corollary. If $X_{1}, X_{2}, \ldots$ are i.i.d. random variables with distribution function $F$, then the sequences of Kolmogorov-Smirnov statistics and Cramér-von Mises statistics converge in distribution to $\left\|\mathbb{G}_{F}\right\|_{\infty}$ and $\int \mathbb{G}_{F}^{2} d F$, respectively. The distributions of these limits are the same for every continuous distribution function $F$.

Proof. The maps $z \mapsto\|z\|_{\infty}$ and $z \mapsto \int z^{2}(t) d t$ from $D[-\infty, \infty]$ into $\mathbb{R}$ are continuous with respect to the supremum norm. Consequently, the first assertion follows from the continuous-mapping theorem. The second assertion follows by the change of variables $F(t) \mapsto u$ in the representation $\mathbb{G}_{F}=\mathbb{G}_{\lambda} \circ F$ of the Brownian bridge. Alternatively, use the quantile transformation to see that the Kolmogorov-Smirnov and Cramér-von Mises statistics are distribution-free for every fixed $n$.

It is probably practically more relevant to test the goodness-of-fit of compositive null hypotheses, for instance the hypothesis that the underlying distribution $P$ of a random sample is normal, that is, it belongs to the normal location-scale family. To test the null hypothesis that $P$ belongs to a certain family $\left\{P_{\theta}: \theta \in \Theta\right\}$, it is natural to use a measure of the discrepancy between $\mathbb{P}_{n}$ and $P_{\hat{\theta}}$, for a reasonable estimator $\hat{\theta}$ of $\theta$. For instance, a modified Kolmogorov-Smirnov statistic for testing normality is

$$
\sup _{t} \sqrt{n}\left|\mathbb{F}_{n}(t)-\Phi\left(\frac{t-\bar{X}}{S}\right)\right| .
$$

For many goodness-of-fit statistics of this type, the limit distribution follows from the limit distribution of $\sqrt{n}\left(\mathbb{P}_{n}-P_{\hat{\theta}}\right)$. This is not a Brownian bridge but also contains a "drift," due to $\hat{\theta}$. Informally, if $\theta \mapsto P_{\theta}$ has a derivative $\dot{P}_{\theta}$ in an appropriate sense, then

$$
\begin{align*}
\sqrt{n}\left(\mathbb{P}_{n}-P_{\hat{\theta}}\right) & =\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta}\right)-\sqrt{n}\left(P_{\hat{\theta}}-P_{\theta}\right), \\
& \approx \sqrt{n}\left(\mathbb{P}_{n}-P_{\theta}\right)-\sqrt{n}(\hat{\theta}-\theta)^{T} \dot{P}_{\theta} . \tag{19.22}
\end{align*}
$$

By the continuous-mapping theorem, the limit distribution of the last approximation can be derived from the limit distribution of the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta}, \hat{\theta}-\theta\right)$. The first component converges in distribution to a Brownian bridge. Its joint behavior with $\sqrt{n}(\hat{\theta}-\theta)$ can most easily be obtained if the latter sequence is asymptotically linear. Assume that

$$
\sqrt{n}\left(\hat{\theta}_{n}-\theta\right)=\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \psi_{\theta}\left(X_{i}\right)+o_{P_{\theta}}(1),
$$

for "influence functions" $\psi_{\theta}$ with $P_{\theta} \psi_{\theta}=0$ and $P_{\theta}\left\|\psi_{\theta}\right\|^{2}<\infty$.
19.23 Theorem. Let $X_{1}, \ldots, X_{n}$ be a random sample from a distribution $P_{\theta}$ indexed by $\theta \in \mathbb{R}^{k}$. Let $\mathcal{F}$ be a $P_{\theta}$-Donsker class of measurable functions and let $\hat{\theta}_{n}$ be estimators that are asymptotically linear with influence function $\psi_{\theta}$. Assume that the map $\theta \mapsto P_{\theta}$ from $\mathbb{R}^{k}$ to $\ell^{\infty}(\mathcal{F})$ is Fréchet differentiable at $\theta .{ }^{\dagger}$ Then the sequence $\sqrt{n}\left(\mathbb{P}_{n}-P_{\hat{\theta}}\right)$ converges under $\theta$ in distribution in $\ell^{\infty}(\mathcal{F})$ to the process $f \mapsto \mathbb{G}_{P_{\theta}} f-\mathbb{G}_{P_{\theta}} \psi_{\theta}^{T} \dot{P}_{\theta} f$.

Proof. In view of the differentiability of the map $\theta \mapsto P_{\theta}$ and Lemma 2.12,

$$
\left\|P_{\hat{\theta}_{n}}-P_{\theta}-(\hat{\theta}-\theta)^{T} \dot{P}_{\theta}\right\|_{\mathcal{F}}=o_{P}\left(\left\|\hat{\theta}_{n}-\theta\right\|\right) .
$$

This justifies the approximation (19.22). The class $\mathcal{G}$ obtained by adding the $k$ components of $\psi_{\theta}$ to $\mathcal{F}$ is Donsker. (The union of two Donsker classes is Donsker, in general. In
${ }^{\dagger}$ This means that there exists a map $\dot{P}_{\theta}: \mathcal{F} \mapsto \mathbb{R}^{k}$ such that $\left\|P_{\theta+h}-P_{\theta}-h^{T} \dot{P}_{\theta}\right\|_{\mathcal{F}}=o(\|h\|)$ as $h \rightarrow 0$; see Chapter 20.
the present case, the result also follows directly from Theorem 18.14.) The variables $\left(\sqrt{n}\left(\mathbb{P}_{n}-P_{\theta}\right), n^{-1 / 2} \sum \psi_{\theta}\left(X_{i}\right)\right)$ are obtained from the empirical process seen as an element of $\ell^{\infty}(\mathcal{G})$ by a continuous map. Finally, apply Slutsky's lemma.

The preceding theorem implies, for instance, that the sequences of modified KolmogorovSmirnov statistic $\sqrt{n}\left\|\mathbb{F}_{n}-F_{\hat{\theta}}\right\|_{\infty}$ converge in distribution to the supremum of a certain Gaussian process. The distribution of the limit may depend on the model $\theta \mapsto F_{\theta}$, the estimators $\hat{\theta}_{n}$, and even on the parameter value $\theta$. Typically, this distribution is not known in closed form but has to be approximated numerically or by simulation. On the other hand, the limit distribution of the true Kolmogorov-Smirnov statistic under a continuous distribution can be derived from properties of the Brownian bridge, and is given by ${ }^{\dagger}$

$$
\mathrm{P}\left(\left\|\mathbb{G}_{\lambda}\right\|_{\infty}>x\right)=2 \sum_{j=1}^{\infty}(-1)^{j+1} e^{-2 j^{2} x^{2}}
$$

With the Donsker theorem in hand, the route via the Brownian bridge is probably the most convenient. In the 1940s Smirnov obtained the right side as the limit of an explicit expression for the distribution function of the Kolmogorov-Smirnov statistic.

### 19.4 Random Functions

The language of Glivenko-Cantelli classes, Donsker classes, and entropy appears to be convenient to state the "regularity conditions" needed in the asymptotic analysis of many statistical procedures. For instance, in the analysis of $Z$ - and $M$-estimators, the theory of empirical processes is a powerful tool to control remainder terms. In this section we consider the key element in this application: controlling random sequences of the form $\sum_{i=1}^{n} f_{n, \hat{\theta}_{n}}\left(X_{i}\right)$ for functions $f_{n, \theta}$ that change with $n$ and depend on an estimated parameter.

If a class $\mathcal{F}$ of functions is $P$-Glivenko-Cantelli, then the difference $\left|\mathbb{P}_{n} f-P f\right|$ converges to zero uniformly in $f$ varying over $\mathcal{F}$, almost surely. Then it is immediate that also $\left|\mathbb{P}_{n} \hat{f}_{n}-P \hat{f}_{n}\right| \xrightarrow{\text { as }} 0$ for every sequence of random functions $\hat{f}_{n}$ that are contained in $\mathcal{F}$. If $\hat{f}_{n}$ converges almost surely to a function $f_{0}$ and the sequence is dominated (or uniformly integrable), so that $P \hat{f}_{n} \xrightarrow{\text { as }} P f_{0}$, then it follows that $\mathbb{P}_{n} \hat{f}_{n} \xrightarrow{\text { as }} P f_{0}$.

Here by "random functions" we mean measurable functions $x \mapsto \hat{f}_{n}(x ; \omega)$ that, for every fixed $x$, are real maps defined on the same probability space as the observations $X_{1}(\omega), \ldots, X_{n}(\omega)$. In many examples the function $\hat{f}_{n}(x)=\hat{f}_{n}\left(x ; X_{1}, \ldots, X_{n}\right)$ is a function of the observations, for every fixed $x$. The notations $\mathbb{P}_{n} \hat{f}_{n}$ and $P \hat{f}_{n}$ are abbreviations for the expectations of the functions $x \mapsto \hat{f}_{n}(x ; \omega)$ with $\omega$ fixed.

A similar principle applies to Donsker classes of functions. For a Donsker class $\mathcal{F}$, the empirical process $\mathbb{G}_{n} f$ converges in distribution to a $P$-Brownian bridge process $\mathbb{G}_{P} f$ "uniformly in $f \in \mathcal{F}$." In view of Lemma 18.15, the limiting process has uniformly continuous sample paths with respect to the variance semimetric. The uniform convergence combined with the continuity yields the weak convergence $\mathbb{G}_{n} \hat{f}_{n} \rightsquigarrow \mathbb{G}_{P} f_{0}$ for every sequence $\hat{f}_{n}$ of random functions that are contained in $\mathcal{F}$ and that converges in the variance semimetric to a function $f_{0}$.

[^9]19.24 Lemma. Suppose that $\mathcal{F}$ is a $P$-Donsker class of measurable functions and $\hat{f}_{n}$ is a sequence of random functions that take their values in $\mathcal{F}$ such that $\int\left(\hat{f}_{n}(x)-f_{0}(x)\right)^{2} d P(x)$ converges in probability to 0 for some $f_{0} \in L_{2}(P)$. Then $\mathbb{G}_{n}\left(\hat{f}_{n}-f_{0}\right) \xrightarrow{\mathrm{P}} 0$ and hence $\mathbb{G}_{n} \hat{f}_{n} \rightsquigarrow \mathbb{G}_{P} f_{0}$.

Proof. Assume without of loss of generality that $f_{0}$ is contained in $\mathcal{F}$. Define a function $g: \ell^{\infty}(\mathcal{F}) \times \mathcal{F} \mapsto \mathbb{R}$ by $g(z, f)=z(f)-z\left(f_{0}\right)$. The set $\mathcal{F}$ is a semimetric space relative to the $L_{2}(P)$-metric. The function $g$ is continuous with respect to the product semimetric at every point $(z, f)$ such that $f \mapsto z(f)$ is continuous. Indeed, if $\left(z_{n}, f_{n}\right) \rightarrow(z, f)$ in the space $\ell^{\infty}(\mathcal{F}) \times \mathcal{F}$, then $z_{n} \rightarrow z$ uniformly and hence $z_{n}\left(f_{n}\right)=z\left(f_{n}\right)+o(1) \rightarrow z(f)$ if $z$ is continuous at $f$.

By assumption, $\hat{f}_{n} \xrightarrow{\mathrm{P}} f_{0}$ as maps in the metric space $\mathcal{F}$. Because $\mathcal{F}$ is Donsker, $\mathbb{G}_{n} \rightsquigarrow \mathbb{G}_{P}$ in the space $\ell^{\infty}(\mathcal{F})$, and it follows that $\left(\mathbb{G}_{n}, \hat{f}_{n}\right) \rightsquigarrow\left(\mathbb{G}_{P}, f_{0}\right)$ in the space $\ell^{\infty}(\mathcal{F}) \times \mathcal{F}$. By Lemma 18.15, almost all sample paths of $\mathbb{G}_{P}$ are continuous on $\mathcal{F}$. Thus the function $g$ is continuous at almost every point $\left(\mathbb{G}_{P}, f_{0}\right)$. By the continuous-mapping theorem, $\mathbb{G}_{n}\left(\hat{f}_{n}-f_{0}\right)=g\left(\mathbb{G}_{n}, \hat{f}_{n}\right) \rightsquigarrow g\left(\mathbb{G}_{P}, f_{0}\right)=0$. The lemma follows, because convergence in distribution and convergence in probability are the same for a degenerate limit.

The preceding lemma can also be proved by reference to an almost sure representation for the converging sequence $\mathbb{G}_{n} \rightsquigarrow \mathbb{G}_{P}$. Such a representation, a generalization of Theorem 2.19 exists. However, the correct handling of measurability issues makes its application involved.
19.25 Example (Mean absolute deviation). The mean absolute deviation of a random sample $X_{1}, \ldots, X_{n}$ is the scale estimator

$$
M_{n}=\frac{1}{n} \sum_{i=1}^{n}\left|X_{i}-\bar{X}_{n}\right| .
$$

The absolute value bars make the derivation of its asymptotic distribution surprisingly difficult. (Try and do it by elementary means.) Denote the distribution function of the observations by $F$, and assume for simplicity of notation that they have mean $F x$ equal to zero. We shall write $\mathbb{F}_{n}|x-\theta|$ for the stochastic process $\theta \mapsto n^{-1} \sum_{i=1}^{n}\left|X_{i}-\theta\right|$, and use the notations $\mathbb{G}_{n}|x-\theta|$ and $F|x-\theta|$ in a similar way.

If $F x^{2}<\infty$, then the set of functions $x \mapsto|x-\theta|$ with $\theta$ ranging over a compact, such as $[-1,1]$, is $F$-Donsker by Example 19.7. Because, by the triangle inequality, $F(\mid x- \bar{X}_{n}|-|x|)^{2} \leq\left|\bar{X}_{n}\right|^{2} \xrightarrow{P} 0$, the preceding lemma shows that $\mathbb{G}_{n}\left|x-\bar{X}_{n}\right|-\mathbb{G}_{n}|x| \xrightarrow{P} 0$. This can be rewritten as

$$
\sqrt{n}\left(M_{n}-F|x|\right)=\sqrt{n}\left(F\left|x-\bar{X}_{n}\right|-F|x|\right)+\mathbb{G}_{n}|x|+o_{P}(1) .
$$

If the map $\theta \mapsto F|x-\theta|$ is differentiable at 0 , then, with the derivative written in the form $2 F(0)-1$, the first term on the right is asymptotically equivalent to $(2 F(0)-1) \mathbb{G}_{n} x$, by the delta method. Thus, the mean absolute deviation is asymptotically normal with mean zero and asymptotic variance equal to the variance of $(2 F(0)-1) X_{1}+\left|X_{1}\right|$.

If the mean and median of the observations are equal (i.e., $F(0)=\frac{1}{2}$ ), then the first term is 0 and hence the centering of the absolute values at the sample mean has the same effect
as centering at the true mean. In this case not knowing the true mean does not hurt the scale estimator. In comparison, for the sample variance this is true for any $F$.

Perhaps the most important application of the preceding lemma is to the theory of $Z$ estimators. In Theorem 5.21 we imposed a pointwise Lipschitz condition on the maps $\theta \mapsto \psi_{\theta}$ to ensure the convergence 5.22 :

$$
\mathbb{G}_{n}\left(\hat{\psi}_{\hat{\theta}_{n}}-\psi_{\theta_{0}}\right) \xrightarrow{\mathrm{P}} 0 .
$$

In view of Example 19.7, this is now seen to be a consequence of the preceding lemma. The display is valid if the class of functions $\left\{\psi_{\theta}:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ is Donsker for some $\delta>0$ and $\psi_{\theta} \rightarrow \psi_{\theta_{0}}$ in quadratic mean. Imposing a Lipschitz condition is just one method to ensure these conditions, and hence Theorem 5.21 can be extended considerably. In particular, in its generalized form the theorem covers the sample median, corresponding to the choice $\psi_{\theta}(x)=\operatorname{sign}(x-\theta)$. The sign functions can be bracketed just as the indicator functions of cells considered in Example 19.6 and thus form a Donsker class.

For the treatment of semiparametric models (see Chapter 25), it is useful to extend the results on $Z$-estimators to the case of infinite-dimensional parameters. A differentiability or Lipschitz condition on the maps $\theta \mapsto \psi_{\theta}$ would preclude most applications of interest. However, if we use the language of Donsker classes, the extension is straightforward and useful.

If the parameter $\theta$ ranges over a subset of an infinite-dimensional normed space, then we use an infinite number of estimating equations, which we label by some set $H$ and assume to be sums. Thus the estimator $\hat{\theta}_{n}$ (nearly) solves an equation $\mathbb{P}_{n} \psi_{\theta, h}=0$ for every $h \in H$. We assume that, for every fixed $x$ and $\theta$, the map $h \mapsto \psi_{\theta, h}(x)$, which we denote by $\psi_{\theta}(x)$, is uniformly bounded, and the same for the map $h \mapsto P \psi_{\theta, h}$, which we denote by $P \psi_{\theta}$.
19.26 Theorem. For each $\theta$ in a subset $\Theta$ of a normed space and everyh in an arbitrary set $H$, let $x \mapsto \psi_{\theta, h}(x)$ be a measurable function such that the class $\left\{\psi_{\theta, h}:\left\|\theta-\theta_{0}\right\|<\delta, h \in\right. H\}$ is $P$-Donsker for some $\delta>0$, with finite envelope function. Assume that, as a map into $\ell^{\infty}(H)$, the map $\theta \mapsto P \psi_{\theta}$ is Fréchet-differentiable at a zero $\theta_{0}$, with a derivative $V: \operatorname{lin} \Theta \mapsto \ell^{\infty}(H)$ that has a continuous inverse on its range. Furthermore, assume that $\left\|P\left(\psi_{\theta, h}-\psi_{\theta_{0}, h}\right)^{2}\right\|_{H} \rightarrow 0$ as $\theta \rightarrow \theta_{0}$. If $\left\|\mathbb{P}_{n} \psi_{\hat{\theta}_{n}}\right\|_{H}=o_{P}\left(n^{-1 / 2}\right)$ and $\hat{\theta}_{n} \xrightarrow{\mathrm{P}} \theta_{0}$, then

$$
V \sqrt{n}\left(\hat{\theta}_{n}-\theta_{0}\right)=-\mathbb{G}_{n} \psi_{\theta_{0}}+o_{P}(1)
$$

Proof. This follows the same lines as the proof of Theorem 5.21. The only novel aspect is that a uniform version of Lemma 19.24 is needed to ensure that $\mathbb{G}_{n}\left(\psi_{\hat{\theta}_{n}}-\psi_{\theta_{0}}\right)$ converges to zero in probability in $\ell^{\infty}(H)$. This is proved along the same lines.

Assume without loss of generality that $\hat{\theta}_{n}$ takes its values in $\Theta_{\delta}=\left\{\theta \in \Theta:\left\|\theta-\theta_{0}\right\|<\delta\right\}$ and define a map $g: \ell^{\infty}\left(\Theta_{\delta} \times H\right) \times \Theta_{\delta} \mapsto \ell^{\infty}(H)$ by $g(z, \theta) h=z(\theta, h)-z\left(\theta_{0}, h\right)$. This map is continuous at every point $\left(z, \theta_{0}\right)$ such that $\left\|z(\theta, h)-z\left(\theta_{0}, h\right)\right\|_{H} \rightarrow 0$ as $\theta \rightarrow \theta_{0}$. The sequence $\left(\mathbb{G}_{n} \psi_{\theta}, \hat{\theta}_{n}\right)$ converges in distribution in the space $\ell^{\infty}\left(\Theta_{\delta} \times H\right) \times \Theta_{\delta}$ to a pair $\left(\mathbb{G} \psi_{\theta}, \theta_{0}\right)$. As $\theta \rightarrow \theta_{0}$, we have that $\sup _{h} P\left(\psi_{\theta, h}-\psi_{\theta_{0}, h}\right)^{2} \rightarrow 0$ by assumption, and thus $\left\|\mathbb{G} \psi_{\theta}-\mathbb{G} \psi_{\theta_{0}}\right\|_{H} \rightarrow 0$ almost surely, by the uniform continuity of the sample paths of the Brownian bridge. Thus, we can apply the continuous-mapping theorem and conclude that $g\left(\mathbb{G}_{n} \psi_{\theta}, \hat{\theta}_{n}\right) \rightsquigarrow g\left(\mathbb{G} \psi_{\theta}, \theta_{0}\right)=0$, which is the desired result.

### 19.5 Changing Classes

The Glivenko-Cantelli and Donsker theorems concern the empirical process for different $n$, but each time with the same indexing class $\mathcal{F}$. This is sufficient for a large number of applications, but in other cases it may be necessary to allow the class $\mathcal{F}$ to change with $n$. For instance, the range of the random function $\hat{f}_{n}$ in Lemma 19.24 might be different for every $n$. We encounter one such a situation in the treatment of $M$-estimators and the likelihood ratio statistic in Chapters 5 and 16, in which the random functions of interest $\sqrt{n}\left(m_{\tilde{\theta}_{n}}-m_{\theta_{0}}\right)-\sqrt{n}\left(\tilde{\theta}_{n}-\theta_{0}\right) \dot{m}_{\theta_{0}}$ are obtained by rescaling a given class of functions. It turns out that the convergence of random variables such as $\mathbb{G}_{n} \hat{f}_{n}$ does not require the ranges $\mathcal{F}_{n}$ of the functions $\hat{f}_{n}$ to be constant but depends only on the sizes of the ranges to stabilize. The nature of the functions inside the classes could change completely from $n$ to $n$ (apart from a Lindeberg condition).

Directly or indirectly, all the results in this chapter are based on the maximal inequalities obtained in section 19.6. The most general results can be obtained by applying these inequalities, which are valid for every fixed $n$, directly. The conditions for convergence of quantities such as $\mathbb{G}_{n} \hat{f}_{n}$ are then framed in terms of (random) entropy numbers. In this section we give an intermediate treatment, starting with an extension of the Donsker theorems, Theorems 19.5 and 19.14, to the weak convergence of the empirical process indexed by classes that change with $n$.

Let $\mathcal{F}_{n}$ be a sequence of classes of measurable functions $f_{n, t}: \mathcal{X} \mapsto \mathbb{R}$ indexed by a parameter $t$, which belongs to a common index set $T$. Then we can consider the weak convergence of the stochastic processes $t \mapsto \mathbb{G}_{n} f_{n, t}$ as elements of $\ell^{\infty}(T)$, assuming that the sample paths are bounded. By Theorem 18.14 weak convergence is equivalent to marginal convergence and asymptotic tightness. The marginal convergence to a Gaussian process follows under the conditions of the Lindeberg theorem, Proposition 2.27. Sufficient conditions for tightness can be given in terms of the entropies of the classes $\mathcal{F}_{n}$.

We shall assume that there exists a semimetric $\rho$ that makes $T$ into a totally bounded space and that relates to the $L_{2}$-metric in that

$$
\begin{equation*}
\sup _{\rho(s, t)<\delta_{n}} P\left(f_{n, s}-f_{n, t}\right)^{2} \rightarrow 0, \quad \text { every } \delta_{n} \downarrow 0 . \tag{19.27}
\end{equation*}
$$

Furthermore, we suppose that the classes $\mathcal{F}_{n}$ possess envelope functions $F_{n}$ that satisfy the Lindeberg condition

$$
\begin{aligned}
P F_{n}^{2} & =O(1) \\
P F_{n}^{2}\left\{F_{n}>\varepsilon \sqrt{n}\right\} & \rightarrow 0, \quad \text { every } \varepsilon>0
\end{aligned}
$$

Then the central limit theorem holds under an entropy condition. As before, we can use either bracketing or uniform entropy.
19.28 Theorem. Let $\mathcal{F}_{n}=\left\{f_{n, t}: t \in T\right\}$ be a class of measurable functions indexed by a totally bounded semimetric space $(T, \rho)$ satisfying $(19.27)$ and with envelope function that satisfies the Lindeberg condition. If $J_{[]}\left(\delta_{n}, \mathcal{F}_{n}, L_{2}(P)\right) \rightarrow 0$ for every $\delta_{n} \downarrow 0$, or alternatively, every $\mathcal{F}_{n}$ is suitably measurable and $J\left(\delta_{n}, \mathcal{F}_{n}, L_{2}\right) \rightarrow 0$ for every $\delta_{n} \downarrow 0$, then the sequence $\left\{\mathbb{G}_{n} f_{n, t}: t \in T\right\}$ converges in distribution to a tight Gaussian process, provided the sequence of covariance functions $P f_{n, s} f_{n, t}-P f_{n, s} P f_{n, t}$ converges pointwise on $T \times T$.

Proof. Under bracketing the proof of the following theorem is similar to the proof of Theorem 19.5. We omit the proof under uniform entropy.

For every given $\delta>0$ we can use the semimetric $\rho$ and condition (19.27) to partition $T$ into finitely many sets $T_{1}, \ldots, T_{k}$ such that, for every sufficiently large $n$,

$$
\sup _{i} \sup _{s, t \in T_{i}} P\left(f_{n, s}-f_{n, t}\right)^{2}<\delta^{2}
$$

(This is the only role for the totally bounded semimetric $\rho$; alternatively, we could assume the existence of partitions as in this display directly.) Next we apply Lemma 19.34 to obtain the bound

$$
E \sup _{i} \sup _{s, t \in T_{i}}\left|\mathbb{G}_{n}\left(f_{n, s}-f_{n, t}\right)\right| \lesssim J_{[]}\left(\delta, \mathcal{F}_{n}, L_{2}(P)\right)+\frac{P F_{n}^{2} 1\left\{F_{n}>a_{n}(\delta) \sqrt{n}\right\}}{a_{n}(\delta)} .
$$

Here $a_{n}(\delta)$ is the number given in Lemma 19.34 evaluated for the class of functions $\mathcal{F}_{n}-\mathcal{F}_{n}$ and $F_{n}$ is its envelope, but the corresponding number and envelope of the class $\mathcal{F}_{n}$ differ only by constants. Because $J_{[]}\left(\delta_{n}, \mathcal{F}_{n}, L_{2}(P)\right) \rightarrow 0$ for every $\delta_{n} \downarrow 0$, we must have that $J_{[]}\left(\delta, \mathcal{F}_{n}, L_{2}(P)\right)=O(1)$ for every $\delta>0$ and hence $a_{n}(\delta)$ is bounded away from zero. Then the second term in the preceding display converges to zero for every fixed $\delta>0$, by the Lindeberg condition. The first term can be made arbitrarily small as $n \rightarrow \infty$ by choosing $\delta$ small, by assumption.
19.29 Example (Local empirical measure). Consider the functions $f_{n, t}=r_{n} 1_{\left(a, a+t \delta_{n}\right]}$ for $t$ ranging over a compact in $\mathbb{R}$, say $[0,1]$, a fixed number $a$, and sequences $\delta_{n} \downarrow 0$ and $r_{n} \rightarrow \infty$. This leads to a multiple of the local empirical measure $\mathbb{P}_{n} f_{n, t}=(1 / n) \#\left(X_{i} \in\right. \left.\left(a, a+t \delta_{n}\right]\right)$, which counts the fraction of observations falling into the shrinking intervals $\left(a, a+t \delta_{n}\right]$.

Assume that the distribution of the observations is continuous with density $p$. Then

$$
P f_{n, t}^{2}=r_{n}^{2} P\left(a, a+t \delta_{n}\right]=r_{n}^{2} p(a) t \delta_{n}+o\left(r_{n}^{2} \delta_{n}\right)
$$

Thus, we obtain an interesting limit only if $r_{n}^{2} \delta_{n} \sim 1$. From now on, set $r_{n}^{2} \delta_{n}=1$. Then the variance of every $\mathbb{G}_{n} f_{n, t}$ converges to a nonzero limit. Because the envelope function is $F_{n}=f_{n, 1}$, the Lindeberg condition reduces to $r_{n}^{2} P\left(a, a+\delta_{n}\right] 1_{r_{n}>\varepsilon \sqrt{n}} \rightarrow 0$, which is true provided $n \delta_{n} \rightarrow \infty$. This requires that we do not localize too much. If the intervals become too small, then catching an observation becomes a rare event and the problem is not within the domain of normal convergence.

The bracketing numbers of the cells $1_{\left(a, a+t \delta_{n}\right]}$ with $t \in[0,1]$ are of the order $O\left(\delta_{n} / \varepsilon^{2}\right)$. Multiplication with $r_{n}$ changes this in $O\left(1 / \varepsilon^{2}\right)$. Thus Theorem 19.28 applies easily, and we conclude that the sequence of processes $t \mapsto \mathbb{G}_{n} f_{n, t}$ converges in distribution to a Gaussian process for every $\delta_{n} \downarrow 0$ such that $n \delta_{n} \rightarrow \infty$.

The limit process is not a Brownian bridge, but a Brownian motion process, as follows by computing the limit covariance of $\left(\mathbb{G}_{n} f_{n, s}, \mathbb{G}_{n} f_{n, t}\right)$. Asymptotically the local empirical process "does not know" that it is tied down at its extremes. In fact, it is an interesting exercise to check that two different local empirical processes (fixed at two different numbers $a$ and $b)$ converge jointly to two independent Brownian motions.

In the treatment of $M$-estimators and the likelihood ratio statistic in Chapters 5 and 16, we encountered random functions resulting from rescaling a given class of functions. Given
functions $x \mapsto m_{\theta}(x)$ indexed by a Euclidean parameter $\theta$, we needed conditions that ensure that, for a given sequence $r_{n} \rightarrow \infty$ and any random sequence $\tilde{h}_{n}=O_{P}^{*}(1)$,

$$
\begin{equation*}
\mathbb{G}_{n}\left(r_{n}\left(m_{\theta_{0}+\tilde{h}_{n} / r_{n}}-m_{\theta_{0}}\right)-\tilde{h}_{n}^{T} \dot{m}_{\theta_{0}}\right) \xrightarrow{\mathrm{P}} 0 . \tag{19.30}
\end{equation*}
$$

We shall prove this under a Lipschitz condition, but it should be clear from the following proof and the preceding theorem that there are other possibilities.
19.31 Lemma. For each $\theta$ in an open subset of Euclidean space let $x \mapsto m_{\theta}(x)$ be a measurable function such that the map $\theta \mapsto m_{\theta}(x)$ is differentiable at $\theta_{0}$ for almost every $x$ (or in probability) with derivative $\dot{m}_{\theta_{0}}(x)$ and such that, for every $\theta_{1}$ and $\theta_{2}$ in a neighborhood of $\theta_{0}$, and for a measurable function $\dot{m}$ such that $P \dot{m}^{2}<\infty$,

$$
\left\|m_{\theta_{1}}(x)-m_{\theta_{2}}(x)\right\| \leq \dot{m}(x)\left\|\theta_{1}-\theta_{2}\right\| .
$$

Then (19.30) is valid for every random sequence $\tilde{h}_{n}$ that is bounded in probability.
Proof. The random variables $\mathbb{G}_{n}\left(r_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)-h^{T} \dot{m}_{\theta_{0}}\right)$ have mean zero and their variance converges to 0 , by the differentiability of the maps $\theta \mapsto m_{\theta}$ and the Lipschitz condition, which allows application of the dominated-convergence theorem. In other words, this sequence seen as stochastic processes indexed by $h$ converges marginally in distribution to zero. Because the sequence $\tilde{h}_{n}$ is bounded in probability, it suffices to strengthen this to uniform convergence in $\|h\| \leq 1$. This follows if the sequence of processes converges weakly in the space $\ell^{\infty}(h:\|h\| \leq 1)$, because taking a supremum is a continuous operation and, by the marginal convergence, the weak limit is then necessarily zero. By Theorem 18.14, we can confine ourselves to proving asymptotic tightness (i.e., condition (ii) of this theorem). Because the linear processes $h \mapsto h^{T} \mathbb{G}_{n} \dot{m}_{\theta_{0}}$ are trivially tight, we may concentrate on the processes $h \mapsto \mathbb{G}_{n}\left(r_{n}\left(m_{\theta_{0}+h / r_{n}}-m_{\theta_{0}}\right)\right)$, the empirical process indexed by the classes of functions $r_{n} \mathcal{M}_{1 / r_{n}}$, for $\mathcal{M}_{\delta}=\left\{m_{\theta}-m_{\theta_{0}}:\left\|\theta-\theta_{0}\right\| \leq \delta\right\}$.

By Example 19.7, the bracketing numbers of the classes of functions $\mathcal{M}_{\delta}$ satisfy

$$
N_{[]}\left(\varepsilon \delta\|\dot{m}\|_{P, 2}, \mathcal{M}_{\delta}, L_{2}(P)\right) \leq C\left(\frac{1}{\varepsilon}\right)^{d}, \quad 0<\varepsilon<\delta
$$

The constant $C$ is independent of $\varepsilon$ and $\delta$. The function $M_{\delta}=\delta \dot{m}$ is an envelope function of $\mathcal{M}_{\delta}$. The left side also gives the bracketing numbers of the rescaled classes $\mathcal{M}_{\delta} / \delta$ relative to the envelope functions $M_{\delta} / \delta=\dot{m}$. Thus, we compute

$$
J_{[]}\left(\delta_{n}, \mathcal{M}_{\delta} / \delta, L_{2}(P)\right) \lesssim \int_{0}^{\delta_{n}} \sqrt{d \log \left(\frac{1}{\varepsilon}\right)+\log C} d \varepsilon
$$

The right side converges to zero as $\delta_{n} \downarrow 0$ uniformly in $\delta$. The envelope functions $M_{\delta} / \delta=\dot{m}$ also satisfy the Lindeberg condition. The lemma follows from Theorem 19.28.

### 19.6 Maximal Inequalities

The main aim of this section is to derive the maximal inequality that is used in the proofs of Theorems 19.5 and 19.28. We use the notation $\lesssim$ for "smaller than up to a universal constant" and denote the function $1 \vee \log x$ by $\log x$.

A maximal inequality bounds the tail probabilities or moments of a supremum of random variables. A maximal inequality for an infinite supremum can be obtained by combining two devices: a chaining argument and maximal inequalities for finite maxima. The chaining argument bounds every element in the supremum by a (telescoping) sum of small deviations. In order that a sum of small terms is small, each of the terms must be exponentially small. So we start with an exponential inequality. Next we apply this to obtain bounds on finite suprema, and finally we derive the desired maximal inequality.
19.32 Lemma (Bernstein's inequality). For any bounded, measurable function $f^{\dagger}$

$$
\mathrm{P}_{P}\left(\left|\mathbb{G}_{n} f\right|>x\right) \leq 2 \exp \left(-\frac{1}{4} \frac{x^{2}}{P f^{2}+x\|f\|_{\infty} / \sqrt{n}}\right), \quad \text { every } x>0 .
$$

Proof. The leading term 2 results from separate bounds on the right and left tail probabilities. It suffices to bound the right tail probabilities by the exponential, because the left tail inequality follows from the right tail inequality applied to $-f$. By Markov's inequality, for every $\lambda>0$,

$$
\mathrm{P}\left(\mathbb{G}_{n} f>x\right) \leq e^{-\lambda x} \mathrm{E} e^{\lambda \mathbb{G}_{n} f}=e^{-\lambda x}\left(1+\sum_{k=1}^{\infty} \frac{1}{k!}\left(\frac{\lambda}{\sqrt{n}}\right)^{k} P(f-P f)^{k}\right)^{n},
$$

by Fubini's theorem and next developing the exponential function in its power series. The term for $k=1$ vanishes because $P(f-P f)=0$, so that a factor $1 / n$ can be moved outside the sum. We apply this inequality with the choice

$$
\lambda=\frac{1}{2} \frac{x}{P f^{2}+x\|f\|_{\infty} / \sqrt{n}} \leq \frac{1}{2}\left(\frac{x}{P f^{2}} \wedge \frac{\sqrt{n}}{\|f\|_{\infty}}\right)=: \lambda_{1} \wedge \lambda_{2} .
$$

Next, with $\lambda_{1}$ and $\lambda_{2}$ defined as in the preceding display, we insert the bound $\lambda^{k} \leq \lambda_{1} \lambda_{2}^{k-2} \lambda$ and use the inequality $\left|P(f-P f)^{k}\right| \leq P f^{2}\left(2\|f\|_{\infty}\right)^{k-2}$, and we obtain

$$
\mathrm{P}\left(\mathbb{G}_{n} f>x\right) \leq e^{-\lambda x}\left(1+\frac{1}{n} \sum_{k=2}^{\infty} \frac{1}{k!} \frac{1}{2} \lambda x\right)^{n} .
$$

Because $\sum(1 / k!) \leq e-2 \leq 1$ and $(1+a)^{n} \leq e^{a n}$, the right side of this inequality is bounded by $\exp (-\lambda x / 2)$, which is the exponential in the lemma.
19.33 Lemma. For any finite class $\mathcal{F}$ of bounded, measurable, square-integrable functions, with $|\mathcal{F}|$ elements,

$$
\mathrm{E}_{P}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim \max _{f} \frac{\|f\|_{\infty}}{\sqrt{n}} \log (1+|\mathcal{F}|)+\max _{f}\|f\|_{P, 2} \sqrt{\log (1+|\mathcal{F}|)} .
$$

Proof. Define $a=24\|f\|_{\infty} / \sqrt{n}$ and $b=24 P f^{2}$. For $x \geq b / a$ and $x \leq b / a$ the exponent in Bernstein's inequality is bounded above by $-3 x / a$ and $-3 x^{2} / b$, respectively.

[^10]For the truncated variables $A_{f}=\mathbb{G}_{n} f 1\left\{\left|\mathbb{G}_{n} f\right|>b / a\right\}$ and $B_{f}=\mathbb{G}_{n} f 1\left\{\left|\mathbb{G}_{n} f\right| \leq b / a\right\}$, Bernstein's inequality yields the bounds, for all $x>0$,

$$
\mathrm{P}\left(\left|A_{f}\right|>x\right) \leq 2 \exp \left(\frac{-3 x}{a}\right), \quad \mathrm{P}\left(\left|B_{f}\right|>x\right) \leq 2 \exp \left(\frac{-3 x^{2}}{b}\right) .
$$

Combining the first inequality with Fubini's theorem, we obtain, with $\psi_{p}(x)=\exp x^{p}-1$,

$$
\mathrm{E} \psi_{1}\left(\frac{\left|A_{f}\right|}{a}\right)=\mathrm{E} \int_{0}^{\left|A_{f}\right| / a} e^{x} d x=\int_{0}^{\infty} \mathrm{P}\left(\left|A_{f}\right|>x a\right) e^{x} d x \leq 1
$$

By a similar argument we find that $\mathrm{E} \psi_{2}\left(\left|B_{f}\right| / \sqrt{b}\right) \leq 1$. Because the function $\psi_{1}$ is convex and nonnegative, we next obtain, by Jensen's inequality,

$$
\psi_{1}\left(\operatorname{Emax}_{f} \frac{\left|A_{f}\right|}{a}\right) \leq \mathrm{E} \psi_{1}\left(\frac{\max _{f}\left|A_{f}\right|}{a}\right) \leq \mathrm{E} \sum_{f} \psi_{1}\left(\frac{\left|A_{f}\right|}{a}\right) \leq|\mathcal{F}| .
$$

Because $\psi_{1}^{-1}(u)=\log (1+u)$ is increasing, we can apply it across the display, and find a bound on E max $\left|A_{f}\right|$ that yields the first term on the right side of the lemma. An analogous inequality is valid for $\max _{f}\left|B_{f}\right| / \sqrt{b}$, but with $\psi_{2}$ instead of $\psi_{1}$. An application of the triangle inequality concludes the proof.
19.34 Lemma. For any class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ such that $P f^{2}<\delta^{2}$ for every $f$, we have, with $a(\delta)=\delta / \sqrt{\log N_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)}$, and $F$ an envelope function,

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)+\sqrt{n} P^{*} F\{F>\sqrt{n} a(\delta)\} .
$$

Proof. Because $\left|\mathbb{G}_{n} f\right| \leq \sqrt{n}\left(\mathbb{P}_{n}+P\right) g$ for every pair of functions $|f| \leq g$, we obtain, for $F$ an envelope function of $\mathcal{F}$,

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n} f\{F>\sqrt{n} a(\delta)\}\right\|_{\mathcal{F}} \leq 2 \sqrt{n} P F\{F>\sqrt{n} a(\delta)\} .
$$

The right side is twice the second term in the bound of the lemma. It suffices to bound $\mathrm{E}^{*}\left\|\mathbb{G}_{n} f\{F \leq \sqrt{n} a(\delta)\}\right\|_{\mathcal{F}}$ by a multiple of the first term. The bracketing numbers of the class of functions $f\{F \leq a(\delta) \sqrt{n}\}$ if $f$ ranges over $\mathcal{F}$ are smaller than the bracketing numbers of the class $\mathcal{F}$. Thus, to simplify the notation, we can assume that every $f \in \mathcal{F}$ is bounded by $\sqrt{n} a(\delta)$.

Fix an integer $q_{0}$ such that $4 \delta \leq 2^{-q_{0}} \leq 8 \delta$. There exists a nested sequence of partitions $\mathcal{F}=\cup_{i=1}^{N_{q}} \mathcal{F}_{q i}$ of $\mathcal{F}$, indexed by the integers $q \geq q_{0}$, into $N_{q}$ disjoint subsets and measurable functions $\Delta_{q i} \leq 2 F$ such that

$$
\begin{gathered}
\sum_{q \geq q_{0}} 2^{-q} \sqrt{\log N_{q}} \lesssim \int_{0}^{\delta} \sqrt{\log N_{[]}\left(\varepsilon, \mathcal{F}, L_{2}(P)\right)} d \varepsilon \\
\sup _{f, g \in \mathcal{F}_{q i}}|f-g| \leq \Delta_{q i}, \quad P \Delta_{q i}^{2}<2^{-2 q}
\end{gathered}
$$

To see this, first cover $\mathcal{F}$ with minimal numbers of $L_{2}(P)$-brackets of size $2^{-q}$ and replace these by as many disjoint sets, each of them equal to a bracket minus "previous" brackets. This gives partitions that satisfy the conditions with $\Delta_{q i}$ equal to the difference
of the upper and lower brackets. If this sequence of partitions does not yet consist of successive refinements, then replace the partition at stage $q$ by the set of all intersections of the form $\cap_{p=q_{0}}^{q} \mathcal{F}_{p, i_{p}}$. This gives partitions into $\bar{N}_{q}=N_{q_{0}} \cdots N_{q}$ sets. Using the inequality $\left(\log \prod N_{p}\right)^{1 / 2} \leq \sum\left(\log N_{p}\right)^{1 / 2}$ and rearranging sums, we see that the first of the two displayed conditions is still satisfied.

Choose for each $q \geq q_{0}$ a fixed element $f_{q i}$ from each partitioning set $\mathcal{F}_{q i}$, and set

$$
\pi_{q} f=f_{q i}, \quad \Delta_{q} f=\Delta_{q i}, \quad \text { if } f \in \mathcal{F}_{q i} .
$$

Then $\pi_{q} f$ and $\Delta_{q} f$ run through a set of $N_{q}$ functions if $f$ runs through $\mathcal{F}$. Define for each fixed $n$ and $q \geq q_{0}$ numbers and indicator functions

$$
\begin{aligned}
a_{q} & =2^{-q} / \sqrt{\log N_{q+1}} \\
A_{q-1} f & =1\left\{\Delta_{q_{0}} f \leq \sqrt{n} a_{q_{0}}, \ldots, \Delta_{q-1} f \leq \sqrt{n} a_{q-1}\right\} \\
B_{q} f & =1\left\{\Delta_{q_{0}} f \leq \sqrt{n} a_{q_{0}}, \ldots, \Delta_{q-1} f \leq \sqrt{n} a_{q-1}, \Delta_{q} f>\sqrt{n} a_{q}\right\} .
\end{aligned}
$$

Then $A_{q} f$ and $B_{q} f$ are constant in $f$ on each of the partitioning sets $\mathcal{F}_{q i}$ at level $q$, because the partitions are nested. Our construction of partitions and choice of $q_{0}$ also ensure that $2 a(\delta) \leq a_{q_{0}}$, whence $A_{q_{0}} f=1$. Now decompose, pointwise in $x$ (which is suppressed in the notation),

$$
f-\pi_{q_{0}} f=\sum_{q_{0}+1}^{\infty}\left(f-\pi_{q} f\right) B_{q} f+\sum_{q_{0}+1}^{\infty}\left(\pi_{q} f-\pi_{q-1} f\right) A_{q-1} f .
$$

The idea here is to write the left side as the sum of $f-\pi_{q_{1}} f$ and the telescopic sum $\sum_{q_{0}+1}^{q_{1}}\left(\pi_{q} f-\pi_{q-1} f\right)$ for the largest $q_{1}=q_{1}(f, x)$ such that each of the bounds $\Delta_{q} f$ on the "links" $\pi_{q} f-\pi_{q-1} f$ in the "chain" is uniformly bounded by $\sqrt{n} a_{q}$ (with $q_{1}$ possibly infinite). We note that either all $B_{q} f$ are 1 or there is a unique $q_{1}>q_{0}$ with $B_{q_{1}} f=1$. In the first case $A_{q} f=1$ for every $q$; in the second case $A_{q} f=1$ for $q<q_{1}$ and $A_{q} f=0$ for $q \geq q_{1}$.

Next we apply the empirical process $\mathbb{G}_{n}$ to both series on the right separately, take absolute values, and next take suprema over $f \in \mathcal{F}$. We shall bound the means of the resulting two variables.

First, because the partitions are nested, $\Delta_{q} f B_{q} f \leq \Delta_{q-1} f B_{q} f \leq \sqrt{n} a_{q-1}$ trivially $P\left(\Delta_{q} f\right)^{2} B_{q} f \leq 2^{-2 q}$. Because $\left|\mathbb{G}_{n} f\right| \leq \mathbb{G}_{n} g+2 \sqrt{n} P g$ for every pair of functions $|f| \leq g$, we obtain, by the triangle inequality and next Lemma 19.33,

$$
\begin{aligned}
\mathrm{E}^{*}\left\|\sum_{q_{0}+1}^{\infty} \mathbb{G}_{n}\left(f-\pi_{q} f\right) B_{q} f\right\|_{\mathcal{F}} & \leq \sum_{q_{0}+1}^{\infty} \mathrm{E}^{*}\left\|\mathbb{G}_{n} \Delta_{q} f B_{q} f\right\|_{\mathcal{F}}+\sum_{q_{0}+1}^{\infty} 2 \sqrt{n}\left\|P \Delta_{q} f B_{q} f\right\|_{\mathcal{F}} \\
& \lesssim \sum_{q_{0}+1}^{\infty}\left[a_{q-1} \log N_{q}+2^{-q} \sqrt{\log N_{q}}+\frac{4}{a_{q}} 2^{-2 q}\right]
\end{aligned}
$$

In view of the definition of $a_{q}$, the series on the right can be bounded by a multiple of the series $\sum_{q_{0}+1}^{\infty} 2^{-q} \sqrt{\log N_{q}}$.

Second, there are at most $N_{q}$ functions $\pi_{q} f-\pi_{q-1} f$ and at most $N_{q-1}$ indicator functions $A_{q-1} f$. Because the partitions are nested, the function $\left|\pi_{q} f-\pi_{q-1} f\right| A_{q-1} f$ is bounded by $\Delta_{q-1} f A_{q-1} f \leq \sqrt{n} a_{q-1}$. The $L_{2}(P)$-norm of $\left|\pi_{q} f-\pi_{q-1} f\right|$ is bounded by $2^{-q+1}$. Apply Lemma 19.33 to find

$$
\mathrm{E}^{*}\left\|\sum_{q_{0}+1}^{\infty} \mathbb{G}_{n}\left(\pi_{q} f-\pi_{q-1} f\right) A_{q-1} f\right\|_{\mathcal{F}} \lesssim \sum_{q_{0}+1}^{\infty}\left[a_{q-1} \log N_{q}+2^{-q} \sqrt{\log N_{q}}\right]
$$

Again this is bounded above by a multiple of the series $\sum_{q_{0}+1}^{\infty} 2^{-q} \sqrt{\log N_{q}}$.
To conclude the proof it suffices to consider the terms $\pi_{q_{0}} f$. Because $\left|\pi_{q_{0}} f\right| \leq F \leq a(\delta) \sqrt{n} \leq \sqrt{n} a_{q_{0}}$ and $P\left(\pi_{q_{0}} f\right)^{2} \leq \delta^{2}$ by assumption, another application of Lemma 19.33 yields

$$
\mathrm{E}^{*}\left\|\mathbb{G}_{n} \pi_{q_{0}} f\right\|_{\mathcal{F}} \lesssim a_{q_{0}} \log N_{q_{0}}+\delta \sqrt{\log N_{q_{0}}} .
$$

By the choice of $q_{0}$, this is bounded by a multiple of the first few terms of the series $\sum_{q_{0}+1}^{\infty} 2^{-q} \sqrt{\log N_{q}}$.
19.35 Corollary. For any class $\mathcal{F}$ of measurable functions with envelope function $F$,

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim J_{[]}\left(\|F\|_{P, 2}, \mathcal{F}, L_{2}(P)\right) .
$$

Proof. Because $\mathcal{F}$ is contained in the single bracket $[-F, F]$, we have $N_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)=$ 1 for $\delta=2\|F\|_{P, 2}$. Then the constant $a(\delta)$ as defined in the preceding lemma reduces to a multiple of $\|F\|_{P, 2}$, and $\sqrt{n} P^{*} F\{F>\sqrt{n} a(\delta)\}$ is bounded above by a multiple of $\|F\|_{P, 2}$, by Markov's inequality.

The second term in the maximal inequality Lemma 19.34 results from a crude majorization in the first step of its proof. This bound can be improved by taking special properties of the class of functions $\mathcal{F}$ into account, or by using different norms to measure the brackets. The following lemmas, which are used in Chapter 25, exemplify this. ${ }^{\dagger}$ The first uses the $L_{2}(P)$-norm but is limited to uniformly bounded classes; the second uses a stronger norm, which we call the "Bernstein norm" as it relates to a strengthening of Bernstein's inequality. Actually, this is not a true norm, but it can be used in the same way to measure the size of brackets. It is defined by

$$
\|f\|_{P, B}^{2}=2 P\left(e^{|f|}-1-|f|\right) .
$$

19.36 Lemma. For any class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ such that $P f^{2}<\delta^{2}$ and $\|f\|_{\infty} \leq M$ for every $f$,

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)\left(1+\frac{J_{[]}\left(\delta, \mathcal{F}, L_{2}(P)\right)}{\delta^{2} \sqrt{n}} M\right) .
$$

[^11]19.37 Lemma. For any class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$ such that $\|f\|_{P, B} <\delta$ for every $f$,
$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim J_{[]}\left(\delta, \mathcal{F},\|\cdot\|_{P, B}\right)\left(1+\frac{J_{[]}\left(\delta, \mathcal{F},\|\cdot\|_{P, B}\right)}{\delta^{2} \sqrt{n}}\right)
$$

Instead of brackets, we may also use uniform covering numbers to obtain maximal inequalities. As is the case for the Glivenko-Cantelli and Donsker theorem, the inequality given by Corollary 19.35 has a complete uniform entropy counterpart. This appears to be untrue for the inequality given by Lemma 19.34, for it appears difficult to use the information that a class $\mathcal{F}$ is contained in a small $L_{2}(P)$-ball directly in a uniform entropy maximal inequality. ${ }^{\dagger}$
19.38 Lemma. For any suitably measurable class $\mathcal{F}$ of measurable functions $f: \mathcal{X} \mapsto \mathbb{R}$, we have, with $\theta_{n}^{2}=\sup _{f \in \mathcal{F}} \mathbb{P}_{n} f^{2} / \mathbb{P}_{n} F^{2}$,

$$
\mathrm{E}_{P}^{*}\left\|\mathbb{G}_{n}\right\|_{\mathcal{F}} \lesssim \mathrm{E}\left(J\left(\theta_{n}, \mathcal{F}, L_{2}\right)\|F\|_{\mathbb{P}_{n}, 2}\right) \lesssim J\left(1, \mathcal{F}, L_{2}\right)\|F\|_{P, 2} .
$$

## Notes

The law of large numbers for the empirical distribution function was derived by Glivenko [59] and Cantelli [19] in the 1930s. The Kolmogorov-Smirnov and Cramér-von Mises statistics were introduced and studied in the same period. The limit distributions of these statistics were obtained by direct methods. That these were the same as the distribution of corresponding functions of the Brownian bridge was noted and proved by Doob before Donsker [38] formalized the theory of weak convergence in the space of continuous functions in 1952. Donsker's main examples were the empirical process on the real line, and the partial sum process. Abstract empirical processes were studied more recently. The bracketing central limit presented here was obtained by Ossiander [111] and the uniform entropy central limit theorem by Pollard [116] and Kolčinskii [88]. In both cases these were generalizations of earlier results by Dudley, who also was influential in developing a theory of weak convergence that can deal with the measurability problems, which were partly ignored by Donsker. The maximal inequality Lemma 19.34 was proved in [119]. The first Vapnik-Cervonenkis classes were considered in [147].

For further results on the classical empirical process, including an introduction to strong approximations, see [134] . For the abstract empirical process, see [57], [117], [120] and [146]. For connections with limit theorems for random elements with values in Banach spaces, see [98].

## PROBLEMS

1. Derive a formula for the covariance function of the Gaussian process that appears in the limit of the modified Kolmogorov-Smirnov statistic for estimating normality.

[^12]2. Find the covariance function of the Brownian motion process.
3. If $\mathbb{Z}$ is a standard Brownian motion, then $\mathbb{Z}(t)-t \mathbb{Z}(1)$ is a Brownian bridge.
4. Suppose that $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ are independent samples from distribution functions $F$ and $G$, respectively. The Kolmogorov-Smirnov statistic for testing the null hypothesis $H_{0}: F= G$ is the supremum distance $K_{m, n}=\left\|\mathbb{F}_{m}-\mathbb{G}_{n}\right\|_{\infty}$ between the empirical distribution functions of the two samples.
(i) Find the limit distribution of $K_{m, n}$ under the null hypothesis.
(ii) Show that the Kolmogorov-Smirnov test is asymptotically consistent against every alternative $F \neq G$.
(iii) Find the asymptotic power function as a function of $(g, h)$ for alternatives $\left(F_{g / \sqrt{m}}, G_{h / \sqrt{n}}\right)$ belonging to smooth parametric models $\theta \mapsto F_{\theta}$ and $\theta \mapsto G_{\theta}$.
5. Consider the class of all functions $f:[0,1] \mapsto[0,1]$ such that $|f(x)-f(y)| \leq|x-y|$. Construct a set of $\varepsilon$-brackets for this class of functions of cardinality bounded by $\exp (C / \varepsilon)$.
6. Determine the VC index of
(i) The collection of all cells $(a, b]$ in the real line;
(ii) The collection of all cells $(-\infty, t]$ in the plane;
(iii) The collection of all translates $\{\psi(\cdot-\theta): \theta \in \mathbb{R}\}$ of a monotone function $\psi: \mathbb{R} \mapsto \mathbb{R}$.
7. Suppose that the class of functions $\mathcal{F}$ is VC. Show that the following classes are VC as well:
(i) The collection of sets $\{f>0\}$ as $f$ ranges over $\mathcal{F}$;
(ii) The collection of functions $x \mapsto f(x)+g(x)$ as $f$ ranges over $\mathcal{F}$ and $g$ is fixed;
(iii) The collection of functions $x \mapsto f(x) g(x)$ as $f$ ranges over $\mathcal{F}$ and $g$ is fixed.
8. Show that a collection of sets is a VC class of sets if and only if the corresponding class of indicator functions is a VC class of functions.
9. Let $F_{n}$ and $F$ be distribution functions on the real line. Show that:
(i) If $F_{n}(x) \rightarrow F(x)$ for every $x$ and $F$ is continuous, then $\left\|F_{n}-F\right\|_{\infty} \rightarrow 0$.
(ii) If $F_{n}(x) \rightarrow F(x)$ and $F_{n}\{x\} \rightarrow F\{x\}$ for every $x$, then $\left\|F_{n}-F\right\|_{\infty} \rightarrow 0$.
10. Find the asymptotic distribution of the mean absolute deviation from the median.

## 20

## Functional Delta Method

> The delta method was introduced in Chapter 3 as an easy way to turn the weak convergence of a sequence of random vectors $r_{n}\left(T_{n}-\theta\right)$ into the weak convergence of transformations of the type $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$. It is useful to apply a similar technique in combination with the more powerful convergence of stochastic processes. In this chapter we consider the delta method at two levels. The first section is of a heuristic character and limited to the case that $T_{n}$ is the empirical distribution. The second section establishes the delta method rigorously and in general, completely parallel to the delta method for $\mathbb{R}^{k}$, for Hadamard differentiable maps between normed spaces.

## 20.1 von Mises Calculus

Let $\mathbb{P}_{n}$ be the empirical distribution of a random sample $X_{1}, \ldots, X_{n}$ from a distribution $P$. Many statistics can be written in the form $\phi\left(\mathbb{P}_{n}\right)$, where $\phi$ is a function that maps every distribution of interest into some space, which for simplicity is taken equal to the real line. Because the observations can be regained from $\mathbb{P}_{n}$ completely (unless there are ties), any statistic can be expressed in the empirical distribution. The special structure assumed here is that the statistic can be written as a fixed function $\phi$ of $\mathbb{P}_{n}$, independent of $n$, a strong assumption.

Because $\mathbb{P}_{n}$ converges to $P$ as $n$ tends to infinity, we may hope to find the asymptotic behavior of $\phi\left(\mathbb{P}_{n}\right)-\phi(P)$ through a differential analysis of $\phi$ in a neighborhood of $P$. A first-order analysis would have the form

$$
\phi\left(\mathbb{P}_{n}\right)-\phi(P)=\phi_{P}^{\prime}\left(\mathbb{P}_{n}-P\right)+\cdots,
$$

where $\phi_{P}^{\prime}$ is a "derivative" and the remainder is hopefully negligible. The simplest approach towards defining a derivative is to consider the function $t \mapsto \phi(P+t H)$ for a fixed perturbation $H$ and as a function of the real-valued argument $t$. If $\phi$ takes its values in $\mathbb{R}$, then this function is just a function from the reals to the reals. Assume that the ordinary derivatives of the map $t \mapsto \phi(P+t H)$ at $t=0$ exist for $k=1,2, \ldots, m$. Denoting them by $\phi_{P}^{(k)}(H)$, we obtain, by Taylor's theorem,

$$
\phi(P+t H)-\phi(P)=t \phi_{P}^{\prime}(H)+\cdots+\frac{1}{m!} t^{m} \phi_{P}^{(m)}(H)+o\left(t^{m}\right) .
$$

Substituting $t=1 / \sqrt{n}$ and $H=\mathbb{G}_{n}$, for $\mathbb{G}_{n}=\sqrt{n}\left(\mathbb{P}_{n}-P\right)$ the empirical process of the observations, we obtain the von Mises expansion

$$
\phi\left(\mathbb{P}_{n}\right)-\phi(P)=\frac{1}{\sqrt{n}} \phi_{P}^{\prime}\left(\mathbb{G}_{n}\right)+\cdots+\frac{1}{m!} \frac{1}{n^{m / 2}} \phi_{P}^{(m)}\left(\mathbb{G}_{n}\right)+\cdots
$$

Actually, because the empirical process $\mathbb{G}_{n}$ is dependent on $n$, it is not a legal choice for $H$ under the assumed type of differentiability: There is no guarantee that the remainder is small. However, we make this our working hypothesis. This is reasonable, because the remainder has one factor $1 / \sqrt{n}$ more, and the empirical process $\mathbb{G}_{n}$ shares at least one property with a fixed $H$ : It is "bounded." Then the asymptotic distribution of $\phi\left(\mathbb{P}_{n}\right)-\phi(P)$ should be determined by the first nonzero term in the expansion, which is usually the firstorder term $\phi_{P}^{\prime}\left(\mathbb{G}_{n}\right)$. A method to make our wishful thinking rigorous is discussed in the next section. Even in cases in which it is hard to make the differentation operation rigorous, the von Mises expansion still has heuristic value. It may suggest the type of limiting behavior of $\phi\left(\mathbb{P}_{n}\right)-\phi(P)$, which can next be further investigated by ad-hoc methods.

We discuss this in more detail for the case that $m=1$. A first derivative typically gives a linear approximation to the original function. If, indeed, the map $H \mapsto \phi_{P}^{\prime}(H)$ is linear, then, writing $\mathbb{P}_{n}$ as the linear combination $\mathbb{P}_{n}=n^{-1} \sum \delta_{X_{i}}$ of the Dirac measures at the observations, we obtain

$$
\begin{equation*}
\phi\left(\mathbb{P}_{n}\right)-\phi(P) \approx \frac{1}{\sqrt{n}} \phi_{P}^{\prime}\left(\mathbb{G}_{n}\right)=\frac{1}{n} \sum_{i=1}^{n} \phi_{P}^{\prime}\left(\delta_{X_{i}}-P\right) \tag{20.1}
\end{equation*}
$$

Thus, the difference $\phi\left(\mathbb{P}_{n}\right)-\phi(P)$ behaves as an average of the independent random variables $\phi_{P}^{\prime}\left(\delta_{X_{i}}-P\right)$. If these variables have zero means and finite second moments, then a normal limit distribution of $\sqrt{n}\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)$ may be expected. Here the zero mean ought to be automatic, because we may expect that

$$
\int \phi_{P}^{\prime}\left(\delta_{x}-P\right) d P(x)=\phi_{P}^{\prime}\left(\int\left(\delta_{x}-P\right) d P(x)\right)=\phi_{P}^{\prime}(0)=0
$$

The interchange of order of integration and application of $\phi_{P}^{\prime}$ is motivated by linearity (and continuity) of this derivative operator.

The function $x \mapsto \phi_{P}^{\prime}\left(\delta_{x}-P\right)$ is known as the influence function of the function $\phi$. It can be computed as the ordinary derivative

$$
\phi_{P}^{\prime}\left(\delta_{x}-P\right)=\frac{d}{d t}_{\mid t=0} \phi\left((1-t) P+t \delta_{x}\right)
$$

The name "influence function" originated in developing robust statistics. The function measures the change in the value $\phi(P)$ if an infinitesimally small part of $P$ is replaced by a pointmass at $x$. In robust statistics, functions and estimators with an unbounded influence function are suspect, because a small fraction of the observations would have too much influence on the estimator if their values were equal to an $x$ where the influence function is large.

In many examples the derivative takes the form of an "expectation operator" $\phi_{P}^{\prime}(H)= \int \tilde{\phi}_{P} d H$, for some function $\tilde{\phi}_{P}$ with $\int \tilde{\phi}_{P} d P=0$, at least for a subset of $H$. Then the influence function is precisely the function $\tilde{\phi}_{P}$.
20.2 Example (Mean). The sample mean is obtained as $\phi\left(\mathbb{P}_{n}\right)$ from the mean function $\phi(P)=\int s d P(s)$. The influence function is

$$
\phi_{P}^{\prime}\left(\delta_{x}-P\right)=\frac{d}{d t}{ }_{\mid t=0} \int s d\left[(1-t) P+t \delta_{x}\right](s)=x-\int s d P(s)
$$

In this case, the approximation (20.1) is an identity, because the function is linear already. If the sample space is a Euclidean space, then the influence function is unbounded and hence the sample mean is not robust.
20.3 Example (Wilcoxon). Let $\left(X_{1}, Y_{1}\right), \ldots,\left(X_{n}, Y_{n}\right)$ be a random sample from a bivariate distribution. Write $\mathbb{F}_{n}$ and $\mathbb{G}_{n}$ for the empirical distribution functions of the $X_{i}$ and $Y_{j}$, respectively, and consider the Mann-Whitney statistic

$$
T_{n}=\int \mathbb{F}_{n} d \mathbb{G}_{n}=\frac{1}{n^{2}} \sum_{i=1}^{n} \sum_{j=1}^{n} 1\left\{X_{i} \leq Y_{j}\right\}
$$

This statistic corresponds to the function $\phi(F, G)=\int F d G$, which can be viewed as a function of two distribution functions, or also as a function of a bivariate distribution function with marginals $F$ and $G$. (We have assumed that the sample sizes of the two samples are equal, to fit the example into the previous discussion, which, for simplicity, is restricted to i.i.d. observations.) The influence function is

$$
\begin{aligned}
\phi_{(F, G)}^{\prime}\left(\delta_{x, y}-P\right) & =\frac{d}{d t}{ }_{\mid t=0} \int\left[(1-t) F+t \delta_{x}\right] d\left[(1-t) G+t \delta_{y}\right] \\
& =F(y)+1-G_{-}(x)-2 \int F d G
\end{aligned}
$$

The last step follows on multiplying out the two terms between square brackets: The function that is to be differentiated is simply a parabola in $t$. For this case (20.1) reads

$$
\int \mathbb{F}_{n} d \mathbb{G}_{n}-\int F d G \approx \frac{1}{n} \sum_{i=1}^{n}\left(F\left(Y_{i}\right)+1-G_{-}\left(X_{i}\right)-2 \int F d G\right)
$$

From the two-sample $U$-statistic theorem, Theorem 12.6, it is known that the difference between the two sides of the approximation sign is actually $o_{P}(1 / \sqrt{n})$. Thus, the heuristic calculus leads to the correct answer. In the next section an alternative proof of the asymptotic normality of the Mann-Whitney statistic is obtained by making this heuristic approach rigorous.
20.4 Example (Z-functions). For every $\theta$ in an open subset of $\mathbb{R}^{k}$, let $x \mapsto \psi_{\theta}(x)$ be a given, measurable map into $\mathbb{R}^{k}$. The corresponding $Z$-function assigns to a probability measure $P$ a zero $\phi(P)$ of the map $\theta \mapsto P \psi_{\theta}$. (Consider only $P$ for which a unique zero exists.) If applied to the empirical distribution, this yields a $Z$-estimator $\phi\left(\mathbb{P}_{n}\right)$.

Differentiating with respect to $t$ across the identity

$$
0=\left(P+t \delta_{x}\right) \psi_{\phi\left(P+t \delta_{x}\right)}=P \psi_{\phi\left(P+t \delta_{x}\right)}+t \psi_{\phi\left(P+t \delta_{x}\right)}(x)
$$

and assuming that the derivatives exist and that $\theta \mapsto \psi_{\theta}$ is continuous, we find

$$
0=\left(\frac{\partial}{\partial \theta} P \psi_{\theta}\right)_{\theta=\phi(P)}\left[\frac{d}{d t} \phi\left(P+t \delta_{x}\right)\right]_{t=0}+\psi_{\phi(P)}(x)
$$

The expression enclosed by squared brackets is the influence function of the $Z$-function. Informally, this is seen to be equal to

$$
-\left(\frac{\partial}{\partial \theta} P \psi_{\theta}\right)_{\theta=\phi(P)}^{-1} \psi_{\phi(P)}(x)
$$

In robust statistics we look for estimators with bounded influence functions. Because the influence function is, up to a constant, equal to $\psi_{\phi(P)}(x)$, this is easy to achieve with $Z$-estimators!

The $Z$-estimators are discussed at length in Chapter 5. The theorems discussed there give sufficient conditions for the asymptotic normality, and an asymptotic expansion for $\sqrt{n}\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)$. This is of the type (20.1) with the influence function as in the preceding display. $\square$
20.5 Example (Quantiles). The $p$ th quantile of a distribution function $F$ is, roughly, the number $\phi(F)=F^{-1}(p)$ such that $F F^{-1}(p)=p$. We set $F_{t}=(1-t) F+t \delta_{x}$, and differentiate with respect to $t$ the identity

$$
p=F_{t} F_{t}^{-1}(p)=(1-t) F\left(F_{t}^{-1}(p)\right)+t \delta_{x}\left(F_{t}^{-1}(p)\right) .
$$

This "identity" may actually be only an inequality for certain values of $p, t$, and $x$, but we do not worry about this. We find that

$$
0 \equiv-F\left(F^{-1}(p)\right)+f\left(F^{-1}(p)\right)\left[\frac{d}{d t} F_{t}^{-1}(p)\right]_{\mid t=0}+\delta_{x}\left(F^{-1}(p)\right)
$$

The derivative within square brackets is the influence function of the quantile function and can be solved from the equation as

$$
\phi_{F}^{\prime}\left(\delta_{x}-F\right)=-\frac{1_{[x, \infty)}\left(F^{-1}(p)\right)-p}{f\left(F^{-1}(p)\right)}
$$

The graph of this function is given in Figure 20.1 and has the following interpretation. Suppose the $p$ th quantile has been computed for a large sample, but an additional observation $x$ is obtained. If $x$ is to the left of the $p$ th quantile, then the $p$ th quantile decreases; if $x$ is to the right, then the quantile increases. In both cases the rate of change is constant, irrespective of the location of $x$. Addition of an observation $x$ at the $p$ th quantile has an unstable effect.

$$
\text { ⟶ } \frac{p}{f\left(F^{-1}(p)\right)}
$$

![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-081.jpg?height=1161&width=2673&top_left_y=7263&top_left_x=344)
Figure 20.1. Influence function of the $p$ th quantile.

The von Mises calculus suggests that the sequence of empirical quantiles $\sqrt{n}\left(\mathbb{F}_{n}^{-1}(t)-\right. \left.F^{-1}(t)\right)$ is asymptotically normal with variance $\operatorname{var}_{F} \phi_{F}^{\prime}\left(\delta_{X_{1}}\right)=p(1-p) / f \circ F^{-1}(p)^{2}$. In Chapter 21 this is proved rigorously by the delta method of the following section. Alternatively, a $p$ th quantile may be viewed as an $M$-estimator, and we can apply the results of Chapter 5.

### 20.1.1 Higher-Order Expansions

In most examples the analysis of the first derivative suffices. This statement is roughly equivalent to the statement that most limiting distributions are normal. However, in some important examples the quadratic term dominates the von Mises expansion.

The second derivative $\phi_{P}^{\prime \prime}(H)$ ought to correspond to a bilinear map. Thus, it is better to write it as $\phi_{P}^{\prime \prime}(H, H)$. If the first derivative in the von Mises expansion vanishes, then we expect that

$$
\phi\left(\mathbb{P}_{n}\right)-\phi(P) \approx \frac{1}{2} \frac{1}{n} \phi_{P}^{\prime \prime}\left(\mathbb{G}_{n}, \mathbb{G}_{n}\right)=\frac{1}{2} \frac{1}{n^{2}} \sum_{i=1}^{n} \sum_{j=1}^{n} \phi_{P}^{\prime \prime}\left(\delta_{X_{i}}-P, \delta_{X_{j}}-P\right)
$$

The right side is a $V$-statistic of degree 2 with kernel function equal to $h_{P}(x, y)=\frac{1}{2} \phi_{P}^{\prime \prime}\left(\delta_{x}-\right. P, \delta_{y}-P$ ). The kernel ought to be symmetric and degenerate in that $P h_{P}(X, y)=0$ for every $y$, because, by linearity and continuity,

$$
\begin{aligned}
\int \phi_{P}^{\prime \prime}\left(\delta_{x}-P, \delta_{y}-P\right) d P(x) & =\phi_{P}^{\prime \prime}\left(\int\left(\delta_{x}-P\right) d P(x), \delta_{y}-P\right) \\
& =\phi_{P}^{\prime \prime}\left(0, \delta_{y}-P\right)=0
\end{aligned}
$$

If we delete the diagonal, then a $V$-statistic turns into a $U$-statistic and hence we can apply Theorem 12.10 to find the limit distribution of $n\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)$. We expect that

$$
n\left(\phi\left(\mathbb{P}_{n}\right)-\phi(P)\right)=\frac{2}{n} \sum_{i<j} \sum_{P} h_{P}\left(X_{i}, X_{j}\right)+\frac{1}{n} \sum_{i=1}^{n} h_{P}\left(X_{i}, X_{i}\right)+o_{P}(1) .
$$

If the function $x \mapsto h_{P}(x, x)$ is $P$-integrable, then the second term on the right only contributes a constant to the limit distribution. If the function $(x, y) \mapsto h_{P}^{2}(x, y)$ is $(P \times P)$ integrable, then the first term on the right converges to an infinite linear combination of independent $\chi_{1}^{2}$-variables, according to Example 12.12.
20.6 Example (Cramér-von Mises). The Cramér-von Mises statistic is the function $\phi\left(\mathbb{F}_{n}\right)$ for $\phi(F)=\int\left(F-F_{0}\right)^{2} d F_{0}$ and a fixed cumulative distribution function $F_{0}$. By direct calculation,

$$
\phi(F+t H)=\phi(F)+2 t \int\left(F-F_{0}\right) H d F_{0}+t^{2} \int H^{2} d F_{0}
$$

Consequently, the first derivative vanishes at $F=F_{0}$ and the second derivative is equal to $\phi_{F_{0}}^{\prime \prime}(H)=2 \int H^{2} d F_{0}$. The von Mises calculus suggests the approximation

$$
\phi\left(\mathbb{F}_{n}\right)-\phi\left(F_{0}\right) \approx \frac{1}{2} \frac{1}{n} \phi_{F_{0}}^{\prime \prime}\left(\mathbb{G}_{n}\right)=\frac{1}{n} \int \mathbb{G}_{n}^{2} d F_{0}
$$

This is certainly correct, because it is just the definition of the statistic. The preceding discussion is still of some interest in that it suggests that the limit distribution is nonnormal and can be obtained using the theory of $V$-statistics. Indeed, by squaring the sum that is hidden in $\mathbb{G}_{n}^{2}$, we see that

$$
n \phi\left(\mathbb{F}_{n}\right)=\frac{1}{n} \sum_{i=1}^{n} \sum_{j=1}^{n} \int\left(1_{X_{i} \leq x}-F_{0}(x)\right)\left(1_{X_{j} \leq x}-F_{0}(x)\right) d F_{0}(x)
$$

In Example 12.13 we used this representation to find that the sequence $n \phi\left(\mathbb{F}_{n}\right) \rightsquigarrow(1 / 6)+ \sum_{j=1}^{\infty} j^{-2} \pi^{-2}\left(Z_{j}^{2}-1\right)$ for an i.i.d. sequence of standard normal variables $Z_{1}, Z_{2}, \ldots$, if the true distribution $F_{0}$ is continuous.

### 20.2 Hadamard-Differentiable Functions

Let $T_{n}$ be a sequence of statistics with values in a normed space $\mathbb{D}$ such that $r_{n}\left(T_{n}-\theta\right)$ converges in distribution to a limit $T$, for a given, nonrandom $\theta$, and given numbers $r_{n} \rightarrow \infty$. In the previous section the role of $T_{n}$ was played by the empirical distribution $\mathbb{P}_{n}$, which might, for instance, be viewed as an element of the normed space $D[-\infty, \infty]$. We wish to prove that $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)$ converges to a limit, for every appropriately differentiable map $\phi$, which we shall assume to take its values in another normed space $\mathbb{E}$.

There are several possibilities for defining differentiability of a map $\phi: \mathbb{D} \mapsto \mathbb{E}$ between normed spaces. A map $\phi$ is said to be Gateaux differentiable at $\theta \in \mathbb{D}$ if for every fixed $h$ there exists an element $\phi_{\theta}^{\prime}(h) \in \mathbb{E}$ such that

$$
\phi(\theta+t h)-\phi(\theta)=t \phi_{\theta}^{\prime}(h)+o(t), \quad \text { as } t \downarrow 0 .
$$

For $\mathbb{E}$ the real line, this is precisely the differentiability as introduced in the preceding section. Gateaux differentiability is also called "directional differentiability," because for every possible direction $h$ in the domain the derivative value $\phi_{\theta}^{\prime}(h)$ measures the direction of the infinitesimal change in the value of the function $\phi$. More formally, the $o(t)$ term in the previous displayed equation means that

$$
\begin{equation*}
\left\|\frac{\phi(\theta+t h)-\phi(\theta)}{t}-\phi_{\theta}^{\prime}(h)\right\|_{\mathbb{E}} \rightarrow 0, \quad \text { as } t \downarrow 0 . \tag{20.7}
\end{equation*}
$$

The suggestive notation $\phi_{\theta}^{\prime}(h)$ for the "tangent vectors" encourages one to think of the directional derivative as a map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$, which approximates the difference map $\phi(\theta+ h)-\phi(\theta): \mathbb{D} \mapsto \mathbb{E}$. It is usually included in the definition of Gateaux differentiability that this map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ be linear and continuous.

However, Gateaux differentiability is too weak for the present purposes, and we need a stronger concept. A map $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$, defined on a subset $\mathbb{D}_{\phi}$ of a normed space $\mathbb{D}$ that contains $\theta$, is called Hadamard differentiable at $\theta$ if there exists a continuous, linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that

$$
\left\|\frac{\phi\left(\theta+t h_{t}\right)-\phi(\theta)}{t}-\phi_{\theta}^{\prime}(h)\right\|_{\mathbb{E}} \rightarrow 0, \quad \text { as } t \downarrow 0, \text { every } h_{t} \rightarrow h .
$$

(More precisely, for every $h_{t} \rightarrow h$ such that $\theta+t h_{t}$ is contained in the domain of $\phi$ for all small $t>0$.) The values $\phi_{\theta}^{\prime}(h)$ of the derivative are the same for the two types
of differentiability. The difference is that for Hadamard-differentiability the directions $h_{t}$ are allowed to change with $t$ (although they have to settle down eventually), whereas for Gateaux differentiability they are fixed. The definition as given requires that $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ exists as a map on the whole of $\mathbb{D}$. If this is not the case, but $\phi_{\theta}^{\prime}$ exists on a subset $\mathbb{D}_{0}$ and the sequences $h_{t} \rightarrow h$ are restricted to converge to limits $h \in \mathbb{D}_{0}$, then $\phi$ is called Hadamard differentiable tangentially to this subset.

It can be shown that Hadamard differentiability is equivalent to the difference in (20.7) tending to zero uniformly for $h$ in compact subsets of $\mathbb{D}$. For this reason, it is also called compact differentiability. Because weak convergence of random elements in metric spaces is intimately connected with compact sets, through Prohorov's theorem, Hadamard differentiability is the right type of differentiability in connection with the delta method.

The derivative map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ is assumed to be linear and continuous. In the case of finite-dimensional spaces a linear map can be represented by matrix multiplication and is automatically continuous. In general, linearity does not imply continuity.

Continuity of the map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ should not be confused with continuity of the dependence $\theta \mapsto \phi_{\theta}^{\prime}$ (if $\phi$ has derivatives in a neighborhood of $\theta$-values). If the latter continuity holds, then $\phi$ is called continuously differentiable. This concept requires a norm on the set of derivative maps but need not concern us here.

For completeness we discuss a third, stronger form of differentiability. The map $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}$ is called Fréchet differentiable at $\theta$ if there exists a continuous, linear map $\phi_{\theta}^{\prime}: \mathbb{D} \mapsto \mathbb{E}$ such that

$$
\left\|\phi(\theta+h)-\phi(\theta)-\phi_{\theta}^{\prime}(h)\right\|_{\mathbb{E}}=o(\|h\|), \quad \text { as }\|h\| \downarrow 0 .
$$

Because sequences of the type $t h_{t}$, as employed in the definition of Hadamard differentiability, have norms satisfying $\left\|t h_{t}\right\|=O(t)$, Fréchet differentiability is the most restrictive of the three concepts. In statistical applications, Fréchet differentiability may not hold, whereas Hadamard differentiability does. We did not have this problem in Section 3.1, because Hadamard and Fréchet differentiability are equivalent when $\mathbb{D}=\mathbb{R}^{k}$.
20.8 Theorem (Delta method). Let $\mathbb{D}$ and $\mathbb{E}$ be normed linear spaces. Let $\phi: \mathbb{D}_{\phi} \subset \mathbb{D} \mapsto \mathbb{E}$ be Hadamard differentiable at $\theta$ tangentially to $\mathbb{D}_{0}$. Let $T_{n}: \Omega_{n} \mapsto \mathbb{D}_{\phi}$ be maps such that $r_{n}\left(T_{n}-\theta\right) \rightsquigarrow T$ for some sequence of numbers $r_{n} \rightarrow \infty$ and a random element $T$ that takes its values in $\mathbb{D}_{0}$. Then $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$. If $\phi_{\theta}^{\prime}$ is defined and continuous on the whole space $\mathbb{D}$, then we also have $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)=\phi_{\theta}^{\prime}\left(r_{n}\left(T_{n}-\theta\right)\right)+o_{P}(1)$.

Proof. To prove that $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$, define for each $n$ a map $g_{n}(h)=r_{n}(\phi(\theta+ \left.\left.r_{n}^{-1} h\right)-\phi(\theta)\right)$ on the domain $\mathbb{D}_{n}=\left\{h: \theta+r_{n}^{-1} h \in \mathbb{D}_{\phi}\right\}$. By Hadamard differentiability, this sequence of maps satisfies $g_{n^{\prime}}\left(h_{n^{\prime}}\right) \rightarrow \phi_{\theta}^{\prime}(h)$ for every subsequence $h_{n^{\prime}} \rightarrow h \in \mathbb{D}_{0}$. Therefore, $g_{n}\left(r_{n}\left(T_{n}-\theta\right)\right) \rightsquigarrow \phi_{\theta}^{\prime}(T)$ by the extended continuous-mapping theorem, Theorem 18.11, which is the first assertion.

The seemingly stronger last assertion of the theorem actually follows from this, if applied to the function $\psi=\left(\phi, \phi_{\theta}^{\prime}\right): \mathbb{D} \mapsto \mathbb{E} \times \mathbb{E}$. This is Hadamard-differentiable at $(\theta, \theta)$ with derivative $\psi_{\theta}^{\prime}=\left(\phi_{\theta}^{\prime}, \phi_{\theta}^{\prime}\right)$. Thus, by the preceding paragraph, $r_{n}\left(\psi\left(T_{n}\right)-\psi(\theta)\right)$ converges weakly to $\left(\phi_{\theta}^{\prime}(T), \phi_{\theta}^{\prime}(T)\right)$ in $\mathbb{E} \times \mathbb{E}$. By the continuous-mapping theorem, the difference $r_{n}\left(\phi\left(T_{n}\right)-\phi(\theta)\right)-\phi_{\theta}^{\prime}\left(r_{n}\left(T_{n}-\theta\right)\right)$ converges weakly to $\phi_{\theta}^{\prime}(T)-\phi_{\theta}^{\prime}(T)=0$. Weak convergence to a constant is equivalent to convergence in probability.

Without the chain rule, Hadamard differentiability would not be as interesting. Consider maps $\phi: \mathbb{D} \mapsto \mathbb{E}$ and $\psi: \mathbb{E} \mapsto \mathbb{F}$ that are Hadamard-differentiable at $\theta$ and $\phi(\theta)$, respectively. Then the composed map $\psi \circ \phi: \mathbb{D} \mapsto \mathbb{F}$ is Hadamard-differentiable at $\theta$, and the derivative is the map obtained by composing the two derivative maps. (For Euclidean spaces this means that the derivative can be found through matrix multiplication of the two derivative matrices.) The attraction of the chain rule is that it allows a calculus of Hadamarddifferentiable maps, in which differentiability of a complicated map can be established by decomposing this into a sequence of basic maps, of which Hadamard differentiability is known or can be proven easily. This is analogous to the chain rule for real functions, which allows, for instance, to see the differentiability of the map $x \mapsto \exp \cos \log \left(1+x^{2}\right)$ in a glance.
20.9 Theorem (Chain rule). Let $\phi: \mathbb{D}_{\phi} \mapsto \mathbb{E}_{\psi}$ and $\psi: \mathbb{E}_{\psi} \mapsto \mathbb{F}$ be maps defined on subsets $\mathbb{D}_{\phi}$ and $\mathbb{E}_{\psi}$ of normed spaces $\mathbb{D}$ and $\mathbb{E}$, respectively. Let $\phi$ be Hadamard-differentiable at $\theta$ tangentially to $\mathbb{D}_{0}$ and let $\psi$ be Hadamard-differentiable at $\phi(\theta)$ tangentially to $\phi_{\theta}^{\prime}\left(\mathbb{D}_{0}\right)$. Then $\psi \circ \phi: \mathbb{D}_{\phi} \mapsto \mathbb{F}$ is Hadamard-differentiable at $\theta$ tangentially to $\mathbb{D}_{0}$ with derivative $\psi_{\phi(\theta)}^{\prime} \circ \phi_{\theta}^{\prime}$.

Proof. Take an arbitrary converging path $h_{t} \rightarrow h$ in $\mathbb{D}$. With the notation $g_{t}=t^{-1}(\phi(\theta+ \left.t h_{t}\right)-\phi(\theta)$ ), we have

$$
\frac{\psi \circ \phi\left(\theta+t h_{t}\right)-\psi \circ \phi(\theta)}{t}=\frac{\psi\left(\phi(\theta)+t g_{t}\right)-\psi(\phi(\theta))}{t} .
$$

By Hadamard differentiability of $\phi, g_{t} \rightarrow \phi_{\theta}^{\prime}(h)$. Thus, by Hadamard differentiability of $\psi$, the whole expression goes to $\psi_{\phi(\theta)}^{\prime}\left(\phi_{\theta}^{\prime}(h)\right)$.

### 20.3 Some Examples

In this section we give examples of Hadamard-differentiable functions and applications of the delta method. Further examples, such as quantiles and trimmed means, are discussed in separate chapters.

The Mann-Whitney statistic can be obtained by substituting the empirical distribution functions of two samples of observations into the function $(F, G) \mapsto \int F d G$. This function also plays a role in the construction of other estimators. The following lemma shows that it is Hadamard-differentiable. The set $B V_{M}[a, b]$ is the set of all cadlag functions $z:[a, b] \mapsto[-M, M] \subset \mathbb{R}$ of variation bounded by $M$ (the set of differences of $z_{1}-z_{2}$ of two monotonely increasing functions that together increase no more than $M$ ).
20.10 Lemma. Let $\phi:[0,1] \mapsto \mathbb{R}$ be twice continuously differentiable. Then the function $\left(F_{1}, F_{2}\right) \mapsto \int \phi\left(F_{1}\right) d F_{2}$ is Hadamard-differentiable from the domain $D[-\infty, \infty] \times B V_{1}[-\infty, \infty] \subset D[-\infty, \infty] \times D[-\infty, \infty]$ into $\mathbb{R}$ at every pair of functions of bounded variation ( $F_{1}, F_{2}$ ). The derivative is given by ${ }^{\dagger}$

$$
\left.\left(h_{1}, h_{2}\right) \mapsto h_{2} \phi \circ F_{1}\right|_{-\infty} ^{\infty}-\int h_{2-} d \phi \circ F_{1}+\int \phi^{\prime}\left(F_{1}\right) h_{1} d F_{2}
$$

[^13]Furthermore, the function $\left(F_{1}, F_{2}\right) \mapsto \int_{(-\infty, \cdot]} \phi\left(F_{1}\right) d F_{2}$ is Hamamard-differentiable as a map into $D[-\infty, \infty]$.

Proof. Let $h_{1 t} \rightarrow h_{1}$ and $h_{2 t} \rightarrow h_{2}$ in $D[-\infty, \infty]$ be such that $F_{2 t}=F_{2}+t h_{2 t}$ is a function of variation bounded by 1 for each $t$. Because $F_{2}$ is of bounded variation, it follows that $h_{2 t}$ is of bounded variation for every $t$. Now, with $F_{1 t}=F_{1}+t h_{1 t}$,

$$
\begin{aligned}
& \frac{1}{t}\left(\int \phi\left(F_{1 t}\right) d F_{2 t}-\int \phi\left(F_{1}\right) d F_{2}\right) \\
& \quad=\int\left(\frac{\phi\left(F_{1 t}\right)-\phi\left(F_{1}\right)}{t}-\phi^{\prime}\left(F_{1}\right) h_{1}\right) d F_{2 t}+\int \phi\left(F_{1}\right) d h_{2 t}+\int \phi^{\prime}\left(F_{1}\right) h_{1} d F_{2 t}
\end{aligned}
$$

By partial integration, the second term on the right can be rewritten as $\left.\phi \circ F_{1} h_{2 t}\right|_{-\infty} ^{\infty}- \int h_{2 t-} d \phi \circ F_{1}$. Under the assumption on $h_{2 t}$, this converges to the first part of the derivative as given in the lemma. The first term is bounded above by $\left(\left\|\phi^{\prime \prime}\right\|_{\infty} t\left\|h_{1 t}\right\|_{\infty}+\left\|\phi^{\prime}\right\|_{\infty} \| h_{1 t}-\right. \left.h_{1} \|_{\infty}\right) \int d\left|F_{2 t}\right|$. Because the measures $F_{2 t}$ are of total variation at most 1 by assumption, this expression converges to zero. To analyze the third term on the right, take a grid $u_{0}= -\infty<u_{1}<\cdots<u_{m}=\infty$ such that the function $\phi^{\prime} \circ F_{1} h_{1}$ varies less than a prescribed value $\varepsilon>0$ on each interval [ $u_{i-1}, u_{i}$ ). Such a grid exists for every element of $D[-\infty, \infty]$ (problem 18.6). Then

$$
\begin{aligned}
\left|\int \phi^{\prime}\left(F_{1}\right) h_{1} d\left(F_{2 t}-F_{2}\right)\right| \leq & \varepsilon\left(\int d\left|F_{2 t}\right|+d\left|F_{2}\right|\right) \\
& +\sum_{i=1}^{m+1}\left|\left(\phi^{\prime} \circ F_{1} h_{1}\right)\left(u_{i-1}\right)\right|\left|F_{2 t}\left[u_{i-1}, u_{i}\right)-F_{2}\left[u_{i-1}, u_{i}\right)\right|
\end{aligned}
$$

The first term is bounded by $\varepsilon O(1)$, in which the $\varepsilon$ can be made arbitrarily small by the choice of the partition. For each fixed partition, the second term converges to zero as $t \downarrow 0$. Hence the left side converges to zero as $t \downarrow 0$.

This proves the first assertion. The second assertion follows similarly. $\square$
20.11 Example (Wilcoxon). Let $\mathbb{F}_{m}$ and $\mathbb{G}_{n}$ be the empirical distribution functions of two independent random samples $X_{1}, \ldots, X_{m}$ and $Y_{1}, \ldots, Y_{n}$ from distribution functions $F$ and $G$, respectively. As usual, consider both $m$ and $n$ as indexed by a parameter $\nu$, let $N=m+n$, and assume that $m / N \rightarrow \lambda \in(0,1)$ as $v \rightarrow \infty$. By Donsker's theorem and Slutsky's lemma,

$$
\sqrt{N}\left(\mathbb{F}_{m}-F, \mathbb{G}_{n}-G\right) \rightsquigarrow\left(\frac{\mathbb{G}_{F}}{\sqrt{\lambda}}, \frac{\mathbb{G}_{G}}{\sqrt{1-\lambda}}\right),
$$

in the space $D[-\infty, \infty] \times D[-\infty, \infty]$, for a pair of independent Brownian bridges $\mathbb{G}_{F}$ and $\mathbb{G}_{G}$. The preceding lemma together with the delta method imply that

$$
\sqrt{N}\left(\int \mathbb{F}_{m} d \mathbb{G}_{n}-\int F d G\right) \rightsquigarrow-\int \frac{\mathbb{G}_{G-}}{\sqrt{1-\lambda}} d F+\int \frac{\mathbb{G}_{F}}{\sqrt{\lambda}} d G .
$$

The random variable on the right is a continuous, linear function applied to Gaussian processes. In analogy to the theorem that a linear transformation of a multivariate Gaussian vector has a Gaussian distribution, it can be shown that a continuous, linear transformation of a tight Gaussian process is normally distributed. That the present variable is normally
distributed can be more easily seen by applying the delta method in its stronger form, which implies that the limit variable is the limit in distribution of the sequence

$$
-\int \sqrt{N}\left(\mathbb{G}_{n}-G\right)_{-} d F+\int \sqrt{N}\left(\mathbb{F}_{m}-F\right) d G
$$

This can be rewritten as the difference of two sums of independent random variables, and next we can apply the central limit theorem for real variables.
20.12 Example (Two-sample rank statistics). Let $\mathbb{H}_{N}$ be the empirical distribution function of a sample $X_{1}, \ldots, X_{m}, Y_{1}, \ldots, Y_{n}$ obtained by "pooling" two independent random samples from distributions $F$ and $G$, respectively. Let $R_{N 1}, \ldots, R_{N N}$ be the ranks of the pooled sample and let $\mathbb{G}_{n}$ be the empirical distribution function of the second sample. If no observations are tied, then $N \mathbb{H}_{N}\left(Y_{j}\right)$ is the rank of $Y_{j}$ in the pooled sample. Thus,

$$
\int \phi\left(\mathbb{H}_{N}\right) d \mathbb{G}_{n}=\frac{1}{n} \sum_{j=m+1}^{N} \phi\left(\frac{R_{N j}}{N}\right)
$$

is a two-sample rank statistic. This can be shown to be asymptotically normal by the preceding lemma. Because $N \mathbb{H}_{N}=m \mathbb{F}_{m}+n \mathbb{G}_{n}$, the asymptotic normality of the pair $\left(\mathbb{H}_{N}, \mathbb{G}_{n}\right)$ can be obtained from the asymptotic normality of the pair $\left(\mathbb{F}_{m}, \mathbb{G}_{n}\right)$, which is discussed in the preceding example.

The cumulative hazard function corresponding to a cumulative distribution function $F$ on [ $0, \infty$ ] is defined as

$$
\Lambda_{F}(t)=\int_{[0, t]} \frac{d F}{1-F_{-}}
$$

In particular, if $F$ has a density $f$, then $\Lambda_{F}$ has a density $\lambda_{F}=f /(1-F)$. If $F(t)$ gives the probability of "survival" of a person or object until time $t$, then $d \Lambda_{F}(t)$ can be interpreted as the probability of "instant death at time $t$ given survival until $t$." The hazard function is an important modeling tool in survival analysis.

The correspondence between distribution functions and hazard functions is one-to-one. The cumulative distribution function can be explicitly recovered from the cumulative hazard function as the product integral of $-\Lambda$ (see the proof of Lemma 25.74),

$$
\begin{equation*}
1-F_{\Lambda}(t)=\prod_{0<s \leq t}(1-\Lambda\{s\}) e^{-\Lambda^{c}(t)} \tag{20.13}
\end{equation*}
$$

Here $\Lambda\{s\}$ is the jump of $\Lambda$ at $s$ and $\Lambda^{c}(s)$ is the continuous part of $\Lambda$.
Under some restrictions the maps $F \leftrightarrow \Lambda_{F}$ are Hadamard differentiable. Thus, from an asymptotic-statistical point of view, estimating a distribution function and estimating a cumulative hazard function are the same problem.
20.14 Lemma. Let $\mathbb{D}_{\phi}$ be the set of all nondecreasing cadlag functions $F:[0, \tau] \mapsto \mathbb{R}$ with $F(0)=0$ and $1-F(\tau) \geq \varepsilon>0$ for some $\varepsilon>0$, and let $\mathbb{E}_{\psi}$ be the set of all nondecreasing cadlag functions $\Lambda:[0, \tau] \mapsto \mathbb{R}$ with $\Lambda(0)=0$ and $\Lambda(\tau) \leq M$ for some $M \in \mathbb{R}$.
(i) The map $\phi: \mathbb{D}_{\phi} \subset D[0, \tau] \mapsto D[0, \tau]$ defined by $\phi(F)=\Lambda_{F}$ is Hadamard differentiable.
(ii) The map $\psi: \mathbb{E}_{\psi} \subset D[0, \tau] \mapsto D[0, \tau]$ defined by $\psi(\Lambda)=F_{\Lambda}$ is Hadamard differentiable.

Proof. Part (i) follows from the chain rule and the Hadamard differentiability of each of the three maps in the decomposition

$$
F \mapsto\left(F, 1-F_{-}\right) \mapsto\left(F, \frac{1}{1-F_{-}}\right) \mapsto \int_{[0, t]} \frac{d F}{1-F_{-}}
$$

The differentiability of the first two maps is easy to see. The differentiability of the last one follows from Lemma 20.10. The proof of (ii) is longer; see, for example, [54] or [55].
20.15 Example (Nelson-Aalen estimator). Consider estimating a distribution function based on right-censored data. We wish to estimate the distribution function $F$ (or the corresponding cumulative hazard function $\Lambda$ ) of a random sample of "failure times" $T_{1}, \ldots, T_{n}$. Unfortunately, instead of $T_{i}$ we only observe the pair ( $X_{i}, \Delta_{i}$ ), in which $X_{i}=T_{i} \wedge C_{i}$ is the minimum of $T_{i}$ and a "censoring time" $C_{i}$, and $\Delta_{i}=1\left\{T_{i} \leq C_{i}\right\}$ records whether $T_{i}$ is censored ( $\Delta_{i}=0$ ) or not ( $\Delta_{i}=1$ ). The censoring time could be the closing date of the study or a time that a patient is lost for further observation. The cumulative hazard function of interest can be written

$$
\Lambda(t)=\int_{[0, t]} \frac{1}{1-F_{-}} d F=\int_{[0, t]} \frac{1}{1-H_{-}} d H_{1}
$$

for $1-H=(1-F)(1-G)$ and $d H_{1}=\left(1-G_{-}\right) d F$, and every choice of distribution function $G$. If we assume that the censoring times $C_{1}, \ldots, C_{n}$ are a random sample from $G$ and are independent of the failure times $T_{i}$, then $H$ is precisely the distribution function of $X_{i}$ and $H_{1}$ is a "subdistribution function,"

$$
1-H(x)=\mathrm{P}\left(X_{i}>x\right), \quad H_{1}(x)=\mathrm{P}\left(X_{i} \leq x, \Delta_{i}=1\right) .
$$

An estimator for $\Lambda$ is obtained by estimating these functions by the empirical distributions of the data, given by $\mathbb{H}_{n}(x)=n^{-1} \sum_{i=1}^{n} 1\left\{X_{i} \leq x\right\}$ and $\mathbb{H}_{1 n}(x)=n^{-1} \sum_{i=1}^{n} 1\left\{X_{i} \leq\right. \left.x, \Delta_{i}=1\right\}$, and next substituting these estimators in the formula for $\Lambda$. This yields the Nelson-Aalen estimator

$$
\hat{\Lambda}_{n}(t)=\int_{[0, t]} \frac{1}{1-\mathbb{H}_{n-}} d \mathbb{H}_{1 n}
$$

Because they are empirical distribution functions, the pair ( $\mathbb{H}_{n}, \mathbb{H}_{1 n}$ ) is asymptotically normal in the space $D[-\infty, \infty] \times D[-\infty, \infty]$. The easiest way to see this is to consider them as continuous transformations of the (bivariate) empirical distribution function of the pairs ( $X_{i}, \Delta_{i}$ ). The Nelson-Aalen estimator is constructed through the maps

$$
(A, B) \mapsto(1-A, B) \mapsto\left(\frac{1}{1-A}, B\right) \mapsto \int_{[0, t]} \frac{1}{1-A_{-}} d B
$$

These are Hadamard differentiable on appropriate domains, the main restrictions being that $1-A$ should be bounded away from zero and $B$ of uniformly bounded variation. The
asymptotic normality of the Nelson-Aalen estimator $\hat{\Lambda}_{n}(t)$ follows for every $t$ such that $H(t)<1$, and even as a process in $D[0, \tau]$ for every $\tau$ such that $H(\tau)<1$.

If we apply the product integral given in (20.13) to the Nelson-Aalen estimator, then we obtain an estimator $1-\hat{F}_{n}$ for the distribution function, known as the product limit estimator or Kaplan-Meier estimator. For a discrete hazard function the product integral is an ordinary product over the jumps, by definition, and it can be seen that

$$
1-\hat{F}_{n}(t)=\prod_{i: X_{i} \leq t} \frac{\#\left(j: X_{j} \geq X_{i}\right)-\Delta_{i}}{\#\left(j: X_{j} \geq X_{i}\right)}=\prod_{i: X_{(i)} \leq t}\left(\frac{n-i}{n-i+1}\right)^{\Delta_{(i)}} .
$$

This estimator sequence is asymptotically normal by the Hadamard differentiability of the product integral.

## Notes

A calculus of "differentiable statistical functions" was proposed by von Mises [104]. Von Mises considered functions $\phi\left(\mathbb{F}_{n}\right)$ of the empirical distribution function (which he calls the "repartition of the real quantities $x_{1}, \ldots, x_{n}$ ") as in the first section of this chapter. Following Volterra he calls $\phi m$ times differentiable at $F$ if the first $m$ derivatives of the map $t \mapsto \phi(F+t H)$ at $t=0$ exist and have representations of the form

$$
\phi_{F}^{(k)}(H)=\int \cdots \int \psi\left(x_{1}, \ldots, x_{k}\right) d H\left(x_{1}\right) \cdots d H\left(x_{k}\right)
$$

This representation is motivated in analogy with the finite-dimensional case, in which $H$ would be a vector and the integrals sums. From the perspective of our section on Hadamarddifferentiable functions, the representation is somewhat arbitrary, because it is required that a derivative be continuous, whence its general form depends on the norm that we use on the domain of $\phi$. Furthermore, the Volterra representation cannot be directly applied to, for instance, a limiting Brownian bridge, which is not of bounded variation.

Von Mises' treatment is not at all informal, as is the first section of this chapter. After developing moment bounds on the derivatives, he shows that $n^{m / 2}\left(\phi\left(\mathbb{F}_{n}\right)-\phi(F)\right)$ is asymptotically equivalent to $\phi_{F}^{(m)}\left(\mathbb{G}_{n}\right)$ if the first $m-1$ derivatives vanish at $F$ and the ( $m+1$ )th derivative is sufficiently regular. He refers to the approximating variables $\phi_{F}^{(m)}\left(\mathbb{G}_{n}\right)$, degenerate $V$-statistics, as "quantics" and derives the asymptotic distribution of quantics of degree 2 , first for discrete observations and next in general by discrete approximation. Hoeffding's work on $U$-statistics, which was published one year later, had a similar aim of approximating complicated statistics by simpler ones but did not consider degenerate $U$-statistics.

The systematic application of Hamadard differentiability in statistics appears to have first been put forward in the (unpublished) thesis [125] of J Reeds and had a main focus on robust functions. It was revived by Gill [53] with applications in survival analysis in mind. With a growing number of functional estimators available (beyond the empirical distribution and product-limit estimator), the delta method is a simple but useful tool to standardize asymptotic normality proofs.

Our treatment allows the domain $\mathbb{D}_{\phi}$ of the map $\phi$ to be arbitrary. In particular, we do not assume that it is open, as we did, for simplicity, when discussing the Delta method for

Euclidean spaces. This is convenient, because many functions of statistical interest, such as zeros, inverses or integrals, are defined only on irregularly shaped subsets of a normed space, which, besides a linear space, should be chosen big enough to support the limit distribution of $T_{n}$.

## PROBLEMS

1. Let $\phi(P)=\iint h(u, v) d P(u) d P(v)$ for a fixed given function $h$. The corresponding estimator $\phi\left(\mathbb{P}_{n}\right)$ is known as a $V$-statistic. Find the influence function.
2. Find the influence function of the function $\phi(F)=\int a\left(F_{1}+F_{2}\right) d F_{2}$ if $F_{1}$ and $F_{2}$ are the marginals of the bivariate distribution function $F$, and $a$ is a fixed, smooth function. Write out $\phi\left(\mathbb{F}_{n}\right)$. What asymptotic variance do you expect?
3. Find the influence function of the map $F \mapsto \int_{[0, t]}\left(1-F_{-}\right)^{-1} d F$ (the cumulative hazard function).
4. Show that a map $\phi: \mathbb{D} \mapsto \mathbb{E}$ is Hadamard differentiable at a point $\theta$ if and only if for every compact set $K \subset \mathbb{D}$ the expression in (20.7) converges to zero uniformly in $h \in K$ as $t \rightarrow 0$.
5. Show that the symmetrization map $(\theta, F) \mapsto \frac{1}{2}(F(t)+1-F(2 \theta-t))$ is (tangentially) Hadamard differentiable under appropriate conditions.
6. Let $g:[a, b] \mapsto \mathbb{R}$ be a continuously differentiable function. Show that the map $z \mapsto g \circ z$ with domain the functions $z: T \mapsto[a, b]$ contained in $\ell^{\infty}(T)$ is Hadamard differentiable. What does this imply for the function $z \mapsto 1 / z$ ?
7. Show that the map $F \mapsto \int_{[a, b]} s d F(s)$ is Hadamard differentiable from the domain of all distribution functions to $\mathbb{R}$, for each pair of finite numbers $a$ and $b$. View the distribution functions as a subset of $D[-\infty, \infty]$ equipped with supremum norm. What if $a$ or $b$ are infinite?
8. Find the first- and second-order derivative of the function $\phi(F)=\int\left(F-F_{0}\right)^{2} d F$ at $F=F_{0}$. What limit distribution do you expect for $\phi\left(\mathbb{F}_{n}\right)$ ?

## 21

## Quantiles and Order Statistics

In this chapter we derive the asymptotic distribution of estimators of quantiles from the asymptotic distribution of the corresponding estimators of a distribution function. Empirical quantiles are an example, and hence we also discuss some results concerning order statistics. Furthermore, we discuss the asymptotics of the median absolute deviation, which is the empirical 1/2-quantile of the observations centered at their 1/2-quantile.

### 21.1 Weak Consistency

The quantile function of a cumulative distribution function $F$ is the generalized inverse $F^{-1}:(0,1) \mapsto \mathbb{R}$ given by

$$
F^{-1}(p)=\inf \{x: F(x) \geq p\}
$$

It is a left-continuous function with range equal to the support of $F$ and hence is often unbounded. The following lemma records some useful properties.
21.1 Lemma. For every $0<p<1$ and $x \in \mathbb{R}$,
(i) $F^{-1}(p) \leq x$ iff $p \leq F(x)$;
(ii) $F \circ F^{-1}(p) \geq p$ with equality iff $p$ is in the range of $F$; equality can fail only if $F$ is discontinuous at $F^{-1}(p)$;
(iii) $F_{-} \circ F^{-1}(p) \leq p$;
(iv) $F^{-1} \circ F(x) \leq x$; equality fails iff $x$ is in the interior or at the right end of a "flat" of $F$;
(v) $F^{-1} \circ F \circ F^{-1}=F^{-1} ; F \circ F^{-1} \circ F=F$;
(vi) $(F \circ G)^{-1}=G^{-1} \circ F^{-1}$.

Proof. The proofs of the inequalities in (i) through (iv) are best given by a picture. The equalities (v) follow from (ii) and (iv) and the monotonicity of $F$ and $F^{-1}$. If $p=F(x)$ for some $x$, then, by (ii) $p \leq F \circ F^{-1}(p)=F \circ F^{-1} \circ F(x)=F(x)=p$, by (iv). This proves the first statement in (ii); the second is immediate from the inequalities in (ii) and (iii). Statement (vi) follows from (i) and the definition of $(F \circ G)^{-1}$.

Consequences of (ii) and (iv) are that $F \circ F^{-1}(p) \equiv p$ on ( 0,1 ) if and only if $F$ is continuous (i.e., has range $[0,1]$ ), and $F^{-1} \circ F(x) \equiv x$ on $\mathbb{R}$ if and only if $F$ is strictly increasing (i.e., has no "flats"). Thus $F^{-1}$ is a proper inverse if and only if $F$ is both continuous and strictly increasing, as one would expect.

By (i) the random variable $F^{-1}(U)$ has distribution function $F$ if $U$ is uniformly distributed on $[0,1]$. This is called the quantile transformation. On the other hand, by (i) and (ii) the variable $F(X)$ is uniformly distributed on $[0,1]$ if and only if $X$ has a continuous distribution function $F$. This is called the probability integral transformation.

A sequence of quantile functions is defined to converge weakly to a limit quantile function, denoted $F_{n}^{-1} \rightsquigarrow F^{-1}$, if and only if $F_{n}^{-1}(t) \rightarrow F^{-1}(t)$ at every $t$ where $F^{-1}$ is continuous. This type of convergence is not only analogous in form to the weak convergence of distribution functions, it is the same.
21.2 Lemma. For any sequence of cumulative distribution functions, $F_{n}^{-1} \rightsquigarrow F^{-1}$ if and only if $F_{n} \leadsto F$.

Proof. Let $U$ be uniformly distributed on $[0,1]$. Because $F^{-1}$ has at most countably many discontinuity points, $F_{n}^{-1} \rightsquigarrow F^{-1}$ implies that $F_{n}^{-1}(U) \rightarrow F^{-1}(U)$ almost surely. Consequently, $F_{n}^{-1}(U)$ converges in law to $F^{-1}(U)$, which is exactly $F_{n} \rightsquigarrow F$ by the quantile transformation.

For a proof the converse, let $V$ be a normally distributed random variable. If $F_{n} \rightsquigarrow F$, then $F_{n}(V) \xrightarrow{\text { as }} F(V)$, because convergence can fail only at discontinuity points of $F$. Thus $\Phi\left(F_{n}^{-1}(t)\right)=\mathrm{P}\left(F_{n}(V)<t\right)$ (by (i) of the preceding lemma) converges to $\mathrm{P}(F(V)< t)=\Phi\left(F^{-1}(t)\right)$ at every $t$ at which the limit function is continuous. This includes every $t$ at which $F^{-1}$ is continuous. By the continuity of $\Phi^{-1}, F_{n}^{-1}(t) \rightarrow F^{-1}(t)$ for every such $t$. -

A statistical application of the preceding lemma is as follows. If a sequence of estimators $\hat{F}_{n}$ of a distribution function $F$ is weakly consistent, then the sequence of estimators $\hat{F}_{n}^{-1}$ is weakly consistent for the quantile function $F^{-1}$.

### 21.2 Asymptotic Normality

In the absence of information concerning the underlying distribution function $F$ of a sample, the empirical distribution function $\mathbb{F}_{n}$ and empirical quantile function $\mathbb{F}_{n}^{-1}$ are reasonable estimators for $F$ and $F^{-1}$, respectively. The empirical quantile function is related to the order statistics $X_{n(1)}, \ldots, X_{n(n)}$ of the sample through

$$
\mathbb{F}_{n}^{-1}(p)=X_{n(i)}, \quad \text { for } p \in\left(\frac{i-1}{n}, \frac{i}{n}\right] .
$$

One method to prove the asymptotic normality of empirical quantiles is to view them as $M$-estimators and apply the theorems given in Chapter 5. Another possibility is to express the distribution function $\mathrm{P}\left(X_{n(i)} \leq x\right)$ into binomial probabilities and apply approximations to these. The method that we follow in this chapter is to deduce the asymptotic normality of quantiles from the asymptotic normality of the distribution function, using the delta method.

An advantage of this method is that it is not restricted to empirical quantiles but applies to the quantiles of any estimator of the distribution function.

For a nondecreasing function $F \in D[a, b],[a, b] \subset[-\infty, \infty]$, and a fixed $p \in \mathbb{R}$, let $\phi(F) \in[a, b]$ be an arbitrary point in $[a, b]$ such that

$$
F(\phi(F)-) \leq p \leq F(\phi(F)) .
$$

The natural domain $\mathbb{D}_{\phi}$ of the resulting map $\phi$ is the set of all nondecreasing $F$ such that there exists a solution to the pair of inequalities. If there exists more than one solution, then the precise choice of $\phi(F)$ is irrelevant. In particular, $\phi(F)$ may be taken equal to the $p$ th quantile $F^{-1}(p)$.
21.3 Lemma. Let $F \in \mathbb{D}_{\phi}$ be differentiable at a point $\xi_{p} \in(a, b)$ such that $F\left(\xi_{p}\right)=p$, with positive derivative. Then $\phi: \mathbb{D}_{\phi} \subset D[a, b] \mapsto \mathbb{R}$ is Hadamard-differentiable at $F$ tangentially to the set of functions $h \in D[a, b]$ that are continuous at $\xi_{p}$, with derivative $\phi_{F}^{\prime}(h)=-h\left(\xi_{p}\right) / F^{\prime}\left(\xi_{p}\right)$.

Proof. Let $h_{t} \rightarrow h$ uniformly on $[a, b]$ for a function $h$ that is continuous at $\xi_{p}$. Write $\xi_{p t}$ for $\phi\left(F+t h_{t}\right)$. By the definition of $\phi$, for every $\varepsilon_{t}>0$,

$$
\left(F+t h_{t}\right)\left(\xi_{p t}-\varepsilon_{t}\right) \leq p \leq\left(F+t h_{t}\right)\left(\xi_{p t}\right)
$$

Choose $\varepsilon_{t}$ positive and such that $\varepsilon_{t}=o(t)$. Because the sequence $h_{t}$ converges uniformly to a bounded function, it is uniformly bounded. Conclude that $F\left(\xi_{p t}-\varepsilon_{t}\right)+O(t) \leq p \leq F\left(\xi_{p t}\right)+O(t)$. By assumption, the function $F$ is monotone and bounded away from $p$ outside any interval $\left(\xi_{p}-\varepsilon, \xi_{p}+\varepsilon\right)$ around $\xi_{p}$. To satisfy the preceding inequalities the numbers $\xi_{p t}$ must be to the right of $\xi_{p}-\varepsilon$ eventually, and the numbers $\xi_{p t}-\varepsilon_{t}$ must be to the left of $\xi_{p}+\varepsilon$ eventually. In other words, $\xi_{p t} \rightarrow \xi_{p}$.

By the uniform convergence of $h_{t}$ and the continuity of the limit, $h_{t}\left(\xi_{p t}-\varepsilon_{t}\right) \rightarrow h\left(\xi_{p}\right)$ for every $\varepsilon_{t} \rightarrow 0$. Using this and Taylor's formula on the preceding display yields

$$
\begin{aligned}
& p+\left(\xi_{p t}-\xi_{p}\right) F^{\prime}\left(\xi_{p}\right)-o\left(\xi_{p t}-\xi_{p}\right)+O\left(\varepsilon_{t}\right)+\operatorname{th}\left(\xi_{p}\right)-o(t) \\
& \quad \leq p \leq p+\left(\xi_{p t}-\xi_{p}\right) F^{\prime}\left(\xi_{p}\right)+o\left(\xi_{p t}-\xi_{p}\right)+O\left(\varepsilon_{t}\right)+\operatorname{th}\left(\xi_{p}\right)+o(t) .
\end{aligned}
$$

Conclude first that $\xi_{p t}-\xi_{p}=O(t)$. Next, use this to replace the $o\left(\xi_{p t}-\xi_{p}\right)$ terms in the display by $o(t)$ terms and conclude that $\left(\xi_{p t}-\xi_{p}\right) / t \rightarrow-\left(h / F^{\prime}\right)\left(\xi_{p}\right)$.

Instead of a single quantile we can consider the quantile function $F \mapsto\left(F^{-1}(p)\right)_{p_{1}<p<p_{2}}$, for fixed numbers $0 \leq p_{1}<p_{2} \leq 1$. Because any quantile function is bounded on an interval [ $p_{1}, p_{2}$ ] strictly contained in $(0,1)$, we may hope that a quantile estimator converges in distribution in $\ell^{\infty}\left(p_{1}, p_{2}\right)$ for such an interval. The quantile function of a distribution with compact support is bounded on the whole interval $(0,1)$, and then we may hope to strengthen the result to weak convergence in $\ell^{\infty}(0,1)$.

Given an interval $[a, b] \subset \mathbb{R}$, let $\mathbb{D}_{1}$ be the set of all restrictions of distribution functions on $\mathbb{R}$ to $[a, b]$, and let $\mathbb{D}_{2}$ be the subset of $\mathbb{D}_{1}$ of distribution functions of measures that give mass 1 to $(a, b]$.

### 21.4 Lemma.

(i) Let $0<p_{1}<p_{2}<1$, and let $F$ be continuously differentiable on the interval $[a, b]= \left[F^{-1}\left(p_{1}\right)-\varepsilon, F^{-1}\left(p_{2}\right)+\varepsilon\right]$ for some $\varepsilon>0$, with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{1} \subset D[a, b] \mapsto \ell^{\infty}\left[p_{1}, p_{2}\right]$ is Hadamard differentiable at $F$ tangentially to $C[a, b]$.
(ii) Let $F$ have compact support $[a, b]$ and be continuously differentiable on its support with strictly positive derivative $f$. Then the inverse map $G \mapsto G^{-1}$ as a map $\mathbb{D}_{2} \subset D[a, b] \mapsto \ell^{\infty}(0,1)$ is Hadamard differentiable at $F$ tangentially to $C[a, b]$.
In both cases the derivative is the map $h \mapsto-(h / f) \circ F^{-1}$.
Proof. It suffices to make the proof of the preceding lemma uniform in $p$. We use the same notation.
(i). Because the function $F$ has a positive density, it is strictly increasing on an interval $\left[\xi_{p_{1}^{\prime}}, \xi_{p_{2}^{\prime}}\right]$ that strictly contains $\left[\xi_{p_{1}}, \xi_{p_{2}}\right]$. Then on $\left[p_{1}^{\prime}, p_{2}^{\prime}\right]$ the quantile function $F^{-1}$ is the ordinary inverse of $F$ and is (uniformly) continuous and strictly increasing. Let $h_{t} \rightarrow h$ uniformly on $\left[\xi_{p_{1}^{\prime}}, \xi_{p_{2}^{\prime}}\right]$ for a continuous function $h$. By the proof of the preceding lemma, $\xi_{p_{i} t} \rightarrow \xi_{p_{i}}$ and hence every $\xi_{p t}$ for $p_{1} \leq p \leq p_{2}$ is contained in $\left[\xi_{p_{1}^{\prime}}, \xi_{p_{2}^{\prime}}\right]$ eventually. The remainder of the proof is the same as the proof of the preceding lemma.
(ii). Let $h_{t} \rightarrow h$ uniformly in $D[a, b]$, where $h$ is continuous and $F+t h_{t}$ is contained in $\mathbb{D}_{2}$ for all $t$. Abbreviate $F^{-1}(p)$ and $\left(F+t h_{t}\right)^{-1}(p)$ to $\xi_{p}$ and $\xi_{p t}$, respectively. Because $F$ and $F+t h_{t}$ are concentrated on ( $a, b$ ] by assumption, we have $a<\xi_{p t}, \xi_{p} \leq b$ for all $0<p<1$. Thus the numbers $\varepsilon_{p t}=t^{2} \wedge\left(\xi_{p t}-a\right)$ are positive, whence, by definition,

$$
\left(F+t h_{t}\right)\left(\xi_{p t}-\varepsilon_{p t}\right) \leq p \leq\left(F+t h_{t}\right)\left(\xi_{p t}\right) .
$$

By the smoothness of $F$ we have $F\left(\xi_{p}\right)=p$ and $F\left(\xi_{p t}-\varepsilon_{p t}\right)=F\left(\xi_{p t}\right)+O\left(\varepsilon_{p t}\right)$, uniformly in $0<p<1$. It follows that

$$
-t h\left(\xi_{p t}\right)+o(t) \leq F\left(\xi_{p t}\right)-F\left(\xi_{p}\right) \leq-t h\left(\xi_{p t}-\varepsilon_{p t}\right)+o(t) .
$$

The $o(t)$ terms are uniform in $0<p<1$. The far left side and the far right side are $O(t)$; the expression in the middle is bounded above and below by a constant times $\left|\xi_{p t}-\xi_{p}\right|$. Conclude that $\left|\xi_{p t}-\xi_{p}\right|=O(t)$, uniformly in $p$. Next, the lemma follows by the uniform differentiability of $F$.

Thus, the asymptotic normality of an estimator of a distribution function (or another nondecreasing function) automatically entails the asymptotic normality of the corresponding quantile estimators. More precisely, to derive the asymptotic normality of even a single quantile estimator $\hat{F}_{n}^{-1}(p)$, we need to know that the estimators $\hat{F}_{n}$ are asymptotically normal as a process, in a neighborhood of $F^{-1}(p)$. The standardized empirical distribution function is asymptotically normal as a process indexed by $\mathbb{R}$, and hence the empirical quantiles are asymptotically normal.
21.5 Corollary. Fix $0<p<1$. If $F$ is differentiable at $F^{-1}(p)$ with positive derivative $f\left(F^{-1}(p)\right)$, then

$$
\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)=-\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \frac{1\left\{X_{i} \leq F^{-1}(p)\right\}-p}{f\left(F^{-1}(p)\right)}+o_{P}(1) .
$$

Consequently, the sequence $\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)$ is asymptotically normal with mean 0 and variance $p(1-p) / f^{2}\left(F^{-1}(p)\right)$. Furthermore, if $F$ satisfies the conditions (i) or (ii) of the preceding lemma, then $\sqrt{n}\left(\mathbb{F}_{n}^{-1}-F^{-1}\right)$ converges in distribution in $\ell^{\infty}\left[p_{1}, p_{2}\right]$ or $\ell^{\infty}(0,1)$, respectively, to the process $\mathbb{G}_{\lambda} / f\left(F^{-1}(p)\right)$, where $\mathbb{G}_{\lambda}$ is a standard Brownian bridge.

Proof. By Theorem 19.3, the empirical process $\mathbb{G}_{n, F}=\sqrt{n}\left(\mathbb{F}_{n}-F\right)$ converges in distribution in $D[-\infty, \infty]$ to an $F$-Brownian bridge process $\mathbb{G}_{F}=\mathbb{G}_{\lambda} \circ F$. The sample paths of the limit process are continuous at the points at which $F$ is continuous. By Lemma 21.3, the quantile function $F \mapsto F^{-1}(p)$ is Hadamard-differentiable tangentially to the range of the limit process. By the functional delta method, the sequence $\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)$ is asymptotically equivalent to the derivative of the quantile function evaluated at $\mathbb{G}_{n, F}$, that is, to $-\mathbb{G}_{n, F}\left(F^{-1}(p)\right) / f\left(F^{-1}(p)\right)$. This is the first assertion. Next, the asymptotic normality of the sequence $\sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)$ follows by the central limit theorem.

The convergence of the quantile process follows similarly, this time using Lemma 21.4.
21.6 Example. The uniform distribution function has derivative 1 on its compact support. Thus, the uniform empirical quantile process converges weakly in $\ell^{\infty}(0,1)$. The limiting process is a standard Brownian bridge.

The normal and Cauchy distribution functions have continuous derivatives that are bounded away from zero on any compact interval. Thus, the normal and Cauchy empirical quantile processes converge in $\ell^{\infty}\left[p_{1}, p_{2}\right]$, for every $0<p_{1}<p_{2}<1$.

The empirical quantile function at a point is equal to an order statistic of the sample. In estimating a quantile, we could also use the order statistics directly, not necessarily in the way that $\mathbb{F}_{n}^{-1}$ picks them. For the $k_{n}$-th order statistic $X_{n\left(k_{n}\right)}$ to be a consistent estimator for $F^{-1}(p)$, we need minimally that $k_{n} / n \rightarrow p$ as $n \rightarrow \infty$. For mean-zero asymptotic normality, we also need that $k_{n} / n \rightarrow p$ faster than $1 / \sqrt{n}$, which is necessary to ensure that $X_{n\left(k_{n}\right)}$ and $\mathbb{F}_{n}^{-1}(p)$ are asymptotically equivalent. This still allows considerable freedom for choosing $k_{n}$.
21.7 Lemma. Let $F$ be differentiable at $F^{-1}(p)$ with positive derivative and let $k_{n} / n= p+c / \sqrt{n}+o(1 / \sqrt{n})$. Then

$$
\sqrt{n}\left(X_{n\left(k_{n}\right)}-\mathbb{F}_{n}^{-1}(p)\right) \xrightarrow{\mathrm{P}} \frac{c}{f\left(F^{-1}(p)\right)}
$$

Proof. First assume that $F$ is the uniform distribution function. Denote the observations by $U_{i}$, rather than $X_{i}$. Define a function $g_{n}: \ell^{\infty}(0,1) \mapsto \mathbb{R}$ by $g_{n}(z)=z\left(k_{n} / n\right)-z(p)$. Then $g_{n}\left(z_{n}\right) \rightarrow z(p)-z(p)=0$, whenever $z_{n} \rightarrow z$ for a function $z$ that is continuous at $p$. Because the uniform quantile process $\sqrt{n}\left(\mathbb{G}_{n}^{-1}-G^{-1}\right)$ converges in distribution in $\ell^{\infty}(0,1)$, the extended continuous-mapping theorem, Theorem 18.11, yields $g_{n}\left(\sqrt{n}\left(\mathbb{G}_{n}^{-1}-G^{-1}\right)\right)= \sqrt{n}\left(U_{n\left(k_{n}\right)}-\mathbb{G}_{n}^{-1}(p)\right)-\sqrt{n}\left(k_{n} / n-p\right) \rightsquigarrow 0$. This is the result in the uniform case.

A sample from a general distribution function $F$ can be generated as $F^{-1}\left(U_{i}\right)$, by the quantile transformation. Then $\sqrt{n}\left(X_{n\left(k_{n}\right)}-\mathbb{F}_{n}^{-1}(p)\right)$ is equal to

$$
\sqrt{n}\left[F^{-1}\left(U_{n\left(k_{n}\right)}\right)-F^{-1}(p)\right]-\sqrt{n}\left[F^{-1}\left(\mathbb{G}_{n}^{-1}(p)\right)-F^{-1}(p)\right]
$$

Apply the delta method to the two terms to see that $f\left(F^{-1}(p)\right)$ times their difference is asymptotically equivalent to $\sqrt{n}\left(U_{n\left(k_{n}\right)}-p\right)-\sqrt{n}\left(\mathbb{G}_{n}^{-1}(p)-p\right)$.
21.8 Example (Confidence intervals for quantiles). If $X_{1}, \ldots, X_{n}$ is a random sample from a continuous distribution function $F$, then $U_{1}=F\left(X_{1}\right), \ldots, U_{n}=F\left(X_{n}\right)$ are a random sample from the uniform distribution, by the probability integral transformation. This can be used to construct confidence intervals for quantiles that are distribution-free over the class of continuous distribution functions. For any given natural numbers $k$ and $l$, the interval $\left(X_{n(k)}, X_{n(l)}\right]$ has coverage probability

$$
\mathrm{P}_{F}\left(X_{n(k)}<F^{-1}(p) \leq X_{n(l)}\right)=\mathrm{P}\left(U_{n(k)}<p \leq U_{n(l)}\right) .
$$

Because this is independent of $F$, it is possible to obtain an exact confidence interval for every fixed $n$, by determining $k$ and $l$ to achieve the desired confidence level. (Here we have some freedom in choosing $k$ and $l$ but can obtain only finitely many confidence levels.) For large $n$, the values $k$ and $l$ can be chosen equal to

$$
\frac{k, l}{n}=p \pm z_{\alpha} \sqrt{\frac{p(1-p)}{n}} .
$$

To see this, note that, by the preceding lemma,

$$
U_{n(k)}, U_{n(l)}=\frac{\mathbb{G}_{n}^{-1}(p)}{\sqrt{n}} \pm z_{\alpha} \sqrt{\frac{p(1-p)}{n}}+o_{P}\left(\frac{1}{\sqrt{n}}\right) .
$$

Thus the event $U_{n(k)}<p \leq U_{n(l)}$ is asymptotically equivalent to the event $\sqrt{n} \mid \mathbb{G}_{n}^{-1}(p)- p \mid \leq z_{\alpha} \sqrt{p(1-p)}$. Its probability converges to $1-2 \alpha$.

An alternative is to use the asymptotic normality of the empirical quantiles $\mathbb{F}_{n}^{-1}$, but this has the unattractive feature of having to estimate the density $f\left(F^{-1}(p)\right)$, because this appears in the denominator of the asymptotic variance. If using the distribution-free method, we do not even have to assume that the density exists.

The application of the Hadamard differentiability of the quantile transformation is not limited to empirical quantiles. For instance, we can also immediately obtain the asymptotic normality of the quantiles of the product limit estimator, or any other estimator of a distribution function in semiparametric models. On the other hand, the results on empirical quantiles can be considerably strengthened by taking special properties of the empirical distribution into account. We discuss a few extensions, mostly for curiosity value. ${ }^{\dagger}$

Corollary 21.5 asserts that $R_{n}(p) \xrightarrow{\mathrm{P}} 0$, for, with $\xi_{p}=F^{-1}(p)$,

$$
R_{n}(p)=f\left(\xi_{p}\right) \sqrt{n}\left(\mathbb{F}_{n}^{-1}(p)-F^{-1}(p)\right)+\sqrt{n}\left(\mathbb{F}_{n}\left(\xi_{p}\right)-F\left(\xi_{p}\right)\right) .
$$

The expression on the left is known as the standardized empirical difference process. "Standardized" refers to the leading factor $f\left(\xi_{p}\right)$. That a sum is called a difference is curious but stems from the fact that minus the second term is approximately equal to the first term. The identity shows an interesting symmetry between the empirical distribution and quantile

[^14]processes, particularly in the case that $F$ is uniform, if $f\left(\xi_{p}\right) \equiv 1$ and $\xi_{p} \equiv p$. The result that $R_{n}(p) \xrightarrow{\mathrm{P}} 0$ can be refined considerably. If $F$ is twice-differentiable at $\xi_{p}$ with positive first derivative, then, by the Bahadur-Kiefer theorems,
$$
\begin{aligned}
& \limsup _{n \rightarrow \infty} \frac{n^{1 / 4}}{(\log \log n)^{3 / 4}}\left|R_{n}(p)\right|=\left[\frac{32}{27} p(1-p)\right]^{1 / 4}, \quad \text { a.s., } \\
& n^{1 / 4} R_{n}(p) \rightsquigarrow \frac{2}{\sqrt{p(1-p)}} \int_{0}^{\infty} \Phi\left(\frac{x}{\sqrt{y}}\right) \phi\left(\frac{y}{\sqrt{p(1-p)}}\right) d y .
\end{aligned}
$$

The right side in the last display is a distribution function as a function of the argument $x$. Thus, the magnitude of the empirical difference process is $O_{P}\left(n^{-1 / 4}\right)$, with the rate of its fluctuations being equal to $n^{-1 / 4}(\log \log n)^{3 / 4}$. Under some regularity conditions on $F$, which are satisfied by, for instance, the uniform, the normal, the exponential, and the logistic distribution, versions of the preceding results are also valid in supremum norm,

$$
\begin{gathered}
\limsup _{n \rightarrow \infty} \frac{n^{1 / 4}}{(\log n)^{1 / 2}(2 \log \log n)^{1 / 4}}\left\|R_{n}\right\|_{\infty}=\frac{1}{\sqrt{2}}, \quad \text { a.s. } \\
\frac{n^{1 / 4}}{(\log n)^{1 / 2}}\left\|R_{n}\right\|_{\infty} \rightsquigarrow \sqrt{\left\|\mathbb{Z}_{\lambda}\right\|_{\infty}}
\end{gathered}
$$

Here $\mathbb{Z}_{\lambda}$ is a standard Brownian motion indexed by the interval $[0,1]$.

### 21.3 Median Absolute Deviation

The median absolute deviation of a sample $X_{1}, \ldots, X_{n}$ is the robust estimator of scale defined by

$$
\operatorname{MAD}_{n}=\operatorname{med}_{1 \leq i \leq n}\left|X_{i}-\operatorname{med}_{1 \leq i \leq n} X_{i}\right| .
$$

It is the median of the deviations of the observations from their median and is often recommended for reducing the observations to a standard scale as a first step in a robust procedure. Because the median is a quantile, we can prove the asymptotic normality of the median absolute deviation by the delta method for quantiles, applied twice.

If a variable $X$ has distribution function $F$, then the variable $|X-\theta|$ has the distribution function $x \mapsto F(\theta+x)-F_{-}(\theta-x)$. Let $(\theta, F) \mapsto \phi_{2}(\theta, F)$ be the map that assigns to a given number $\theta$ and a given distribution function $F$ the distribution function $F(\theta+x)- F_{-}(\theta-x)$, and consider the function $\phi=\phi_{3} \circ \phi_{2} \circ \phi_{1}$ defined by

$$
F \stackrel{\phi_{1}}{\mapsto}\left(\theta:=F^{-1}(1 / 2), F\right) \stackrel{\phi_{2}}{\mapsto} G:=F(\theta+\cdot)-F_{-}(\theta-\cdot) \stackrel{\phi_{3}}{\mapsto} G^{-1}(1 / 2) .
$$

If we identify the median with the $1 / 2$-quantile, then the median absolute deviation is exactly $\phi\left(\mathbb{F}_{n}\right)$. Its asymptotic normality follows by the delta method under a regularity condition on the underlying distribution.
21.9 Lemma. Let the numbers $m_{F}$ and $m_{G}$ satisfy $F\left(m_{F}\right)=\frac{1}{2}=F\left(m_{F}+m_{G}\right)-F\left(m_{F}-\right. m_{G}$ ). Suppose that $F$ is differentiable at $m_{F}$ with positive derivative and is continuously differentiable on neighborhoods of $m_{F}+m_{G}$ and $m_{F}-m_{G}$ with positive derivative at
$m_{F}+m_{G}$ and/or $m_{F}-m_{G}$. Then the map $\phi: D[-\infty, \infty] \mapsto \mathbb{R}$, with as domain the distribution functions, is Hadamard-differentiable at $F$, tangentially to the set of functions that are continuous both at $m_{F}$ and on neighborhoods of $m_{F}+m_{G}$ and $m_{F}-m_{G}$. The derivative $\phi_{F}^{\prime}(H)$ is given by

$$
\frac{H\left(m_{F}\right)}{f\left(m_{F}\right)} \frac{f\left(m_{F}+m_{G}\right)-f\left(m_{F}-m_{G}\right)}{f\left(m_{F}+m_{G}\right)+f\left(m_{F}-m_{G}\right)}-\frac{H\left(m_{F}+m_{G}\right)-H\left(m_{F}-m_{G}\right)}{f\left(m_{F}+m_{G}\right)+f\left(m_{F}-m_{G}\right)} .
$$

Proof. Define the maps $\phi_{i}$ as indicated previously.
By Lemma 21.3, the map $\phi_{1}: D[-\infty, \infty] \mapsto \mathbb{R} \times D[-\infty, \infty]$ is Hadamard-differentiable at $F$ tangentially to the set of functions $H$ that are continuous at $m_{F}$.

The map $\phi_{2}: \mathbb{R} \times D[-\infty, \infty] \mapsto D\left[m_{G}-\varepsilon, m_{G}+\varepsilon\right]$ is Hadamard-differentiable at the point ( $m_{F}, F$ ) tangentially to the set of points ( $g, H$ ) such that $H$ is continuous on the intervals $\left[m_{F} \pm m_{G}-2 \varepsilon, m_{F} \pm m_{G}+2 \varepsilon\right]$, for sufficiently small $\varepsilon>0$. This follows because, if $a_{t} \rightarrow a$ and $H_{t} \rightarrow H$ uniformly,

$$
\frac{\left(F+t H_{t}\right)\left(m_{F}+t a_{t}+x\right)-F\left(m_{F}+x\right)}{t} \rightarrow a f\left(m_{F}+x\right)+H\left(m_{F}+x\right),
$$

uniformly in $x \approx m_{G}$, and because a similar statement is valid for the differences ( $F+ \left.t H_{t}\right)_{-}\left(m_{F}+t a_{t}-x\right)-F_{-}\left(m_{F}-x\right)$. The range of the derivative is contained in $C\left[m_{G}-\right. \left.\varepsilon, m_{G}+\varepsilon\right]$.

Finally, by Lemma 21.3, the map $\phi_{3}: D\left[m_{G}-\varepsilon, m_{G}+\varepsilon\right] \mapsto \mathbb{R}$ is Hadamard-differentiable at $G=\phi_{2}\left(m_{F}, F\right)$, tangentially to the set of functions that are continuous at $m_{G}$, because $G$ has a positive derivative at its median, by assumption.

The lemma follows by the chain rule, where we ascertain that the tangent spaces match up properly.

The $F$-Brownian bridge process $\mathbb{G}_{F}$ has sample paths that are continuous everywhere that $F$ is continuous. Under the conditions of the lemma, they are continuous at the point $m_{F}$ and in neighborhoods of the points $m_{F}+m_{G}$ and $m_{F}-m_{G}$. Thus, in view of the lemma and the delta method, the sequence $\sqrt{n}\left(\phi\left(\mathbb{F}_{n}\right)-\phi(F)\right)$ converges in distribution to the variable $\phi_{F}^{\prime}\left(\mathbb{G}_{F}\right)$.
21.10 Example (Symmetric F). If $F$ has a density that is symmetric about 0 , then its median $m_{F}$ is 0 and the median absolute deviation $m_{G}$ is equal to $F^{-1}(3 / 4)$. Then the first term in the definition of the derivative vanishes, and the derivative $\phi_{F}^{\prime}\left(\mathbb{G}_{F}\right)$ at the $F$-Brownian bridge reduces to $-\left(\mathbb{G}_{\lambda}(3 / 4)-\mathbb{G}_{\lambda}(1 / 4)\right) / 2 f\left(F^{-1}(3 / 4)\right)$ for a standard Brownian bridge $\mathbb{G}_{\lambda}$. Then the asymptotic variance of $\sqrt{n}\left(\mathrm{MAD}_{n}-m_{G}\right)$ is equal to $(1 / 16) / f \circ F^{-1}(3 / 4)^{2}$.
21.11 Example (Normal distribution). If $F$ is equal to the normal distribution with mean zero and variance $\sigma^{2}$, then $m_{F}=0$ and $m_{G}=\sigma \Phi^{-1}(3 / 4)$. We find an asymptotic variance $\left(\sigma^{2} / 16\right) \phi \circ \Phi^{-1}(3 / 4)^{-2}$. As an estimator for the standard deviation $\sigma$, we use the estimator $\mathrm{MAD}_{n} / \Phi^{-1}(3 / 4)$, and as an estimator for $\sigma^{2}$ the square of this. By the delta method, the latter estimator has asymptotic variance equal to $(1 / 4) \sigma^{4} \phi \circ \Phi^{-1}(3 / 4)^{-2} \Phi^{-1}(3 / 4)^{-2}$, which is approximately equal to $5.44 \sigma^{4}$. The relative efficiency, relative to the sample variance, is approximately equal to $37 \%$, and hence we should not use this estimator without a good reason.

### 21.4 Extreme Values

The asymptotic behavior of order statistics $X_{n\left(k_{n}\right)}$ such that $k_{n} / n \rightarrow 0$ or 1 is, of course, different from that of central-order statistics. Because $X_{n\left(k_{n}\right)} \leq x_{n}$ means that at most $n-k_{n}$ of the $X_{i}$ can be bigger than $x_{n}$, it follows that, with $p_{n}=\mathrm{P}\left(X_{i}>x_{n}\right)$,

$$
\operatorname{Pr}\left(X_{n\left(k_{n}\right)} \leq x_{n}\right)=\mathrm{P}\left(\operatorname{bin}\left(n, p_{n}\right) \leq n-k_{n}\right)
$$

Therefore, limit distributions of general-order statistics can be derived from approximations to the binomial distribution. In this section we consider the most extreme cases, in which $k_{n}=n-k$ for a fixed number $k$, starting with the maximum $X_{n(n)}$. We write $\bar{F}(t)= \mathrm{P}\left(X_{i}>t\right)$ for the survival distribution of the observations, a random sample of size $n$ from $F$.

The distribution function of the maximum can be derived from the preceding display, or directly, and satisfies

$$
\mathrm{P}\left(X_{n(n)} \leq x_{n}\right)=F\left(x_{n}\right)^{n}=\left(1-\frac{n \bar{F}\left(x_{n}\right)}{n}\right)^{n}
$$

This representation readily yields the following lemma.
21.12 Lemma. For any sequence of numbers $x_{n}$ and any $\tau \in[0, \infty]$, we have $\mathrm{P}\left(X_{n(n)} \leq\right. \left.x_{n}\right) \rightarrow e^{-\tau}$ if and only if $n \bar{F}\left(x_{n}\right) \rightarrow \tau$.

In view of the lemma we can find "interesting limits" for the probabilities $\mathrm{P}\left(X_{n(n)} \leq x_{n}\right)$ only for sequences $x_{n}$ such that $\bar{F}\left(x_{n}\right)=O(1 / n)$. Depending on $F$ this may mean that $x_{n}$ is bounded or converges to infinity.

Suppose that we wish to find constants $a_{n}$ and $b_{n}>0$ such that $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right)$ converges in distribution to a nontrivial limit. Then we must choose $a_{n}$ and $b_{n}$ such that $\bar{F}\left(a_{n}+b_{n} x\right)=O(1 / n)$ for a nontrivial set of $x$. Depending on $F$ such constants may or may not exist. It is a bit surprising that the set of possible limit distributions is extremely small. ${ }^{\dagger}$
21.13 Theorem (Extremal types). If $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right) \rightsquigarrow G$ for a nondegenerate cumulative distribution function $G$, then $G$ belongs to the location-scale family of a distribution of one of the following forms:
(i) $e^{-e^{-x}}$ with support $\mathbb{R}$;
(ii) $e^{-\left(1 / x^{\alpha}\right)}$ with support $[0, \infty)$ and $\alpha>0$;
(iii) $e^{-(-x)^{\alpha}}$ with support $(-\infty, 0]$ and $\alpha>0$.
21.14 Example (Uniform). If the distribution has finite support [ 0,1 ] with $\bar{F}(t)=(1- t)^{\alpha}$, then $n \bar{F}\left(1+n^{-1 / \alpha} x\right) \rightarrow(-x)^{\alpha}$ for every $x \leq 0$. In view of Lemma 21.12, the sequence $n^{1 / \alpha}\left(X_{n(n)}-1\right)$ converges in distribution to a limit of type (iii). The uniform distribution is the special case with $\alpha=1$, for which the limit distribution is the negative of an exponential distribution.

[^15]21.15 Example (Pareto). The survival distribution of the Pareto distribution satisfies $\bar{F}(t)=(\mu / t)^{\alpha}$ for $t \geq \mu$. Thus $n \bar{F}\left(n^{1 / \alpha} \mu x\right) \rightarrow 1 / x^{\alpha}$ for every $x>0$. In view of Lemma 21.12, the sequence $n^{-1 / \alpha} X_{n(n)} / \mu$ converges in distribution to a limit of type (ii).
21.16 Example (Normal). For the normal distribution the calculations are similar, but more delicate. We choose
$$
a_{n}=\sqrt{2 \log n}-\frac{1}{2} \frac{\log \log n+\log 4 \pi}{\sqrt{2 \log n}}, \quad b_{n}=1 / \sqrt{2 \log n} .
$$

Using Mill's ratio, which asserts that $\bar{\Phi}(t) \sim \phi(t) / t$ as $t \rightarrow \infty$, it is straightforward to see that $n \bar{\Phi}\left(a_{n}+b_{n} x\right) \rightarrow e^{-x}$ for every $x$. In view of Lemma 21.12, the sequence $\sqrt{2 \log n}\left(X_{n(n)}-a_{n}\right)$ converges in distribution to a limit of type (i).

The problem of convergence in distribution of suitably normalized maxima is solved in general by the following theorem. Let $\tau_{F}=\sup \{t: F(t)<1\}$ be the right endpoint of $F$ (possibly $\infty$ ).
21.17 Theorem. There exist constants $a_{n}$ and $b_{n}$ such that the sequence $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right)$ converges in distribution if and only if, as $t \rightarrow \tau_{F}$,
(i) There exists a strictly positive function $g$ on $\mathbb{R}$ such that $\bar{F}(t+g(t) x) / \bar{F}(t) \rightarrow e^{-x}$, for every $x \in \mathbb{R}$;
(ii) $\tau_{F}=\infty$ and $\bar{F}(t x) / \bar{F}(t) \rightarrow 1 / x^{\alpha}$, for every $x>0$;
(iii) $\tau_{F}<\infty$ and $\bar{F}\left(\tau_{F}-\left(\tau_{F}-t\right) x\right) / \bar{F}(t) \rightarrow x^{\alpha}$, for every $x>0$.

The constants $\left(a_{n}, b_{n}\right)$ can be taken equal to $\left(u_{n}, g\left(u_{n}\right)\right),\left(0, u_{n}\right)$ and $\left(\tau_{F}, \tau_{F}-u_{n}\right)$, respectively, for $u_{n}=F^{-1}(1-1 / n)$.

Proof. We only give the proof for the "only if" part, which follows the same lines as the preceding examples. In every of the three cases, $n \bar{F}\left(u_{n}\right) \rightarrow 1$. To see this it suffices to show that the jump $F\left(u_{n}\right)-F\left(u_{n}-\right)=o(1 / n)$. In case (i) this follows because, for every $x<0$, the jump is smaller than $\bar{F}\left(u_{n}+g\left(u_{n}\right) x\right)-\bar{F}\left(u_{n}\right)$, which is of the order $\bar{F}\left(u_{n}\right)\left(e^{-x}-1\right) \leq(1 / n)\left(e^{-x}-1\right)$. The right side can be made smaller than $\varepsilon(1 / n)$ for any $\varepsilon>0$, by choosing $x$ close to 0 . In case (ii), we can bound the jump at $u_{n}$ by $\bar{F}\left(x u_{n}\right)-\bar{F}\left(u_{n}\right)$ for every $x<1$, which is of the order $\bar{F}\left(u_{n}\right)\left(1 / x^{\alpha}-1\right) \leq(1 / n)\left(1 / x^{\alpha}-1\right)$. In case (iii) we argue similarly.

We conclude the proof by applying Lemma 21.12. For instance, in case (i) we have $n \bar{F}\left(u_{n}+g\left(u_{n}\right) x\right) \sim n \bar{F}\left(u_{n}\right) e^{-x} \rightarrow e^{-x}$ for every $x$, and the result follows. The argument under the assumptions (ii) or (iii) is similar.

If the maximum converges in distribution, then the ( $k+1$ )-th largest-order statistics $X_{n(n-k)}$ converge in distribution as well, with the same centering and scaling, but a different limit distribution. This follows by combining the preceding results and the Poisson approximation to the binomial distribution.
21.18 Theorem. If $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right) \rightsquigarrow G$, then $b_{n}^{-1}\left(X_{n(n-k)}-a_{n}\right) \rightsquigarrow H$ for the distribution function $H(x)=G(x) \sum_{i=0}^{k}(-\log G(x))^{i} / i!$.

Proof. If $p_{n}=\bar{F}\left(a_{n}+b_{n} x\right)$, then $n p_{n} \rightarrow-\log G(x)$ for every $x$ where $G$ is continuous (all $x$ ), by Lemma 21.12. Furthermore,

$$
\mathrm{P}\left(b_{n}^{-1}\left(X_{n(n-k)}-a_{n}\right) \leq x\right)=\mathrm{P}\left(\operatorname{bin}\left(n, p_{n}\right) \leq k\right) .
$$

This converges to the probability that a Poisson variable with mean $-\log G(x)$ is less than or equal to $k$. (See problem 2.21.)

By the same, but more complicated, arguments, the sample extremes can be seen to converge jointly in distribution also, but we omit a discussion.

Any order statistic depends, by its definition, on all observations. However, asymptotically central and extreme order statistics depend on the observations in orthogonal ways and become stochastically independent. One way to prove this is to note that central-order statistics are asymptotically equivalent to means, and averages and extreme order statistics are asymptotically independent, which is a result of interest on its own.
21.19 Lemma. Let $g$ be a measurable function with $F g=0$ and $F g^{2}=1$, and suppose that $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right) \rightsquigarrow G$ for a nondegenerate distribution $G$. Then $\left(n^{-1 / 2} \sum_{i=1}^{n} g\left(X_{i}\right)\right.$, $\left.b_{n}^{-1}\left(X_{n(n)}-a_{n}\right)\right) \rightsquigarrow(U, V)$ for independent random variables $U$ and $V$ with distributions $N(0,1)$ and $G$.

Proof. Let $U_{n}=n^{-1 / 2} \sum_{i=1}^{n-1} g\left(X_{n(i)}\right)$ and $V_{n}=b_{n}^{-1}\left(X_{n(n)}-a_{n}\right)$. Because $F g^{2}<\infty$, it follows that $\max _{1 \leq i \leq n}\left|g\left(X_{i}\right)\right|=o_{P}(\sqrt{n})$. Hence $n^{-1 / 2}\left|g\left(X_{n(n)}\right)\right| \xrightarrow{\mathrm{P}} 0$, whence the distance between ( $\mathbb{G}_{n} g, V_{n}$ ) and ( $U_{n}, V_{n}$ ) converges to zero in probability. It suffices to show that $\left(U_{n}, V_{n}\right) \rightsquigarrow(U, V)$. Suppose that we can show that, for every $u$,

$$
F_{n}\left(u \mid V_{n}\right):=\mathrm{P}\left(U_{n} \leq u \mid V_{n}\right) \xrightarrow{\mathrm{P}} \Phi(u) .
$$

Then, by the dominated-convergence theorem, $\mathrm{E} F_{n}\left(u \mid V_{n}\right) 1\left\{V_{n} \leq v\right\}=\Phi(u) \mathrm{E} 1\left\{V_{n} \leq\right. v\}+o(1)$, and hence the cumulative distribution function $\mathrm{E} F_{n}\left(u \mid V_{n}\right) 1\left\{V_{n} \leq v\right\}$ of $\left(U_{n}, V_{n}\right)$ converges to $\Phi(u) G(v)$.

The conditional distribution of $U_{n}$ given that $V_{n}=v_{n}$ is the same as the distribution of $n^{-1 / 2} \sum X_{n i}$ for i.i.d. random variables $X_{n, 1}, \ldots, X_{n, n-1}$ distributed according to the conditional distribution of $g\left(X_{1}\right)$ given that $X_{1} \leq x_{n}:=a_{n}+b_{n} v_{n}$. These variables have absolute mean

$$
\left|\mathrm{E} X_{n 1}\right|=\frac{\left|\int_{\left(-\infty, x_{n}\right]} g d F\right|}{F\left(x_{n}\right)}=\frac{\left|\int_{\left(x_{n}, \infty\right)} g d F\right|}{F\left(x_{n}\right)} \leq \frac{\left(\int_{\left(x_{n}, \infty\right)} g^{2} d F \bar{F}\left(x_{n}\right)\right)^{1 / 2}}{F\left(x_{n}\right)} .
$$

If $v_{n} \rightarrow v$, then $\mathrm{P}\left(V_{n} \leq v_{n}\right) \rightarrow G(v)$ by the continuity of $G$, and, by Lemma 21.12, $n \bar{F}\left(x_{n}\right)= O(1)$ whenever $G(v)>0$. We conclude that $\sqrt{n} \mathrm{E} X_{n 1} \rightarrow 0$. Because we also have that $\mathrm{E} X_{n 1}^{2} \rightarrow F g^{2}$ and $\mathrm{E} X_{n 1}^{2} 1\left\{\left|X_{n 1}\right| \geq \varepsilon \sqrt{n}\right\} \rightarrow 0$ for every $\varepsilon>0$, the Lindeberg-Feller theorem yields that $F_{n}\left(u \mid v_{n}\right) \rightarrow \Phi(u)$. This implies $F_{n}\left(u \mid V_{n}\right) \rightsquigarrow \Phi(u)$ by Theorem 18.11 or a direct argument.

By taking linear combinations, we readily see from the preceding lemma that the empirical process $\mathbb{G}_{n}$ and $b_{n}^{-1}\left(X_{n(n)}-a_{n}\right)$, if they converge, are asymptotically independent as well. This independence carries over onto statistics whose asymptotic distribution can
be derived from the empirical process by the delta method, including central order statistics $X_{n\left(k_{n} / n\right)}$ with $k_{n} / n=p+O(1 / \sqrt{n})$, because these are asymptotically equivalent to averages.

## Notes

For more results concerning the empirical quantile function, the books [28]and [134] are good starting points. For results on extreme order statistics, see [66] or the book [90].

## PROBLEMS

1. Suppose that $F_{n} \rightarrow F$ uniformly. Does this imply that $F_{n}^{-1} \rightarrow F^{-1}$ uniformly or pointwise? Give a counterexample.
2. Show that the asymptotic lengths of the two types of asymptotic confidence intervals for a quantile, discussed in Example 21.8, are within $o_{P}(1 / \sqrt{n})$. Assume that the asymptotic variance of the sample quantile (involving $1 / f \circ F^{-1}(p)$ ) can be estimated consistently.
3. Find the limit distribution of the median absolute deviation from the mean, $\operatorname{med}_{1 \leq i \leq n}\left|X_{i}-\bar{X}_{n}\right|$.
4. Find the limit distribution of the $p$ th quantile of the absolute deviation from the median.
5. Prove that $\bar{X}_{n}$ and $X_{n(n-1)}$ are asymptotically independent.

## 22

## L-Statistics

In this chapter we prove the asymptotic normality of linear combinations of order statistics, particularly those used for robust estimation or testing, such as trimmed means. We present two methods: The projection method presumes knowledge of Chapter 11 only; the second method is based on the functional delta method of Chapter 20.

### 22.1 Introduction

Let $X_{n(1)}, \ldots, X_{n(n)}$ be the order statistics of a sample of real-valued random variables. A linear combination of (transformed) order statistics, or $L$-statistic, is a statistic of the form

$$
\sum_{i=1}^{n} c_{n i} a\left(X_{n(i)}\right) .
$$

The coefficients $c_{n i}$ are a triangular array of constants and $a$ is some fixed function. This "score function" can without much loss of generality be taken equal to the identity function, for an $L$-statistic with monotone function $a$ can be viewed as a linear combination of the order statistics of the variables $a\left(X_{1}\right), \ldots, a\left(X_{n}\right)$, and an $L$-statistic with a function $a$ of bounded variation can be dealt with similarly, by splitting the $L$-statistic into two parts.
22.1 Example (Trimmed and Winsorized means). The simplest example of an $L$-statistic is the sample mean. More interesting are the $\alpha$-trimmed means ${ }^{\dagger}$

$$
\frac{1}{n-2\lfloor\alpha n\rfloor} \sum_{i=\lfloor\alpha n\rfloor+1}^{n-\lfloor\alpha n\rfloor} X_{n(i)}
$$

and the $\alpha$-Winsorized means

$$
\frac{1}{n}\left[\lfloor\alpha n\rfloor X_{n(\lfloor\alpha n\rfloor)}+\sum_{i=\lfloor\alpha n\rfloor+1}^{n-\lfloor\alpha n\rfloor} X_{n(i)}+\lfloor\alpha n\rfloor X_{n(n-\lfloor\alpha n\rfloor+1)}\right] .
$$

[^16]![](https://cdn.mathpix.com/cropped/bcf95844-479f-46e6-9eef-3d1637529ded-104.jpg?height=3875&width=3573&top_left_y=520&top_left_x=1075)
Figure 22.1. Asymptotic variance of the $\alpha$-trimmed mean of a sample from a distribution $F$ as function of $\alpha$ for four distributions $F$.

The $\alpha$-trimmed mean is the average of the middle ( $1-2 \alpha$ )-th fraction of the observations, the $\alpha$-Winsorized mean replaces the $\alpha$ th fractions of smallest and largest data by $X_{n(\lfloor\alpha n\rfloor)}$ and $X_{n(n-\lfloor\alpha n\rfloor+1)}$, respectively, and next takes the average. Both estimators were already used in the early days of statistics as location estimators in situations in which the data were suspected to contain outliers. Their properties were studied systematically in the context of robust estimation in the 1960s and 1970s. The estimators were shown to have good properties in situations in which the data follows a heavier tailed distribution than the normal one. Figure 22.1 shows the asymptotic variances of the trimmed means as a function of $\alpha$ for four distributions. (A formula for the asymptotic variance is given in Example 22.11.) The four graphs suggest that $10 \%$ to $15 \%$ trimming may give an improvement over the sample mean in some cases and does not cost much even for the normal distribution. $\square$
22.2 Example (Ranges). Two estimators of dispersion are the interquartile range $X_{n([3 n / 4])}-X_{n([n / 4])}$ and the range $X_{n(n)}-X_{n(1)}$. Of these, the range does not have a normal limit distribution and is not within the scope of the results of this chapter. $\square$

We present two methods to prove the asymptotic normality of $L$-statistics. The first method is based on the Hájek projection; the second uses the delta method. The second method is preferable in that it applies to more general statistics, but it necessitates the study of empirical processes and does not cover the simplest $L$-statistic: the sample mean.

### 22.2 Hájek Projection

The Hájek projection of a general statistic is discussed in section 11.3. Because a projection is linear and an $L$-statistic is linear in the order statistics, the Hájek projection of an $L$-statistic can be found from the Hájek projections of the individual order statistics. Up to centering at mean zero, these are the sums of the conditional expectations $\mathrm{E}\left(X_{n(i)} \mid X_{k}\right)$ over $k$. Some thought shows that the conditional distribution of $X_{n(i)}$ given $X_{k}$ is given by

$$
\mathrm{P}\left(X_{n(i)} \leq y \mid X_{k}=x\right)= \begin{cases}\mathrm{P}\left(X_{n-1(i)} \leq y\right) & \text { if } y<x \\ \mathrm{P}\left(X_{n-1(i-1)} \leq y\right) & \text { if } y \geq x\end{cases}
$$

This is correct for the extreme cases $i=1$ and $i=n$ provided that we define $X_{n-1(0)}=-\infty$ and $X_{n-1(n)}=\infty$. Thus, we obtain, by the partial integration formula for an expectation, for $x \geq 0$,

$$
\begin{aligned}
E\left(X_{n(i)} \mid X_{k}=x\right)= & \int_{0}^{x} \mathrm{P}\left(X_{n-1(i)}>y\right) d y+\int_{x}^{\infty} \mathrm{P}\left(X_{n-1(i-1)}>y\right) d y \\
& -\int_{-\infty}^{0} \mathrm{P}\left(X_{n-1(i)} \leq y\right) d y \\
= & -\int_{x}^{\infty}\left(\mathrm{P}\left(X_{n-1(i)}>y\right)-\mathrm{P}\left(X_{n-1(i-1)}>y\right)\right) d y+\mathrm{E} X_{n-1(i)}
\end{aligned}
$$

The second expression is valid for $x<0$ as well, as can be seen by a similar argument. Because $X_{n-1(i-1)} \leq X_{n-1(i)}$, the difference between the two probabilities in the last integral is equal to the probability of the event $\left\{X_{n-1(i-1)} \leq y<X_{n-1(i)}\right\}$. This is precisely the probability that a binomial $(n-1, F(y))$-variable is equal to $i-1$. If we write this probability as $B_{n-1, F(y)}(i-1)$, then the Hájek projection $\hat{X}_{n(i)}$ of $X_{n(i)}$ satisfies, with $\mathbb{F}_{n}$ the empirical distribution function of $X_{1}, \ldots, X_{n}$,

$$
\begin{aligned}
\hat{X}_{n(i)}-\mathrm{E} \hat{X}_{n(i)} & =-\sum_{k=1}^{n} \int_{X_{k}}^{\infty} B_{n-1, F(y)}(i-1) d y+C_{n} \\
& =-\int n\left(\mathbb{F}_{n}-F\right)(y) B_{n-1, F(y)}(i-1) d y
\end{aligned}
$$

For the projection of the $L$-statistic $T_{n}=\sum_{i=1}^{n} c_{n i} X_{n(i)}$ we find

$$
\hat{T}_{n}-\mathrm{E} \hat{T}_{n}=-\int n\left(\mathbb{F}_{n}-F\right)(y) \sum_{i=1}^{n} c_{n i} B_{n-1, F(y)}(i-1) d y
$$

Under some conditions on the coefficients $c_{n i}$, this sum (divided by $\sqrt{n}$ ) is asymptotically normal by the central limit theorem. Furthermore, the projection $\hat{T}_{n}$ can be shown to be asymptotically equivalent to the $L$-statistic $T_{n}$ by Theorem 11.2. Sufficient conditions on the $c_{n i}$ can take a simple appearance for coefficients that are "generated" by a function $\phi$ as in (13.4).
22.3 Theorem. Suppose that $\mathrm{E} X_{1}^{2}<\infty$ and that $c_{n i}=\phi(i /(n+1))$ for a bounded function $\phi$ that is continuous at $F(y)$ for Lebesgue almost-every $y$. Then the sequence $n^{-1 / 2}\left(T_{n}-\mathrm{E} T_{n}\right)$
converges in distribution to a normal distribution with mean zero and variance

$$
\sigma^{2}(\phi, F)=\iint \phi(F(x)) \phi(F(y))(F(x \wedge y)-F(x) F(y)) d x d y
$$

Proof. Define functions $e(y)=\phi(F(y))$ and

$$
e_{n}(y)=\sum_{i=1}^{n} c_{n i} B_{n-1, F(y)}(i-1)=\mathrm{E} \phi\left(\frac{B_{n}+1}{n+1}\right),
$$

for $B_{n}$ binomially distributed with parameters $(n-1, F(y))$. By the law of large numbers $\left(B_{n}+1\right) /(n+1) \xrightarrow{\mathrm{P}} F(y)$. Because $\phi$ is bounded, $e_{n}(y) \rightarrow e(y)$ for every $y$ such that $\phi$ is continuous at $F(y)$, by the dominated-convergence theorem. By assumption, this includes almost every $y$.

By Theorem 11.2, the sequence $n^{-1 / 2}\left(T_{n}-\hat{T}_{n}\right)$ converges in second mean to zero if the variances of $n^{-1 / 2} T_{n}$ and $n^{-1 / 2} \hat{T}_{n}$ converge to the same number. Because $n^{-1 / 2}\left(\hat{T}_{n}-\mathrm{E} \hat{T}_{n}\right)= -\int \mathbb{G}_{n}(y) e_{n}(y) d y$, the second variance is easily computed to be

$$
\frac{1}{n} \operatorname{var} \hat{T}_{n}=\iint(F(x \wedge y)-F(x) F(y)) e_{n}(x) e_{n}(y) d x d y
$$

This converges to $\sigma^{2}(\phi, F)$ by the dominated-convergence theorem. The variance of $n^{-1 / 2} T_{n}$ can be written in the form

$$
\frac{1}{n} \operatorname{var} T_{n}=\frac{1}{n} \sum_{i=1}^{n} \sum_{j=1}^{n} c_{n i} c_{n j} \operatorname{cov}\left(X_{n(i)}, X_{n(j)}\right)=\iint R_{n}(x, y) d x d y
$$

where, because $\operatorname{cov}(X, Y)=\iint \operatorname{cov}(\{X \leq x\},\{Y \leq y\}) d x d y$ for any pair of variables $(X, Y)$,

$$
R_{n}(x, y)=\frac{1}{n} \sum_{i=1}^{n} \sum_{j=1}^{n} \phi\left(\frac{i}{n+1}\right) \phi\left(\frac{j}{n+1}\right) \operatorname{cov}\left(\left\{X_{n(i)} \leq x\right\},\left\{X_{n(j)} \leq y\right\}\right)
$$

Because the order statistics are positively correlated, all covariances in the double sum are nonnegative. Furthermore,

$$
\begin{aligned}
\frac{1}{n} \sum_{i=1}^{n} \sum_{j=1}^{n} \operatorname{cov}\left(\left\{X_{n(i)} \leq x\right\},\left\{X_{n(j)} \leq y\right\}\right) & =\operatorname{cov}\left(\mathbb{G}_{n}(x), \mathbb{G}_{n}(y)\right) \\
& =(F(x \wedge y)-F(x) F(y))
\end{aligned}
$$

For pairs $(i, j)$ such that $i \approx n F(x)$ and $j \approx n F(y)$, the coefficient of the covariance is approximately $e(x) e(y)$ by the continuity of $\phi$. The covariances corresponding to other pairs $(i, j)$ are negligible. Indeed, for $i \geq n F(x)+n \varepsilon_{n}$,

$$
\begin{aligned}
0 \leq \operatorname{cov}\left(\left\{X_{n(i)} \leq x\right\},\left\{X_{n(j)} \leq y\right\}\right) & \leq 2 \mathrm{P}\left(X_{n(i)} \leq x\right) \\
& \leq 2 \mathrm{P}\left(\operatorname{bin}(n, F(x)) \geq n F(x)+n \varepsilon_{n}\right) \\
& \leq 2 \exp -2 n \varepsilon_{n}^{2}
\end{aligned}
$$

by Hoeffding's inequality. ${ }^{\dagger}$ Thus, because $\phi$ is bounded, the terms with $i \geq n F(x)+n \varepsilon_{n}$ contribute exponentially little as $\varepsilon_{n} \rightarrow 0$ not too fast (e.g., $\varepsilon_{n}^{2}=n^{-1 / 2}$ ). A similar argument applies to the terms with $i \leq n F(x)-n \varepsilon_{n}$ or $|j-n F(y)| \geq n \varepsilon_{n}$. Conclude that, for every $(x, y)$ such that $\phi$ is continuous at both $F(x)$ and $F(y)$,

$$
R_{n}(x, y) \rightarrow e(x) e(y)(F(x \wedge y)-F(x) F(y)) .
$$

Finally, we apply the dominated convergence theorem to see that the double integral of this expression, which is equal to $n^{-1} \operatorname{var} T_{n}$, converges to $\sigma^{2}(\phi, F)$.

This concludes the proof that $T_{n}$ and $\hat{T}_{n}$ are asymptotically equivalent. To show that the sequence $n^{-1 / 2}\left(\hat{T}_{n}-\mathrm{E} \hat{T}_{n}\right)$ is asymptotically normal, define $S_{n}=-\int \mathbb{G}_{n}(y) e(y) d y$. Then, by the same arguments as before, $n^{-1} \operatorname{var}\left(S_{n}-\hat{T}_{n}\right) \rightarrow 0$. Furthermore, the sequence $n^{-1 / 2} S_{n}$ is asymptotically normal by the central limit theorem.

### 22.3 Delta Method

The order statistics of a sample $X_{1}, \ldots, X_{n}$ can be expressed in their empirical distribution $\mathbb{F}_{n}$, or rather the empirical quantile function, through

$$
\mathbb{F}_{n}^{-1}(s)=X_{n([s n])}=X_{n(i)}, \quad \text { for } \frac{i-1}{n}<s \leq \frac{i}{n} .
$$

Consequently, an $L$-statistic can be expressed in the empirical distribution function as well. Given a fixed function $a$ and a fixed signed measure $K$ on $(0,1)^{\ddagger}$, consider the function

$$
\phi(F)=\int_{0}^{1} a\left(F^{-1}\right) d K
$$

View $\phi$ as a map from the set of distribution functions into $\mathbb{R}$. Clearly,

$$
\begin{equation*}
\phi\left(\mathbb{F}_{n}\right)=\sum_{i=1}^{n} K\left(\frac{i-1}{n}, \frac{i}{n}\right] a\left(X_{n(i)}\right) . \tag{22.4}
\end{equation*}
$$

The right side is an $L$-statistic with coefficients $c_{n i}=K((i-1) / n, i / n]$. Not all possible arrays of coefficients $c_{n i}$ can be "generated" through a measure $K$ in this manner. However, most $L$-statistics of interest are almost of the form (22.4), so that not much generality is lost by assuming this structure. An advantage is simplicity in the formulation of the asymptotic properties of the statistics, which can be derived with the help of the von Mises method. More importantly, the function $\phi(F)$ can also be applied to other estimators besides $\mathbb{F}_{n}$. The results of this section yield their asymptotic normality in general.
22.5 Example. The $\alpha$-trimmed mean corresponds to the uniform distribution $K$ on the interval $(\alpha, 1-\alpha)$ and $a$ the identity function. More precisely, the $L$-statistic generated by

[^17]this measure is
$$
\begin{aligned}
\frac{1}{1-2 \alpha} \int_{\alpha}^{1-\alpha} \mathbb{F}_{n}^{-1}(s) d s= & \frac{1}{n-2 \alpha n}\left[(\lceil\alpha n\rceil-\alpha n) X_{n(\lceil\alpha n\rceil)}\right. \\
& \left.+\sum_{i=\lceil\alpha n\rceil+1}^{n-\lceil\alpha n\rceil} X_{n(i)}+(\lceil\alpha n\rceil-\alpha n) X_{n(n-\lceil\alpha n\rceil+1)}\right]
\end{aligned}
$$

Except for the slightly different weight factor and the treatment of the two extremes in the averages, this agrees with the $\alpha$-trimmed mean as introduced before. Because $X_{n\left(k_{n}\right)}$ converges in probability to $F^{-1}(p)$ if $k_{n} / n \rightarrow p$ and $(n-2\lfloor\alpha n\rfloor) /(n-2 \alpha n)=1+O(1 / n)$, the difference between the two versions of the trimmed mean can be seen to be $O_{P}(1 / n)$. For the purpose of this chapter this is negligible.

The $\alpha$-Winsorized mean corresponds to the measure $K$ that is the sum of Lebesgue measure on $(\alpha, 1-\alpha)$ and the discrete measure with pointmasses of size $\alpha$ at each of the points $\alpha$ and $1-\alpha$. Again, the difference between the estimator generated by this $K$ and the Winsorized mean is negligible.

The interquartile range corresponds to the discrete, signed measure $K$ that has pointmasses of sizes 1 and -1 at the points $1 / 4$ and $3 / 4$, respectively.

Before giving a proof of asymptotic normality, we derive the influence function of an (empirical) $L$-statistic in an informal way. If $F_{t}=(1-t) F+t \delta_{x}$, then, by definition, the influence function is the derivative of the map $t \mapsto \phi\left(F_{t}\right)$ at $t=0$. Provided $a$ and $K$ are sufficiently regular,

$$
\frac{d}{d t} \int_{0}^{1} a\left(F_{t}^{-1}\right) d K=\int_{0}^{1} a^{\prime}\left(F_{t}^{-1}\right)\left[\frac{d}{d t} F_{t}^{-1}\right] d K
$$

Here the expression within square brackets if evaluated at $t=0$ is the influence function of the quantile function and is derived in Example 20.5. Substituting the representation given there, we see that the influence function of the $L$-function $\phi(F)=\int a\left(F^{-1}\right) d K$ takes the form

$$
\begin{align*}
\phi_{F}^{\prime}\left(\delta_{x}-F\right) & =-\int_{0}^{1} a^{\prime}\left(F^{-1}(u)\right) \frac{1_{[x, \infty)}\left(F^{-1}(u)\right)-u}{f\left(F^{-1}(u)\right)} d K(u)  \tag{22.6}\\
& =-\int a^{\prime}(y) \frac{1_{[x, \infty)}(y)-F(y)}{f(y)} d K \circ F(y)
\end{align*}
$$

The second equality follows by (a generalization of) the quantile transformation.
An alternative derivation of the influence function starts with rewriting $\phi(F)$ in the form

$$
\begin{equation*}
\phi(F)=\int a d K \circ F=\int_{(0, \infty)} \overline{(K \circ F)_{-}} d a-\int_{(-\infty, 0]}(K \circ F)_{-} d a \tag{22.7}
\end{equation*}
$$

Here $\overline{K \circ F}(x)=K \circ F(\infty)-K \circ F(x)$ and the partial integration can be justified for $a$ a function of bounded variation with $a(0)=0$ (see problem 22.6; the assumption that $a(0)=0$ simplifies the formula, and is made for convenience). This formula for $\phi(F)$ suggests as influence function

$$
\begin{equation*}
\phi_{F}^{\prime}\left(\delta_{x}-F\right)=-\int K^{\prime}(F(y))\left(1_{[x, \infty)}(y)-F(y)\right) d a(y) \tag{22.8}
\end{equation*}
$$

Under appropriate conditions each of the two formulas (22.6) and (22.8) for the influence function is valid. However, already for the defining expressions to make sense very different conditions are needed. Informally, for equation (22.6) it is necessary that $a$ and $F$ be differentiable with a positive derivative for $F$, (22.8) requires that $K$ be differentiable. For this reason both expressions are valuable, and they yield nonoverlapping results.

Corresponding to the two derivations of the influence function, there are two basic approaches towards proving asymptotic normality of $L$-statistics by the delta method, valid under different sets of conditions. Roughly, one approach requires that $F$ and $a$ be smooth, and the other that $K$ be smooth.

The simplest method is to view the $L$-statistic as a function of the empirical quantile function, through the map $\mathbb{F}_{n}^{-1} \mapsto \int a \circ \mathbb{F}_{n}^{-1} d K$, and next apply the functional delta method to the map $Q \mapsto \int a \circ Q d K$. The asymptotic normality of the empirical quantile function is obtained in Chapter 21.
22.9 Lemma. Let $a: \mathbb{R} \mapsto \mathbb{R}$ be continuously differentiable with a bounded derivative. Let $K$ be a signed measure on the interval $(\alpha, \beta) \subset(0,1)$. Then the map $Q \mapsto \int a(Q) d K$ from $\ell^{\infty}(\alpha, \beta)$ to $\mathbb{R}$ is Hadamard-differentiable at every $Q$. The derivative is the map $H \mapsto \int a^{\prime}(Q) H d K$.

Proof. Let $H_{t} \rightarrow H$ in the uniform norm. Consider the difference

$$
\int\left|\frac{a\left(Q+t H_{t}\right)-a(Q)}{t}-a^{\prime}(Q) H\right| d K
$$

The integrand converges to zero everywhere and is bounded uniformly by $\left\|a^{\prime}\right\|_{\infty}\left(\left\|H_{t}\right\|_{\infty}+\right. \left.\|H\|_{\infty}\right)$. Thus the integral converges to zero by the dominated-convergence theorem.

If the underlying distribution has unbounded support, then its quantile function is unbounded on the domain $(0,1)$, and no estimator can converge in $\ell^{\infty}(0,1)$. Then the preceding lemma can apply only to generating measures $K$ with support ( $\alpha, \beta$ ) strictly within $(0,1)$. Fortunately, such generating measures are the most interesting ones, as they yield bounded influence functions and hence robust $L$-statistics.

A more serious limitation of using the preceding lemma is that it could require unnecessary smoothness conditions on the distribution of the observations. For instance, the empirical quantile process converges in distribution in $\ell^{\infty}(\alpha, \beta)$ only if the underlying distribution has a positive density between its $\alpha$ - and $\beta$-quantiles. This is true for most standard distributions, but unnecessary for the asymptotic normality of empirical $L$-statistics generated by smooth measures $K$. Thus we present a second lemma that applies to smooth measures $K$ and does not require that $F$ be smooth. Let $D F[-\infty, \infty]$ be the set of all distribution functions.
22.10 Lemma. Let a: $\mathbb{R} \mapsto \mathbb{R}$ be of bounded variation on bounded intervals with $\int\left(a^{+}+\right. \left.a^{-}\right) d|K \circ F|<\infty$ and $a(0)=0$. Let $K$ be a signed measure on $(0,1)$ whose distribution function $K$ is differentiable at $F(x)$ for a almost-every $x$ and satisfies $|K(u+h)-K(u)| \leq M(u) h$ for every sufficiently small $|h|$, and some function $M$ such that $\int M\left(F_{-}\right) d|a|<\infty$. Then the map $F \mapsto \int a \circ F^{-1} d K$ from $D F[-\infty, \infty] \subset D[-\infty, \infty]$ to $\mathbb{R}$ is Hadamarddifferentiable at $F$, with derivative $H \mapsto-\int\left(K^{\prime} \circ F_{-}\right) H d a$.

Proof. First rewrite the function in the form (22.7). Suppose that $H_{t} \rightarrow H$ uniformly and set $F_{t}=F+t H_{t}$. By continuity of $K,(K \circ F)_{-}=K\left(F_{-}\right)$. Because $K \circ F(\infty)=K(1)$ for all $F$, the difference $\phi\left(F_{t}\right)-\phi(F)$ can be rewritten as $-\int\left(K \circ F_{t-}-K \circ F_{-}\right) d a$. Consider the integral

$$
\int\left|\frac{K\left(F_{-}+t H_{t-}\right)-K\left(F_{-}\right)}{t}-K^{\prime}\left(F_{-}\right) H\right| d|a| .
$$

The integrand converges $a$-almost everywhere to zero and is bounded by $M\left(F_{-}\right)\left(\left\|H_{t}\right\|_{\infty}+\right. \left.\|H\|_{\infty}\right) \leq M\left(F_{-}\right)\left(2\|H\|_{\infty}+1\right)$, for small $t$. Thus, the lemma follows by the dominatedconvergence theorem.

Because the two lemmas apply to nonoverlapping situations, it is worthwhile to combine the two approaches. A given generating measure $K$ can be split in its discrete and continuous part. The corresponding two parts of the $L$-statistic can next be shown to be asymptotically linear by application of the two lemmas. Their sum is asymptotically linear as well and hence asymptotically normal.
22.11 Example (Trimmed mean). The cumulative distribution function $K$ of the uniform distribution on $(\alpha, 1-\alpha)$ is uniformly Lipschitz and fails to be differentiable only at the points $\alpha$ and $1-\alpha$. Thus, the trimmed-mean function is Hadamard-differentiable at every $F$ such that the set $\{x: F(x)=\alpha$, or $1-\alpha\}$ has Lebesgue measure zero. (We assume that $\alpha>0$.) In other words, $F$ should not have flats at height $\alpha$ or $1-\alpha$. For such $F$ the trimmed mean is asymptotically normal with asymptotic influence function $-\int_{\alpha}^{1-\alpha}\left(1_{x \leq y}-F(y)\right) d y$ (see (22.8)), and asymptotic variance

$$
\int_{F^{-1}(\alpha)}^{F^{-1}(1-\alpha)} \int_{F^{-1}(\alpha)}^{F^{-1}(1-\alpha)}(F(x \wedge y)-F(x) F(y)) d x d y
$$

Figure 22.1 shows this number as a function of $\alpha$ for a number of distributions.
22.12 Example (Winsorized mean). The generating measure of the Winsorized mean is the sum of a discrete measure on the two points $\alpha$ and $1-\alpha$, and Lebesgue measure on the interval $(\alpha, 1-\alpha)$. The Winsorized mean itself can be decomposed correspondingly. Suppose that the underlying distribution function $F$ has a positive derivative at the points $F^{-1}(\alpha)$ and $F^{-1}(1-\alpha)$. Then the first part of the decomposition is asymptotically linear in view of Lemma 22.9 and Lemma 21.3, the second part is asymptotically linear by Lemma 22.10 and Theorem 19.3. Combined, this yields the asymptotic linearity of the Winsorized mean and hence its asymptotic normality.

## 22.4 $\boldsymbol{L}$-Estimators for Location

The $\alpha$-trimmed mean and the $\alpha$-Winsorized mean were invented as estimators for location. The question in this section is whether there are still other attractive location estimators within the class of $L$-statistics.

One possible method of generating $L$-estimators for location is to find the best $L$ estimators for given location families $\{f(x-\theta): \theta \in \mathbb{R}\}$, in which $f$ is some fixed density. For instance, for the $f$ equal to the normal shape this leads to the sample mean.

According to Chapter 8, an estimator sequence $T_{n}$ is asymptotically optimal for estimating the location of a density with finite Fisher information $I_{f}$ if

$$
\sqrt{n}\left(T_{n}-\theta\right)=-\frac{1}{\sqrt{n}} \sum_{i=1}^{n} \frac{1}{I_{f}} \frac{f^{\prime}}{f}\left(X_{i}-\theta\right)+o_{P}(1) .
$$

Comparison with equation (22.8) for the influence function of an $L$-statistic shows that the choices of generating measure $K$ and transformation $a$ such that

$$
K^{\prime}(F(x-\theta)) a^{\prime}(x)=-\left(\frac{1}{I_{f}} \frac{f^{\prime}}{f}(x-\theta)\right)^{\prime}
$$

lead to an $L$-statistic with the optimal asymptotic influence function. This can be accommodated by setting $a(x) \equiv x$ and

$$
K^{\prime}(u)=-\left(\frac{1}{I_{f}} \frac{f^{\prime}}{f}\right)^{\prime}\left(F^{-1}(u)\right)
$$

The class of $L$-statistics is apparently large enough to contain an asymptotically efficient estimator sequence for the location parameter of any smooth shape. The $L$-statistics are not as simplistic as they may seem at first.

## Notes

This chapter gives only a few of the many results available on $L$-statistics. For instance, the results on Hadamard differentiability can be refined by using a weighted uniform norm combined with convergence of the weighted empirical process. This allows greater weights for the extreme-order statistics. For further results and references, see [74], [134], and [136].

## PROBLEMS

1. Find a formula for the asymptotic variance of the Winsorized mean.
2. Let $T(F)=\int F^{-1}(u) k(u) d u$.
(i) Show that $T(F)=0$ for every distribution $F$ that is symmetric about zero if and only if $k$ is symmetric about $1 / 2$.
(ii) Show that $T(F)$ is location equivariant if and only if $\int k(u) d u=1$.
(iii) Show that "efficient" $L$-statistics obtained from symmetric densities possess both properties (i) and (ii).
3. Let $X_{1}, \ldots, X_{n}$ be a random sample from a continuous distribution function. Show that conditionally on $\left(X_{n(k)}, X_{n(l)}\right)=(x, y)$, the variables $X_{n(k+1)}, \ldots, X_{n(l-1)}$ are distributed as the order statistics of a random sample of size $l-k-1$ from the conditional distribution of $X_{1}$ given that $x \leq X_{1} \leq y$. How can you use this to study the properties of trimmed means?
4. Find an optimal $L$-statistic for estimating the location in the logistic and Laplace location families.
5. Does there exist a distribution for which the trimmed mean is asymptotically optimal for estimating location?
6. (Partial Integration.) If $a: \mathbb{R} \mapsto \mathbb{R}$ is right-continuous and nondecreasing with $a(0)=0$, and $b: \mathbb{R} \mapsto \mathbb{R}$ is right-continuous, nondecreasing and bounded, then

$$
\int a d b=\int_{(0, \infty)}\left(b(\infty)-b_{-}\right) d a+\int_{(-\infty, 0]}\left(b(-\infty)-b_{-}\right) d a
$$

Prove this. If $a$ is also bounded, then the righthand side can be written more succinctly as $\left.a b\right|_{-\infty} ^{\infty}-\int b_{-} d a$. (Substitute $a(x)=\int_{(0, x]} d a$ for $x>0$ and $a(x)=-\int_{(x, 0]} d a$ for $x \leq 0$ into the left side of the equation, and use Fubini's theorem separately on the integral over the positive and negative part of the real line.)

## 23

## Bootstrap

> This chapter investigates the asymptotic properties of bootstrap estimators for distributions and confidence intervals. The consistency of the bootstrap for the sample mean implies the consistency for many other statistics by the delta method. A similar result is valid with the empirical process.

### 23.1 Introduction

In most estimation problems it is important to give an indication of the precision of a given estimate. A simple method is to provide an estimate of the bias and variance of the estimator; more accurate is a confidence interval for the parameter. In this chapter we concentrate on bootstrap confidence intervals and, more generally, discuss the bootstrap as a method of estimating the distribution of a given statistic.

Let $\hat{\theta}$ be an estimator of some parameter $\theta$ attached to the distribution $P$ of the observations. The distribution of the difference $\hat{\theta}-\theta$ contains all the information needed for assessing the precision of $\hat{\theta}$. In particular, if $\xi_{\alpha}$ is the upper $\alpha$-quantile of the distribution of $(\hat{\theta}-\theta) / \hat{\sigma}$, then

$$
\mathrm{P}\left(\hat{\theta}-\xi_{\beta} \hat{\sigma} \leq \theta \leq \hat{\theta}-\xi_{1-\alpha} \hat{\sigma} \mid P\right) \geq 1-\beta-\alpha .
$$

Here $\hat{\sigma}$ may be arbitrary, but it is typically an estimate of the standard deviation of $\hat{\theta}$. It follows that the interval $\left[\hat{\theta}-\xi_{\beta} \hat{\sigma}, \hat{\theta}-\xi_{1-\alpha} \hat{\sigma}\right]$ is a confidence interval of level $1-\beta-\alpha$. Unfortunately, in most situations the quantiles and the distribution of $\hat{\theta}-\theta$ depend on the unknown distribution $P$ of the observations and cannot be used to assess the performance of $\hat{\theta}$. They must be replaced by estimators.

If the sequence $(\hat{\theta}-\theta) / \hat{\sigma}$ tends in distribution to a standard normal variable, then the normal $N\left(0, \hat{\sigma}^{2}\right)$-distribution can be used as an estimator of the distribution of $\hat{\theta}-\theta$, and we can substitute the standard normal quantiles $z_{\alpha}$ for the quantiles $\xi_{\alpha}$. The weak convergence implies that the interval $\left[\hat{\theta}-z_{\beta} \hat{\sigma}, \hat{\theta}-z_{1-\alpha} \hat{\sigma}\right]$ is a confidence interval of asymptotic level $1-\alpha-\beta$.

Bootstrap procedures yield an alternative. They are based on an estimate $\hat{P}$ of the underlying distribution $P$ of the observations. The distribution of $(\hat{\theta}-\theta) / \hat{\sigma}$ under $P$ can, in principle, be written as a function of $P$. The bootstrap estimator for this distribution is the "plug-in" estimator obtained by substituting $\hat{P}$ for $P$ in this function. Bootstrap estimators
for quantiles, and next confidence intervals, are obtained from the bootstrap estimator for the distribution.

The following type of notation is customary. Let $\hat{\theta}^{*}$ and $\hat{\sigma}^{*}$ be computed from (hypothetic) observations obtained according to $\hat{P}$ in the same way $\hat{\theta}$ and $\hat{\sigma}$ are computed from the true observations with distribution $P$. If $\hat{\theta}$ is related to $\hat{P}$ in the same way $\theta$ is related to $P$, then the bootstrap estimator for the distribution of $(\hat{\theta}-\theta) / \hat{\sigma}$ under $P$ is the distribution of $\left(\hat{\theta}^{*}-\hat{\theta}\right) / \hat{\sigma}^{*}$ under $\hat{P}$. The latter is evaluated given the original observations, that is, for a fixed realization of $\hat{P}$.

A bootstrap estimator for a quantile $\xi_{\alpha}$ of $(\hat{\theta}-\theta) / \hat{\sigma}$ is a quantile of the distribution of $\left(\hat{\theta}^{*}-\hat{\theta}\right) / \hat{\sigma}^{*}$ under $\hat{P}$. This is the smallest value $x=\hat{\xi}_{\alpha}$ that satisfies the inequality

$$
\begin{equation*}
\mathrm{P}\left(\left.\frac{\hat{\theta}^{*}-\hat{\theta}}{\hat{\sigma}^{*}} \leq x \right\rvert\, \hat{P}\right) \geq 1-\alpha . \tag{23.1}
\end{equation*}
$$

The notation $\mathrm{P}(\cdot \mid \hat{P})$ indicates that the distribution of $\left(\hat{\theta}^{*}, \hat{\sigma}^{*}\right)$ must be evaluated assuming that the observations are sampled according to $\hat{P}$ given the original observations. In particular, in the preceding display $\hat{\theta}$ is to be considered nonrandom. The left side of the preceding display is a function of the original observations, whence the same is true for $\hat{\xi}_{\alpha}$.

If $\hat{P}$ is close to the true underlying distribution $P$, then the bootstrap quantiles should be close to the true quantiles, whence it should be true that

$$
\mathrm{P}\left(\left.\frac{\hat{\theta}-\theta}{\hat{\sigma}} \leq \hat{\xi}_{\alpha} \right\rvert\, P\right) \approx 1-\alpha .
$$

In this chapter we show that this approximation is valid in an asymptotic sense: The probability on the left converges to $1-\alpha$ as the number of observations tends to infinity. Thus, the bootstrap confidence interval

$$
\left[\hat{\theta}-\hat{\xi}_{\beta} \hat{\sigma}, \hat{\theta}-\hat{\xi}_{1-\alpha} \hat{\sigma}\right]=\left\{\theta: \hat{\xi}_{1-\alpha} \leq \frac{\hat{\theta}-\theta}{\hat{\sigma}} \leq \hat{\xi}_{\beta}\right\}
$$

possesses asymptotic confidence level $1-\alpha-\beta$.
The statistic $\hat{\sigma}$ is typically chosen equal to an estimator of the (asymptotic) standard deviation of $\hat{\theta}$. The resulting bootstrap method is known as the percentile t-method, in view of the fact that it is based on estimating quantiles of the "studentized" statistic $(\hat{\theta}-\theta) / \hat{\sigma}$. (The notion of a $t$-statistic is used here in an abstract manner to denote a centered statistic divided by a scale estimate; in general, there is no relationship with Student's $t$-distribution from normal theory.) A simpler method is to choose $\hat{\sigma}$ independent of the data. If we choose $\hat{\sigma}=\hat{\sigma}^{*}=1$, then the bootstrap quantiles $\hat{\xi}_{\alpha}$ are the quantiles of the centered statistic $\hat{\theta}^{*}-\hat{\theta}$. This is known as the percentile method. Both methods yield asymptotically correct confidence levels, although the percentile $t$-method is generally more accurate.

A third method, Efron's percentile method, proposes the confidence interval $\left[\hat{\zeta}_{1-\beta}, \hat{\zeta}_{\alpha}\right]$ for $\hat{\zeta}_{\alpha}$ equal to the upper $\alpha$-quantile of $\hat{\theta}^{*}$ : the smallest value $x=\hat{\zeta}_{\alpha}$ such that

$$
\mathrm{P}\left(\hat{\theta}^{*} \leq x \mid \hat{P}\right) \geq 1-\alpha
$$

Thus, $\hat{\zeta}_{\alpha}$ results from "bootstrapping" $\hat{\theta}$, while $\hat{\xi}_{\alpha}$ is the product of bootstrapping $(\hat{\theta}- \theta) / \hat{\sigma}$. These quantiles are related, and Efron's percentile interval can be reexpressed in the quantiles $\hat{\xi}_{\alpha}$ of $\hat{\theta}^{*}-\hat{\theta}$ (employed by the percentile method with $\hat{\sigma}=1$ ) as

$$
\left[\hat{\zeta}_{1-\beta}, \hat{\zeta}_{\alpha}\right]=\left[\hat{\theta}+\hat{\xi}_{1-\beta}, \hat{\theta}+\hat{\xi}_{\alpha}\right]
$$

The logical justification for this interval is less strong than for the intervals based on bootstrapping $\hat{\theta}-\theta$, but it appears to work well. The two types of intervals coincide in the case that the conditional distribution of $\hat{\theta}^{*}-\hat{\theta}$ is symmetric about zero. We shall see that the difference is asymptotically negligible if $\hat{\theta}^{*}-\hat{\theta}$ converges to a normal distribution.

Efron's percentile interval is the only one among the three intervals that is invariant under monotone transformations. For instance, if setting a confidence interval for the correlation coefficient, the sample correlation coefficient might be transformed by Fisher's transformation before carrying out the bootstrap scheme. Next, the confidence interval for the transformed correlation can be transformed back into a confidence interval for the correlation coefficient. This operation would have no effect on Efron's percentile interval but can improve the other intervals considerably, in view of the skewness of the statistic. In this sense Efron's method automatically "finds" useful (stabilizing) transformations. The fact that it does not become better through transformations of course does not imply that it is good, but the invariance appears desirable.

Several of the elements of the bootstrap scheme are still unspecified. The missing probability $\alpha+\beta$ can be distributed over the two tails of the confidence interval in several ways. In many situations equal-tailed confidence intervals, corresponding to the choice $\alpha=\beta$, are reasonable. In general, these do not have $\hat{\theta}$ exactly as the midpoint of the interval. An alternative is the interval

$$
\left[\hat{\theta}-\hat{\xi}_{\alpha+\beta}^{s} \hat{\sigma}, \hat{\theta}+\hat{\xi}_{\alpha+\beta}^{s} \hat{\sigma}\right],
$$

with $\hat{\xi}_{\alpha}^{s}$ equal to the upper $\alpha$-quantile of $\left|\hat{\theta}^{*}-\hat{\theta}\right| / \hat{\sigma}^{*}$. A further possibility is to choose $\alpha$ and $\beta$ under the side condition that the difference $\hat{\xi}_{\beta}-\hat{\xi}_{1-\alpha}$, which is proportional to the length of the confidence interval, is minimal.

More interesting is the choice of the estimator $\hat{P}$ for the underlying distribution. If the original observations are a random sample $X_{1}, \ldots, X_{n}$ from a probability distribution $P$, then one candidate is the empirical distribution $\mathbb{P}_{n}=n^{-1} \sum \delta_{X_{i}}$ of the observations, leading to the empirical bootstrap. Generating a random sample from the empirical distribution amounts to resampling with replacement from the set $\left\{X_{1}, \ldots, X_{n}\right\}$ of original observations. The name "bootstrap" derives from this resampling procedure, which might be surprising at first, because the observations are "sampled twice." If we view the bootstrap as a nonparametric plug-in estimator, we see that there is nothing peculiar about resampling.

We shall be mostly concerned with the empirical bootstrap, even though there are many other possibilities. If the observations are thought to follow a specified parametric model, then it is more reasonable to set $\hat{P}$ equal to $P_{\hat{\theta}}$ for a given estimator $\hat{\theta}$. This is what one would have done in the first place, but it is called the parametric bootstrap within the present context. That the bootstrapping methodology is far from obvious is clear from the fact that the literature also considers the exchangeable, the Bayesian, the smoothed, and the wild bootstrap, as well as several schemes for bootstrap corrections. Even "resampling" can be carried out differently, for instance, by sampling fewer than $n$ variables, or without replacement.

It is almost never possible to calculate the bootstrap quantiles $\hat{\xi}_{\alpha}$ numerically. In practice, these estimators are approximated by a simulation procedure. A large number of independent bootstrap samples $X_{1}^{*}, \ldots, X_{n}^{*}$ are generated according to the estimated distribution $\hat{P}$. Each sample gives rise to a bootstrap value $\left(\hat{\theta}^{*}-\hat{\theta}\right) / \hat{\sigma}^{*}$ of the standardized statistic. Finally, the bootstrap quantiles $\hat{\xi}_{\alpha}$ are estimated by the empirical quantiles of these bootstrap


[^0]:    ${ }^{\dagger}$ It is also proved in Chapter 17 by relating the likelihood ratio statistic to the chi-square statistic.

[^1]:    ${ }^{\dagger}$ The arguments $\vec{Y}_{n}$ and $\hat{\mu}$ of $D$ are the vectors of estimated (conditional) means of $Y$ given the full model and the generalized linear model, respectively. Thus $\hat{\mu}_{i}=b^{\prime} \circ k\left(\hat{\beta}_{n}^{T} X_{i}\right)$.

[^2]:    ${ }^{\dagger}$ For a detailed study of sufficient conditions for consistency see [45].

[^3]:    ${ }^{\dagger}$ For a further discussion, see [5], [9], and [83], and the references cited there.

[^4]:    ${ }^{\dagger}$ The following Prohorov's theorem is not used in this book. For a proof see, for instance, [146].

[^5]:    ${ }^{\dagger}$ See [134] for the following and many other results on the univariate empirical process.
    ${ }^{\ddagger}$ A function is absolutely continuous if it is the primitive function $\int_{0}^{t} g(s) d s$ of an integrable function $g$. Then it is almost-everywhere differentiable with derivative $g$.

[^6]:    ${ }^{\dagger}$ The upper bound and this sufficient condition can be slightly improved. For this and a proof of the upper bound, see e.g., [146, Corollary 2.74].
    ${ }^{\ddagger}$ See [16] .

[^7]:    ${ }^{\dagger}$ See, e.g., [146, Theorem 2.75].

[^8]:    ${ }^{\dagger}$ See, for example, [117], [120], or [146] for proofs of the preceding theorems and other unproven results in this section.

[^9]:    ${ }^{\dagger}$ See, for instance, [42, Chapter 12], or [134].

[^10]:    ${ }^{\dagger}$ The constant $1 / 4$ can be replaced by $1 / 2$ (which is the best possible constant) by a more precise argument.

[^11]:    ${ }^{\dagger}$ For a proof of the following lemmas and further results, see Lemmas 3.4.2 and 3.4.3 and Chapter 2.14, in [146] Also see [14], [15], and [51].

[^12]:    ${ }^{\dagger}$ For a proof of the following lemma, see, for example, [120], or Theorem 2.14.1 in [146].

[^13]:    ${ }^{\dagger}$ We denote by $h_{-}$the left-continuous version of a cadlag function $h$ and abbreviate $\left.h\right|_{a} ^{b}=h(b)-h(a)$.

[^14]:    ${ }^{\dagger}$ See [134, pp. 586-587] for further information.

[^15]:    ${ }^{\dagger}$ For a proof of the following theorem, see [66] or Theorem 1.4.2 in [90].

[^16]:    ${ }^{\dagger}$ The notation $\lfloor x\rfloor$ is used for the greatest integer that is less than or equal to $x$. Also $\lceil x\rceil$ denotes the smallest integer greater than or equal to $x$. For a natural number $n$ and a real number $0 \leq x \leq n$ one has $\lfloor n-x\rfloor=n-\lceil x\rceil$ and $\lceil n-x\rceil=n-\lfloor x\rfloor$.

[^17]:    ${ }^{\dagger}$ See for example, the appendix of [117]. This inequality gives more than needed. For instance, it also works to apply Markov's inequality for fourth moments.
    ${ }^{\ddagger}$ A signed measure is a difference $K=K_{1}-K_{2}$ of two finite measures $K_{1}$ and $K_{2}$.

