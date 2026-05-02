bold-play strategy scaled down to the interval $\left[0, \frac{1}{2}\right]$, and so the chance he ever reaches $\frac{1}{2}$ is $Q(2 x)$ for an initial fortune of $x$. Suppose further that if he does reach the goal of $\frac{1}{2}$, or if he starts with fortune at least $\frac{1}{2}$ in the first place, then he continues, but with ordinary bold play. For an initial fortune $x \geq \frac{1}{2}$, the overall chance of success is of course $Q(x)$, and for an initial fortune $x<\frac{1}{2}$, it is $Q(2 x) Q\left(\frac{1}{2}\right)=p Q(2 x)=Q(x)$. The success probability is indeed $Q(x)$ as for bold play, although the policy is different. With this example in mind, one can generate a whole series of distinct optimal policies.

## Timid Play*

The optimality of bold play seems reasonable when one considers the effect of its opposite, timid play. Let the $\epsilon$-timid policy be to bet $W_{n}= \min \left\{\epsilon, F_{n-1}, 1-F_{n-1}\right\}$ and stop when $F_{n}$ reaches 0 or 1 . Suppose that $p<q$, fix an initial fortune $x=F_{0}$ with $0 \leq x<1$, and consider what happens as $\epsilon \rightarrow 0$. By the strong law of large numbers, $\lim _{n} n^{-1} S_{n}=E\left[X_{1}\right]=p-q<0$. There is therefore probability 1 that $\sup _{k} S_{k}<\infty$ and $\lim _{n} S_{n}=-\infty$. Given $\eta>0$, choose $\epsilon$ so that $P\left[\sup _{k}\left(x+\epsilon S_{k}\right)<1\right]>1-\eta$. Since $P\left(\bigcup_{n=1}^{\infty}\left[x+\epsilon S_{n}\right.\right. <0])=1$, with probability at least $1-\eta$ there exists an $n$ such that $x+\epsilon S_{n} <0$ and $\max _{k<n}\left(x+\epsilon S_{k}\right)<1$. But under the $\epsilon$-timid policy the gambler is in this circumstance ruined. If $Q_{\epsilon}(x)$ is the probability of success under the $\epsilon$-timid policy, then $\lim _{\epsilon \rightarrow 0} Q_{\epsilon}(x)=0$ for $0 \leq x<1$. The law of large numbers carries the timid player to his ruin. ${ }^{\dagger}$

## PROBLEMS

7.1. A gambler with initial capital $a$ plays until his fortune increases $b$ units or he is ruined. Suppose that $\rho>1$. The chance of success is multiplied by $1+\theta$ if his initial capital is infinite instead of $a$. Show that $0<\theta<\left(\rho^{a}-1\right)^{-1}< (a(\rho-1))^{-1}$; relate to Example 7.3.
7.2 As shown on p. 94, there is probability 1 that the gambler either achieves his goal of $c$ or is ruined. For $p \neq q$, deduce this directly from the strong law of large numbers. Deduce it (for all $p$ ) via the Borel-Cantelli lemma from the fact that if play never terminates, there can never occur $c$ successive +1 's.
7.3. $612 \uparrow$ If $V_{n}$ is the set of $n$-long sequences of $\pm 1$ 's, the function $b_{n}$ in (7.9) maps $V_{n-1}$ into $\{0,1\}$. A selection system is a sequence of such maps. Although there are uncountably many selection systems, how many have an effective

[^0]description in the sense of an algorithm or finite set of instructions by means of which a deputy (perhaps a machine) could operate the system for the gambler? An analysis of the question is a matter for mathematical logic, but one can see that there can be only countably many algorithms or finite sets of rules expressed in finite alphabets.

Let $Y_{1}^{(\sigma)}, Y_{2}^{(\sigma)}, \ldots$ be the random variables of Theorem 7.1 for a particular system $\sigma$, and let $C_{\sigma}$ be the $\omega$-set where every $k$-tuple of $\pm 1$ 's ( $k$ arbitrary) occurs in $Y_{1}^{(\sigma)}(\omega), Y_{2}^{(\sigma)}(\omega), \ldots$ with the right asymptotic relative frequency (in the sense of Problem 6.12). Let $C$ be the intersection of $C_{\sigma}$ over all effective selection systems $\sigma$. Show that $C$ lies in $\mathscr{F}$ (the $\sigma$-field in the probability space $(\Omega, \mathscr{F}, P)$ on which the $X_{n}$ are defined) and that $P(C)=1$. A sequence $\left(X_{1}(\omega), X_{2}(\omega), \ldots\right)$ for $\omega$ in $C$ is called a coliective: a subsequence chosen by any of the effective rules $\sigma$ contains all $k$-tuples in the correct proportions
7.4. Let $D_{n}$ be 1 or 0 according as $X_{2 n-1} \neq X_{2 n}$ or not, and let $M_{k}$ be the time of the $k$ th 1 -the smallest $n$ such that $\sum_{i=1}^{n} D_{i}=k$. Let $Z_{k}=X_{2 M_{i}}$. In otner words, look at successive nonoverlapping pairs ( $X_{2 n-1}, X_{2 n}$ ), discard accordant $\left(X_{2 n-1}=X_{2 n}\right)$ pairs, and keep the second element of discordant ( $X_{2 n-1} \neq X_{2 n}$ ) pairs. Show that this process simulates a fair coin: $Z_{1}, Z_{2}, \ldots$ are independent and identically distributed and $P\left[Z_{k}=+1\right]=P\left[Z_{k}=-1\right]=\frac{1}{2}$, whatever $p$ may be. Follow the proof of Theorem 7.1.
7.5. Suppose that a gambler with initial fortune 1 stakes a proportion $\theta(0<\theta<1)$ of his current fortune: $F_{0}=1$ and $W_{n}=\theta F_{n-1}$. Show that $F_{n}=\Pi_{k=1}^{n}\left(1+\theta X_{k}\right)$ and hence that

$$
\log F_{n}=\frac{n}{2}\left[\frac{S_{n}}{n} \log \frac{1+\theta}{1-\theta}+\log \left(1-\theta^{2}\right)\right]
$$

Show that $F_{n} \rightarrow 0$ with probability 1 in the subfair case.
7.6. In "doubling," $W_{1}=1, W_{n}=2 W_{n-1}$, and the rule is to stop after the first win. For any positive $p$, play is certain to terminate. Here $F_{T}=F_{6}+1$, but of course infinite capital is required. If $F_{0}=2^{k}-1$ and $W_{n}$ cannot exceed $F_{n-1}$, the probability of $F_{\tau}=F_{0}+1$ in the fair case is $1-2^{-k}$. Prove this via Theorem 7.2 and also directly.
7.7. In "progress and pinch," the wager, initially some integer, is increased by 1 after a loss and decreased by 1 after a win, the stopping rule being to quit if the next bet is 0 . Show that play is certain to terminate if and only if $p \geq \frac{1}{2}$. Show that $F_{\tau}=F_{0}+\frac{1}{2} W_{1}^{2}+\frac{1}{2}(\tau-1)$. Infinite capital is required.
7.8. Here is a common martingale. Just before the $n$th spin of the wheel, the gambler has before him a pattern $x_{1}, \ldots, x_{k}$ of positive numbers ( $k$ varies with $n)$. He bets $x_{1}+x_{k}$, or $x_{1}$ in case $k=1$. If he loses, at the next stage he uses the pattern $x_{1}, \ldots, x_{k}, x_{1}+x_{k}\left(x_{1}, x_{1}\right.$ in case $\left.k=1\right)$. If he wins, at the next stage he uses the pattern $x_{2}, \ldots, x_{k-1}$, unless $k$ is 1 or 2 , in which case he quits. Show
that play is certain to terminate if $p>\frac{1}{3}$ and that the ultimate gain is the sum of the numbers in the initial pattern. Infinite capital is again required.
7.9. Suppose that $W_{k}=1$, so that $F_{k}=F_{0}+S_{k}$. Suppose that $p \geq q$ and $\tau$ is a stopping time such that $1 \leq \tau \leq n$ with probability 1 . Show that $E\left[F_{\tau}\right] \leq E\left[F_{n}\right]$, with equality in case $p=q$. Interpret this result in terms of a stock option that must be exercised by time $n$, where $F_{0}+S_{k}$ represents the price of the stock at time $k$.
7.10. For a given policy, let $A_{n}^{*}$ be the fortune of the gambler's adversary at time $n$. Consider these conditions on the policy. (i) $W_{n}^{*} \leq F_{n-1}^{*}$; (ii) $W_{n}^{*} \leq A_{n-1}^{*}$; (iii) $F_{n}^{*}+A_{n}^{*}$ is constant. Interpret each condition, and show that together they imply that the policy is bounded in the sense of (7.24).
7.11. Show that $F_{\tau}$ has infinite range if $F_{0}=1, W_{n}=2^{-n}$, and $\tau$ is the smallest $n$ for which $X_{n}=+1$.
7.12. Let $u$ be a real function on $[0,1], u(x)$ representing the utility of the fortune $x$. Consider policies bounded by 1 ; see (7.24). Let $Q_{\pi}\left(F_{0}\right)=E\left[u\left(F_{\tau}\right)\right]$; this represents the expected utility under the policy $\pi$ of an initial fortune $F_{0}$. Suppose of a policy $\pi_{0}$ that

$$
\begin{equation*}
u(x) \leq Q_{\pi_{0}}(x), \quad 0 \leq x \leq 1, \tag{7.34}
\end{equation*}
$$

and that

$$
\begin{align*}
Q_{\pi_{0}}(x) \geq p Q_{\pi_{0}}(x+t)+q Q_{\pi_{0}}(x-t) & ,  \tag{7.35}\\
& 0 \leq x-t \leq x \leq x+t \leq 1 .
\end{align*}
$$

Show that $Q_{\pi}(x) \leq Q_{\pi_{0}}(x)$ for all $x$ and all policies $\pi$. Such a $\pi_{0}$ is optimal.
Theorem 7.3 is the special case of this result for $p \leq \frac{1}{2}$, bold play in the role of $\pi_{0}$, and $u(x)=1$ or $u(x)=0$ according as $x=1$ or $x<1$.

The condition (7.34) says that gambling with policy $\pi_{0}$ is at least as good as not gambling at all; (7.35) says that, although the prospects even under $\pi_{0}$ become on the average less sanguine as time passes, it is better to use $\pi_{0}$ now than to use some other policy for one step and then change to $\pi_{0}$.
7.13. The functional equation (7.30) and the assumption that $Q$ is bounded suffice to determine $Q$ completely. First, $Q(0)$ and $Q(1)$ must be 0 and 1 , respectively, and so (7.31) holds. Let $T_{0} x=\frac{1}{2} x$ and $T_{1} x=\frac{1}{2} x+\frac{1}{2}$; let $f_{0} x=p x$ and $f_{1} x=p+q x$. Then $Q\left(T_{u_{1}} \cdots T_{u_{n}} x\right)=f_{u_{1}} \cdots f_{u_{n}} Q(x)$. If the binary expansions of $x$ and $y$ both begin with the digits $u_{1}, \ldots, u_{n}$, they have the form $x=T_{u_{1}} \ldots T_{u_{n}} x^{\prime}$ and $y=T_{u_{1}} \cdots T_{u_{n}} y^{\prime}$. If $K$ bounds $Q$ and if $m=\max \{p, q\}$, it follows that $|Q(x)-Q(y)| \leq K m^{n}$. Therefore, $Q$ is continuous and satisfies (7.31) and (7.33).

## SECTION 8. MARKOV CHAINS

As Markov chains illustrate in a clear and striking way the connection between probability and measure, their basic properties are developed here in a measure-theoretic setting.

## Definitions

Let $S$ be a finite or countable set. Suppose that to each pair $i$ and $j$ in $S$ there is assigned a nonnegative number $p_{i j}$ and that these numbers satisfy the constraint

$$
\begin{equation*}
\sum_{j \in S} p_{i j}=1, \quad i \in S . \tag{8.1}
\end{equation*}
$$

Let $X_{0}, X_{1}, X_{2}, \ldots$ be a sequence of random variables whose ranges are contained in $S$. The sequence is a Markov chain or Markov process if

$$
\begin{align*}
& P\left[X_{n+1}=j \mid X_{0}=i_{0}, \ldots, X_{n}=i_{n}\right]  \tag{8.2}\\
& \quad=P\left[X_{n+1}=j \mid X_{n}=i_{n}\right]=p_{i_{n} j}
\end{align*}
$$

for every $n$ and every sequence $i_{0}, \ldots, i_{n}$ in $S$ for which $P\left[X_{0}=i_{0}, \ldots, X_{n}=\right. \left.i_{n}\right]>0$. The set $S$ is the state space or phase space of the process, and the $p_{i j}$ are the transition probabilities. Part of the defining condition (8.2) is that the transition probability

$$
\begin{equation*}
P\left[X_{n+1}=j \mid X_{n}=i\right]=p_{i j} \tag{8.3}
\end{equation*}
$$

does not vary with $n .^{\dagger}$
The elements of $S$ are thought of as the possible states of a system, $X_{n}$ representing the state at time $n$. The sequence or process $X_{0}, X_{1}, X_{2}, \ldots$ then represents the history of the system, which evolves in accordance with the probability law (8.2). The conditional distribution of the next state $X_{n+1}$ given the present state $X_{n}$ must not further depend on the past $X_{0}, \ldots, X_{n-1}$. This is what (8.2) requires, and it leads to a copious theory.

The initial probabilities are

$$
\begin{equation*}
\alpha_{i}=P\left[X_{0}=i\right] . \tag{8.4}
\end{equation*}
$$

The $\alpha_{i}$ are nonnegative and add to 1 , but the definition of Markov chain places no further restrictions on them.

[^1]The following examples illustrate some of the possibilities. In each one, the state space $S$ and the transition probabilities $p_{i_{j}}$ are described. but the underlying probability space ( $\Omega, \mathscr{F}, P$ ) and the $X_{n}$ are left unspecified for now: see Theorem 8.1. ${ }^{\dagger}$

Example 8.1. The Bernoulli-Laplace model of diffusion. Imagine $r$ black balls and $r$ white balls distributed between two boxes, with the constraint that each box contains $r$ balls. The state of the system is specified by the number of white balls in the first box, so that the state space is $S=\{0,1, \ldots, r\}$. The transition mechanism is this: at each stage one ball is chosen at random from each box and the two are interchanged. If the present state is $i$, the chance of a transition to $i-1$ is the chance $i / r$ of drawing one of the $i$ white balls from the first box times the chance $i / r$ of drawing one of the $i$ black balls from the second box. Together with similar arguments for the other possibilities, this shows that the transition probabilities are

$$
p_{i, i-i}=\left(\frac{i}{r}\right)^{2}, \quad p_{i, i+1}=\left(\frac{r-i}{r}\right)^{2}, \quad p_{i i}=2 \frac{i(r-i)}{r^{2}},
$$

the others being 0 . This is the probablistic analogue of the model for the flow of two liquids between two containers. $\square$

The $p_{i j}$ form the transition matrix $P=\left[p_{i j}\right]$ of the process. A stochastic matrix is one whose entries are nonnegative and satisfy (8.1); the transition matrix of course has this property.

Example 8.2. Random walk with absorbing barriers. Suppose that $S= \{0,1, \ldots, r\}$ and

$$
P=\left[\begin{array}{ccccccccc}
1 & 0 & 0 & 0 & \ldots & 0 & 0 & 0 & 0 \\
q & 0 & p & 0 & \ldots & 0 & 0 & 0 & 0 \\
0 & q & 0 & p & \ldots & 0 & 0 & 0 & 0 \\
\hdashline 0 & 0 & 0 & 0 & \ldots & q & 0 & p & 0 \\
0 & 0 & 0 & 0 & \ldots & 0 & q & 0 & p \\
0 & 0 & 0 & 0 & \ldots & 0 & 0 & 0 & 1
\end{array}\right]
$$

That is, $p_{i, i+1}=p$ and $p_{i, i-1}=q=1-p$ for $0<i<r$ and $p_{00}=p_{r r}=1$. The chain represents a particle in random walk. The particle moves one unit to the right or left, the respective probabilities being $p$ and $q$, except that each of 0 and $r$ is an absorbing state-once the particle enters, it cannot leave. The state can also be viewed as a gambler's fortune; absorption in 0

[^2]represents ruin for the gambler, absorption in $r$ ruin for his adversary (see Section 7). The gambler's initial fortune is usually regarded as nonrandom, so that (see (8.4)) $\alpha_{i}=1$ for some $i$. $\square$

Example 8.3. Unrestricted random walk. Let $S$ consist of all the integers $i=0, \pm 1, \pm 2, \ldots$, and take $p_{i,+1}=p$ and $p_{i, i-1}=q=1-p$. This chain represents a random walk without barriers, the particle being free to move anywhere on the integer lattice. The walk is symmetric if $p=q$. $\square$

The state space may, as in the preceding example, be countably infinite. If so, the Markov chain consists of functions $X_{n}$ on a probability space $(\Omega, \mathscr{F}, P)$, but these will have infinite range and hence will not be random variables in the sense of the preceding sections. This will cause no difficulty, however, because expected values of the $X_{n}$ will not be considered. All that is required is that for each $i \in S$ the set $\left[\omega: X_{n}(\omega)=i\right]$ lie in $\mathscr{F}$ and hence have a probability.

Example 8.4. Symmetric random walk in space. Let $S$ consist of the integer lattice points in $k$-dimensional Euclidean space $R^{k} ; x=\left(x_{1}, \ldots, x_{k}\right)$ lies in $S$ if the coordinates are all integers. Now $x$ has $2 k$ neighbors, points of the form $y=\left(x_{1}, \ldots, x_{i} \pm 1, \ldots, x_{k}\right)$; for each such $y$ let $p_{x y}=(2 k)^{-1}$. The chain represents a particle moving randomly in space; for $k=1$ it reduces to Example 8.3 with $p=q=\frac{1}{2}$. The cases $k \leq 2$ and $k \geq 3$ exhibit an interesting difference. If $k \leq 2$, the particle is certain to return to its initial position, but this is not so if $k \geq 3$; see Example 8.6. $\square$

Since the state space in this example is not a subset of the line, the $X_{0}, X_{1}, \ldots$ do not assume real values. This is immaterial because expected values of the $X_{n}$ play no role. All that is necessary is that $X_{n}$ be a mapping from $\Omega$ into $S$ (finite or countable) such that $\left[\omega: X_{n}(\omega)=i\right] \in \mathscr{F}$ for $i \in S$. There will be expected values $E\left[f\left(X_{n}\right)\right]$ for real functions $f$ on $S$ with finite range, but then $f\left(X_{n}(\omega)\right)$ is a simple random variable as defined before.

Example 8.5. A selection problem. A princess must chose from among $r$ suitors. She is definite in her preferences and if presented with all $r$ at once could choose her favorite and could even rank the whole group. They are ushered into her presence one by one in random order, however, and she must at each stage either stop and accept the suitor or else reject him and proceed in the hope that a better one will come along. What strategy will maximize her chance of stopping with the best suitor of all?

Shorn of some details, the analysis is this. Let $S_{1}, S_{2}, \ldots, S_{r}$ be the suitors in order of presentation; this sequence is a random permutation of the set of suitors. Let $X_{1}=1$ and let $X_{2}, X_{3}, \ldots$ be the successive positions of suitors who dominate (are preferable to) all their predecessors. Thus $X_{2}=4$ and $X_{3}=6$ means that $S_{1}$ dominates $S_{2}$ and $S_{3}$ but $S_{4}$ dominates $S_{1}, S_{2}, S_{3}$, and that $S_{4}$ dominates $S_{5}$ but $S_{6}$ dominates $S_{1}, \ldots, S_{5}$. There can be at most $r$ of these dominant suitors; if there are exactly $m, X_{m+1}=X_{m+2}=\cdots=r+1$ by convention.

As the suitors arrive in random order, the chance that $S_{i}$ ranks highest among $S_{1}, \ldots, S_{i}$ is $(i-1)!/ i!=1 / i$. The chance that $S_{j}$ ranks highest among $S_{1}, \ldots, S_{j}$ and $S_{i}$ ranks next is $(j-2)!/ j!=1 / j(j-1)$. This leads to a chain with transition probabilities ${ }^{\dagger}$

$$
\begin{equation*}
P\left[X_{n+1}=j \mid X_{n}=i\right]=\frac{i}{j(j-1)}, \quad 1 \leq i<j \leq r \tag{8.5}
\end{equation*}
$$

If $X_{n}=i$, then $X_{n+1}=r+1$ means that $S_{i}$ dominates $S_{i+1}, ., S_{r}$ as well as $S_{1}, \ldots, S_{i}$, and the conditional probability of this is

$$
\begin{equation*}
P\left[X_{n+1}=r+1 \mid X_{n}=i\right]=\frac{i}{r}, \quad 1 \leq i \leq r \tag{8.6}
\end{equation*}
$$

As downward transitions are impossible and $r+1$ is absorbing, this specifies a transition matrix for $S=\{1,2, \ldots, r+1\}$.

It is quite clear that in maximizing her chance of selecting the best suitor of all, the princess should reject those who do not dominate their predecessors. Her strategy therefore will be to stop with the suitor in position $X_{\tau}$, where $\tau$ is a random variable representing her strategy. Since her decision to stop must depend only on the suitors she has seen thus far, the event $[\tau=n]$ must lie in $\sigma\left(X, \ldots, X_{n}\right)$ If $X_{\tau}=i$, then by (8.6) the conditional probability of success is $f(i)=i / r$. The probability of success is therefore $E\left[f\left(X_{\tau}\right)\right]$, and the problem is to choose the strategy $\tau$ so as to maximize it. For the solution, see Example $817 .^{\ddagger}$

## Higher-Order Transitions

The properties of the Markov chain are entirely determined by the transition and initial probabilities. The chain rule (4.2) for conditional probabilities gives

$$
\begin{aligned}
P\left[X_{0}=i_{0}\right. & \left., X_{1}=i_{1}, X_{2}=i_{2}\right] \\
& \quad=P\left[X_{0}=i_{0}\right] P\left[X_{1}=i_{1} \mid X_{0}=i_{0}\right] P\left[X_{2}=i_{2} \mid X_{0}=i_{0}, X_{1}=i_{1}\right] \\
& \quad=\alpha_{i_{1}} p_{i_{0} i_{1}} p_{i_{1} i_{2}}
\end{aligned}
$$

Similarly,

$$
\begin{equation*}
P\left[X_{t}=i_{t}, 0 \leq t \leq m\right]=\alpha_{i_{11}} p_{i_{01} i_{1}} \cdots p_{i_{m-1} i_{m}} \tag{8.7}
\end{equation*}
$$

for any sequence $i_{0}, i_{1}, \ldots, i_{m}$ of states.
Further,

$$
\begin{equation*}
P\left[X_{m+t}=j_{t}, 1 \leq t \leq n \mid X_{s}=i_{s}, 0 \leq s \leq m\right]=p_{i_{m} j_{1}} p_{j_{1} j_{2}} \cdots p_{j_{n-1} j_{n}} \tag{8.8}
\end{equation*}
$$

[^3]as follows by expressing the conditional probability as a ratio and applying (8.7) to numerator and denominator. Adding out the intermediate states now gives the formula
$$
\begin{align*}
p_{i j}^{(n)} & =P\left[X_{m+n}=j \mid X_{m}=i\right]  \tag{8.9}\\
& =\sum_{k_{1}} p_{k_{n-1}} p_{k_{1}} p_{k_{1} k_{2}} \ldots p_{k_{n-1} j}
\end{align*}
$$
(the $k_{l}$ range over $S$ ) for the $n$ th-order transition probabilities.
Notice that $p_{i j}^{(n)}$ is the entry in position $(i, j)$ of $P^{n}$, the $n$th power of the transition matrix $P$. If $S$ is infinite, $P$ is a matrix with infinitely many rows and columns; as the terms in (8.9) are nonnegative, there are no convergence problems. It is natural to put
$$
p_{i j}^{(0)}=\delta_{i j}= \begin{cases}1 & \text { if } i=j, \\ 0 & \text { if } i \neq j .\end{cases}
$$

Then $P^{0}$ is the identity $I$, as it should be. From (8.1) and (8.9) follow

$$
\begin{equation*}
p_{i j}^{(m+n)}=\sum_{\nu} p_{i \nu}^{(m)} p_{\nu j}^{(n)}, \quad \sum_{j} p_{i j}^{(n)}=1 . \tag{8.10}
\end{equation*}
$$

## An Existence Theorem

Theorem 8.1. Suppose that $P=\left[p_{i j}\right]$ is a stochastic matrix and that $\alpha_{i}$ are nonnegative numbers satisfying $\Sigma_{i \in S} \alpha_{i}=1$. There exists on some ( $\Omega, \mathscr{F}, P$ ) a Markov chain $X_{0}, X_{1}, X_{2}, \ldots$ with initial probabilities $\alpha_{i}$ and transition probabilities $p_{i j}$.

Proof. Reconsider the proof of Theorem 5.3. There the space $(\Omega, \mathscr{F}, P)$ was the unit interval, and the central part of the argument was the construction of the decompositions (5.13). Suppose for the moment that $S=\{1,2, \ldots\}$. First construct a partition $I_{1}^{(0)}, I_{2}^{(0)}, \ldots$ of ( 0,1 ] into countably many ${ }^{\dagger}$ subintervals of lengths ( $P$ is again Lebesgue measure) $P\left(I_{i}^{(0)}\right)=\alpha_{i}$. Next decompose each $I_{i}^{(0)}$ into subintervals $I_{i j}^{(1)}$ of lengths $P\left(I_{i j}^{(1)}\right)=\alpha_{i} p_{i j}$. Continuing inductively gives a sequence of partitions $\left\{I_{i_{0}}^{(n)}{ }_{i_{n}}: i_{0}, \ldots, i_{n}=1,2, \ldots\right\}$ such that each refines the preceding and $P\left(I_{i_{0}}^{(n)}{ }_{i_{n}}\right)=\alpha_{i_{0}} p_{i_{0} i_{1}} \cdots p_{i_{n-1} i_{n}}$.

Put $X_{n}(\omega)=i$ if $\omega \in \mathrm{U}_{i_{0} . i_{n-1}} I_{i_{0} . i_{n-1} \text {. }}{ }^{n}$. It follows just as in the proof of Theorem 5.3 that the set $\left[X_{0}=i_{0}, \ldots, X_{n}=i_{n}\right]$ coincides with the interval $I_{i_{0}}^{(n)} \ldots i_{n}$. Thus $P\left[X_{0}=i_{0}, \ldots, X_{n}=i_{n}\right]=\alpha_{i_{0}} p_{i_{0} i_{1}} \cdots p_{i_{n-1} i_{n}}$. From this it foilows immediately that (8.4) holds and that the first and third members of
${ }^{\dagger}$ If $\delta_{1}+\delta_{2}+\cdots=b-a$ and $\delta_{i} \geq 0$, then $I_{i}=\left(b-\sum_{j \leq i} \delta_{j}, b-\sum_{j<i} \delta_{j}\right], i=1,2, \ldots$, decompose $(a, b]$ into intervals of lengths $\delta_{i}$.
(8.2) are the same. As for the middle member, it is $P\left[X_{n}=i_{n}, X_{n+1}=\right. j] / P\left[X_{n}=i_{n}\right]$; the numerator is $\sum \alpha_{i_{0}} p_{i_{0} i_{1}} \cdots p_{i_{n-1} i_{n}} p_{i_{n} j}$ the sum extending over all $i_{0}, \ldots, i_{n-1}$, and the denominator is the same thing without the factor $p_{i_{n} j}$, which means that the ratio is $p_{i_{n} j}$, as required.

That completes the construction for the case $S=\{1,2, \ldots\}$. For the general countably infinite $S$, let $g$ be a one-to-one mapping of $\{1,2, \ldots\}$ onto $S$, and replace the $X_{n}$ as already constructed by $g\left(X_{n}\right)$; the assumption $S= \{1,2, \ldots\}$ was merely a notational convenience. The same argument obviously works if $S$ is finite. ${ }^{\dagger}$ $\square$

Although strictly speaking the Markov chain is the sequence $X_{0}$, $X_{1}, \ldots$, one often speaks as though the chain were the matrix $P$ together with the initial probabilities $\alpha_{i}$ or even $P$ with some unspecified set of $\alpha_{i}$. Theorem 8.1 justifies this attitude: For given $P$ and $\alpha_{i}$ the corresponding $X_{n}$ do exist, and the apparatus of probability theory-the Borel-Cantelli lemmas and so on-is available for the study of $P$ and of systems evolving in accordance with the Markov rule.

From now on fix a chain $X_{0}, X_{1}, \ldots$ satisfying $\alpha_{i}>0$ for all $i$. Denote by $P_{i}$ probabilities conditional on $\left[X_{0}=i\right]: P_{i}(A)=P\left[A \mid X_{0}=i\right]$. Thus

$$
\begin{equation*}
P_{i}\left[X_{t}=i_{t}, 1 \leq t \leq n\right]=p_{i i_{1}} p_{i_{1} i_{2}} \cdots p_{i_{n-1} i_{n}} \tag{8.11}
\end{equation*}
$$

by (8.8). The interest centers on these conditional probabilities, and the actual initial probabilities $\alpha_{i}$ are now largely irrelevant.

From (8.11) follows

$$
\begin{align*}
P_{i}\left[X_{1}\right. & \left.=i_{1}, \ldots, X_{m}=i_{m}, X_{m+1}=j_{1}, \ldots, X_{m+n}=j_{n}\right]  \tag{8.12}\\
& =P_{i}\left[X_{1}=i_{1}, \ldots, X_{m}=i_{m}\right] P_{i_{m}}\left[X_{1}=j_{1}, \ldots, X_{n}=j_{n}\right]
\end{align*}
$$

Suppose that $I$ is a set (finite or infinite) of $m$-long sequences of states, $J$ is a set of $n$-long sequences of states, and every sequence in $I$ ends in $j$. Adding both sides of (8.12) for ( $i_{1}, \ldots, i_{m}$ ) ranging over $I$ and ( $j_{1}, \ldots, j_{n}$ ) ranging over $J$ gives

$$
\begin{align*}
& P_{i}\left[\left(X_{1}, \ldots, X_{m}\right) \in I,\left(X_{m+1}, \ldots, X_{m+n}\right) \in J\right]  \tag{8.13}\\
& \quad=P_{i}\left[\left(X_{1}, \ldots, X_{m}\right) \in I\right] P_{j}\left[\left(X_{1}, \ldots, X_{n}\right) \in J\right] .
\end{align*}
$$

For this to hold it is essential that each sequence in $I$ end in $j$. The formulas (8.12) and (8.13) are of central importance.

[^4]
## Transience and Persistence

Let

$$
\begin{equation*}
f_{i j}^{(n)}=P_{i}\left[X_{1} \neq j, \ldots, X_{n-1} \neq j, X_{n}=j\right] \tag{8.14}
\end{equation*}
$$

be the probability of a first visit to $j$ at time $n$ for a system that starts in $i$, and let

$$
\begin{equation*}
f_{i j}=P_{i}\left(\bigcup_{n=1}^{\infty}\left[X_{n}=j\right]\right)=\sum_{n=1}^{\infty} f_{i j}^{(n)} \tag{8.15}
\end{equation*}
$$

be the probabiiity of an eventual visit. A state $i$ is persistent if a system starting at $i$ is certain somerime to return to $i: f_{i i}=1$. The state is transient in the opposite case: $f_{i i}<1$.

Suppose that $n_{1}, \ldots, n_{k}$ are integers satisfying $1 \leq n_{1}<\cdots<n_{k}$ and consider the event that the system visits $j$ at times $n_{1} \ldots n_{k}$ but not in between; this event is determined by the conditions

$$
\begin{array}{ccc}
X_{1} \neq j, \ldots, & X_{n_{1}-1} \neq j, & X_{n_{1}}=j, \\
X_{n_{1}+1} \neq j, \ldots, & X_{n_{2}-1} \neq j, & X_{n_{2}}=j, \\
\vdots & \\
X_{n_{k-1}+1} \neq j, \ldots, & X_{n_{k}-1} \neq j, & X_{n_{k}}=j .
\end{array}
$$

Repeated application of (8.13) shows that under $P_{i}$ the probability of this event is $f_{i j}^{\left(n_{1}\right)} f_{j j}^{\left(n_{2}-n_{1}\right)} \cdots f_{j j}^{\left(n_{k}-n_{k-1}\right)}$. Add this over the $k$-tuples $n_{1}, \ldots, n_{k}$ : the $P_{i}$-probability that $X_{n}=j$ for at least $k$ different values of $n$ is $f_{i j} f_{j i}^{k-1}$. Letting $k \rightarrow \infty$ therefore gives

$$
P_{i}\left[X_{n}=j \text { i.o. }\right]= \begin{cases}0 & \text { if } f_{j j}<1,  \tag{8.16}\\ f_{i j} & \text { if } f_{j j}=1 .\end{cases}
$$

Recall that i.o. means infinitely often. Taking $i=j$ gives

$$
P_{i}\left[X_{n}=i \text { i.o. }\right]=\left\{\begin{array}{ll}
0 & \text { if } f_{i i}<1  \tag{8.17}\\
1 & \text { if } f_{i i}=1
\end{array} .\right.
$$

Thus $P_{i}\left[X_{n}=i\right.$ i.o. $]$ is either 0 or 1 ; compare the zero-one law (Theorem 4.5), but note that the events $\left[X_{n}=i\right]$ here are not in general independent. ${ }^{\dagger}$
${ }^{\dagger}$ See Problem 8.35

## Theorem 8.2.

(i) Transience of $i$ is equivalent to $P_{i}\left[X_{n}=i\right.$ i.o. $]=0$ and to $\sum_{n} p_{i i}^{(n)}<\infty$.
(ii) Persistence of $i$ is equivalent to $P_{i}\left[X_{n}=i\right.$ i.o. $]=1$ and to $\sum_{n} p_{i i}^{(n)}=\infty$.

Proof. By the first Borel- Cantelli lemma, $\sum_{n} p_{i i}^{(n)}<\infty$ implies $P_{i}\left[X_{n}=i\right.$ i.o. $]=0$, which by (8.17) in turn implies $f_{i i}<1$. The entire theorem will be proved if it is shown that $f_{i i}<1$ implies $\sum_{n} p_{i i}^{(n)}<\infty$.

The proof uses a first-passage argument: By (8.13),

$$
\begin{aligned}
p_{i j}^{(n)} & =P_{i}\left[X_{n}=j\right]=\sum_{s=0}^{n-1} P_{i}\left[X_{1} \neq j, \ldots, X_{n-s-1} \neq j, X_{n-s}=j, X_{n}=j\right] \\
& =\sum_{s=0}^{n-1} P_{i}\left[X_{1} \neq j, \ldots, X_{n-s-1} \neq j, X_{n-s}=j\right] P_{j}\left[X_{s}=j\right] \\
& =\sum_{s=0}^{n-1} f_{i j}^{(n-s)} p_{j j}^{(s)} .
\end{aligned}
$$

Therefore,

$$
\begin{aligned}
\sum_{t=1}^{n} p_{i i}^{(t)} & =\sum_{t=1}^{n} \sum_{s=0}^{t-1} f_{i i}^{(t-s)} p_{i i}^{(s)} \\
& =\sum_{s=0}^{n-1} p_{i i}^{(s)} \sum_{t=s+1}^{n} f_{i i}^{(t-s)} \leq \sum_{s=0}^{n} p_{i i}^{(s)} f_{i i} .
\end{aligned}
$$

Thus $\left(1-f_{i i}\right) \sum_{i=1}^{n} p_{i i}^{(t)} \leq f_{i i}$, and if $f_{i i}<1$, this puts a bound on the partial sums $\sum_{t=1}^{n} p_{i i}^{(t)}$.

Example 8.6. Pólya's theorem. For the symmetric $k$-dimensional random walk (Example 8.4), all states are persistent if $k=1$ or $k=2$, and all states are transient if $k \geq 3$. To prove this, note first that the probability $p_{i i}^{(n)}$ of return in $n$ steps is the same for all states $i$; denote this probability by $a_{n}^{(k)}$ to indicate the dependence on the dimension $k$. Clearly, $a_{2 n+1}^{(k)}=0$. Suppose that $k=1$. Since return in $2 n$ steps means $n$ steps east and $n$ steps west,

$$
a_{2 n}^{(1)}=\binom{2 n}{n} \frac{1}{2^{2 n}} .
$$

By Stirling's formula, $a_{2 n}^{(1)} \sim(\pi n)^{-1 / 2}$. Therefore, $\sum_{n} a_{n}^{(1)}=\infty$, and all states are persistent by Theorem 8.2.

In the plane, a return to the starting point in $2 n$ steps means equal numbers of steps east and west as well as equal numbers north and south:

$$
\begin{aligned}
a_{2 n}^{(2)} & =\sum_{u=0}^{n} \frac{(2 n)!}{u!u!(n-u)!(n-u)!} \frac{1}{4^{2 n}} \\
& =\frac{1}{4^{2 n}}\binom{2 n}{n} \sum_{u=0}^{n}\binom{n}{u}\binom{n}{n-u} .
\end{aligned}
$$

It can be seen on combinatorial grounds that the last sum is $\binom{2 n}{n}$, and so $a_{2 n}^{(2)}=\left(a_{2 n}^{(1)}\right)^{2} \sim(\pi n)^{-1}$. Again, $\Sigma_{n} a_{n}^{(2)}=\infty$ and every state is persistent.

For three dimensions,

$$
a_{2 n}^{(3)}=\sum \frac{(2 n)!}{u!u!v!v!(n-u-v)!(n-u-v)!} \frac{1}{6^{2 n}},
$$

the sum extending over nonnegative $u$ and $v$ satisfying $u+v \leq n$. This reduces to

$$
\begin{equation*}
a_{2 n}^{(3)}=\sum_{i=0}^{n}\binom{2 n}{2 l}\left(\frac{1}{3}\right)^{2 n-2 l}\left(\frac{2}{3}\right)^{2 l} a_{2 n-2 l}^{(1)} a_{2 l}^{(2)}, \tag{8.18}
\end{equation*}
$$

as can be checked by substitution. (To see the probabilistic meaning of this formula, condition on there being $2 n-2 l$ steps parallel to the vertical axis and $2 l$ steps parallel to the horizontal plane.) It will be shown that $a_{2 n}^{(3)}= O\left(n^{-3 / 2}\right)$, which will imply that $\sum_{n} a_{n}^{(3)}<\infty$. The terms in (8.18) for $l=0$ and $l=n$ are each $O\left(n^{-3 / 2}\right)$ and hence can be omitted. Now $a_{u}^{(1)} \leq K u^{-1 / 2}$ and $a_{u}^{(2)} \leq K u^{-1}$, as already seen, and so the sum in question is at most

$$
K^{2} \sum_{l=1}^{n-1}\binom{2 n}{2 l}\left(\frac{1}{3}\right)^{2 n-2 l}\left(\frac{2}{3}\right)^{2 l}(2 n-2 l)^{-1 / 2}(2 l)^{-1} .
$$

Since $(2 n-2 l)^{-1 / 2} \leq 2 n^{1 / 2}(2 n-2 l)^{-1} \leq 4 n^{1 / 2}(2 n-2 l+1)^{-1}$ and $(2 l)^{-1} \leq 2(2 l+1)^{-1}$, this is at most a constant times

$$
n^{1 / 2} \frac{(2 n)!}{(2 n+2)!} \sum_{l=1}^{n-1}\binom{2 n+2}{2 l-1}\left(\frac{1}{3}\right)^{2 n-2 l+1}\left(\frac{2}{3}\right)^{2 l+1}=O\left(n^{-3 / 2}\right) .
$$

Thus $\sum_{n} a_{n}^{(3)}<\infty$, and the states are transient. The same is true for $k=4,5, \ldots$, since an inductive extension of the argument shows that $a_{n}^{(k)}=O\left(n^{-k / 2}\right)$.

It is possible for a system starting in $i$ to reach $j\left(f_{i j}>0\right)$ if and only if $p_{i j}^{(n)}>0$ for some $n$. If this is true for all $i$ and $j$, the Markov chain is irreducible.

Theorem 8.3. If the Markov chain is irreducible, then one of the following two alternatives holds.
(i) All states are transient, $P_{i}\left(\bigcup_{j}\left[X_{n}=j\right.\right.$ i.o. $\left.]\right)=0$ for all $i$, and $\sum_{n} p_{i j}^{(n)}<\infty$ for all $i$ and $j$.
(ii) All states are persistent, $P_{i}\left(\cap_{j}\left[X_{n}=j\right.\right.$ i.o. $\left.]\right)=1$ for all $i$, and $\sum_{n} p_{i j}^{(n)}=\infty$ for all $i$ and $j$.

The irreducible chain itself can accordingly be called persistent or transient. In the persistent case the system visits every state infinitely often. In the transient case it visits each state only finitely often, hence visits each finite set only finitely often, and so may be said to go to infinity.

Proof. For each $i$ and $j$ there exist $r$ and $s$ such that $\rho_{i j}^{(r)}>0$ and $p_{j i}^{(s)}>0$. Now

$$
\begin{equation*}
p_{i i}^{(r \pm s+n)} \geq p_{i j}^{(r)} p_{j j}^{(n)} p_{j i}^{(s)}, \tag{8.19}
\end{equation*}
$$

and from $p_{i j}^{(r)} p_{j i}^{(s)}>0$ it follows that $\sum_{n} p_{i i}^{(n)}<\infty$ implies $\sum_{n} p_{j j}^{(n)}<\infty$ : if one state is transient, they all are. In this case (8.16) gives $P_{i}\left[X_{n}=j\right.$ i.o. $]=0$ for all $i$ and $j$, so that $P_{i}\left(\cup_{j}\left[X_{n}=j\right.\right.$ i.o. $\left.]\right)=0$ for all $i$. Since $\sum_{n=1}^{\infty} p_{i j}^{(n)}= \sum_{n=1}^{\infty} \sum_{\nu=1}^{n} f_{i j}^{(\nu)} p_{j j}^{(n-\nu)}=\sum_{\nu=1}^{\infty} f_{i j}^{(\nu)} \sum_{m=0}^{\infty} p_{j j}^{(m)} \leq \sum_{m=0}^{\infty} p_{j j}^{(m)}$, it follows that if $j$ is transient, then (Theorem 8.2) $\sum_{n} p_{i j}^{(n)}$ converges for every $i$.

The other possibility is that all states are persistent. In this case $P_{j}\left[X_{n}=j\right.$ i.o. $]=1$ by Theorem 8.2, and it follows by (8.13) that

$$
\begin{aligned}
p_{j i}^{(m)} & =P_{j}\left(\left[X_{m}=i\right] \cap\left[X_{n}=j \text { i.o. }\right]\right) \\
& \leq \sum_{n>m} P_{j}\left[X_{m}=i, X_{m+1} \neq j, \ldots, X_{n-1} \neq j, X_{n}=j\right] \\
& =\sum_{n>m} p_{j i}^{(m)} f_{i j}^{(n-m)}=p_{j i}^{(m)} f_{i j} .
\end{aligned}
$$

There is an $m$ for which $p_{j i}^{(m)}>0$, and therefore $f_{i j}=1$. By (8.16), $P_{i}\left[X_{n}=j\right.$ i.o.] $=f_{i j}=1$. If $\sum_{n} p_{i j}^{(n)}$ were to converge for some $i$ and $j$, it would follow by the first Borel-Cantelli lemma that $P_{i}\left[X_{n}=j\right.$ i.o. $]=0$. $\square$

Example 8.7. Since $\sum_{j} p_{i j}^{(n)}=1$, the first alternative in Theorem 8.3 is impossible if $S$ is finite: a finite, irreducible Markov chain is persistent. $\square$

Example 8.8. The chain in Pólya's theorem is certainly irreducible. If the dimension is 1 or 2 , there is probability 1 that a particle in symmetric random walk visits every state infinitely often. If the dimension is 3 or more, the particle goes to infinity. $\square$

Example 8.9. Consider the unrestricted random walk on the line (Example 8.3). According to the ruin calculation (7.8), $f_{01}=p / q$ for $p<q$. Since the chain is irreducible, all states are transient. By symmetry, of course, the chain is also transient if $p>q$, although in this case (7.8) gives $f_{01}=1$. Thus $f_{i j}=1(i \neq j)$ is possible in the transient case. ${ }^{\dagger}$

If $p=q=\frac{1}{2}$, the chain is persistent by Pólya's theorem. If $n$ and $j-i$ have the same parity,

$$
p_{i j}^{(n)}=\binom{n}{\frac{n+j-i}{2}} \frac{1}{2^{n}}, \quad|j-i| \leq n .
$$

This is maximal if $j=i$ or $j=i \pm 1$, and by Stirling's formula the maximal value is of order $n^{-1 / 2}$. Therefore, $\lim _{n} p_{i j}^{(n)}=0$, which always holds in the transient case but is thus possible in the persistent case as well (see Theorem 8.8).

## Another Criterion for Persistence

Let $Q=\left[q_{i j}\right]$ be a matrix with rows and columns indexed by the elements of a finite or countable set $U$. Suppose it is substochastic in the sense that $q_{i j} \geq 0$ and $\sum_{j} q_{i j} \leq 1$. Let $Q^{n}=\left[q_{i j}^{(n)}\right]$ be the $n$th power, so that

$$
\begin{equation*}
q_{i j}^{(n+1)}=\sum_{\nu} q_{i \nu} q_{\nu j}^{(n)}, \quad q_{i j}^{(0)}=\delta_{i j} \tag{8.20}
\end{equation*}
$$

Consider the row sums

$$
\begin{equation*}
\sigma_{i}^{(n)}=\sum_{j} q_{i j}^{(n)} . \tag{8.21}
\end{equation*}
$$

From (8.20) follows

$$
\begin{equation*}
\sigma_{i}^{(n+1)}=\sum_{j} q_{i j} \sigma_{j}^{(n)} . \tag{8.22}
\end{equation*}
$$

Since $Q$ is substochastic $\sigma_{i}^{(1)} \leq 1$, and hence $\sigma_{i}^{(n+1)}=\sum_{j} \sum_{v} q_{i v}^{(n)} q_{\nu j}= \sum_{\nu} q_{i \nu}^{(n)} \sigma_{\nu}^{(1)} \leq \sigma_{i}^{(n)}$. Therefore, the monotone limits

$$
\begin{equation*}
\sigma_{i}=\lim _{n} \sum_{j} q_{i j}^{(n)} \tag{8.23}
\end{equation*}
$$

${ }^{\dagger}$ But for each $j$ there must be some $i \neq j$ for which $f_{i j}<1$; see Problem 8.7.
exist. By (8.22) and the Weierstrass $M$-test [A28], $\sigma_{i}=\sum_{i} q_{i j} \sigma_{j}$. Thus the $\sigma_{i}$ solve the system

$$
\begin{cases}x_{i}=\sum_{j \in U} q_{i j} x_{j}, & i \in U,  \tag{8.24}\\ 0 \leq x_{i} \leq 1, & i \in U .\end{cases}
$$

For an arbitrary solution, $x_{i}=\sum_{j} q_{i j} x_{j} \leq \sum_{i} q_{i j}=\sigma_{i}^{(1)}$, and $x_{i} \leq \sigma_{i}^{(1)}$ for all $i$ implies $x_{i} \leq \sum_{j} q_{i j} \sigma_{j}^{(n)}=\sigma_{i}^{(n+1)}$ by (8.22). Thus $x_{i} \leq \sigma_{i}^{(n)}$ for all $n$ by induction, and so $x_{i} \leq \sigma_{i}$. Thus the $\sigma_{i}$ give the maximal solution to (8.24):

Lemma 1. For a substochastic matrix $Q$ the limits (8.23) are the maximal solution of (8.24).

Now suppose that $U$ is a subset of the state space $S$. The $p_{i j}$ for $i$ and $j$ in $U$ give a substochastic matrix $Q$. The row sums (8.21) are $\sigma_{i}^{(n)}=\sum p_{i j_{1}} p_{i j_{2}} \cdots p_{i_{n-1} l_{n}}$, where the $j_{1}, \ldots, j_{n}$ range over $U$, and so $\sigma_{i}^{(n)}=P_{i}\left[X_{\imath} \in U, t \leq n\right]$. Let $n \rightarrow \infty$ :

$$
\begin{equation*}
\sigma_{i}=P_{i}\left[X_{t} \in U, t=1,2 \ldots\right], \quad i \in U . \tag{8.25}
\end{equation*}
$$

In this case, $\sigma_{i}$ is thus the probability that the system remains forever in $U$, given that it starts at $i$. The following theorem is now an immediate consequence of Lemma 1.

Theorem 8.4. For $U \subset S$ the probabilities (8.25) are the maximal solution of the system

$$
\begin{cases}x_{i}=\sum_{j \in U} p_{i j} x_{j}, & i \in U,  \tag{8.26}\\ 0 \leq x_{i} \leq 1, & i \in U .\end{cases}
$$

The constraint $x_{i} \geq 0$ in (8.26) is in a sense redundant: Since $x_{i} \equiv 0$ is a solution, the maximal solution is automatically nonnegative (and similarly for (8.24)). And the maximal solution is $x_{i} \equiv 1$ if and only if $\sum_{j \in U} p_{i j}=1$ for all $i$ in $U$, which makes probabilistic sense.

Example 8.10. For the random walk on the line consider the set $U= \{0,1,2, \ldots\}$. The System (8.26) is

$$
\begin{aligned}
& x_{i}=p x_{i+1}+q x_{i-1}, \quad i \geq 1, \\
& x_{0}=p x_{1} .
\end{aligned}
$$

It follows [A19] that $x_{n}=A+A n$ if $p=q$ and $x_{n}=A-A(q / p)^{n+1}$ if $p \neq q$. The only bounded solution is $x_{n} \equiv 0$ if $q \geq p$, and in this case there is
probability 0 of staying forever among the nonnegative integers. If $q<p$, $A=1$ gives the maximal solution $x_{n}=1-(q / p)^{n+1}$ (and $0 \leq A<1$ gives exactly the solutions that are not maximal). Compare (7.8) and Example 8.9. $\square$

Now consider the system (8.26) with $U=S-\left\{i_{0}\right\}$ for an arbitrary single state $i_{0}$ :

$$
\begin{cases}x_{i}=\sum_{j \neq i_{0}} p_{i j} x_{j}, & i \neq i_{0},  \tag{8.27}\\ 0 \leq x_{i} \leq 1, & i \neq i_{0} .\end{cases}
$$

There is always the trivial solution-the one for which $x_{i} \equiv 0$.
Theorem 8.5. An irreducible chain is transient if and only if (8.27) has a nontrivial solution.

Proof. The probabilities

$$
\begin{equation*}
1-f_{i i_{0}}=P_{i}\left[X_{n} \neq i_{0}, n \geq 1\right], \quad i \neq i_{0}, \tag{8.28}
\end{equation*}
$$

are by Theorem 8.4 the maximal solution of (8.27). Therefore (8.27) has a nontrivial solution if and only if $f_{i i_{\mathbf{~}}}<1$ for some $i \neq i_{0}$. If the chain is persistent, this is impossible by Theorem 8.3(ii).

Suppose the chain is transient. Since

$$
\begin{aligned}
f_{i_{0} i_{0}} & =P_{i_{0}}\left[X_{1}=i_{0}\right]+\sum_{n=2}^{\infty} \sum_{i \neq i_{0}} P_{i_{0}}\left[X_{1}=i, X_{2} \neq i_{0}, \ldots, X_{n-1} \neq i_{0}, X_{n}=i_{0}\right] \\
& =p_{i_{0} i_{0}}+\sum_{i \neq i_{0}} p_{i_{0}} f_{i i_{0}}
\end{aligned}
$$

and since $f_{i_{0} i_{0}}<1$, it follows that $f_{i i_{0}}<1$ for some $i \neq i_{0}$. $\square$

Since the equations in (8.27) are homogeneous, the issue is whether they have a solution that is nonnegative, nontrivial, and bounded. If they do, $0 \leq x_{i} \leq 1$ can be arranged by rescaling. ${ }^{\dagger}$

[^5]Example 8.11. In the simplest of queueing models the state space is $\{0,1,2, \ldots\}$ and the transition matrix has the form

$$
\left[\begin{array}{ccccccc}
t_{0} & t_{1} & t_{2} & 0 & 0 & 0 & \cdots \\
t_{0} & t_{1} & t_{2} & 0 & 0 & 0 & \cdots \\
0 & t_{0} & t_{1} & t_{2} & 0 & 0 & \cdots \\
0 & 0 & t_{0} & t_{1} & t_{2} & 0 & \cdots \\
0 & 0 & 0 & t_{0} & t_{1} & t_{2} & \cdots \\
\cdots & \cdots & \cdots & \cdots & \cdots
\end{array}\right]
$$

If there are $i$ customers in the queue and $i \geq 1$, the customer at the head of the queue is served and leaves, and then 0,1 , or 2 new customers arrive (probabilities $t_{0}, t_{1}, t_{2}$ ), which leaves a queue of length $i-1$, $i$, or $i+1$. If $i=0$, no one is served, and the new customers bring the queue length to 0,1 , or 2 . Assume that $t_{0}$ and $t_{2}$ are positive, so that the chain is irreducible.

For $i_{0}=0$ the system (8.27) is

$$
\begin{align*}
& x_{1}=t_{1} x_{1}+t_{2} x_{2} \\
& x_{k}=t_{0} x_{k-1}+t_{1} x_{k}+t_{2} x_{k+1}, \quad k \geq 2 . \tag{8.29}
\end{align*}
$$

Since $t_{0}, t_{1}, t_{2}$ have the form $q(1-t), t, p(1-t)$ for appropriate $p, q, t$, the second line of (8.29) has the form $x_{k}=p x_{k+1}+q x_{k-1}, k \geq 2$. Now the solution [A19] is $A+B(q / p)^{k}=A+B\left(t_{0} / t_{2}\right)^{k}$ if $t_{0} \neq t_{2}(p \neq q)$ and $A+B k$ if $t_{0}=t_{2}(p=q)$, and $A$ can be expressed in terms of $B$ because of the first equation in (8.29). The result is

$$
x_{k}= \begin{cases}B\left(\left(t_{0} / t_{2}\right)^{k}-1\right) & \text { if } t_{0} \neq t_{2}, \\ B k & \text { if } t_{0}=t_{2} .\end{cases}
$$

There is a nontrivial solution if $t_{0}<t_{2}$ but not if $t_{0} \geq t_{2}$.
If $t_{0}<t_{2}$, the chain is thus transient, and the queue size goes to infinity with proability 1 . If $t_{0} \geq t_{2}$, the chain is persistent. For a nonempty queue the expected increase in queue length in one step is $t_{2}-t_{0}$, and the queue goes out of control if and only if this is positive.

## Stationary Distributions

Suppose that the chain has initial probabilities $\pi_{i}$ satisfying

$$
\begin{equation*}
\sum_{i \in S} \pi_{i} p_{i j}=\pi_{j}, \quad j \in S . \tag{8.30}
\end{equation*}
$$

It then follows by induction that

$$
\begin{equation*}
\sum_{i \in S} \pi_{i} p_{i j}^{(n)}=\pi_{j}, \quad j \in S, \quad n=0,1,2, \ldots \tag{8.31}
\end{equation*}
$$

If $\pi_{i}$ is the probability that $X_{0}=i$, then the left side of (8.31) is the probability that $X_{n}=j$, and thus (8.30) implies that the probability of [ $X_{n}=j$ ] is the same for all $n$. A set of probabilities satisfying (8.30) is for this reason called a stationary distribution. The existence of such a distribution implies that the chain is very stable.

To discuss this requires the notion of periodicity. The state $j$ has period $t$ if $p_{j j}^{(n)}>0$ implies that $t$ divides $n$ and if $t$ is the largest integer with this property. In other words, the period of $j$ is the greatest common divisor of the set of integers

$$
\begin{equation*}
\left[n: n \geq 1, p_{j j}^{(n)}>0\right] . \tag{8.32}
\end{equation*}
$$

If the chain is irreducible, then for each pair $i$ and $j$ there exist $r$ and $s$ for which $p_{i j}^{(r)}$ and $p_{j i}^{(s)}$ are positive, and of course

$$
\begin{equation*}
p_{i i}^{(r+s+n)} \geq p_{i j}^{(r)} p_{j j}^{(n)} p_{j i}^{(s)} . \tag{8.33}
\end{equation*}
$$

Let $t_{i}$ and $t_{j}$ be the periods of $i$ and $j$. Taking $n=0$ in this inequality shows that $t_{i}$ divides $r+s$; and now it follows by the inequality that $p_{j j}^{(n)}>0$ implies that $t_{i}$ divides $r+s+n$ and hence divides $n$. Thus $t_{i}$ divides each integer in the set (8.32), and so $t_{i} \leq t_{j}$. Since $i$ and $j$ can be interchanged in this argument, $i$ and $j$ have the same period. One can thus speak of the period of the cnain itself in the irreducible case. The random walk on the line has period 2 , for example. If the period is 1 , the chain is aperiodic

Lemma 2. In an irreducible, aperiodic chain, for each $i$ and $j, p_{i j}^{(n)}>0$ for all $n$ exceeding some $n_{0}(i, j)$.

Proof. Since $p_{j j}^{(m+n)} \geq p_{j j}^{(m)} p_{j j}^{(n)}$, if $M$ is the set (8.32) then $m \in M$ and $n \in M$ together imply $m+n \in M$. But it is a fact of number theory [A21] that if a set of positive integers is closed under addition and has greatest common divisor 1 , then it contains all integers exceeding some $n_{1}$. Given $i$ and $j$, choose $r$ so that $p_{i j}^{(r)}>0$. If $n>n_{0}=n_{1}+r$, then $p_{i j}^{(n)} \geq p_{i j}^{(r)} p_{j j}^{(n-r)}>0$.

Theorem 8.6. Suppose of an irreducible, aperiodic chain that there exists a stationary distribution-a solution of (8.30) satisfying $\pi_{i} \geq 0$ and $\sum_{i} \pi_{i}=1$. Then the chain is persistent,

$$
\begin{equation*}
\lim _{n} p_{i j}^{(n)}=\pi_{j} \tag{8.34}
\end{equation*}
$$

for all $i$ and $j$, the $\pi_{i}$ are all positive, and the stationary distribution is unique.

The main point of the conclusion is that the effect of the initial state wears off. Whatever the actual initial distribution $\left\{\alpha_{i}\right\}$ of the chain may be, if (8.34) holds, then it follows by the $M$-test that the probability $\sum_{i} \alpha_{i} p_{i j}^{(n)}$ of $\left[X_{n}=j\right]$ converges to $\pi_{j}$.

Proof. If the chain is transient, then $p_{i j}^{(n)} \rightarrow 0$ for all $i$ and $j$ by Theorem 8.3, and it follows by (8.31) and the $M$-test that $\pi_{j}$ is identically 0 , which contradicts $\sum_{i} \pi_{i}=1$. The existence of a stationary distribution therefore implies that the chain is persistent.

Consider now a Markov chain with state space $S \times S$ and transition probabilities $p(i j, k l)=p_{i k} p_{j l}$ (it is easy to verify that these form a stochastic matrix). Call this the coupled chain; it describes the joint behavior of a pair of independent systems, each evolving according to the laws of the original Markov chain. By Theorem 8.1 there exists a Markov chain $\left(X_{n}, Y_{n}\right), n= 0,1, \ldots$, having positive initial probabilities and transition probabilities

$$
P\left[\left(X_{n+1}, Y_{n+1}\right)=(k, l) \mid\left(X_{n}, Y_{n}\right)=(i, \jmath)\right]=p(i j, k l) .
$$

For $n$ exceeding some $n_{0}$ depending on $i . j, k, l$, the probability $p^{(n)}(i j, k l)=p_{i k}^{(n)} p_{j l}^{(n)}$ is positive by Lemma 2. Therefore, the coupled chain is irreducible. (This proof that the coupled chain is irreducible requires only the assumptions that the original chain is irreducible and aperiodic, a fact needed again in the proof of Theorem 8.7.)

It is easy to check that $\pi(i j)=\pi_{i} \pi_{j}$ forms a set of stationary initial probabilities for the coupled chain, which, like the original one, must therefore be persistent. It follows that, for an arbitrary initial state $(i, j)$ for the chain $\left\{\left(X_{n}, Y_{n}\right)\right\}$ and an arbitrary $i_{0}$ in $S$, one has $P_{i j}\left[\left(X_{n}, Y_{n}\right)=\left(i_{0}, i_{0}\right)\right.$ i.o. $]=1$. If $\tau$ is the smallest integer such that $X_{\tau}=Y_{\tau}=i_{0}$, then $\tau$ is finite with probability 1 under $P_{i j}$. The idea of the proof is now this: $X_{n}$ starts in $i$ and $Y_{n}$ starts in $j$; once $X_{n}=Y_{n}=i_{0}$ occurs, $X_{n}$ and $Y_{n}$ follow identical probability laws, and hence the initial states $i$ and $j$ will lose their influence.

By (8.13) applied to the coupled chain, if $m \leq n$, then

$$
\begin{aligned}
P_{i j}\left[\left(X_{n},\right.\right. & \left.\left.Y_{n}\right)=(k, l), \tau=m\right] \\
& =P_{i j}\left[\left(X_{i}, Y_{t}\right) \neq\left(i_{0}, i_{0}\right), t<m,\left(X_{m}, Y_{m}\right)=\left(i_{0}, i_{0}\right)\right] \\
& \quad \times P_{i_{0} l_{0}}\left[\left(X_{n-m}, Y_{n-m}\right)=(k, l)\right] \\
= & P_{i j}[\tau=m] p_{i_{0} k}^{(n-m)} p_{i_{0} l}^{(n-m)} .
\end{aligned}
$$

Adding out $l$ gives $P_{i j}\left[X_{n}=k, \tau=m\right]=P_{i j}[\tau=m] p_{i_{0} k}^{(n-m)}$, and adding out $k$ gives $P_{i j}\left[Y_{n}=l, \tau=m\right]=P_{i j}[\tau=m] p_{i_{0} l}^{(n-m)}$. Take $k=l$, equate probabilities, and add over $m=1, \ldots, n$ :

$$
P_{i j}\left[X_{n}=k, \tau \leq n\right]=P_{i j}\left[Y_{n}=k, \tau \leq n\right] .
$$

From this follows

$$
\begin{aligned}
P_{i j}\left[X_{n}=k\right] & \leq P_{i j}\left[X_{n}=k, \tau \leq n\right]+P_{i j}[\tau>n] \\
& =P_{i j}\left[Y_{n}=k, \tau \leq n\right]+P_{i j}[\tau>n] \\
& \leq P_{i j}\left[Y_{n}=k\right]+P_{i j}[\tau>n] .
\end{aligned}
$$

This and the same inequality with $X$ and $Y$ interchanged give

$$
\left|p_{i k}^{(n)}-p_{j k}^{(n)}\right|=\left|P_{i j}\left[X_{n}=k\right]-P_{i j}\left[Y_{n}=k\right]\right| \leq P_{i j}[\tau>n] .
$$

Since $\tau$ is finite with probability 1 ,

$$
\begin{equation*}
\lim _{n}\left|p_{i k}^{(n)}-p_{j k}^{(n)}\right|=0 . \tag{8.35}
\end{equation*}
$$

(This proof of (8.35) goes through as long as the coupled chain is irreducible and persistent - no assumptions on the original chain are needed. This fact is used in the proof of the next theorem.)

By (8.31), $\pi_{k}-p_{j k}^{(n)}=\sum_{i} \pi_{i}\left(p_{i k}^{(n)}-p_{j k}^{(n)}\right)$, and this goes to 0 by the $M$-test if (8.35) holds. Thus $\lim _{n} p_{j k}^{(n)}=\pi_{k}$. As this holds for each stationary distribution, there can be only one of them.

It remains to show that the $\pi_{j}$ are all strictly positive. Choose $r$ and $s$ so that $p_{i j}^{(r)}$ and $p_{j i}^{(s)}$ are positive. Letting $n \rightarrow \infty$ in (8.33) shows that $\pi_{i}$ is positive if $\pi_{j}$ is; since some $\pi_{j}$ is positive (they add to 1 ), all the $\pi_{i}$ must be positive. $\square$

Example 8.12. For the queueing model in Example 8.11 the equations (8.30) are

$$
\begin{aligned}
\pi_{0} & =\pi_{0} t_{0}+\pi_{1} t_{0} \\
\pi_{1} & =\pi_{0} t_{1}+\pi_{1} t_{1}+\pi_{2} t_{0} \\
\pi_{2} & =\pi_{0} t_{2}+\pi_{1} t_{2}+\pi_{2} t_{1}+\pi_{3} t_{0}, \\
\pi_{k} & =\pi_{k-1} t_{2}+\pi_{k} t_{1}+\pi_{k+1} t_{0}, \quad k \geq 3 .
\end{aligned}
$$

Again write $t_{0}, t_{1}, t_{2}$, as $q(1-t), t, p(1-t)$. Since the last equation here is $\pi_{k}=q \pi_{k+1}+p \pi_{k-1}$, the solution is

$$
\pi_{k}= \begin{cases}A+B(p / q)^{k}=A+B\left(t_{2} / t_{0}\right)^{k} & \text { if } t_{0} \neq t_{2}, \\ A+B k & \text { if } t_{0}=t_{2}\end{cases}
$$

for $k \geq 2$. If $t_{0}<t_{2}$ and $\sum \pi_{k}$ converges, then $\pi_{k} \equiv 0$, and hence there is no stationary distribution; but this is not new, because it was shown in Example 8.11 that the chain is transient in this case. If $t_{0}=t_{2}$, there is again no
stationary distribution, and this is new because the chain was in Example 8.11 shown to be persistent in this case.

If $t_{0}>t_{2}$, then $\sum \pi_{k}$ converges, provided $A=0$. Solving for $\pi_{0}$ and $\pi_{1}$ in the first two equations of the system above gives $\pi_{0}=B t_{2}$ and $\pi_{1}=B t_{2}(1- \left.t_{0}\right) / t_{0}$. From $\Sigma_{k} \pi_{k}=1$ it now follows that $B=\left(t_{0}-t_{2}\right) / t_{2}$, and the $\pi_{k}$ can be written down explicitly. Since $\pi_{k}=B\left(t_{2} / t_{0}\right)^{k}$ for $k \geq 2$, there is small chance of a large queue length. $\square$

If $t_{0}=t_{2}$ in this queueing model, the chain is persistent (Example 8.11) but has no stationary distribution (Example 8.12). The next theorem describes the asymptotic behavior of the $p_{i j}^{(n)}$ in this case.

Theorem 8.7. If an irreducible, aperiodic chain has no stationary distribution, then

$$
\begin{equation*}
\lim _{n} p_{i j}^{(n)}=0 \tag{8.36}
\end{equation*}
$$

for all $i$ and $j$.
If the chain is transient, (8.36) follows from Theorem 8.3. What is interesting here is the persistent case.

Proof. By the argument in the proof of Theorem 8.6, the coupled chain is irreducible. If it is transient, then $\sum_{n}\left(p_{i j}^{(n)}\right)^{2}$ converges by Theorem 8.2, and the conclusion follows.

Suppose, on the other hand, that the coupled chain is (irreducible and) persistent. Then the stopping-time argument leading to (8.35) goes through as before. If the $p_{i j}^{(n)}$ do not all go to 0 , then there is an increasing sequence $\left\{n_{u}\right\}$ of integers along which some $p_{l_{j}}^{(n)}$ is bounded away from 0 . By the diagonal method [A14], it is possible by passing to a subsequence of \{ $n_{v}$ \} to ensure that each $p_{i j}^{\left(n_{u}\right)}$ converges to a limit, which by (8.35) must be independent of $i$. Therefore, there is a sequence $\left\{n_{u}\right\}$ such that $\lim _{u} p_{i j}^{\left(n_{u}\right)}=t_{j}$ exists for all $i$ and $j$, where $t_{j}$ is nonnegative for all $j$ and positive for some $j$. If $M$ is a finite set of states, then $\sum_{j \in M} t_{j}=\lim _{u} \sum_{j \in M} p_{i j}^{\left(n_{u}\right)} \leq 1$, and hence $0< t=\sum_{j} t_{j} \leq 1$. Now $\sum_{k \in M} p_{i k}^{\left(n_{u}\right)} p_{k j} \leq p_{i j}^{\left(n_{u}+1\right)}=\sum_{k} p_{i k} p_{k j}^{\left(n_{u}\right)}$; it is possible to pass to the limit ( $u \rightarrow \infty$ ) inside the first sum (if $M$ is finite) and inside the second sum (by the $M$-test), and hence $\sum_{k \in M} t_{k} p_{k j} \leq \sum_{k} p_{i k} t_{j}=t_{j}$. Therefore, $\sum_{k} t_{k} p_{k j} \leq t_{j}$; if one of these inequalities were strict, it would follow that $\sum_{k} t_{k}=\sum_{j} \sum_{k} t_{k} p_{k j}<\sum_{j} t_{j}$, which is impossible. Therefore $\sum_{k} t_{k} p_{k j}=t_{j}$ for all $j$, and the ratios $\pi_{j}=t_{j} / t$ give a stationary distribution, contrary to the hypothesis. $\square$

The limits in (8.34) and (8.36) can be described in terms of mean return times. Let

$$
\begin{equation*}
\mu_{j}=\sum_{n=1}^{\infty} n f_{j j}^{(n)} ; \tag{8.37}
\end{equation*}
$$

if the series diverges, write $\mu_{j}=\infty$. In the persistent case, this sum is to be thought of as the average number of steps to first return to $j$, given that $X_{0}=j .^{\dagger}$

Lemma 3. Suppose that $j$ is persistent and that $\lim _{n} p_{j j}^{(n)}=u$. Then $u>0$ if and only if $\mu_{j}<\infty$, in which case $u=1 / \mu_{j}$.

Under the convention that $0=1 / \infty$, the case $u=0$ and $\mu_{j}=\infty$ is consistent with the equation $u=1 / \mu_{j}$.

Proof. For $k \geq 0$ let $\rho_{k}=\sum_{n>k} f_{j j}^{(n)}$; the notation does not show the dependence on $j$, which is fixed. Consider the double series

$$
\begin{aligned}
f_{j i}^{(1)}+f_{j j}^{(2)}+f_{j j}^{(3)}+\cdots \\
+f_{j i}^{(2)}+f_{j j}^{(3)}+\cdots \\
+f_{j j}^{(3)}+\cdots \\
+\cdots
\end{aligned}
$$

The $k$ th row sums to $\rho_{k}(k \geq 0)$ and the $n$th column sums to $n f_{j j}^{(n)}(n \geq 1)$, and so [A27] the series in (8.37) converges if and only if $\sum_{k} \rho_{k}$ does, in which case

$$
\begin{equation*}
\mu_{j}=\sum_{k=0}^{\infty} \rho_{h} . \tag{8.38}
\end{equation*}
$$

Since $j$ is persistent, the $P_{j}$-probability that the system does not hit $j$ up to time $n$ is the probability that it hits $j$ after time $n$, and this is $\rho_{n}$. Therefore,

$$
\begin{aligned}
1-p_{j j}^{(n)} & =P_{i}\left[X_{n} \neq j\right] \\
& =P_{j}\left[X_{1} \neq j, \ldots, X_{n} \neq j\right]+\sum_{k=1}^{n-1} P_{j}\left[X_{k}=j, X_{k+1} \neq j, \ldots, X_{n} \neq j\right] \\
& =\rho_{n}+\sum_{k=1}^{n-1} p_{j j}^{(k)} \rho_{n-k},
\end{aligned}
$$

and since $\rho_{0}=1$,

$$
1=\rho_{0} p_{j j}^{(n)}+\rho_{1} p_{j j}^{(n-1)}+\cdots+\rho_{n-1} p_{j j}^{(1)}+\rho_{n} p_{j j}^{(0)} .
$$

Keep only the first $k+1$ terms on the right here, and let $n \rightarrow \infty$; the result is $1 \geq\left(\rho_{0}+\cdots+\rho_{k}\right) u$. Therefore $u>0$ implies that $\Sigma_{k} \rho_{k}$ converges, so that $\mu_{j}<\infty$.
${ }^{\dagger}$ Since in general there is no upper bound to the number of steps to first return, it is not a simple random variable. It does come under the general theory in Chapter 4, and its expected value is indeed $\mu_{j}$ (and (838) is just (5.29)), but for the present the interpretation of $\mu_{j}$ as an average is informal See Problem 23.11

Write $x_{n k}=\rho_{k} p_{j j}^{(n-k)}$ for $0 \leq k \leq n$ and $x_{n k}=0$ for $n<k$. Then $0 \leq x_{n k} \leq \rho_{k}$ and $\lim _{n} x_{n k}=\rho_{k} u$. If $\mu_{j}<\infty$, then $\sum_{k} \rho_{k}$ converges and it follows by the $M$-test that $1=\sum_{k=0}^{\infty} x_{n k} \rightarrow \sum_{k=0}^{\infty} \rho_{k} u$. By (8.38), $1=\mu_{j} u$, so that $u>0$ and $u=1 / \mu_{j}$.

The law of large numbers bears on the relation $u=1 / \mu_{j}$ in the persistent case. Let $V_{n}$ be the number of visits to state $j$ up to time $n$. If the time from one visit to the next is about $\mu_{j}$, then $V_{n}$ should be about $n / \mu_{j}: V_{n} / n \approx 1 / \mu_{j}$. But (if $X_{0}=j$ ) $V_{n} / n$ has expected value $n^{-1} \sum_{k=1}^{n} p_{j j}^{(k)}$, which goes to $u$ under the hypothesis of Lemma 3 [A30].

Consider an irreducible, aperiodic, persistent chain. There are two possibilities. If there is a stationary distribution, then the limits (8.34) are positive, and the chain is called positive persistent. It then follows by Lemma 3 that $\mu_{j}<\infty$ and $\pi_{j}=1 / \mu$, for all $j$. In this case, it is not actually necessary to assume persistence, since this follows from the existence of a stationary distribution. On the other hand, if the chair has no stationary distribution, then the limits (8.36) are all 0 , and the chain is called null persistent It then follows by Lemma 3 that $\mu_{j}=\infty$ for all $j$. This, taken together with Theorem 8.3 , provides a complete classification:

Theorem 8.8. For an irreducible, aperiodic chain there are three possibilities:
(i) The chain is transient; then for all $i$ and $j, \lim _{n} p_{i j}^{(n)}=0$ and in fact $\sum_{n} p_{i j}^{(n)}<\infty$.
(ii) The chain is persistent but there exists no stationary distribution (the null persistent case); then for all $i$ and $j, p_{i j}^{(n)}$ goes to 0 but so slowly that $\sum_{n} p_{i j}^{(n)}=\infty$, and $\mu_{j}=\infty$.
(iii) There exist stationary probabilities $\pi_{j}$ and (hence) the chain is persistent (the positive persistent case); then for all $i$ and $j, \lim _{n} p_{i j}^{(n)}=\pi_{j}>0$ and $\mu_{j}=1 / \pi_{j}<\infty$.

Since the asymptotic properties of the $p_{i j}^{(n)}$ are distinct in the three cases, these asymptotic properties in fact characterize the three cases.

Example 8.13. Suppose that the states are $0,1,2, \ldots$ and the transition matrix is

$$
\left[\begin{array}{ccccc}
q_{0} & p_{0} & 0 & 0 & \cdots \\
q_{1} & 0 & p_{1} & 0 & \cdots \\
q_{2} & 0 & 0 & p_{2} & \cdots \\
\cdots & \cdots & \cdots & \cdots
\end{array}\right]
$$

where $p_{i}$ and $q_{i}$ are positive. The state $i$ represents the length of a success
run, the conditional chance of a further success being $p_{i}$. Clearly the chain is irreducible and aperiodic.

A solution of the system (8.27) for testing for transience (with $i_{0}=0$ ) must have the form $x_{k}=x_{1} / p_{1} \cdots p_{k-1}$. Hence there is a bounded, nontrivial solution, and the chain is transient, if and only if the limit $\alpha$ of $p_{0} \cdots p_{n}$ is positive. But the chance of no return to 0 (for initial state 0 ) in $n$ steps is clearly $p_{0} \cdots p_{n-1}$; hence $f_{00}=1-\alpha$, which checks: the chain is persistent if and only if $\alpha=0$.

Every solution of the steady-state equations (8.30) has the form $\pi_{k}=\pi_{0} p_{0} \cdots p_{k-1}$. Hence there is a stationary distribution if and only if $\sum_{k} p_{0} \cdots p_{k}$ converges; this is the positive persistent case. The null persistent case is that in which $p_{0} \cdots p_{k} \rightarrow 0$ but $\sum_{k} p_{0} \cdots p_{k}$ diverges (which happens, for example, if $q_{k}=1 / k$ for $k>1$ ).

Since the chance of no return to 0 in $n$ steps is $p_{0} \cdots p_{n-1}$, in the persistent case (8.38) gives $\mu_{0}=\sum_{k=0}^{\infty} p_{0} \cdots p_{k-1}$. In the null persistent case this checks with $\mu_{0}=\infty$; in the positive persistent case it gives $\mu_{0}= \sum_{k=0}^{\infty} \pi_{k} / \pi_{0}=1 / \pi_{0}$, which again is consistent. $\square$

Example 8.14. Since $\sum_{j} p_{i j}^{(n)}=1$, possibilities (i) and (ii) in Theorem 8.8 are impossible in the finite case: A finite, irreducible, aperiodic Markov chain has a stationary distribution. $\square$

## Exponential Convergence*

In the finite case, $p_{i j}^{(n)}$ converges to $\pi_{j}$ at an exponential rate:
Theorem 8.9. If the state space is finite and the chain is irreducible and aperiodic, then there is a stationary distribution $\left\{\pi_{i}\right\}$, and

$$
\left|p_{i j}^{(n)}-\pi_{j}\right| \leq A \rho^{n},
$$

where $A \geq 0$ and $0 \leq \rho<1$.
Proof. ${ }^{\dagger} \quad$ Let $m_{j}^{(n)}=\min _{i} p_{i j}^{(n)}$ and $M_{j}^{(n)}=\max _{i} p_{i j}^{(n)}$. By (8.10),

$$
\begin{aligned}
& m_{j}^{(n+1)}=\min _{i} \sum_{\nu} p_{i \nu} p_{\nu j}^{(n)} \geq \min _{i} \sum_{\nu} p_{i \nu} m_{j}^{(n)}=m_{j}^{(n)}, \\
& M_{j}^{(n+1)}=\max _{i} \sum_{\nu} p_{i \nu} p_{\nu j}^{(n)} \leq \max _{i} \sum_{\nu} p_{i \nu} M_{j}^{(n)}=M_{j}^{(n)} .
\end{aligned}
$$

[^6]Since obviously $m_{j}^{(n)} \leq M_{j}^{(n)}$,

$$
\begin{equation*}
0 \leq m_{j}^{(1)} \leq m_{j}^{(2)} \leq \cdots \leq M_{j}^{(2)} \leq M_{j}^{(1)} \leq 1 . \tag{8.39}
\end{equation*}
$$

Suppose temporarily that all the $p_{i j}$ are positive. Let $s$ be the number of states and let $\delta=\min _{i j} p_{i j}$. From $\sum_{j} p_{i j} \geq s \delta$ follows $0<\delta \leq s^{-1}$. Fix states $u$ and $v$ for the moment; let $\Sigma^{\prime}$ denote the summation over $j$ in $S$ satisfying $p_{u j} \geq p_{v j}$ and let $\sum^{\prime \prime}$ denote summation over $j$ satisfying $p_{u j}<p_{v j}$. Then

$$
\begin{equation*}
\sum^{\prime}\left(p_{u j}-p_{\iota j}\right)+\sum^{\prime \prime}\left(p_{u j}-p_{v j}\right)=1-1=0 . \tag{8.40}
\end{equation*}
$$

Since $\Sigma^{\prime} p_{v j}+\Sigma^{\prime \prime} p_{u j} \geq s \delta$.

$$
\begin{equation*}
\sum^{\prime}\left(p_{u j}-p_{\iota j}\right)=1-\sum^{\prime \prime} p_{u j}-\sum^{\prime} p_{\iota j} \leq 1-s \delta . \tag{8.41}
\end{equation*}
$$

Apply (8.40) and then (8.41):

$$
\begin{aligned}
p_{u k}^{(n+1)}-p_{\imath k}^{(n+1)} & =\sum_{j}\left(p_{u j}-p_{v j}\right) p_{j k}^{(n)} \\
& \leq \sum^{\prime}\left(p_{u j}-p_{v j}\right) M_{k}^{(n)}+\sum^{\prime \prime}\left(p_{u j}-p_{\imath j}\right) m_{k}^{(n)} \\
& =\sum^{\prime}\left(\rho_{u j}-p_{\iota j}\right)\left(M_{k}^{(n)}-m_{k}^{(n)}\right) \\
& \leq(1-s \delta)\left(M_{k}^{(n)}-m_{k}^{(n)}\right) .
\end{aligned}
$$

Since $u$ and $v$ are arbitrary,

$$
M_{k}^{(n+1)}-m_{k}^{(n+1)} \leq(1-s \delta)\left(M_{k}^{(n)}-m_{k}^{(n)}\right) .
$$

Therefore, $M_{k}^{(n)}-m_{k}^{(n)} \leq(1-s \delta)^{n}$. It follows by (8.39) that $m_{j}^{(n)}$ and $M_{j}^{(n)}$ have a common limit $\pi_{j}$ and that

$$
\begin{equation*}
\left|p_{i j}^{(n)}-\pi_{j}\right| \leq(1-s \delta)^{n} . \tag{8.42}
\end{equation*}
$$

Take $A=1$ and $\rho=1-\mathrm{s} \delta$. Passing to the limit in $\sum_{i} p_{\nu i}^{(n)} p_{i j}=p_{\nu j}^{(n+1)}$ shows that the $\pi_{i}$ are stationary probabilities. (Note that the proof thus far makes almost no use of the preceding theory.)

If the $p_{i j}$ are not all positive, apply Lemma 2: Since there are only finitely many states, there exists an $m$ such that $p_{i j}^{(m)}>0$ for all $i$ and $j$. By the case just treated, $M_{j}^{(m t)}-m_{j}^{(m t)} \leq \rho^{\prime}$. Take $A=\rho^{-1}$ and then replace $\rho$ by $\rho^{1 / m}$. $\square$

Example 8.15. Suppose that

$$
P=\left[\begin{array}{llll}
p_{0} & p_{1} & \cdots & p_{s-1} \\
p_{s-1} & p_{0} & \cdots & p_{s-2} \\
\cdots & \cdots & \cdots & \cdots \\
p_{1} & p_{2} & \cdots & p_{0}
\end{array}\right] .
$$

The rows of $P$ are the cyclic permutations of the first row: $p_{i j}=p_{j-i}, j-i$ reduced modulo $s$. Since the columns of $P$ add to 1 as well as the rows, the steady-state equations (8.30) have the solution $\pi_{i} \equiv s^{-1}$. If the $p_{i}$ are all positive, the theorem implies that $p_{i j}^{(n)}$ converges to $s^{-1}$ at an exponential rate. If $X_{0}, Y_{1}, Y_{2}, \ldots$ are independent random variables with range $\{0,1, \ldots, s-1\}$, if each $Y_{n}$ has distribution $\left\{p_{0}, \ldots, p_{s-1}\right\}$, and if $X_{n}= X_{0}+Y_{1}+\cdots+Y_{n}$, where the sum is reduced modulo $s$, then $P\left[X_{n}=j\right] \rightarrow s^{-1}$. The $X_{n}$ describe a random walk on a circle of points, and whatever the initial distribution, the positions become equally likely in the limit. $\square$

## Optimal Stopping*

Assume throughout the rest of the section that $S$ is finite. Consider a function $\tau$ on $\Omega$ for which $\tau(\omega)$ is a nonnegative integer for each $\omega$. Let $\mathscr{F}_{n}= \sigma\left(X_{0}, X_{1}, \ldots, X_{n}\right) ; \tau$ is a stopping time or a Markov time if

$$
\begin{equation*}
[\omega: \tau(\omega)=n] \in \mathscr{F}_{n} \tag{8.43}
\end{equation*}
$$

for $n=0,1, \ldots$. This is analogous to the condition (7.18) on the gambler's stopping time. It will be necessary to allow $\tau(\omega)$ to assume the special value $\infty$, but only on a set of probability 0 . This has no effect on the requirement (8.43), which concerns finite $n$ only.

If $f$ is a real function on the state space, then $f\left(X_{0}\right), f\left(X_{1}\right), \ldots$ are simple random variables. Imagine an observer who follows the successive states $X_{0}, X_{1}, \ldots$ of the system. He stops at time $\tau$, when the state is $X_{\tau}$ (or $X_{\tau(\omega)}(\omega)$ ), and receives an reward or payoff $f\left(X_{\tau}\right)$. The condition (8.43) prevents prevision on the part of the observer. This is a kind of game, the stopping time is a strategy, and the problem is to find a strategy that maximizes the expected payoff $E\left[f\left(X_{\tau}\right)\right]$. The problem in Example 8.5 had this form; there $S=\{1,2, \ldots, r+1\}$, and the payoff function is $f(i)=i / r$ for $i \leq r($ set $f(r+1)=0)$.

If $P(A)>0$ and $Y=\sum_{j} y_{j} I_{B_{j}}$ is a simple random variable, the $B_{j}$ forming a finite decomposition of $\Omega$ into $\mathscr{F}$-sets, the conditional expected value of $Y$

[^7]given $A$ is defined by
$$
E[Y \mid A]=\sum_{j} y_{i} P\left(B_{j} \mid A\right) .
$$

Denote by $E_{i}$ conditional expected values for the case $A=\left[X_{0}=i\right]$ :

$$
E_{i}[Y]=E\left[Y \mid X_{0}=i\right]=\sum_{j} y_{j} P_{i}\left(B_{j}\right) .
$$

The stopping-time problem is to choose $\tau$ so as to maximize simultaneously $E_{i}\left[f\left(X_{\tau}\right)\right]$ for all initial states $i$. If $x$ lies in the range of $f$, which is finite, and if $\tau$ is everywhere finite, then $\left[\omega: f\left(X_{\tau(\omega)}(\omega)\right)=x\right]=\bigcup_{n=0}^{\infty}[\omega: \tau(\omega)=n$, $\left.f\left(X_{n}(\omega)\right)=x\right]$ lies in $\mathscr{F}$, and so $f\left(X_{\tau}\right)$ is a simple random variable. In order that this always hold, put $f\left(X_{\tau(\omega)}(\omega)\right)=0$, say, if $\tau(\omega)=\infty$ (which happens only on a set of probability 0 ).

The game with payoff function $f$ has at $i$ the value

$$
\begin{equation*}
v(i)=\sup E_{i}\left[f\left(X_{\tau}\right)\right], \tag{8.44}
\end{equation*}
$$

the supremum extending over all Markov times $\tau$. It will turn out that the supremum here is achieved: there always exists an optimal stopping time. It will also turn out that there is an optimal $\tau$ that works for all initial states $i$. The problem is to calculate $v(i)$ and find the best $\tau$. If the chain is irreducible, the system must pass through every state, and the best strategy is obviously to wait until the system enters a state for which $f$ is maximal. This describes an optimal $\tau$, and $v(i)=\max f$ for all $i$. For this reason the interesting cases are those in which some states are transient and others are absorbing ( $p_{i i}=1$ ).

A function $\varphi$ on $S$ is excessive or superharmonic, if ${ }^{\dagger}$

$$
\begin{equation*}
\varphi(i) \geq \sum_{j} p_{i j} \varphi(j), \quad i \in S . \tag{8.45}
\end{equation*}
$$

In terms of conditional expectation the requirement is $\varphi(i) \geq E_{i}\left[\varphi\left(X_{1}\right)\right]$.
Lemma 4. The value function $v$ is excessive.
Proof. Given $\epsilon$, choose for each $j$ in $S$ a "good" stopping time $\tau_{j}$ satisfying $E_{j}\left[f\left(X_{\tau_{j}}\right)\right]>v(j)-\epsilon$. By (8.43), $\left[\tau_{j}=n\right]=\left[\left(X_{0}, \ldots, X_{n}\right) \in I_{j n}\right]$ for some set $I_{j n}$ of ( $n+1$ )-long sequences of states. Set $\tau=n+1(n \geq 0)$ on the set $\left[X_{1}=j\right] \cap\left[\left(X_{1}, \ldots, X_{n+1}\right) \in I_{j n}\right]$; that is, take one step and then from the new state $X_{1}$ add on the "good" stopping time for that state. Then $\tau$ is a

[^8]stopping time and
$$
\begin{aligned}
E_{i}\left[f\left(X_{\tau}\right)\right] & =\sum_{n=0}^{\infty} \sum_{j} \sum_{k} P_{i}\left[X_{1}=j,\left(X_{1}, \ldots, X_{n+1}\right) \in I_{j n}, X_{n+1}=k\right] f(k) \\
& =\sum_{n=0}^{\infty} \sum_{j} \sum_{k} p_{i j} P_{j}\left[\left(X_{0}, \ldots, X_{n}\right) \in I_{j n}, X_{n}=k\right] f(k) \\
& =\sum_{j} p_{i j} E_{j}\left[f\left(X_{\tau_{j}}\right)\right] .
\end{aligned}
$$

Therefore, $v(i) \geq E_{i}\left[f\left(X_{\tau}\right)\right] \geq \sum_{j} p_{i j}(v(j)-\epsilon)=\sum_{j} p_{i j} v(j)-\epsilon$. Since $\epsilon$ was arbitrary, $v$ is excessive. $\square$

Lemma 5. Suppose that $\varphi$ is excessive.
(i) For all stopping times $\tau, \varphi(i) \geq E_{i}\left[\varphi\left(X_{\tau}\right)\right]$.
(ii) For all pairs of stopping times satisfying $\sigma \leq \tau, E_{i}\left[\varphi\left(X_{\sigma}\right)\right] \geq E_{i}\left[\varphi\left(X_{\tau}\right)\right]$.

Part (i) says that for an excessive payoff function, $\tau \equiv 0$ represents an optimal strategy.

Proof. To prove (i), put $\tau_{N}=\min \{\tau, N\}$. Then $\tau_{N}$ is a stopping time, and

$$
\begin{align*}
E_{i}\left[\varphi\left(X_{r_{N}}\right)\right]= & \sum_{n=0}^{N-1} \sum_{k} P_{i}\left[\tau=n, X_{n}=k\right] \varphi(k)  \tag{8.46}\\
& +\sum_{k} P_{i}\left[\tau \geq N, X_{N}=k\right] \varphi(k)
\end{align*}
$$

Since $[\tau \geq N]=[\tau<N]^{c} \in F_{N-1}$, the final sum here is by (8.13)

$$
\begin{aligned}
& \sum_{k} \sum_{j} P_{i}\left[\tau \geq N, X_{N-1}=j, X_{N}=k\right] \varphi(k) \\
& \quad=\sum_{k} \sum_{j} P_{i}\left[\tau \geq N, X_{N-1}=j\right] p_{j k} \varphi(k) \leq \sum_{j} P_{i}\left[\tau \geq N, X_{N-1}=j\right] \varphi(j)
\end{aligned}
$$

Substituting this into (8.46) leads to $E_{i}\left[\varphi\left(X_{\tau_{N}}\right)\right] \leq E_{i}\left[\varphi\left(X_{\tau_{N-1}}\right)\right]$. Since $\tau_{0}=0$ and $E_{i}\left[\varphi\left(X_{0}\right)\right]=\varphi(i)$, it follows that $E_{i}\left[\varphi\left(X_{\tau_{N}}\right)\right] \leq \varphi(i)$ for all $N$. But for $\tau(\omega)$ finite, $\varphi\left(X_{\tau_{N}(\omega)}(\omega)\right) \rightarrow \varphi\left(X_{\tau(\omega)}(\omega)\right)$ (there is equality for large $N$ ), and so $E_{i}\left[\varphi\left(X_{\tau_{N}}\right)\right] \rightarrow E_{i}\left[\varphi\left(X_{\tau}\right)\right]$ by Theorem 5.4.

The proof of (ii) is essentially the same. If $\tau_{N}=\min \{\tau, \sigma+N\}$, then $\tau_{N}$ is a stopping time, and

$$
\begin{aligned}
E_{i}\left[\varphi\left(X_{\tau_{N}}\right)\right]= & \sum_{m=0}^{\infty} \sum_{n=0}^{N-1} \sum_{k} P_{i}\left[\sigma=m, \tau=m+n, X_{m+n}=k\right] \varphi(k) \\
& +\sum_{m=0}^{\infty} \sum_{k} P_{i}\left[\sigma=m, \tau \geq m+N, X_{m+N}=k\right] \varphi(k)
\end{aligned}
$$

Since $[\sigma=m, \tau \geq m+N]=[\sigma=m]-[\sigma=m, \tau<m+N] \in \mathscr{F}_{m+N-1}$, again $E_{i}\left[\varphi\left(X_{\tau_{N}}\right)\right] \leq E_{i}\left[\varphi\left(X_{\tau_{N-1}}\right)\right] \leq E_{i}\left[\varphi\left(X_{\tau_{0}}\right)\right]$. Since $\tau_{0}=\sigma$, part (ii) follows from part (i) by another passage to the limit.

Lemma 6. If an excessive function $\varphi$ dominates the payoff function $f$, then it dominates the value function $v$ as well.

By definition, to say that $g$ dominates $h$ is to say that $g(i) \geq h(i)$ for all $i$.

Proof. By Lemma 5, $\varphi(i) \geq E_{i}\left[\varphi\left(X_{\tau}\right)\right] \geq E_{i}\left[f\left(X_{\tau}\right)\right]$ for all Markov times $\tau$, and so $\varphi(i) \geq v(i)$ for all $i$.

Since $\tau \equiv 0$ is a stopping time, $v$ dominates $f$. Lemmas 4 and 6 immediately characterize $v$ :

Theorem 8.10. The value function $v$ is the minimal excessive function dominating $f$.

There remains the problem of constructing the optimal strategy $\tau$. Let $M$ be the set of states $i$ for which $v(i)=f(i) ; M$, the support set, is nonempty, since it at least contains those $i$ that maximize $f$. Let $A=\bigcap_{n=0}^{\infty}\left[X_{n} \notin M\right]$ be the event that the system never enters $M$. The following argument shows that $P_{i}(A)=0$ for each $i$. As this is trivial if $M=S$, assume that $M \neq S$. Choose $\delta>0$ so that $f(i) \leq v(i)-\delta$ for $i \in S-M$. Now $E_{i}\left[f\left(X_{\tau}\right)\right]=\sum_{n=0}^{\infty} \sum_{k} P_{i}[\tau=n$, $\left.X_{n}=k\right] f(k)$; replacing the $f(k)$ by $v(k)$ or $v(k)-\delta$ according as $k \in M$ or $k \in S-M$ gives $E_{i}\left[f\left(X_{\tau}\right)\right] \leq E_{i}\left[v\left(X_{\tau}\right)\right]-\delta P_{i}\left[X_{\tau} \in S-M\right] \leq E_{i}\left[v\left(X_{\tau}\right)\right]- \delta P_{i}(A) \leq v(i)-\delta P_{i}(A)$, the last inequality by Lemmas 4 and 5 . Since this holds for every Markov time, taking the supremum over $\tau$ gives $P_{i}(A)=0$. Whatever the initial state, the system is thus certain to enter the support set $M$.

Let $\tau_{0}(\omega)=\min \left[n: X_{n}(\omega) \in M\right]$ be the hitting time for $M$. Then $\tau_{0}$ is a Markov time, and $\tau_{0}=0$ if $X_{0} \in M$. It may be that $X_{n}(\omega) \notin M$ for all $n$, in which case $\tau_{0}(\omega)=\infty$, but as just shown, the probability of this is 0 .

Theorem 8.11. The hitting time $\tau_{0}$ is optimal: $E_{i}\left[f\left(X_{\tau_{0}}\right)\right]=v(i)$ for all $i$.
Proof. By the definition of $\tau_{0}, f\left(X_{\tau_{0}}\right)=v\left(X_{\tau_{0}}\right)$. Put $\varphi(i)=E_{i}\left[f\left(X_{\tau_{0}}\right)\right]= E_{i}\left[v\left(X_{\tau_{0}}\right)\right]$. The first step is to show that $\varphi$ is excessive. If $\tau_{\mathrm{l}}=\min [n$ : $\left.n \geq 1, X_{n} \in M\right]$, then $\tau_{1}$ is a Markov time and

$$
\begin{aligned}
E_{i}\left[v\left(X_{\tau_{1}}\right)\right] & =\sum_{n=1}^{\infty} \sum_{k \in M} P_{i}\left[X_{1} \notin M, \ldots, X_{n-1} \notin M, X_{n}=k\right] v(k) \\
& =\sum_{n=1}^{\infty} \sum_{k \in M} \sum_{j \in S} p_{i j} P_{j}\left[X_{0} \notin M, \ldots, X_{n-2} \notin M, X_{n-1}=k\right] v(k) \\
& =\sum_{j} p_{i j} E_{j}\left[v\left(X_{\tau_{0}}\right)\right] .
\end{aligned}
$$

Since $\tau_{0} \leq \tau_{1}, E_{i}\left[v\left(X_{\tau_{0}}\right)\right] \geq E_{i}\left[v\left(X_{\tau_{1}}\right)\right]$ by Lemmas 4 and 5.
This shows that $\varphi$ is excessive. And $\varphi(i) \leq v(i)$ by the definition (8.44). If $\varphi(i) \geq f(i)$ is proved, it will follow by Theorem 8.10 that $\varphi(i) \geq v(i)$ and hence that $\varphi(i)=v(i)$. Since $\tau_{0}=0$ for $X_{0} \in M$, if $i \in M$ then $\varphi(i)= E_{i}\left[f\left(X_{0}\right)\right]=f(i)$. Suppose that $\varphi(i)<f(i)$ for some values of $i$ in $S-M$, and choose $i_{0}$ to maximize $f(i)-\varphi(i)$. Then $\psi(i)=\varphi(i)+f\left(i_{0}\right)-\varphi\left(i_{0}\right)$ dominates $f$ and is excessive, being the sum of a constant and an excessive function. By Theorem 8.10, $\psi$ must dominate $v$, so that $\psi\left(i_{0}\right) \geq v\left(i_{0}\right)$, or $f\left(i_{0}\right) \geq v\left(v_{0}\right)$. But this implies that $i_{0} \in M$, a contradiction $\square$

The optimal strategy need not be unique. If $f$ is constant, for example, all strategies have the same value.

Example 8.16. For the symmetric random walk with absorbing barriers at 0 and $r$ (Example 8.2) a tunction $\varphi$ on $S=\{0,1, \ldots, r\}$ is excessive if $\varphi(i) \geq \frac{1}{2} \varphi(i-1)+\frac{1}{2} \varphi(i+1)$ for $1 \leq i \leq r-1$. The requirement is that $\varphi$ give a concave function when extended by linear interpolation from $S$ to the entire interval $[0, r]$. Hence $v$ thus extended is the minimal concave function dominating $f$. The figure shows the geometry; the ordinates of the dots are the values of $f$ and the polygonal line describes $v$. The optimal strategy is to stop at a state for which the dot lies on the polygon.
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-030.jpg?height=375&width=1183&top_left_y=2405&top_left_x=314)

If $f(r)=1$ and $f(i)=0$ for $i<r$, then $v$ is a straight line; $v(i)=i / r$. The optimal Markov time $\tau_{0}$ is the hitting time for $M=\{0, r\}$, and $v(i)= E_{i}\left[f\left(X_{\tau_{0}}\right)\right]$ is the probability of absorption in the state $r$. This gives another solution of the gambler's ruin problem for the symmetric case.

Example 8.17. For the selection problem in Example 8.5, the $p_{i,}$ are given by (8.5) and (8.6) for $1 \leq i \leq r$, while $p_{r+1, r+1}=1$. The payoff is $f(i)=i / r$ for $i \leq r$ and $f(r+1)=0$. Thus $v(r+1)=0$, and since $v$ is excessive,

$$
\begin{equation*}
v(i) \geq g(i)=\sum_{j=i+1}^{r} \frac{i}{j(j+1)} v(j), \quad 1 \leq i<r \tag{8.47}
\end{equation*}
$$

By Theorem 8.10, $v$ is the smallest function satisfying (8.47) and $v(i) \geq f(i)=i / r$, $1 \leq i \leq r$. Since (8.47) puts no lower limit on $v(r)$, it follows that $v(r)=f(r)=1$, and $r$ lies in the support set $M$. By minimality,

$$
\begin{equation*}
v(i)=\max \{f(i), g(i)\}, \quad 1 \leq i<r . \tag{8.48}
\end{equation*}
$$

If $i \in M$, then $f(i)=v(i) \geq g(i) \geq \sum_{j=i+1}^{r} i^{j-1}(j-1)^{-1} f(j)=f(i) \sum_{j=i+1}^{r}(j-1)^{-1}$, and hence $\sum_{j=i+1}^{r}(j-1)^{-1} \leq 1$. On the other hand, if this inequality holds and $i+1, \ldots, r$ all lie in $M$, then $g(i)=\sum_{j=i+1}^{r} i^{-1}(j-1)^{-1} f(j)=f(i) \sum_{j=i+1}^{r}(j-1)^{-1} \leq f(i)$, so that $i \in M$ by (8.48). Therefore, $M=\left\{i_{r}, i_{r}+1, \ldots, r, r+1\right\}$, where $i_{r}$ is determined by

$$
\begin{equation*}
\frac{1}{i_{r}}+\frac{1}{i_{r}+1}+\cdots+\frac{1}{r-1} \leq 1<\frac{1}{i_{r}-1}+\frac{1}{i_{r}}+\cdots+\frac{1}{r-1} \tag{8.49}
\end{equation*}
$$

If $i<i_{r}$, so that $i \notin M$, then $v(i)>f(i)$ and so, by (8.48),

$$
\begin{aligned}
v(i) & =g(i)=\sum_{j=i+1}^{i_{r}-1} \frac{i}{j(j-1)} v(j)+\sum_{j=i_{r}}^{r} \frac{i}{j(j-1)} f(j) \\
& =\sum_{j=i+1}^{i_{r}-1} \frac{i}{j(j-1)} v(j)+\frac{i}{r}\left(\frac{1}{i_{r}-1}+\cdots+\frac{1}{r-1}\right) .
\end{aligned}
$$

It follows by backward induction starting with $i=i_{r}-1$ that

$$
\begin{equation*}
v(i)=p_{r}=\frac{i_{r}-1}{r}\left(\frac{1}{i_{r}-1}+\cdots+\frac{1}{r-1}\right) \tag{8.50}
\end{equation*}
$$

is constant for $1 \leq i<i_{r}$.
In the selection problem as originally posed, $X_{1}=1$. The optimal strategy is to stop with the first $X_{n}$ that lies in $M$. The princess should therefore reject the first $i_{r}-1$ suitors and accept the next one who is preferable to all his predecessors (is dominant). The probability of success is $p_{r}$ as given by (8.50). Failure can happen in two ways. Perhaps the first dominant suitor after $i_{r}$ is not the best of all suitors; in this case the princess will be unaware of failure. Perhaps no dominant suitor comes after $i_{r}$; in this case the princess is obliged to take the last suitor of all and may be well
aware of failure. Recall that the problem was to maximize the chance of getting the best suitor of all rather than, say, the chance of getting a suitor in the top half.

If $r$ is large, (8.49) essentially requires that $\log r-\log i_{r}$ be near 1 , so that $i_{r} \approx r / e$. In this case, $p_{r} \approx 1 / e$.

Note that although the system starts in state 1 in the original problem, its resolution by means of the preceding theory requires consideration of all possible initial states. $\square$

This theory carries over in part to the case of infinite $S$, although this requires the general theory of expected values, since $f\left(X_{\tau}\right)$ may not be a simple random variable. Theorem 8.10 holds for infinite $S$ if the payoff function is nonnegative and the value function is finite. ${ }^{\dagger}$ But then problems arise: Optimal strategies may not exist, and the probability of hitting the suppori set $M$ may be less than 1 . Even if this probability is 1 , the strategy of stopping on first entering $M$ may be the worst one of all. ${ }^{\ddagger}$

## PROBLEMS

8.1. Prove Theorem 8.1 for the case of finite $S$ by constructing the appropriate probability measure on sequence space $S^{\infty}$ : Replace the summand on the right in (2.21) by $\alpha_{u_{1}} p_{u_{1} u_{2}} \cdots p_{u_{n-1} u_{n}}$, and extend the arguments preceding Theorem 2.3. If $X_{n}(\cdot)=z_{n}(\cdot)$, then $X_{1}, X_{2}, \ldots$ is the appropriate Markov chain (here time is shifted by 1 ).
8.2. Let $Y_{0}, Y_{1}, \ldots$ be independent and identically distributed with $P\left[Y_{n}=1\right]=p$, $P\left[Y_{n}=0\right]=q=1-p, p \neq q$. Put $X_{n}=Y_{n}+Y_{n+1}(\bmod 2)$. Show that $X_{0} ; X_{1}, \ldots$ is not a Markov chain even though $P\left[X_{n+1}=j \mid X_{n-1}=i\right]=P\left[X_{n+1}=j\right]$. Does this last relation hold for all Markov chains? Why?
8.3. Show by example that a function $f\left(X_{0}\right), f\left(X_{1}\right), \ldots$ of a Markov chain need not be a Markov chain.
8.4. Show that

$$
f_{i j} \sum_{k=0}^{\infty} p_{j j}^{(k)}=\sum_{n=1}^{\infty} \sum_{m=1}^{n} f_{i j}^{(m)} p_{j j}^{(n-m)}=\sum_{n=1}^{\infty} p_{i j}^{(n)},
$$

and prove that if $j$ is transient, then $\sum_{n} p_{i j}^{(n)}<\infty$ for each $i$ (compare Theorem 8.3(i)). If $j$ is transient, then

$$
f_{i j}=\sum_{n=1}^{\infty} p_{i j}^{(n)} /\left(1+\sum_{n=1}^{\infty} p_{j j}^{(n)}\right) .
$$

${ }^{\dagger}$ The only essemial change in the argument is that Fatou's lemma (Theorem 16.3) must be used in place of Theorem 54 in the proof of Lemma 5.
${ }^{\ddagger}$ See Problems 836 and 8.37

Specialize to the case $i=j$ : in addition to implying that $i$ is transient (Theorem 8.2(i)), a finite value for $\sum_{n=1}^{\infty} p_{i i}^{(n)}$ suffices to determine $f_{i i}$ exactly.
8.5. Call $\left(x_{i}\right)$ a subsolution of (8.24) if $x_{i} \leq \sum_{j} q_{i j} x_{j}$ and $0 \leq x_{i} \leq 1, i \in U$. Extending Lemma 1, show that a subsolution $\left\{x_{i}\right\}$ satisfies $x_{i} \leq \sigma_{i}$ : The solution $\left\{\sigma_{i}\right\}$ of (8.24) dominates all subsolutions as well as all solutions. Show that if $x_{i}=\sum_{j} q_{i j} x$, and $-1 \leq x_{i} \leq 1$, then $\left\{\left|x_{i}\right|\right\}$ is a subsolution of (8.24).
8.6. Show by solving (8.27) that the unrestricted random walk on the line (Example 8.3) is persistent if and only if $p=\frac{1}{2}$
8.7. (a) Generalize an argument in the proof of Theorem 8.5 to show that $f_{i k}= p_{i k}+\sum_{j \neq k} p_{i j} f_{j k}$. Generalize this further to

$$
\begin{aligned}
f_{i k}= & f_{i k}^{(1)}+\cdots+f_{i k}^{(n)} \\
& +\sum_{j \neq k} P_{i}\left[X_{1} \neq k, \ldots, X_{n-1} \neq k, X_{n}=j\right] f_{, k}
\end{aligned}
$$

(b) Take $k=i$. Show that $f_{i}>0$ if and only if $P_{i}\left[X_{1} \neq i, . ., X_{n-1} \neq i\right.$, $\left.X_{n}=j\right]>0$ for some $n$, and conclude that $i$ is transient if and only if $f_{j i}<1$ for some $j \neq i$ such that $f_{i j}>0$.
(c) Show that an irreducible chain is transient if and only if for each $i$ there is a $j \neq i$ such that $f_{j i}<1$.
8.8. Suppose that $S=\{0,1,2, \ldots\}, p_{00}=1$, and $f_{i 0}>0$ for all $i$.
(a) Show that $P_{i}\left(\cup_{j=1}^{\infty}\left[X_{n}=j\right.\right.$ i.o. $\left.]\right)=0$ for all $i$.
(b) Regard the state as the size of a population and interpret the conditions $p_{00}=1$ and $f_{i 0}>0$ and the conclusion in part (a).
8.9. $8.5 \uparrow$ Show for an irreducible chain that (8.27) has a nontrivial solution if and only if there exists a nontrivial, bounded sequence $\left\{x_{i}\right\}$ (not necessarily nonnegative) satisfying $x_{i}=\sum_{j \neq i_{0}} p_{i j} x_{j}, i \neq i_{0}$. (See the remark following the proof of Theorem 8.5.)
8.10. ↑ Show that an irreducible chain is transient if and only if (for arbitrary $i_{0}$ ) the system $y_{i}=\sum_{j} p_{i j} y_{j}, i \neq i_{0}$ (sum over all $j$ ), has a bounded, nonconstant solution $\left(y_{i}, i \in S\right)$.
8.11. Show that the $P_{i}$-probabilities of ever leaving $U$ for $i \in U$ are the minimal solution of the system.

$$
\begin{cases}z_{i}=\sum_{j \in U} p_{i}, z_{j}+\sum_{j \notin U} p_{i j}, & i \in U,  \tag{8.51}\\ 0 \leq z_{i} \leq 1, & i \in U .\end{cases}
$$

The constraint $z_{i} \leq 1$ can be dropped: the minimal solution automatically satisfies it, since $z_{i} \equiv 1$ is a solution.
8.12. Show that $\sup _{i j} n_{0}(i, j)=\infty$ is possible in Lemma 2 .
8.13. Suppose that ( $\pi_{i}$ ) solves (8.30), where it is assumed that $\sum_{i}\left|\pi_{i}\right|<\infty$, so that the left side is well defined. Show in the irreducible case that the $\pi_{i}$ are either all positive or all negative or all 0 . Stationary probabilities thus exist in the irreducible case if and only if (8.30) has a nontrivial solution $\left\{\pi_{i}\right\}\left(\Sigma_{i} \pi_{i}\right.$ absolutely convergent).
8.14. Show by example that the coupled chain in the proof of Theorem 8.6 need not be irreducible if the original chain is not aperiodic.
8.15. Suppose that $S$ consists of all the integers and

$$
\begin{array}{ll}
p_{0,-1}=p_{0,0}=p_{0,+1}=\frac{1}{3}, & \\
p_{k, k-1}=q, \quad p_{k, k+1}=p, & k \leq-1, \\
p_{k, k-1}=p, \quad p_{k, k+1}=q, & k \geq 1 .
\end{array}
$$

Show that the chain is irreducible and aperiodic. For which $p$ 's is the chain persistent? For which $p$ 's are there stationary probabilities?
8.16. Show that the period of $j$ is the greatest common divisor of the set

$$
\begin{equation*}
\left[n: n \geq 1, f_{1 j}^{(n)}>0\right] . \tag{8.52}
\end{equation*}
$$

8.17. $\uparrow$ Recurrent events. Let $f_{1}, f_{2}, \ldots$ be nonnegative numbers with $f=\sum_{n=1}^{\infty} f_{n} \leq$ 1. Define $u_{1}, u_{2}, \ldots$ recursively by $u_{1}=f_{1}$ and

$$
\begin{equation*}
u_{n}=f_{1} u_{n-1}+\cdots+f_{n-1} u_{1}+f_{n} . \tag{8.53}
\end{equation*}
$$

(a) Show that $f<1$ if and only if $\sum_{n} u_{n}<\infty$.
(b) Assume that $f=1$, set $\mu=\sum_{n=1}^{\infty} n f_{n}$, and assume that

$$
\begin{equation*}
\operatorname{gcd}\left[n: n \geq 1, f_{n}>0\right]=1 . \tag{8.54}
\end{equation*}
$$

Prove the renewal theorem. Under these assumptions, the limit $u=\lim _{n} u_{n}$ exists, and $u>0$ if and only if $\mu<\infty$, in which case $u=1 / \mu$.

Although these definitions and facts are stated in purely analytical terms, they have a probabilistic interpretation: Imagine an event $\mathscr{E}$ that may occur at times $1,2, \ldots$. Suppose $f_{n}$ is the probability $\mathscr{E}$ occurs first at time $n$. Suppose further that at each occurrence of $\mathscr{E}$ the system starts anew, so that $f_{n}$ is the probability that $\mathscr{E}$ next occurs $n$ steps later. Such an $\mathscr{E}$ is called a recurrent event. If $u_{n}$ is the probability that $\mathscr{E}$ occurs at time $n$, then (8.53) holds. The recurrent event $\mathscr{E}$ is called transient or persistent according as $f<1$ or $f=1$, it is called aperiodic if (8.54) holds, and if $f=1, \mu$ is interpreted as the mean recurrence time
8.18. (a) Let $\tau$ be the smallest integer for which $X_{\tau}=i_{0}$. Suppose that the state space is finite and that the $p_{i j}$ are all positive. Find a $\rho$ such that $\max _{i}\left(1-p_{i i_{0}}\right) \leq \rho<1$ and hence $P_{i}[\tau>n] \leq \rho^{n}$ for all $i$.
(b) Apply this to the coupled chain in the proof of Theorem 8.6: $\left|p_{i k}^{(n)}-p_{j k}^{(n)}\right| \leq \rho^{n}$. Now give a new proof of Theorem 8.9.
8.19. A thinker who owns $r$ umbrellas wanders back and forth between home and office, taking along an umbrella (if there is one at hand) in rain (probability $p$ ) but not in shine (probability $q$ ). Let the state be the number of umbrellas at hand, irrespective of whether the thinker is at home or at work. Set up the transition matrix and find the stationary probabilities. Find the steady-state probability of his getting wet, and show that five umbrellas will protect him at the $5 \%$ level against any climate (any $p$ ).
8.20. (a) A transition matrix is doubly stochastic if $\sum_{i} p_{i},=1$ for each $j$. For a finite, irreducible, aperiodic chain with doubly stochastic transition matrix, show that the stationary probabilities are all equal.
(b) Generalize Example 8.15: Let $S$ be a finite group, let $p(i)$ be probabilities, and put $p_{i j}=p\left(J \cdot i^{-1}\right)$, where product and inverse refer to the group operation. Show that, if all $p(i)$ are positive, the states are all equally likely in the limit.
(c) Let $S$ be the symmetric group on 52 elements. What has (b) to say about card shuffling?
8.21. A set $C$ in $S$ is closed if $\Sigma_{j \in C} p_{i j}=1$ for $i \in C$ : once the system enters $C$ it cannot leave. Show that a chain is irreducible if and only if $S$ has no proper closed subset.
8.22. $\uparrow$ Let $T$ be the set of transient states and define persistent states $i$ and $j$ (if there are any) to be equivalent if $f_{i j}>0$. Show that this is an equivalence relation on $S-T$ and decomposes it into equivalence classes $C_{1}, C_{2}, \ldots$, so that $S=T \cup C_{1} \cup C_{2} \cup \cdots$ Show that each $C_{m}$ is closed and that $f_{i j}=1$ for $i$ and $j$ in the same $C_{m}$.
8.23. $8.118 .21 \uparrow$ Let $T$ be the set of transient states and let $C$ be any closed set of persistent states. Show that the $P_{i}$-probabilities of eventual absorption in $C$ for $i \in T$ are the minimal solution of

$$
\begin{cases}y_{i}=\sum_{j \in T} p_{i j} y_{j}+\sum_{j \in C} p_{i j}, & i \in T,  \tag{8.55}\\ 0 \leq y_{i} \leq 1, & i \in T .\end{cases}
$$

8.24. Suppose that an irreducible chain has period $t>1$. Show that $S$ decomposes into sets $S_{0}, \ldots, S_{t-1}$ such that $p_{i j}>0$ only if $i \in S_{\nu}$ and $j \in S_{\nu+1}$ for some $\nu$ ( $\nu+1$ reduced modulo $t$ ). Thus the system passes through the $S_{\nu}$ in cyclic succession.
8.25. ↑ Suppose that an irreducible chain of period $t>1$ has a stationary distribution $\left\{\pi_{j}\right\}$. Show that, if $i \in S_{\nu}$ and $j \in S_{\nu+\alpha}(\nu+\alpha$ reduced modulo $t)$, then $\lim _{n} p_{i j}^{(n t+\alpha)}=\pi_{j}$. Show that $\lim _{n} n^{-1} \sum_{m=1}^{n} p_{i j}^{(m)}=\pi_{j} / t$ for all $i$ and $j$.
8.26. Eigenvalues. Consider an irreducible, aperiodic chain with state space $\{1, \ldots, s\}$. Let $r_{0}=\left(\pi_{1}, \ldots, \pi_{s}\right)$ be (Example 8.14) the row vector of stationary probabilities, and let $c_{0}$ be the column vector of 1 's; then $r_{0}$ and $c_{0}$ are left and right eigenvectors of $P$ for the eigenvalue $\lambda=1$.
(a) Suppose that $r$ is a left eigenvector for the (possibly complex) eigenvalue $\lambda$ : $r P=\lambda r$. Prove: If $\lambda=1$, then $r$ is a scalar multiple of $r_{0}(\lambda=1$ has geometric
multiplicity 1). If $\lambda \neq 1$, then $|\lambda|<1$ and $r c_{0}=0$ (the $1 \times 1$ product of $1 \times \mathrm{s}$ and $s \times 1$ matrices).
(b) Suppose that $c$ is a right eigenvector: $P c=\lambda c$. If $\lambda=1$, then $c$ is a scalar multiple of $c_{0}$ (again the geometric multiplicity is 1 ). If $\lambda \neq 1$, then again $|\lambda|<1$, and $r_{0} c=0$.
8.27. $\uparrow$ Suppose $P$ is diagonalizable; that is, suppose there is a nonsingular $C$ such that $C^{-1} P C=\Lambda$, where $\Lambda$ is a diagonal matrix. Let $\lambda_{1}, \ldots, \lambda_{s}$ be the diagonal elements of $\Lambda$, let $c_{1}, \ldots, c_{s}$ be the successive columns of $C$, let $R=C^{-1}$, and let $r_{1}, \ldots, r_{s}$ be the successive rows of $R$.
(a) Show that $c_{i}$ and $r_{i}$ are right and left eigenvectors for the eigenvalue $\lambda_{i}$, $i=1, \ldots, s$. Show that $r_{i} c_{j}=\delta_{i j}$. Let $A_{i}=c_{i} r_{i}(s \times s)$. Show that $\Lambda^{n}$ is a diagonal matrix with diagonal elements $\lambda_{1}^{n}, \ldots, \lambda_{s}^{n}$ and that $P^{n}=C \Lambda^{n} R=\sum_{u=1}^{s} \lambda_{u}^{n} A_{u}, n \geq 1$.
(b) Part (a) goes through under the sole assumption that $P$ is a diagonalizable matrix. Now assume also that it is an irreducible, aperiodic stochastic matrix, and arrange the notation so that $\lambda_{1}=1$. Show that each row of $A_{1}$ is the vector ( $\pi_{1}, \ldots, \pi_{s}$ ) of stationary probabilities. Since

$$
\begin{equation*}
P^{n}=A_{1}+\sum_{u=2}^{s} \lambda_{u}^{n} A_{u} \tag{8.56}
\end{equation*}
$$

and $\left|\lambda_{u}\right|<1$ for $2 \leq u \leq s$, this proves exponential convergence once more.
(c) Write out (8.56) explicitly for the case $s=2$.
(d) Find an irreducible, aperiodic stochastic matrix that is not diagonalizable.
8.28. $\uparrow$ (a) Show that the eigenvalue $\lambda=1$ has geometric multiplicity 1 if there is only one closed, irreducible set of states; there may be transient states, in which case the chain itself is not irreducible.
(b) Show, on the other hand, that if there is more than one closed, irreducible set of states, then $\lambda=1$ has geometric multiplicity exceeding 1 .
(c) Suppose that there is only one closed, irreducible set of states. Show that the chain has period exceeding 1 if and only if there is an eigenvalue other than 1 on the unit circle.
8.29. Suppose that $\left\{X_{n}\right\}$ is a Markov chain with state space $S$, and put $Y_{n}=\left(X_{n}, X_{n+1}\right)$. Let $T$ be the set of pairs $(i, j)$ such that $p_{i j}>0$ and show that $\left\{Y_{n}\right\}$ is a Markov chain with state space $T$. Write down the transition probabilities. Show that, if $\left\{X_{n}\right\}$ is irreducible and aperiodic, so is $\left\{Y_{n}\right\}$. Show that, if $\pi_{i}$ are stationary probabilities for $\left\{X_{n}\right\}$, then $\pi_{i} p_{i j}$ are stationary probabilities for $\left\{Y_{n}\right\}$.
8.30. $6.108 .29 \uparrow$ Suppose that the chain is finite, irreducible, and aperiodic and that the initial probabilities are the stationary ones. Fix a state $i$, let $A_{n}=\left[X_{i}=\right. i]$, and let $N_{n}$ be the number of passages through $i$ in the first $n$ steps. Calculate $\alpha_{n}$ and $\beta_{n}$ as defined by (5.41). Show that $\beta_{n}-\alpha_{n}^{2}=O(1 / n)$, so that $n^{-1} N_{n} \rightarrow \pi_{i}$ with probability 1 . Show for a function $f$ on the state space that $n^{-1} \sum_{k=1}^{n} f\left(X_{k}\right) \rightarrow \sum_{i} \pi_{i} f(i)$ with probability 1 . Show that $n^{-1} \sum_{k=1}^{n} g\left(X_{k}, X_{k+1}\right) \rightarrow \sum_{i j} \pi_{i} p_{i j} g(i, j)$ for functions $g$ on $S \times S$.
8.31. $6.148 .30 \uparrow$ If $X_{0}(\omega)=i_{0}, \ldots, X_{n}(\omega)=i_{n}$ for states $i_{0}, \ldots, i_{n}$, put $p_{n}(\omega)= \pi_{i_{0}} p_{i_{0} i_{1}} \cdots p_{i_{n-1} i_{n}}$, so that $p_{n}(\omega)$ is the probability of the observation observed. Show that $-n^{-1} \log p_{n}(\omega) \rightarrow h=-\sum_{i j} \pi_{i} p_{i j} \log p_{i j}$ with probability 1 if the chain is finite, irreducible, and aperiodic. Extend to this case the notions of source, entropy, and asymptotic equipartition.
8.32. A sequence $\left\{X_{n}\right\}$ is a Markov chain of second order if $P\left[X_{n+1}=j \mid X_{0}=\right. \left.i_{0}, \ldots, X_{n}=i_{n}\right]=P\left[X_{n+1}=j \mid X_{n-1}=i_{n-1}, X_{n}=i_{n}\right]=p_{i_{n-1} i_{n}} j$. Show that nothing really new is involved because the sequence of pairs ( $X_{n}, X_{n+1}$ ) is an ordinary Markov chain (of first order). Compare Problem 8.29. Generalize this idea into chains of order $r$.
8.33. Consider a chain on $S=\{0,1, \ldots, r\}$, where 0 and $r$ are absorbing states and $p_{i, i+1}=p_{i}>0, p_{i, i-1}=q_{i}=1-p_{i}>0$ for $0<i<r$. Identify state $i$ with a point $z_{i}$ on the line, where $0=z_{0}<\cdots<z_{r}$ and the distance from $z_{i}$ to $z_{i+1}$ is $q_{i} / p_{i}$ times that from $z_{i-1}$ to $z_{i}$. Given a function $\varphi$ on $S$, consider the associated function $\hat{\varphi}$ on [ $0, z_{r}$ ] defined at the $z_{i}$ by $\hat{\varphi}\left(z_{i}\right)=\varphi(i)$ and in between by linear interpolation. Show that $\varphi$ is excessive if and only if $\hat{\varphi}$ is concave. Show that the probability of absorption in $r$ for initial state $i$ is $t_{i-1} / t_{r-1}$, where $t_{i}= \sum_{k=0}^{i} q_{1} \cdot q_{k} / p_{1} \cdots p_{k}$. Deduce (7.7). Show that in the new scale the expected distance moved on each step is 0 .
8.34. Suppose that a finite chain is irreducible and aperiodic. Show by Theorem 8.9 that an excessive function must be constant.
8.35. A zero-one law. Let the state space $S$ contain $s$ points, and suppose that $\epsilon_{n}=\sup _{i j}\left|p_{i j}^{(n)}-\pi_{j}\right| \rightarrow 0$, as holds under the hypotheses of Theorem 8.9. For $a \leq b$, let $\mathscr{G}_{a}^{b}$ be the $\sigma$-field generated by the sets $\left[X_{a}=u_{a}, \ldots, X_{b}=u_{b}\right]$. Let $\mathscr{T}_{a}=\sigma\left(\bigcup_{b=a}^{\infty} \mathscr{G}_{a}^{b}\right)$ and $\mathscr{T}=\bigcap_{a=1}^{\infty} \mathscr{T}_{a}$. Show that $|P(A \cap B)-P(A) P(B)| \leq s\left(\epsilon_{n}+\epsilon_{b+n}\right)$ for $A \in \mathscr{G}_{0}^{b}$ and $B \in \mathscr{G}_{b-1 n}^{b+m}$; the $\epsilon_{b+n}$ can be suppressed if the initial probabilities are the stationary ones. Show that this holds for $A \in \mathscr{G}_{0}^{b}$ and $B \in \mathscr{T}_{b+n}$. Show that $C \in \mathscr{T}$ implies that $P(C)$ is either 0 or 1 .
8.36 ${ }^{\dagger}$ Alter the chain in Example 8.13 so that $q_{0}=1-p_{0}=1$ (the other $p_{i}$ and $q_{i}$ still positive). Let $\beta=\lim _{n} p_{1} \cdots p_{n}$ and assume that $\beta>0$. Define a payoff function by $f(0)=1$ and $f(i)=1-f_{i 0}$ for $i>0$. If $X_{0}, \ldots, X_{n}$ are positive, put $\sigma_{n}=n$; otherwise let $\sigma_{n}$ be the smallest $k$ such that $X_{k}=0$. Show that $E_{i}\left[f\left(X_{\sigma_{n}}\right)\right] \rightarrow 1$ as $n \rightarrow \infty$, so that $v(i) \equiv 1$. Thus the support set is $M=\{0\}$, and for an initial state $i>0$ the probability of ever hitting $M$ is $f_{i 0}<1$.

For an arbitrary finite stopping time $\tau$, choose $n$ so that $P_{i}\left[\tau<n=\sigma_{n}\right]>0$. Then $E_{i}\left[f\left(X_{\tau}\right)\right] \leq 1-f_{i+n, 0} P_{i}\left[\tau<n=\sigma_{n}\right]<1$. Thus no strategy achieves the value $v(i)$ (except of course for $i=0$ ).
8.37. ↑ Let the chain be as in the preceding problem, but assume that $\beta=0$, so that $f_{i 0}=1$ for all $i$. Suppose that $\lambda_{1}, \lambda_{2}, \ldots$ exceed 1 and that $\lambda_{1} \cdots \lambda_{n} \rightarrow \lambda< \infty$; put $f(0)=0$ and $f(i)=\lambda_{1} \cdots \lambda_{i-1} / p_{1} \cdots p_{i-1}$. For an arbitrary (finite) stopping time $\tau$, the event $[\tau=n]$ must have the form $\left[\left(X_{0}, \ldots, X_{n}\right) \in I_{n}\right]$ for some set $I_{n}$ of ( $n+1$ )-long sequences of states. Show that for each $i$ there is at
${ }^{\dagger}$ The final three problems in this section involve expected values for random variables with infinite range.
most one $n \geq 0$ such that $(i, i+1, \ldots, i+n) \in I_{n}$. If there is no such $n$, then $E_{i}\left[f\left(X_{\tau}\right)\right]=0$. If there is one, then

$$
E_{i}\left[f\left(X_{\tau}\right)\right]=P_{i}\left[\left(X_{0}, . ., X_{n}\right)=(i, \ldots, i+n)\right] f(i+n),
$$

and hence the only possible values of $E_{\mathrm{i}}\left[f\left(X_{\tau}\right)\right]$ are

$$
0, \quad f(i), \quad p_{i} f(i+1)=f(i) \lambda_{i}, \quad p_{i} p_{i+1} f(i+2)=f(i) \lambda_{i} \lambda_{i+1}, \ldots .
$$

Thus $v(i)=f(i) \lambda / \lambda_{1} \cdots \lambda_{i-1}$ for $i \geq 1$; no strategy this value. The support set is $M=(0)$, and the hitting time $\tau_{0}$ for $M$ is finite, but $E_{i}\left[f\left(X_{r_{0}}\right)\right]=0$.
8.38. $5.12 \hat{i}$ Consider an irreducible, aperiodic, positive persistent chain. Let $\tau_{j}$ be the smaliest $n$ such that $X_{n}=j$, and let $m_{i j}=E_{i}\left[\tau_{j}\right]$. Show that there is an $r$ such that $p=P_{j}\left[X_{1} \neq j, \ldots, X_{r-1} \neq j, X_{r}=i\right]$ is positive; from $f_{j j}^{(n+r)} \geq p f_{i j}^{(n)}$ and $m_{j,}<\infty$, conclude that $m_{i},<\infty$ and $m_{i j}=\sum_{n=0}^{\infty} P_{i}\left[\tau_{j}>n\right]$. Starting from $p_{i j}^{(t)}= \sum_{s=1}^{t} f_{i j}^{(s)} p_{j,}^{(t-s)}$, show that

$$
\sum_{i=1}^{n}\left(p_{i j}^{(t)}-p_{j j}^{(t)}\right)=1-\sum_{m=0}^{n} p_{j j}^{(n-m)} P_{i}\left[\tau_{i}>m\right] .
$$

Use the $M$-test to show that

$$
\pi_{j} m_{i j}=1+\sum_{n=1}^{\infty}\left(p_{j j}^{(n)}-p_{i j}^{(n)}\right) .
$$

If $i=j$, this gives $m_{j j}=1 / \pi_{j}$ again; if $i \neq j$, it shows how in principle $m_{i j}$ can be calculated from the transition matrix and the stationary probabilities.

## SECTION 9. LARGE DEVIATIONS AND THE LAW OF THE ITERATED LOGARITHM*

It is interesting in connection with the strong law of large numbers to estimate the rate at which $S_{n} / n$ converges to the mean $m$. The proof of the strong law used upper bounds for the probabilities $P\left[\left|S_{n}-m\right| \geq \alpha\right]$ for large $\alpha$. Accurate upper and lower bounds for these probabilities will lead to the law of the iterated logarithm, a theorem giving very precise rates for $S_{n} / n \rightarrow m$.

The first concern will be to estimate the probability of large deviations from the mean, which will require the method of moment generating functions. The estimates will be applied first to a problem in statistics and then to the law of the iterated logarithm.

[^9]
## Moment Generating Functions

Let $X$ be a simple random variable asssuming the distinct values $x_{1}, \ldots, x_{1}$ with respective probabilities $p_{1}, \ldots, p_{l}$. Its moment generating function is

$$
\begin{equation*}
M(t)=E\left[e^{t X}\right]=\sum_{i=1}^{l} p_{i} e^{t x_{i}} . \tag{9.1}
\end{equation*}
$$

(See (5.19) for expected values of functions of random variables.) This function, defined for all real $t$, can be regarded as associated with $X$ itself or as associated with its distribution-that is, with the measure on the line having mass $p_{i}$ at $x_{i}$ (see (5.12)).

If $c=\max _{i}\left|x_{i}\right|$, the partial sums of the series $e^{t X}=\sum_{k=0}^{\infty} t^{k} X^{k} / k!$ are bounded by $e^{|r| c}$, and so the corollary to Theorem 5.4 applies:

$$
\begin{equation*}
M(t)=\sum_{k=0}^{\infty} \frac{t^{k}}{k!} E\left[X^{k}\right] . \tag{9.2}
\end{equation*}
$$

Thus $M(t)$ has a Taylor expansion, and as follows from the general theory [A29], the coefficient of $t^{k}$ must be $M^{(k)}(0) / k!$ Thus

$$
\begin{equation*}
E\left[X^{k}\right]=M^{(k)}(0) . \tag{9.3}
\end{equation*}
$$

Furthermore, term-by-term differentiation in (9.1) gives

$$
M^{(k)}(t)=\sum_{i=1}^{l} p_{i} x_{i}^{k} e^{i x}=E\left[X^{k} e^{i X}\right]
$$

taking $t=0$ here gives (9.3) again. Thus the moments of $X$ can be calculated by successive differentiation, whence $M(t)$ gets its name. Note that $M(0)=1$.

Example 9.1. If $X$ assumes the values 1 and 0 with probabilities $p$ and $q=1-p$, as in Bernoulli trials, its moment generating function is $M(t)= p e^{i}+q$. The first two moments are $M^{\prime}(0)=p$ and $M^{\prime \prime}(0)=p$, and the variance is $p-p^{2}=p q$. $\square$

If $X_{1}, \ldots, X_{n}$ are independent, then for each $t$ (see the argument following (5.10)), $e^{t X_{1}}, \ldots, e^{t X_{n}}$ are also independent. Let $M$ and $M_{1}, \ldots, M_{n}$ be the respective moment generating functions of $S=X_{1}+\cdots+X_{n}$ and of $X_{1}, \ldots, X_{n}$; of course, $e^{t S}=\prod_{i} e^{t X_{i}}$. Since by (5.25) expected values multiply for independent random variables, there results the fundamental relation

$$
\begin{equation*}
M(t)=M_{1}(t) \cdots M_{n}(t) . \tag{9.4}
\end{equation*}
$$

This is an effective way of calculating the moment generating function of the sum $S$. The real interest, however, centers on the distribution of $S$, and so it is important to know that distributions can in principle be recovered from their moment generating functions.

Consider along with (9.1) another finite exponential sum $N(t)=\sum_{j} q_{j} e^{t y_{j}}$, and suppose that $M(t)=N(t)$ for all $t$. If $x_{i_{0}}=\max x_{i}$ and $y_{j_{0}}=\max y_{j}$, then $M(t) \sim p_{i_{0}} e^{i x_{i_{0}}}$ and $N(t) \sim q_{j_{0}} e^{t y_{i_{0}}}$ as $t \rightarrow \infty$, and so $x_{i_{0}}=y_{j_{0}}$ and $p_{i_{0}}=q_{i_{0}}$. The same argument now applies to $\sum_{i \neq i_{0}} p_{i} e^{i x_{i}}=\sum_{j \neq j_{0}} q_{j} e^{i y_{j}}$, and it follows inductively that with appropriate relabeling, $x_{i}=y_{i}$ and $p_{i}=q_{i}$ for each $i$. Thus the function (9.1) does uniquely determine the $x_{i}$ and $p_{i}$.

Example 9.2. If $X_{1}, \ldots, X_{n}$ are independent, each assuming values 1 and 0 with probabilities $p$ and $q$, then $S=X_{1}+\cdots+X_{n}$ is the number of successes in $n$ Bernoulli trials. By (9.4) and Example 9.1, $S$ has the moment generating function

$$
E\left[e^{i S}\right]=\left(p e^{i}+q\right)^{n}=\sum_{k=0}^{n}\binom{n}{k} p^{k} q^{n-k} e^{i k}
$$

The right-hand form shows this to be the moment generating function of a distribution with mass $\binom{n}{k} p^{k} q^{n-k}$ at the integer $k, 0 \leq k \leq n$. The uniqueness just established therefore yields the standard fact that $P[S=k]=\binom{n}{k} p^{k} q^{n-k}$.

The cumulant generating function of $X$ (or of its distribution) is

$$
\begin{equation*}
C(t)=\log M(t)=\log E\left[e^{t X}\right] . \tag{9.5}
\end{equation*}
$$

(Note that $M(t)$ is strictly positive.) Since $C^{\prime}=M^{\prime} / M$ and $C^{\prime \prime}=\left(M M^{\prime \prime}-\right. \left.\left(M^{\prime}\right)^{2}\right) / M^{2}$, and since $M(0)=1$,

$$
\begin{equation*}
C(0)=0, \quad C^{\prime}(0)=E[X], \quad C^{\prime \prime}(0)=\operatorname{Var}[X] . \tag{9.6}
\end{equation*}
$$

Let $m_{k}=E\left[X^{k}\right]$. The leading term in (9.2) is $m_{0}=1$, and so a formal expansion of the logarithm in (9.5) gives

$$
\begin{equation*}
C(t)=\sum_{v=1}^{\infty} \frac{(-1)^{v+1}}{v}\left(\sum_{k=1}^{\infty} \frac{m_{k}}{k!} t^{k}\right)^{v} . \tag{9.7}
\end{equation*}
$$

Since $M(t) \rightarrow 1$ as $t \rightarrow 0$, this expression is valid for $t$ in some neighborhood of 0 . By the theory of series, the powers on the right can be expanded and
terms with a common factor $t^{i}$ collected together. This gives an expansion

$$
\begin{equation*}
C(t)=\sum_{i=1}^{\infty} \frac{c_{i}}{i!} t^{i}, \tag{9.8}
\end{equation*}
$$

valid in some neighborhood of 0 .
The $c_{i}$ are the cumulants of $X$. Equating coefficients in the expansions (9.7) and (9.8) leads to $c_{1}=m_{1}$ and $c_{2}=m_{2}-m_{1}^{2}$, which checks with (9.6). Each $c_{i}$ can be expressed as a polynomial in $m_{1}, \ldots, m_{i}$ and conversely, although the calculations soon become tedious. If $E[X]=0$, however, so that $m_{1}=c_{1}=0$, it is not hard to check that

$$
\begin{equation*}
c_{3}=m_{3}, \quad c_{4}=m_{4}-3 m_{2}^{2} . \tag{9.9}
\end{equation*}
$$

Taking logarithms converts the multiplicative relation (9.4) into the additive relation

$$
\begin{equation*}
C(t)=C_{1}(t)+\cdots+C_{n}(t) \tag{9.10}
\end{equation*}
$$

for the corresponding cumulant generating functions; it is valid in the presence of independence. By this and the definition (9.8), it follows that cumulants add for independent random variables.

Clearly, $M^{\prime \prime}(t)=E\left[X^{2} e^{t X}\right] \geq 0$. Since $\left(M^{\prime}(t)\right)^{2}=E^{2}\left[X e^{t X}\right] \leq E\left[e^{t X}\right]$. $E\left[X^{2} e^{t X}\right]=M(t) M^{\prime \prime}(t)$ by Schwarz's inequality (5.36), $C^{\prime \prime}(t) \geq 0$. Thus the moment generating function and the cumulant generating function are both convex.

## Large Deviations

Let $Y$ be a simple random variable assuming values $y_{j}$ with probabilities $p_{j}$. The problem is to estimate $P[Y \geq \alpha]$ when $Y$ has mean 0 and $\alpha$ is positive. It is notationally convenient to subtract $\alpha$ away from $Y$ and instead estimate $P[Y \geq 0]$ when $Y$ has negative mean.

Assume then that

$$
\begin{equation*}
E[Y]<0, \quad P[Y>0]>0, \tag{9.11}
\end{equation*}
$$

the second assumption to avoid trivialities. Let $M(t)=\sum_{j} p_{j} e^{i y_{j}}$ be the moment generating function of $Y$. Then $M^{\prime}(0)<0$ by the first assumption in
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-041.jpg?height=411&width=770&top_left_y=2441&top_left_x=553)
(9.11), and $M(t) \rightarrow \infty$ as $t \rightarrow \infty$ by the second. Since $M(t)$ is convex, it has its minimum $\rho$ at a positive argument $\tau$ :

$$
\begin{equation*}
\inf _{\imath} M(t)=M(\tau)=\rho, \quad 0<\rho<1, \quad \tau>0 . \tag{9.12}
\end{equation*}
$$

Construct (on an entirely irrelevant probability space) an auxiliary random variable $Z$ such that

$$
\begin{equation*}
P\left[Z=y_{j}\right]=\frac{e^{\tau y_{j}}}{\rho} P\left[Y=y_{j}\right] \tag{9.13}
\end{equation*}
$$

for each $y_{j}$ in the range of $Y$. Note that the probabilities on the right do add to 1 . The moment generating function of $Z$ is

$$
\begin{equation*}
E\left[e^{i z}\right]=\sum_{j} \frac{e^{\tau y_{j}}}{\rho} p_{j} e^{i y_{j}}=\frac{M(\tau+t)}{\rho}, \tag{9.14}
\end{equation*}
$$

and therefore

$$
\begin{equation*}
E[Z]=\frac{M^{\prime}(\tau)}{\rho}=0, \quad s^{2}=E\left[Z^{2}\right]=\frac{M^{\prime \prime}(\tau)}{\rho}>0 . \tag{9.15}
\end{equation*}
$$

For all positive $t, P[Y \geq 0]=P\left[e^{t Y} \geq 1\right] \leq M(t)$ by Markov's inequality (5.31), and hence

$$
\begin{equation*}
P[Y \geq 0] \leq \rho \tag{9.16}
\end{equation*}
$$

Inequalities in the other direction are harder to obtain. If $\Sigma^{\prime}$ denotes summation over those indices $j$ for which $y_{j} \geq 0$, then

$$
\begin{equation*}
P[Y \geq 0]=\sum^{\prime} p_{j}=\rho \sum^{\prime} e^{-\tau y_{j}} P\left[Z=y_{j}\right] . \tag{9.17}
\end{equation*}
$$

Put the final sum here in the form $e^{-\theta}$, and let $p=P[Z \geq 0]$. By (9.16), $\theta \geq 0$. Since $\log x$ is concave, Jensen's inequality (5.33) gives

$$
\begin{aligned}
-\theta & =\log \sum^{\prime} e^{-\tau y_{j}} p^{-1} P\left[Z=y_{j}\right]+\log p \\
& \geq \sum^{\prime}\left(-\tau y_{j}\right) p^{-1} P\left[Z=y_{j}\right]+\log p \\
& =-\tau s p^{-1} \sum^{\prime} \frac{y_{j}}{s} P\left[Z=y_{j}\right]+\log p
\end{aligned}
$$

By (9.15) and Lyapounov's inequality (5.37),

$$
\sum^{\prime} \frac{y_{j}}{s} P\left[Z=y_{j}\right] \leq \frac{1}{s} E[|Z|] \leq \frac{1}{s} E^{1 / 2}\left[Z^{2}\right]=1 .
$$

The last two inequalities give

$$
\begin{equation*}
0 \leq \theta \leq \frac{\tau s}{P[Z \geq 0]}-\log P[Z \geq 0] \tag{9.18}
\end{equation*}
$$

This proves the following result.
Theorem 9.1. Suppose that $Y$ satisfies (9.11). Define $\rho$ and $\tau$ by (9.12), let $Z$ be a random variable with distribution (9.13), and define $s^{2}$ by (9.15). Then $P[Y \geq 0]=\rho e^{-\theta}$, where $\theta$ satisfies (9.18).

To use (9.18) requires a lower bound for $P[Z \geq 0]$.
Theorem 9.2. If $E[Z]=0, E\left[Z^{2}\right]=s^{2}$, and $E\left[Z^{4}\right]=\xi^{4}>0$, then $P[Z \geq 0] \geq s^{4} / 4 \xi^{4}{ }^{\dagger}$

Proof. Let $Z^{+}=Z I_{[Z \geq 0]}$ and $Z^{-}=-Z I_{[Z<0]}$. Then $Z^{+}$and $Z^{-}$are nonnegative, $Z=Z^{+}-Z^{-}, Z^{2}=\left(Z^{+}\right)^{2}+\left(Z^{-}\right)^{2}$, and

$$
\begin{equation*}
s^{2}=E\left[\left(Z^{+}\right)^{2}\right]+E\left[\left(Z^{-}\right)^{2}\right] . \tag{9.19}
\end{equation*}
$$

Let $p=P[Z \geq 0]$. By Schwarz's inequality (5.36),

$$
\begin{aligned}
E\left[\left(Z^{+}\right)^{2}\right] & =E\left[I_{[Z \geq 0]} Z^{2}\right] \\
& \leq E^{1 / 2}\left[I_{[Z \geq 0]}^{2}\right] E^{1 / 2}\left[Z^{4}\right]=p^{1 / 2} \xi^{2}
\end{aligned}
$$

By Hölder's inequality (5.35) (for $p=\frac{3}{2}$ and $q=3$ )

$$
\begin{aligned}
E\left[\left(Z^{-}\right)^{2}\right] & =E\left[\left(Z^{-}\right)^{2 / 3}\left(Z^{-}\right)^{4 / 3}\right] \\
& \leq E^{2 / 3}\left[Z^{-}\right] E^{1 / 3}\left[\left(Z^{-}\right)^{4}\right] \leq E^{2 / 3}\left[Z^{-}\right] \xi^{4 / 3}
\end{aligned}
$$

Since $E[Z]=0$, another application of Hölder's inequality (for $p=4$ and $q=\frac{4}{3}$ ) gives

$$
\begin{aligned}
E\left[Z^{-}\right] & =E\left[Z^{+}\right]=E\left[Z I_{[Z \geq 0]}\right] \\
& \leq E^{1 / 4}\left[Z^{4}\right] E^{3 / 4}\left[I_{[Z \geq 0]}^{4 / 3}\right]=\xi p^{3 / 4} .
\end{aligned}
$$

Combining these three inequalities with (9.19) gives $s^{2} \leq p^{1 / 2} \xi^{2}+ \left(\xi p^{3 / 4}\right)^{2 / 3} \xi^{4 / 3}=2 p^{1 / 2} \xi^{2}$.

[^10]
## Chernoff's Theorem ${ }^{\dagger}$

Theorem 9.3. Let $X_{1}, X_{2}, \ldots$ be independent, identically distributed simple random variables satisfying $E\left[X_{n}\right]<0$ and $P\left[X_{n}>0\right]>0$, let $M(t)$ be their common moment generating function, and put $\rho=\inf _{,} M(t)$. Then

$$
\begin{equation*}
\lim _{n \rightarrow \infty} \frac{1}{n} \log P\left[X_{1}+\cdots+X_{n} \geq 0\right]=\log \rho \tag{9.20}
\end{equation*}
$$

Proof. Put $Y_{n}=X_{1}+\cdots+X_{n}$. Then $E\left[Y_{n}\right]<0$ and $P\left[Y_{n}>0\right] \geq P^{n}\left[X_{1}>0\right]>0$, and so the hypotheses of Theorem 91 are satisfied. Define $\rho_{n}$ and $\tau_{n}$ by $\inf _{l} M_{n}(t)=M_{n}\left(\tau_{n}\right)=\rho_{n}$, where $M_{n}(t)$ is the moment generating function of $Y_{n}$. Since $M_{n}(t)=M^{n}(t)$, it follows that $\rho_{n}=\rho^{n}$ and $\tau_{n}=\tau$, where $M(\tau)=\rho$.

Let $Z_{n}$ be the analogue for $Y_{n}$ of the $Z$ described by (9.13). Its moment generating function (see (9.14)) is $M_{n}(\tau+t) / \rho^{n}=(M(\tau+t) / \rho)^{n}$. This is also the moment generating function of $V_{1}+\cdots+V_{n}$ for independent tandom variables $V_{1}, \ldots, V_{n}$ each having moment generating function $M(\tau+t) / \rho$. Now each $V_{i}$ has (see (9.15)) mean 0 and some positive variance $\sigma^{2}$ and fourth moment $\xi^{4}$ independent of $i$. Since $Z_{n}$ must have the same moments as $V_{1}+\cdots+V_{n}$, it has mean 0 , variance $s_{n}^{2}=n \sigma^{2}$, and fourth moment $\xi_{n}^{4}=n \xi^{4}+3 n(n-1) \sigma^{4}=O\left(n^{2}\right)$ (see (6.2)). By Theorem 9.2, $P\left[Z_{n} \geq 0\right] \geq s_{n}^{4} / 4 \xi_{n}^{4} \geq \alpha$ for some positive $\alpha$ independent of $n$. By Theorem 9.1 then, $P\left[Y_{n} \geq 0\right]=\rho^{n} e^{-\theta_{n}}$, where $0 \leq \theta_{n} \leq \tau_{n} s_{n} \alpha^{-1}-\log \alpha=\tau \alpha^{-1} \sigma \sqrt{n}-\log \alpha$. This gives (9.20), and shows, in fact, that the rate of convergence is $O\left(n^{-1 / 2}\right)$. $\square$

This result is important in the theory of statistical hypothesis testing. An informal treatment of the Bernoulli case will illustrate the connection.

Suppose $S_{n}=X_{1}+\cdots+X_{n}$, where the $X_{i}$ are independent and assume the values 1 and 0 with probabilities $p$ and $q$. Now $P\left[S_{n} \geq n a\right]=P\left[\sum_{k=1}^{n}\left(X_{k}-a\right) \geq 0\right]$, and Chernoff's theorem applies if $p<a<\overline{1}$. In this case $M(t)=E\left[e^{t\left(X_{1}-a\right)}\right]=e^{-t a}\left(p e^{t}+\right. q$ ). Minimizing this shows that the $\rho$ of Chernoff's theorem satisfies

$$
-\log \rho=K(a, p)=a \log \frac{a}{p}+b \log \frac{b}{q},
$$

where $b=1-a$. By (9.20), $n^{-1} \log P\left[S_{n} \geq n a\right] \rightarrow-K(a, p)$; express this as

$$
\begin{equation*}
P\left[S_{n} \geq n a\right] \approx e^{-n K(a, p)} . \tag{9.21}
\end{equation*}
$$

Suppose now that $p$ is unknown and that there are two competing hypotheses concerning its value, the hypothesis $H_{1}$ that $p=p_{1}$ and the hypothesis $H_{2}$ that
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-044.jpg?height=60&width=1308&top_left_y=2747&top_left_x=132)
${ }^{\dagger}$ This theorem is not needed for the law of the iterated logarithm, Theorem 9.5.
$p=p_{2}$, where $p_{1}<p_{2}$. Given the observed results $X_{1}, \ldots, X_{n}$ of $n$ Bernoulli trials, one decides in favor of $H_{2}$ if $S_{n} \geq n a$ and in favor of $H_{1}$ if $S_{n}<n a$, where $a$ is some number satisfying $p_{1}<a<p_{2}$. The problem is to find an advantageous value for the threshold $a$.

By (9.21),

$$
\begin{equation*}
P\left[S_{n} \geq n a \mid H_{1}\right] \approx e^{-n K\left(a, p_{1}\right)} \tag{9.22}
\end{equation*}
$$

where the notation indicates that the probability is calculated for $p=p_{1}$-that is, under the assumption of $H_{1}$. By symmeny,

$$
\begin{equation*}
P\left[S_{n}<n a \mid H_{2}\right]=e^{-n K\left(a_{1}, p_{2}\right)} . \tag{923}
\end{equation*}
$$

The left sides of (9.22) and (923) are the probabilities of erroneously deciding in favor of $H_{2}$ when $H_{1}$ is, in fact, true and of erroneously deciding in favor of $H_{1}$ when $H_{2}$ is, in fact, true-the probabilities describing the level and power of the test.

Suppose $a$ is chosen so that $K\left(a, p_{1}\right)=K\left(a, p_{2}\right)$, which makes the two error probabilities approximately equal. This constraint gives for $a$ a linear equation with solution

$$
\begin{equation*}
a=a\left(p_{1}, p_{2}\right)=\frac{\log \left(q_{1} / q_{2}\right)}{\log \left(p_{2} / p_{1}\right)+\log \left(q_{1} / q_{2}\right)} \tag{9.24}
\end{equation*}
$$

where $q_{i}=1-p_{i}$ The common error probability is approximately $e^{-n K\left(a_{,} p_{1}\right)}$ for this value of $a$, and so the larger $K\left(a, p_{1}\right)$ is, the easier it is to distinguish statistically between $p_{1}$ and $p_{2}$.

Although $K\left(a\left(p_{1}, p_{2}\right), p_{1}\right)$ is a complicated function, it has a simple approximation for $p_{1}$ near $p_{2}$. As $x \rightarrow 0, \log (1+x)=x-\frac{1}{2} x^{2}+O\left(x^{3}\right)$. Using this in the definition of $K$ and collecting terms gives

$$
\begin{equation*}
K(p+x, p)=\frac{x^{2}}{2 p q}+O\left(x^{3}\right), \quad x \rightarrow 0 \tag{9.25}
\end{equation*}
$$

Fix $p_{1}=p$, and let $p_{2}=p+t$; (9.24) becomes a function $\psi(t)$ of $t$, and expanding the logarithms gives

$$
\begin{equation*}
\psi(t)=p+\frac{1}{2} t+O\left(t^{2}\right), \quad t \rightarrow 0 \tag{9.26}
\end{equation*}
$$

after some reductions. Finally, (9.25) and (9.26) together imply that

$$
\begin{equation*}
K(\psi(t), p)=\frac{t^{2}}{8 p q}+O\left(t^{3}\right), \quad t \rightarrow 0 \tag{9.27}
\end{equation*}
$$

In distinguishing $p_{1}=p$ from $p_{2}=p+t$ for small $t$, if $a$ is chosen to equalize the two error probabilities, then their common value is about $e^{-n t^{2} / 8 p q}$. For $t$ fixed, the nearer $p$ is to $\frac{1}{2}$, the larger this probability is and the more difficult it is to distinguish $p$ from $p+t$. As an example, compare $p=.1$ with $p=.5$. Now $.36 n t^{2} / 8(.1)(.9)= n t^{2} / 8(.5)(.5)$. With a sample only 36 percent as large, .1 can therefore be distinguished from $.1+t$ with about the same precision as .5 can be distinguished from $5+t$.

## The Law of the Iterated Logarithm

The analysis of the rate at which $S_{n} / n$ approaches the mean depends on the following variant of the theorem on large deviations.

Theorem 9.4. Let $S_{n}=X_{1}+\cdots+X_{n}$, where the $X_{n}$ are independent and identically distributed simple random variables with mean 0 and variance 1 . If $a_{n}$ are constants satisfying

$$
\begin{equation*}
a_{n} \rightarrow \infty, \quad \frac{a_{n}}{\sqrt{n}} \rightarrow 0, \tag{9.28}
\end{equation*}
$$

then

$$
\begin{equation*}
P\left[S_{n} \geq a_{n} \sqrt{n}\right]=e^{-a_{n}^{2}\left(1+\zeta_{n}\right) / 2} \tag{9.29}
\end{equation*}
$$

for a sequence $\zeta_{n}$ going to 0 .
Proof. Put $Y_{n}=S_{n}-a_{n} \sqrt{n}=\sum_{k=1}^{n}\left(X_{k}-a_{n} / \sqrt{n}\right)$. Then $E\left[Y_{n}\right]<0$. Since $X_{1}$ has mean 0 and variance $1, P\left[X_{1}>0\right]>0$, and it follows by (9.28) that $P\left[X_{1}>a_{n} / \sqrt{n}\right]>0$ for $n$ sufficiently large, in which case $P\left[Y_{n}>0\right] \geq P^{n}\left[X_{1}-a_{n} / \sqrt{n}>0\right]>0$. Thus Theorem 9.1 applies to $Y_{n}$ for all large enough $n$.

Let $M_{n}(t), \rho_{n}, \tau_{n}$, and $Z_{n}$ be associated with $Y_{n}$ as in the theorem. If $m(t)$ and $c(t)$ are the moment and cumulant generating functions of the $X_{n}$, then $M_{n}(t)$ is the $n$th power of the moment generating function $e^{-t a_{n} / \sqrt{n}} m(t)$ of $X_{1}-a_{n} / \sqrt{n}$, and so $Y_{n}$ has cumulant generating function

$$
\begin{equation*}
C_{n}(t)=-t a_{n} \sqrt{n}+n c(t) . \tag{9.30}
\end{equation*}
$$

Since $\tau_{n}$ is the unique minimum of $C_{n}(t)$, and since $C_{n}^{\prime}(t)=-a_{n} \sqrt{n}+ n c^{\prime}(t), \tau_{n}$ is determined by the equation $c^{\prime}\left(\tau_{n}\right)=a_{n} / \sqrt{n}$. Since $X_{1}$ has mean 0 and variance 1, it follows by (9.6) that

$$
\begin{equation*}
c(0)=c^{\prime}(0)=0, \quad c^{\prime \prime}(0)=1 \tag{9.31}
\end{equation*}
$$

Now $c^{\prime}(t)$ is nondecreasing because $c(t)$ is convex, and since $c^{\prime}\left(\tau_{n}\right)=a_{n} / \sqrt{n}$ goes to $0, \tau_{n}$ must therefore go to 0 as well and must in fact be $O\left(a_{n} / \sqrt{n}\right)$. By the second-order mean-value theorem for $c^{\prime}(t), a_{n} / \sqrt{n}=c^{\prime}\left(\tau_{n}\right)=\tau_{n}+ O\left(\tau_{n}^{2}\right)$, from which follows

$$
\begin{equation*}
\tau_{n}=\frac{a_{n}}{\sqrt{n}}+O\left(\frac{a_{n}^{2}}{n}\right) . \tag{9.32}
\end{equation*}
$$

By the third-order mean-value theorem for $c(t)$,

$$
\begin{aligned}
\log \rho_{n} & =C_{n}\left(\tau_{n}\right)=-\tau_{n} a_{n} \sqrt{n}+n c\left(\tau_{n}\right) \\
& =-\tau_{n} a_{n} \sqrt{n}+n\left[\frac{1}{2} \tau_{n}^{2}+O\left(\tau_{n}^{3}\right)\right] .
\end{aligned}
$$

Applying (9.32) gives

$$
\begin{equation*}
\log \rho_{n}=-\frac{1}{2} a_{n}^{2}+o\left(a_{n}^{2}\right) . \tag{9.33}
\end{equation*}
$$

Now (see (9.14)) $Z_{n}$ has moment generating function $M_{n}\left(\tau_{n}+t\right) / \rho_{n}$ and (see (9.30)) cumulant generating function $D_{n}(t)=C_{n}\left(\tau_{n}+t\right)-\log \rho_{n}=-\left(\tau_{n}\right. +t) \alpha_{n} \sqrt{n}+n c\left(t+\tau_{n}\right)-\log o_{n}$. The mean of $Z_{n}$ is $D_{n}^{\prime}(0)=0$. Its variance $s_{n}^{2}$ is $D_{n}^{\prime \prime}(0)$; by (9.31), this is

$$
\begin{equation*}
s_{n}^{2}=n c^{\prime \prime}\left(\tau_{n}\right)=n\left(c^{\prime \prime}(0)+O\left(\tau_{n}\right)\right)=n(1+o(1)) . \tag{9.34}
\end{equation*}
$$

The fourth cumulant of $Z_{n}$ is $D_{n}^{\prime \prime \prime}(0)=n c^{\prime \prime \prime \prime}\left(\tau_{n}\right)=O(n)$. By the formula (9.9) relating moments and cumulants (applicable because $E\left[Z_{n}\right]=0$ ), $E\left[Z_{n}^{4}\right]= 3 \mathrm{~s}_{n}^{4}+D_{n}^{\prime \prime \prime \prime}(0)$. Therefore, $E\left[Z_{n}^{4}\right] / s_{n}^{4} \rightarrow 3$, and it follows by Theorem 9.2 that there exists an $\alpha$ such that $P\left[Z_{n} \geq 0\right] \geq \alpha>0$ for all sufficiently large $n$.

By Theorem 9.1, $P\left[Y_{n} \geq 0\right]=\rho_{n} e^{-\theta_{n}}$ with $0 \leq \theta_{n} \leq \tau_{n} s_{n} \alpha^{-1}+\log \alpha$. By (9.28), (9.32), and (9.34), $\theta_{n}=O\left(a_{n}\right)=o\left(a_{n}^{2}\right)$, and it follows by (9.33) that $P\left[Y_{n} \geq 0\right]=e^{-a_{n}^{2}(1+o(1)) / 2}$. $\square$

The law of the iterated logarithm is this:

Theorem 9.5. Let $S_{n}=X_{1}+\cdots+X_{n}$, where the $X_{n}$ are independent, identically distributed simple random variables with mean 0 and variance 1. Then

$$
\begin{equation*}
P\left[\lim \sup _{n} \frac{S_{n}}{\sqrt{2 n \log \log n}}=1\right]=1 . \tag{9.35}
\end{equation*}
$$

Equivalent to (9.35) is the assertion that for positive $\epsilon$

$$
\begin{equation*}
P\left[S_{n} \geq(1+\epsilon) \sqrt{2 n \log \log n} \text { i.o. }\right]=0 \tag{9.36}
\end{equation*}
$$

and

$$
\begin{equation*}
P\left[S_{n} \geq(1-\epsilon) \sqrt{2 n \log \log n} \text { i.o. }\right]=1 . \tag{9.37}
\end{equation*}
$$

The set in (9.35) is, in fact, the intersection over positive rational $\epsilon$ of the sets in (9.37) minus the union over positive rational $\epsilon$ of the sets in (9.36).

The idea of the proof is this. Write

$$
\begin{equation*}
\phi(n)=\sqrt{2 n \log \log n} \tag{9.38}
\end{equation*}
$$

If $A_{n}^{ \pm}=\left[S_{n} \geq(1 \pm \epsilon) \phi(n)\right]$, then by (9.29), $P\left(A_{n}^{ \pm}\right)$is near $(\log n)^{-(1 \pm \epsilon)^{2}}$. If $n_{k}$ increases exponentially, say $n_{k} \sim \theta^{k}$ for $\theta>1$, then $P\left(A_{n_{k}}^{ \pm}\right)$is of the order $k^{-(1 \pm \epsilon)^{2}}$. Now $\Sigma_{k} k^{-(1 \pm \epsilon)^{2}}$ converges if the sign is + and diverges if the sign is -. It will follow by the first Borel-Cantelli lemma that there is probability 0 that $A_{n_{k}}^{+}$occurs for infinitely many $k$. In providing (9.36), an extra argument is required to get around the fact that the $A_{n}^{+}$for $n \neq n_{k}$ must also be accounted for (this requires choosing $\theta$ near 1 ). If the $A_{n}^{-}$were independent, it would follow by the second Borel-Cantelli lemma that with probability $1, A_{\overline{n_{k}}}$ occurs for infinitely many $k$, which would in tarn imply (9.37). An extra argument is required to get around the fact that the $A_{n_{k}}^{-}$are dependent (this requires choosing $\theta$ large).

For the proof of (9.36) a preliminary result is needed. Put $M_{k}= \max \left\{S_{0}, S_{1}, \ldots, S_{k}\right\}$, where $S_{0}=0$.

Theorem 9.6. If the $X_{k}$ are independent simple random variables with mean 0 and variance 1 , then for $\alpha \geq \sqrt{2}$.

$$
\begin{equation*}
P\left[\frac{M_{n}}{\sqrt{n}} \geq \alpha\right] \leq 2 P\left[\frac{S_{n}}{\sqrt{n}} \geq \alpha-\sqrt{2}\right] \tag{9.39}
\end{equation*}
$$

Proof. If $A_{j}=\left[M_{j-1}<\alpha \sqrt{n} \leq M_{j}\right]$, then

$$
P\left[\frac{M_{n}}{\sqrt{n}} \geq \alpha\right] \leq P\left[\frac{S_{n}}{\sqrt{n}} \geq \alpha-\sqrt{2}\right]+\sum_{j=1}^{n-1} P\left(A_{j} \cap\left[\frac{S_{n}}{\sqrt{n}} \leq \alpha-\sqrt{2}\right]\right) .
$$

Since $S_{n}-S_{j}$ has variance $n-j$, it follows by independence and Chebyshev's inequality that the probability in the sum is at most

$$
\begin{aligned}
P\left(A_{j} \cap\left[\frac{\left|S_{n}-S_{j}\right|}{\sqrt{n}}>\sqrt{2}\right]\right) & =P\left(A_{j}\right) P\left[\frac{\left|S_{n}-S_{j}\right|}{\sqrt{n}}>\sqrt{2}\right] \\
& \leq P\left(A_{j}\right) \frac{n-j}{2 n} \leq \frac{1}{2} P\left(A_{j}\right) .
\end{aligned}
$$

Since $\bigcup_{j=1}^{n-1} A_{j} \subset\left[M_{n} \geq \alpha \sqrt{n}\right]$,

$$
P\left[\frac{M_{n}}{\sqrt{n}} \geq \alpha\right] \leq P\left[\frac{S_{n}}{\sqrt{n}} \geq \alpha-\sqrt{2}\right]+\frac{1}{2} P\left[\frac{M_{n}}{\sqrt{n}} \geq \alpha\right]
$$ $\square$

Proof of (9.36). Given $\epsilon$, choose $\theta$ so that $\theta>1$ but $\theta^{2}<1+\epsilon$. Let $n_{k}=\left\lfloor\theta^{k}\right\rfloor$ and $x_{k}=\theta\left(2 \log \log n_{k}\right)^{1 / 2}$. By (9.29) and (9.39),

$$
P\left[\frac{M_{n_{k}}}{\sqrt{n_{k}}} \geq x_{k}\right] \leq 2 \exp \left[-\frac{1}{2}\left(x_{k}-\sqrt{2}\right)^{2}\left(1+\xi_{k}\right)\right] .
$$

where $\xi_{k} \rightarrow 0$. The negative of the exponent is asymptotically $\theta^{2} \log k$ and hence for large $k$ exceeds $\theta \log k$, so that

$$
P\left[\frac{M_{n_{k}}}{\sqrt{n_{k}}} \geq x_{k}\right] \leq \frac{2}{k^{\theta}} .
$$

Since $\theta>1$, it follows by the first Borel-Cantelli lemma that there is probability 0 that (see (9.38))

$$
\begin{equation*}
M_{n_{k}} \geq \theta \phi\left(n_{k}\right) \tag{9.40}
\end{equation*}
$$

for infinitely many $k$. Suppose that $n_{k-1}<n \leq n_{k}$ and that

$$
\begin{equation*}
S_{n}>(1+\epsilon) \phi(n) . \tag{9.41}
\end{equation*}
$$

Now $\phi(n) \geq \phi\left(n_{k-1}\right) \sim \theta^{-1 / 2} \phi\left(n_{k}\right)$; hence, by the choice of $\theta,(1+\epsilon) \phi(n)> \theta \phi\left(n_{k}\right)$ if $k$ is large enough. Thus for sufficiently large $k$, (9.41) implies (9.40) (if $n_{k-1}<n \leq n_{k}$ ), and there is therefore proability 0 that (9.41) holds for infinitely many $n$. $\square$

Procf of (9.37). Given $\epsilon$, choose an integer $\theta$ so large that $3 \theta^{-1 / 2}<\epsilon$. Take $n_{k}=\theta^{k}$. Now $n_{k}-n_{k-1} \rightarrow \infty$, and (9.29) applies with $n=n_{k}-n_{k-1}$ and $a_{n}=x_{k} / \sqrt{n_{k}-n_{k-1}}$, where $x_{k}=\left(1-\theta^{-1}\right) \phi\left(n_{k}\right)$. It follows that

$$
P\left[S_{n_{k}}-S_{n_{k-1}} \geq x_{k}\right]=P\left[S_{n_{k}-n_{k-1}} \geq x_{k}\right]=\exp \left[-\frac{1}{2} \frac{x_{k}^{2}}{n_{k}-n_{k-1}}\left(1+\xi_{k}\right)\right],
$$

where $\xi_{k} \rightarrow 0$. The negative of the exponent is asymptotically $\left(1-\theta^{-1}\right) \log k$ and so for large $k$ is less than log $k$, in which case $P\left[S_{n_{k}}-S_{n_{k-1}} \geq x_{k}\right] \geq k^{-1}$. The events here being independent, it follows by the second Borel-Cantelli lemma that with probability $1, S_{n_{k}}-S_{n_{k-1}} \geq x_{k}$ for infinitely many $k$. On the other hand, by (9.36) applied to $\left\{-X_{\mathrm{q}}\right\}$, there is probability 1 that $-S_{n_{k-1}} \leq 2 \phi\left(n_{k-1}\right) \leq 2 \theta^{-1 / 2} \phi\left(n_{k}\right)$ for all but finitely many $k$. These two inequalities give $S_{n_{k}} \geq x_{k}-2 \theta^{-1 / 2} \phi\left(n_{k}\right)>(1-\epsilon) \phi\left(n_{k}\right)$, the last inequality because of the choice of $\theta$. $\square$

That completes the proof of Theorem 9.5.

## PROBLEMS

9.1. Prove (6.2) by using (9.9) and the fact that cumulants add in the presence of independence.
9.2 In the Bernoulli case, (9.21) gives

$$
P\left[S_{n} \geq n p+x_{n}\right]=\exp \left[-n K\left(p+\frac{x_{n}}{n}, p\right)(1+o(1))\right]
$$

where $p<a<1$ and $x_{n}=n(a-p)$. Theorem 9.4 gives

$$
P\left[S_{n} \geq n p+x_{n}\right]=\exp \left[-\frac{x_{n}^{2}}{2 n p q}(1+o(1))\right],
$$

where $x_{n}=a_{n} \sqrt{n p q}$. Resolve the apparent discrepancy. Use (9.25) to compare the two expressions in case $x_{n} / n$ is small. See Problem 27.17.
9.3. Relabel the binomial parameter $p$ as $\theta=f(p)$, where $f$ is increasing and continuously differentiable. Show by (9.27) that the distinguishability of $\theta$ from $\theta+\Delta \theta$, as measured by $K$, is $(\Delta \theta)^{2} / 8 p(1-p)\left(f^{\prime}(p)\right)^{2}+O(\Delta \theta)^{3}$. The leading coefficient is independent of $\theta$ if $f(p)=\arcsin \sqrt{p}$.
9.4. From (9.35) and the same result for $\left\{-X_{n}\right\}$, together with the uniform boundedness of the $X_{n}$, deduce that with probability 1 the set of limit points of the sequence $\left\{S_{n}(2 n \log \log n)^{-1 / 2}\right\}$ is the closed interval from -1 to +1 .
9.5. $\uparrow$ Suppose $X_{n}$ takes the values $\pm 1$ with probability $\frac{1}{2}$ each, and show that $P\left[S_{n}=0\right.$ i.o. $]=1$. (This gives still another proof of the persistence of symmetric random walk on the line (Example 8.6).) Show more generally that, if the $X_{n}$ are bounded by $M$, then $P\left[\left|S_{n}\right| \leq M\right.$ i.o. $]=1$.
9.6. Weakened versions of (9.36) are quite easy to prove. By a fourthmoment argument (see (6.2)), show that $P\left[S_{n}>n^{3 / 4}(\log n)^{(1+\epsilon) / 4}\right.$ i.o. $]=0$. Use (9.29) to give a simple proof that $P\left[S_{n}>(3 n \log n)^{1 / 2}\right.$ i.o. $]=0$.
9.7. Show that (9.35) is true if $S_{n}$ is replaced by $\left|S_{n}\right|$ or $\max _{k \leq n} S_{k}$ or $\max _{k \leq n}\left|S_{k}\right|$.

## CHAPTER2

## Measure

## SECTION 10. GENERAL MEASURES

Lebesgue measure on the unit interval was central to the ideas in Chapter 1. Lebesgue measure on the entire real line is important in probability as well as in analysis generally, and a uniform treatment of this and other examples requires a notion of measure for which infinite values are possible. The present chapter extends the ideas of Sections 2 and 3 to this more general setting.

## Classes of Sets

The $\sigma$-field of Borel sets in ( 0,1 ] played an essential role in Chapter 1, and it is necessary to construct the analogous classes for the entire real line and for $k$-dimensional Euclidean space.

Example 10.1. Let $x=\left(x_{1}, \ldots, x_{k}\right)$ be the generic point of Euclidean $k$-space $R^{k}$. The bounded rectangles

$$
\begin{equation*}
\left[x=\left(x_{1}, \ldots, x_{k}\right): a_{i}<x_{i} \leq b_{i}, i=1, \ldots, k\right] \tag{10.1}
\end{equation*}
$$

will play in $R^{k}$ the role intervals $(a, b]$ played in $(0,1]$. Let $\mathscr{R}^{k}$ be the $\sigma$-field generated by these rectangles. This is the analogue of the class $\mathscr{B}$ of Borel sets in ( 0,1 ]; see Example 2.6. The elements of $\mathscr{R}^{k}$ are the $k$ dimensional Borel sets. For $k=1$ they are also called the linear Borel sets.

Call the rectangle (10.1) rational if the $a_{i}$ and $b_{i}$ are all rational. If $G$ is an open set in $R^{k}$ and $y \in G$, then there is a rational rectangle $A_{y}$ such that $y \in A_{y} \subset G$. But then $G=\cup_{y \in G} A_{y}$, and since there are only countably many rational rectangles, this is a countable union. Thus $\mathscr{P}^{k}$ contains the open sets. Since a closed set has open complement, $\mathscr{R}^{k}$ also contains the closed sets. Just as $\mathscr{B}$ contains all the sets in ( 0,1 ] that actually arise in
ordinary analysis and probability theory, $\mathscr{R}^{k}$ contains all the sets in $R^{k}$ that actually arise.

The $\sigma$-field $\mathscr{R}^{k}$ is generated by subclasses other than the class of rectangles. If $A_{n}$ is the $x$-set where $a_{i}<x_{i}<b_{i}+n^{-1}, i=1, \ldots, k$, then $A_{n}$ is open and (10.1) is $\bigcap_{n} A_{n}$. Thus $\mathscr{R}^{k}$ is generated by the open sets. Similarly, it is generated by the closed sets. Now an open set is a countable union of rational rectangles. Therefore, the (countable) class of rational rectangles generates $\mathscr{R}^{k}$. $\square$

The $\sigma$-field $\mathscr{R}^{1}$ on the line $R^{1}$ is by definition generated by the finite intervals. The $\sigma$-field $\mathscr{B}$ in ( 0,1 ] is generated by the subintervals of $(0,1]$. The question naturally arises whether the elements of $\mathscr{B}$ are the elements of $\mathscr{R}^{1}$ that happen to lie inside ( 0,1 ], and the answer is yes. If $\mathscr{A}$ is a class of sets in a space $\Omega$ and $\Omega_{0}$ is a subset of $\Omega$, let $\mathscr{A} \cap \Omega_{0}=\left[A \cap \Omega_{0}: A \in \mathscr{A}\right]$.

Theorem 10.1. (i) If $\mathscr{F}$ is a $\sigma$-field in $\Omega$, then $\mathscr{F} \cap \Omega_{0}$ is a $\sigma$-field in $\Omega_{0}$.
(ii) If $\mathscr{A}$ generates the $\sigma$-field $\mathscr{F}$ in $\Omega$, then $\mathscr{A} \cap \Omega_{0}$ generates the $\sigma$-field $\mathscr{F} \cap \Omega_{0}$ in $\Omega_{0}: \sigma\left(\mathscr{A} \cap \Omega_{0}\right)=\sigma(\mathscr{A}) \cap \Omega_{0}$.

Proof. Of course $\Omega_{0}=\Omega \cap \Omega_{0}$ lies in $\mathscr{F} \cap \Omega_{0}$. If $B$ lies in $\mathscr{F} \cap \Omega_{0}$, so that $B=A \cap \Omega_{0}$ for an $A \in \mathscr{F}$, then $\Omega_{0}-B=(\Omega-A) \cap \Omega_{0}$ lies in $\mathscr{F} \cap \Omega_{0}$. If $B_{n}$ lies in $\mathscr{F} \cap \Omega_{0}$ for all $n$, so that $B_{n}=A_{n} \cap \Omega_{0}$ for an $A_{n} \in \mathscr{F}$, then $\bigcup_{n} B_{n}=\left(\mathrm{U}_{n} A_{n}\right) \cap \Omega_{0}$ lies in $\mathscr{F} \cap \Omega_{0}$. Hence part (i).

Let $\mathscr{F}_{0}$ be the $\sigma$-field $\mathscr{A} \cap \Omega_{0}$ generates in $\Omega_{0}$. Since $\mathscr{A} \cap \Omega_{0} \subset \mathscr{F} \cap \Omega_{0}$ and $\mathscr{F} \cap \Omega_{0}$ is a $\sigma$-field by part (i), $\mathscr{F}_{0} \subset \mathscr{F} \cap \Omega_{0}$.

Now $\mathscr{F} \cap \Omega_{0} \subset \mathscr{F}_{0}$ will follow if it is shown that $A \in \mathscr{F}$ implies $A \cap \Omega_{0} \in \mathscr{F}_{0}$, or, to put it another way, if it is shown that $\mathscr{F}$ is contained in $\mathscr{G}=\left[A \subset \Omega: A \cap \Omega_{0} \in \mathscr{F}_{0}\right]$. Since $A \in \mathscr{A}$ implies that $A \cap \Omega_{0}$ lies in $\mathscr{A} \cap \Omega_{0}$ and hence in $\mathscr{F} \cap \Omega_{0}$, it follows that $\mathscr{A} \subset \mathscr{G}$. It is therefore enough to show that $\mathscr{G}$ is a $\sigma$-field in $\Omega$. Since $\Omega \cap \Omega_{0}=\Omega_{0}$ lies in $\mathscr{F}_{0}$, it follows that $\Omega \in \mathscr{G}$. If $A \in \mathscr{G}$, then $(\Omega-A) \cap \Omega_{0}=\Omega_{0}-\left(A \cap \Omega_{0}\right)$ lies in $\mathscr{F}_{0}$ and hence $\Omega-A \in \mathscr{H}$. If $A_{n} \in \mathscr{G}$ for all $n$, then $\left(\cup_{n} A_{n}\right) \cap \Omega_{0}=\cup_{n}\left(A_{n} \cap \Omega_{0}\right)$ lies in $\mathscr{F}_{0}$ and hence $\cup_{n} A_{n} \in \mathscr{G}$. $\square$

If $\Omega_{0} \in \mathscr{F}$, then $\mathscr{F} \cap \Omega_{0}=\left[A: A \subset \Omega_{0}, A \in \mathscr{F}\right]$. If $\Omega=R^{1}, \Omega_{0}=(0,1]$, and $\mathscr{F}=\mathscr{R}^{1}$, and if $\mathscr{A}$ is the class of finite intervals on the line, then $\mathscr{A} \cap \Omega_{0}$ is the class of subintervals of $(0,1]$, and $\mathscr{B}=\sigma\left(\mathscr{A} \cap \Omega_{0}\right)$ is given by

$$
\begin{equation*}
\mathscr{B}=\left[A: A \subset(0,1], A \in \mathscr{R}^{1}\right] . \tag{10.2}
\end{equation*}
$$

A subset of $(0,1]$ is thus a Borel set (lies in $\mathscr{B}$ ) if and only if it is a linear Borel set (lies in $\mathscr{R}^{1}$ ), and the distinction in terminology can be dropped.

## Conventions Involving $\infty$

Measures assume values in the set $[0, \infty]$ consisting of the ordinary nonnegative reals and the special value $\infty$, and some arithmetic conventions are called for.

For $x, y \in[0, \infty], x \leq y$ means that $y=\infty$ or else $x$ and $y$ are finite (that is, are ordinary real numbers) and $x \leq y$ holds in the usual sense. Similarly, $x<y$ means that $y=\infty$ and $x$ is finite or else $x$ and $y$ are both finite and $x<y$ holds in the usual sense.

For a finite or infinite sequence $x, x_{1}, x_{2}, \ldots$ in $[0, \infty]$,

$$
\begin{equation*}
x=\sum_{k} x_{k} \tag{10.3}
\end{equation*}
$$

means that either (i) $x=\infty$ and $x_{k}=\infty$ for some $k$, or (ii) $x=\infty$ and $x_{k}<\infty$ for all $k$ and $\sum_{k} x_{k}$ is an ordinary divergent infinite series, or (iii) $x<\infty$ and $x_{k}<\infty$ for all $k$ and (10.3) holds in the usual sense for $\sum_{k} x_{k}$ an ordinary finite sum or convergent infinite series. By these conventions and Dirichlet's theorem [A26], the order of summation in (10.3) has no effect on the sum.

For an infinite sequence $x, x_{1}, x_{2}, \ldots$ in $[0, \infty]$,

$$
\begin{equation*}
x_{k} \uparrow x \tag{10.4}
\end{equation*}
$$

means in the first place that $x_{k} \leq x_{k+1} \leq x$ and in the second place that either (i) $x<\infty$ and there is convergence in the usual sense, or (ii) $x_{k}=\infty$ for some $k$, or (iii) $x=\infty$ and the $x_{k}$ are finite reals converging to infinity in the usual sense.

## Measures

A set function $\mu$ on a field $\mathscr{F}$ in $\Omega$ is a measure if it satisfies these conditions:
(i) $\mu(A) \in[0, \infty]$ for $A \in \mathscr{F}$;
(ii) $\mu(\varnothing)=0$;
(iii) if $A_{1}, A_{2}, \ldots$ is a disioint sequence of $\mathscr{F}$-sets and if $\bigcup_{k=1}^{\infty} A_{k} \in \mathscr{F}$, then (see (10.3))

$$
\mu\left(\bigcup_{k=1}^{\infty} A_{k}\right)=\sum_{k=1}^{\infty} \mu\left(A_{k}\right) .
$$

The measure $\mu$ is finite or infinite as $\mu(\Omega)<\infty$ or $\mu(\Omega)=\infty$; it is a probability measure if $\mu(\Omega)=1$, as in Chapter 1 .

If $\Omega=A_{1} \cup A_{2} \cup \ldots$ for some finite or countable sequence of $\mathscr{F}$-sets satisfying $\mu\left(A_{k}\right)<\infty$, then $\mu$ is $\sigma$-finite. The significance of this concept will be seen later. A finite measure is by definition $\sigma$-finite; a $\sigma$-finite measure may be finite or infinite. If $\mathscr{A}$ is a subclass of $\mathscr{F}$, then $\mu$ is $\sigma$-finite on $\mathscr{A}$ if $\Omega=\bigcup_{k} A_{k}$ for some finite or infinite sequence of $\mathscr{A}$-sets satisfying $\mu\left(A_{k}\right)< \infty$. It is not required that these sets $A_{k}$ be disjoint. Note that if $\Omega$ is not a finite or countable union of $\mathscr{A}$-sets, then no measure can be $\sigma$-finite on $\mathscr{A}$. It
is important to understand that $\sigma$-finiteness is a joint property of the space $\Omega$, the measure $\mu$, and the class $\mathscr{A}$.

If $\mu$ is a measure on a $\sigma$-field $\mathscr{F}$ in $\Omega$, the triple ( $\Omega, \mathscr{F}, \mu$ ) is a measure space. (This term is not used if $\mathscr{F}$ is merely a field.) It is an infinite, a $\sigma$-finite, a finite, or a probability measure space according as $\mu$ has the corresponding property. If $\mu\left(A^{c}\right)=0$ for an $\mathscr{F}$-set $A$, then $A$ is a support of $\mu$, and $\mu$ is concentrated on $A$. For a finite measure, $A$ is a support if and only if $\mu(A)=\mu(\Omega)$.

The pair ( $\Omega, \mathscr{F}$ ) itself is a measurable space if $\mathscr{F}$ is a $\sigma$-field in $\Omega$. To say that $\mu$ is a measure on ( $\Omega, \mathscr{F}$ ) indicates clearly both the space and the class of sets involved.

As in the case of probability measures, (iii) above is the condition of countable additivity, and it implies finite additivity: If $A_{1}, \ldots, A_{n}$ are disjoint $\mathscr{F}_{\text {-sets, then }}$

$$
\mu\left(\bigcup_{k=1}^{n} A_{k}\right)=\sum_{k=1}^{n} \mu\left(A_{k}\right) .
$$

As in the case of probability measures, if this holds for $n=2$, then it extends inductively to all $n$.

Example 10.2. A measure $\mu$ on ( $\Omega, \mathscr{F}$ ) is discrete if there are finitely or countably many points $\omega_{i}$ in $\Omega$ and masses $m_{i}$ in $[0, \infty]$ such that $\mu(A)= \sum_{\omega_{i} \in A} m_{i}$ for $A \in \mathscr{F}$. It is an infinite, a finite, or a probability measure as $\sum_{i} m_{i}$ diverges, or converges, or converges to 1 ; the last case was treated in Example 2.9. If $\mathscr{F}$ contains each singleton $\left\{\omega_{i}\right\}$, then $\mu$ is $\sigma$-finite if and only if $m_{i}<\infty$ for all $i$ $\square$

Example 10.3. Let $\mathscr{F}$ be the $\sigma$-field of all subsets of an arbitrary $\Omega$, and let $\mu(A)$ be the number of points in $A$, where $\mu(A)=\infty$ if $A$ is not finite. This $\mu$ is counting measure; it is finite if and only if $\Omega$ is finite, and is $\sigma$-finite if and only if $\Omega$ is countable. Even if $\mathscr{F}$ does not contain every subset of $\Omega$, counting measure is well defined on $\mathscr{F}$. $\square$

Example 10.4. Specifying a measure includes specifying its domain. If $\mu$ is a measure on a field $\mathscr{F}$ and $\mathscr{F}_{0}$ is a field contained in $\mathscr{F}$, then the restriction $\mu_{0}$ of $\mu$ to $\mathscr{F}_{0}$ is also a measure. Although often denoted by the same symbol, $\mu_{0}$ is really a different measure from $\mu$ unless $\mathscr{F}_{0}=\mathscr{F}$. Its properties may be different: If $\mu$ is counting measure on the $\sigma$-field $\mathscr{F}$ of all subsets of a countably infinite $\Omega$, then $\mu$ is $\sigma$-finite, but its restriction to the $\sigma$-field $\mathscr{F}_{0}=\{\varnothing, \Omega\}$ is not $\sigma$-finite. $\square$

Certain properties of probability measures carry over immediately to the general case. First, $\mu$ is monotone: $\mu(A) \leq \mu(B)$ if $A \subset B$. This is derived, just like its special case (2.5), from $\mu(A)+\mu(B-A)=\mu(B)$. But it is possible to go on and write $\mu(B-A)=\mu(B)-\mu(A)$ only if $\mu(B)<\infty$. If $\mu(B)=\infty$ and $\mu(A)<\infty$, then $\mu(B-A)=\infty$; but for every $\alpha \in[0, \infty]$ there are cases where $\mu(A)=\mu(B)=\infty$ and $\mu(B-A)=\alpha$. The inclusion-exclusion formula (2.9) also carries over without change to $\mathscr{F}$-sets of finite measure:

$$
\begin{align*}
\mu\left(\bigcup_{k=1}^{n} A_{k}\right)= & \sum_{i} \mu\left(A_{i}\right)-\sum_{i<j} \mu\left(A_{i} \cap A_{j}\right)+\cdots  \tag{10.5}\\
& +(-1)^{n+1} \mu\left(A_{1} \cap \cdots \cap A_{n}\right)
\end{align*}
$$

The proof of finite subadditivity also goes through just as before:

$$
\mu\left(\bigcup_{k=1}^{n} A_{k}\right) \leq \sum_{k=1}^{n} \mu\left(A_{k}\right) ;
$$

here the $A_{k}$ need not have finite measure.
Theorem 10.2. Let $\mu$ be a measure on a field $\mathscr{F}$.
(i) Continuity from below: If $A_{n}$ and $A$ lie in $\mathscr{F}$ and $A_{n} \uparrow A$, then ${ }^{\dagger} \mu\left(A_{n}\right) \uparrow \mu(A)$.
(ii) Continuity from above: If $A_{n}$ and $A$ lie in $\mathscr{F}$ and $A_{n} \downarrow A$, and if $\mu\left(A_{1}\right)<\infty$, then $\mu\left(A_{n}\right) \downarrow \mu(A)$.
(iii) Countable subadditivity: If $A_{1}, A_{2}, \ldots$ and $\cup_{k=1}^{\infty} A_{k}$ lie in $\mathscr{F}$, then

$$
\mu\left(\bigcup_{k=1}^{\infty} A_{k}\right) \leq \sum_{k=1}^{\infty} \mu\left(A_{k}\right) .
$$

(iv) If $\mu$ is $\sigma$-finite on $\mathscr{F}$, then $\mathscr{F}$ cannot contain an uncountable, disjoint collection of sets of positive $\mu$-measure.

Proof. The proofs of (i) and (iii) are exactly as for the corresponding parts of Theorem 2.1. The same is essentially true of (ii): If $\mu\left(A_{1}\right)<\infty$, subtraction is possible and $A_{1}-A_{n} \uparrow A_{1}-A$ implies that $\mu\left(A_{1}\right)-\mu\left(A_{n}\right)= \mu\left(A_{1}-A_{n}\right) \uparrow \mu\left(A_{1}-A\right)=\mu\left(A_{1}\right)-\mu(A)$.

There remains (iv). Let $\left[B_{\theta}: \theta \in \Theta\right]$ be a disjoint collection of $\mathscr{F}$-sets satisfying $\mu\left(B_{\theta}\right)>0$. Consider an $\mathscr{F}$-set $A$ for which $\mu(A)<\infty$. If $\theta_{1}, \ldots, \theta_{n}$ are distinct indices satisfying $\mu\left(A \cap B_{\theta_{i}}\right) \geq \epsilon>0$, then $n \epsilon \leq \sum_{i=1}^{n} \mu\left(A \cap B_{\theta_{i}}\right) \leq \mu(A)$, and so $n \leq \mu(A) / \epsilon$. Thus the index set $\left[\theta: \mu\left(A \cap B_{\theta}\right)>\epsilon\right]$ is finite,
${ }^{\dagger}$ See (10.4).
and hence (take the union over positive rational $\epsilon$ ) $\left[\theta: \mu\left(A \cap B_{\theta}\right)>0\right]$ is countable. Since $\mu$ is $\sigma$-finite, $\Omega=\bigcup_{k} A_{k}$ for some finite or countable sequence of $\mathscr{F}$-sets $A_{k}$ satisfying $\mu\left(A_{k}\right)<\infty$. But then $\Theta_{k}=\left[\theta: \mu\left(A_{k} \cap B_{\theta}\right)\right. >0]$ is countable for each $k$. Since $\mu\left(B_{\theta}\right)>0$, there is a $k$ for which $\mu\left(A_{k} \cap B_{\theta}\right)>0$, and so $\Theta=\bigcup_{k} \Theta_{k}: \Theta$ is indeed countable. $\square$

## Uniqueness

According to Theorem 3.3, probability measures agreeing on a $\pi$-system $\mathscr{P}$ agree on $\sigma(\mathscr{P})$. There is an extension to the general case.

Theorem 10.3. Suppose that $\mu_{1}$ and $\mu_{2}$ are measures on $\sigma(\mathscr{P})$, where $\mathscr{P}$ is a $\pi$-system, and suppose they are $\sigma$-finite on $\mathscr{P}$. If $\mu_{1}$ and $\mu_{2}$ agree on $\mathscr{P}$, then they agree on $\sigma(\mathscr{P})$.

Proof. Suppose that $B \in \mathscr{P}$ and $\mu_{1}(B)=\mu_{2}(B)<\infty$, and let $\mathscr{L}_{B}$ be the class of sets $A$ in $\sigma(\mathscr{P})$ for which $\mu_{1}(B \cap A)=\mu_{2}(B \cap A)$. Then $\mathscr{L}_{B}$ is a $\lambda$-system containing $\mathscr{P}$ and hence (Theorem 3.2) containing $\sigma(\mathscr{P})$.

By $\sigma$-finiteness there exist $\mathscr{P}_{\text {sets }} B_{k}$ satisfying $\Omega=\bigcup_{k} B_{k}$ and $\mu_{1}\left(B_{k}\right)= \mu_{2}\left(B_{k}\right)<\infty$. By the inclusion-exclusion formula (10.5),

$$
\mu_{\alpha}\left(\bigcup_{i=1}^{n}\left(B_{i} \cap A\right)\right)=\sum_{1 \leq i \leq n} \mu_{\alpha}\left(B_{i} \cap A\right)-\sum_{1 \leq i<j \leq n} \mu_{\alpha}\left(B_{i} \cap B_{j} \cap A\right)+\cdots
$$

for $\alpha=1,2$ and all $n$. Since $\mathscr{P}$ is a $\pi$-system containing the $B_{i}$, it contains the $B_{i} \cap B_{j}$, and so on. For each $\sigma(\mathscr{P})$-set $A$, the terms on the right above are therefore the same for $\alpha=1$ as for $\alpha=2$. The left side is then the same for $\alpha=1$ as for $\alpha=2$; letting $n \rightarrow \infty$ gives $\mu_{1}(A)=\mu_{2}(A)$. $\square$

Theorem 10.4. Suppose $\mu_{1}$ and $\mu_{2}$ are finite measures on $\sigma(\mathscr{P})$, where $\mathscr{P}$ is a $\pi$-system and $\Omega$ is a finite or countable union of sets in $\mathscr{P}$. If $\mu_{1}$ and $\mu_{2}$ agree on $\mathscr{P}$, then they agree on $\sigma(\mathscr{P})$.

Proof. By hypothesis, $\Omega=\bigcup_{k} B_{k}$ for $\mathscr{P}_{\text {sets }} B_{k}$, and of course $\mu_{\alpha}\left(B_{k}\right) \leq \mu_{\alpha}(\Omega)<\infty, \alpha=1,2$. Thus $\mu_{1}$ and $\mu_{2}$ are $\sigma$-finite on $\mathscr{P}$, and Theorem 10.3 applies. $\square$

Example 10.5. If $\mathscr{P}$ consists of the empty set alone, then it is a $\pi$-system and $\sigma(\mathscr{P})=\{\varnothing, \Omega\}$. Any two finite measures agree on $\mathscr{P}$, but of course they need not agree on $\sigma(\mathscr{P})$. Theorem 10.4 does not apply in this case, because $\Omega$ is not a countable union of sets in $\mathscr{P}$. For the same reason, no measure on $\sigma(\mathscr{P})$ is $\sigma$-finite on $\mathscr{P}$, and hence Theorem 10.3 does not apply. $\square$

Example 10.6. Suppose that $(\Omega, \mathscr{F})=\left(R^{1}, \mathscr{P}^{1}\right)$ and $\mathscr{P}$ consists of the half-infinite intervals $(-\infty, x]$. By Theorem 10.4, two finite measures on $\mathscr{F}$ that agree on $\mathscr{P}$ also agree on $\mathscr{F}$. The $\mathscr{P}$-sets of finite measure required in the definition of $\sigma$-finiteness cannot in this example be made disjoint.

Example 10.7. If a measure on ( $\Omega, \mathscr{F}$ ) is $\sigma$-finite on a subfield $\mathscr{F}_{0}$ of $\mathscr{F}$, then $\Omega=\bigcup_{k} B_{k}$ for disjoint $\mathscr{F}_{0}$-sets $B_{k}$ of finite measure: if they are not disjoint, replace $B_{k}$ by $B_{k} \cap B_{1}^{c} \cdots \cap B_{k-1}^{c}$.

The proof of Theorem 10.3 simplifies slightly if $\Omega=\bigcup_{k} B_{k}$ for disjoint $\mathscr{P}_{\text {sets }}$ with $\mu_{1}\left(B_{k}\right)=\mu_{2}\left(B_{k}\right)<\infty$, because additivity itself can be used in place of the inclusion-exclusion formula.

## PROBLEMS

10.1. Show that if conditions (i) and (iii) in the definition of measure hold, and if $\mu(A)<\infty$ for some $A \in \mathscr{F}$, then condition (ii) holds.
10.2. On the $\sigma$-field of all subsets of $\Omega=\{1,2, \ldots\}$ put $\mu(A)=\Sigma_{k \in A^{2-k}}$ if $A$ is finite and $\mu(A)=\infty$ otherwise. Is $\mu$ finitely additive? Countably additive?
10.3. (a) In connection with Theorem 10.2(ii), show that if $A_{n} \downarrow A$ and $\mu\left(A_{k}\right)<\infty$ for some $k$, then $\mu\left(A_{n}\right) \downarrow \mu(A)$.
(b) Find an example in which $A_{n} \downarrow A, \mu\left(A_{n}\right) \equiv \infty$, and $A=\varnothing$.
10.4. The natural generalization of (4.9) is

$$
\begin{align*}
\mu\left(\lim \inf _{n} A_{n}\right) & \leq \lim \inf _{n} \mu\left(A_{n}\right)  \tag{10.6}\\
& \leq \lim \sup _{n} \mu\left(A_{n}\right) \leq \mu\left(\lim \sup _{n} A_{n}\right) .
\end{align*}
$$

Show that the left-hand inequality always holds. Show that the right-hand inequality holds if $\mu\left(\bigcup_{k \geq n} A_{k}\right)<\infty$ for some $n$ but can fail otherwise.
10.5. 3.10 A measure space ( $\Omega, \mathscr{F}, \mu$ ) is complete if $A \subset B, B \in \mathscr{F}$, and $\mu(B)=0$ together imply that $A \in \mathscr{F}$-the definition is just as in the probability case. Use the ideas of Problem 3.10 to construct a complete measure space $\left(\Omega, \mathscr{F}^{+}, \mu^{+}\right)$ such that $\mathscr{F} \subset \mathscr{F}^{+}$and $\mu$ and $\mu^{+}$agree on $\mathscr{F}$.
10.6. The condition in Theorem 10.2(iv) essentially characterizes $\sigma$-finiteness.
(a) Suppose that $\left(\Omega, \mathscr{F}_{, \mu}\right)$ has no "infinite atoms," in the sense that for every $A$ in $\mathscr{F}$, if $\mu(A)=\infty$, then there is in $\mathscr{F}$ a $B$ such that $B \subset A$ and $0<\mu(B)<\infty$. Show that if $\mathscr{F}$ does not contain an uncountable, disjoint collection of sets of positive measure, then $\mu$ is $\sigma$-finite. (Use Zorn's lemma.)
(b) Show by example that this is false without the condition that there are no "infinite atoms."
10.7. Example 10.5 shows that Theorem 10.3 fails without the $\sigma$-finiteness condition. Construct other examples of this kind.

## SECTION 11. OUTER MEASURE

## Outer Measure

An outer measure is a set function $\mu^{*}$ that is defined for all subsets of a space $\Omega$ and has these four properties:
(i) $\mu^{*}(A) \in[0, \infty]$ for every $A \subset \Omega$;
(ii) $\mu^{*}(\varnothing)=0$;
(iii) $\mu^{*}$ is monotone: $A \subset B$ implies $\mu^{*}(A) \leq \mu^{*}(B)$;
(iv) $\mu^{*}$ is countably subadditive: $\mu^{*}\left(\bigcup_{n} A_{n}\right) \leq \sum_{n} \mu^{*}\left(A_{n}\right)$.

The set function $P^{*}$ defined by (3.1) is an example, one which generalizes:
Example 11.1. Let $\rho$ be a set function on a class $\mathscr{L}$ in $\Omega$. Assume that $\varnothing \in \mathscr{A}$ and $\rho(\varnothing)=0$, and that $\rho(A) \in[0, \infty]$ for $A \in \mathscr{A} ; \rho$ and $\mathscr{A}$ are otherwise arbitrary. Put

$$
\begin{equation*}
\mu^{*}(A)=\inf \sum_{n} \rho\left(A_{n}\right) \tag{11.1}
\end{equation*}
$$

where the infimum extends over all finite and countable coverings of $A$ by $\mathscr{L}$-sets $A_{n}$. If no such covering exists, take $\mu^{*}(A)=\infty$ in accordance with the convention that the infimum over an empty set is $\infty$.

That $\mu^{*}$ satisfies (i), (ii), and (iii) is clear. If $\mu^{*}\left(A_{n}\right)=\infty$ for some $n$, then obviously $\mu^{*}\left(\cup_{n} A_{n}\right) \leq \sum_{n} \mu^{*}\left(A_{n}\right)$. Otherwise, cover each $A_{n}$ by $\mathscr{A}$-sets $B_{n k}$ satisfying $\Sigma_{k} \rho\left(B_{n k}\right)<\mu^{*}\left(A_{n}\right)+\epsilon / 2^{n}$; then $\mu^{*}\left(\bigcup_{n} A_{n}\right) \leq \sum_{n, k} \rho\left(B_{n k}\right)< \Sigma_{n} \mu^{*}\left(A_{n}\right)+\epsilon$. Thus $\mu^{*}$ is an outer measure. $\square$

Define $A$ to be $\mu^{*}$-measurable if

$$
\begin{equation*}
\mu^{*}(A \cap E)+\mu^{*}\left(A^{c} \cap E\right)=\mu^{*}(E) \tag{11.2}
\end{equation*}
$$

for every $E$. This is the general version of the definition (3.4) used in Section 3. By subadditívity it is equivalent to

$$
\begin{equation*}
\mu^{*}(A \cap E)+\mu^{*}\left(A^{c} \cap E\right) \leq \mu^{*}(E) \tag{11.3}
\end{equation*}
$$

Denote by $\mathscr{M}\left(\mu^{*}\right)$ the class of $\mu^{*}$-measurable sets.
The extension property for probability measures in Theorem 3.1 was proved by a sequence of lemmas the first three of which carry over directly to the case of the general outer measure: If $P^{*}$ is replaced by $\mu^{*}$ and $\mathscr{M}$ by $\mathscr{M}\left(\mu^{*}\right)$ at each occurrence, the proofs hold word for word, symbol for symbol.

In particular, an examination of the arguments shows that $\infty$ as a possible value for $\mu^{*}$ does not require any changes. Lemma 3 in Section 3 becomes this:

Theorem 11.1. If $\mu^{*}$ is an outer measure, then $\mathscr{M}\left(\mu^{*}\right)$ is a $\sigma$-field, and $\mu^{*}$ restricted to $\mathscr{M}\left(\mu^{*}\right)$ is a measure.

This will be used to prove an extension theorem, but it has other applications as well.

## Extension

Theorem 11.2. A measure on a field has an extension to the generated $\sigma$-field.

If the original measure on the field is $\sigma$-finite, then it follows by Theorem 10.3 that the extension is unique.

Theorem 11.2 can be deduced from Theorem 11.1 by the arguments used in the proof of Theorem 3.1. ${ }^{\dagger}$ It is unnecessary to retrace the steps, however, because the ideas will appear in stronger form in the proof of the next result, which generalizes Theorem 11.2.

Define a class $\mathscr{A}$ of subsets of $\Omega$ to be a semiring if
(i) $\varnothing \in \mathscr{A}$;
(ii) $A, B \in \mathscr{A}$ implies $A \cap B \in \mathscr{A}$;
(iii) if $A, B \in \mathscr{A}$ and $A \subset B$, then there exist disjoint $\mathscr{A}$-sets $C_{1}, \ldots, C_{n}$ such that $B-A=\bigcup_{k=1}^{n} C_{k}$.

The class of finite intervals in $\Omega=R^{1}$ and the class of subintervals of $\Omega=(0,1]$ are the simplest examples of semirings. Note that a semiring need not contain $\Omega$.

Theorem 11.3. Suppose that $\mu$ is a set function on a semiring $\mathscr{A}$. Suppose that $\mu$ has values in $[0, \infty]$, that $\mu(\varnothing)=0$, and that $\mu$ is finitely additive and countably subadditive. Then $\mu$ extends to a measure on $\sigma(\mathscr{A})$.

This contains Theorem 11.2, because the conditions are all satisfied if $\mathscr{A}$ is a field and $\mu$ is a measure on it. If $\Omega=\bigcup_{k} A_{k}$ for a sequence of $\mathscr{A}$-sets satisfying $\mu\left(A_{k}\right)<\infty$, then it follows by Theorem 10.3 that the extension is unique.

[^11]Proof. If $A, B$, and the $C_{k}$ are related as in condition (iii) in the definition of semiring, then by finite additivity $\mu(B)=\mu(A)+\sum_{k=1}^{n} \mu\left(C_{k}\right) \geq \mu(A)$. Thus $\mu$ is monotone.

Define an outer measure $\mu^{*}$ by (11.1) for $\rho=\mu$ :

$$
\begin{equation*}
\mu^{*}(A)=\inf \sum_{n} \mu\left(A_{n}\right) \tag{11.4}
\end{equation*}
$$

the infimum extending over coverings of $A$ by $\mathscr{A}$-sets.
The first step is to show that $\mathscr{A} \subset \mathscr{M}\left(\mu^{*}\right)$. Suppose that $A \in \mathscr{A}$. If $\mu^{*}(E)=\infty$, then (11.3) holds trivially. If $\mu^{*}(E)<\infty$, for given $\epsilon$ choose $\mathscr{L}$-sets $A_{n}$ such that $E \subset \cup_{n} A_{n}$ and $\sum_{n} \mu\left(A_{n}\right)<\mu^{*}(E)+\epsilon$. Since $\mathscr{A}$ is a semiring, $B_{n}=A \cap A_{n}$ lies in $\mathscr{A}$ and $A^{c} \cap A_{n}=A_{n}-B_{n}$ has the form $\cup_{k=1}^{m_{n}} C_{n k}$ for disjoint $\mathscr{L}$-sets $C_{n k}$. Note that $A_{n}=B_{n} \cup \cup_{k=1}^{m_{n}} C_{n k}$, where the union is disjoint, and that $A \cap E \subset \cup_{n} B_{n}$ and $A^{c} \cap E \subset \cup_{n} \cup_{k=1}^{m_{n}} C_{n k}$. By the definition of $\mu^{*}$ and the assumed finite additivity of $\mu$,

$$
\begin{aligned}
\mu^{*}(A \cap E)+\mu^{*}\left(A^{c} \cap E\right) & \leq \sum_{n} \mu\left(B_{n}\right)+\sum_{n} \sum_{k=1}^{m_{n}} \mu\left(C_{n k}\right) \\
& =\sum_{n} \mu\left(A_{n}\right)<\mu^{*}(E)+\epsilon .
\end{aligned}
$$

Since $\epsilon$ is arbitrary, (11.3) follows. Thus $\mathscr{A} \subset \mathscr{M}\left(\mu^{*}\right)$.
The next step is to show that $\mu^{*}$ and $\mu$ agree on $\mathscr{A}$. If $A \subset \cup_{n} A_{n}$ for $\mathscr{A}$-sets $A$ and $A_{n}$, then by the assumed countable subadditivity of $\mu$ and the monotonicity established above, $\mu(A) \leq \sum_{n} \mu\left(A \cap A_{n}\right) \leq \sum_{n} \mu\left(A_{n}\right)$. Therefore, $A \in \mathscr{A}$ implies that $\mu(A) \leq \mu^{*}(A)$ and hence, since the reverse inequality is an immediate consequence of (11.4), $\mu(A)=\mu^{*}(A)$. Thus $\mu^{*}$ agrees with $\mu$ on $\mathscr{A}$.

Since $\mathscr{A} \subset \mathscr{M}\left(\mu^{*}\right)$ and $\mathscr{M}\left(\mu^{*}\right)$ is a $\sigma$-field (Theorem 11.1),

$$
\mathscr{A} \subset \sigma(\mathscr{A}) \subset \mathscr{M}\left(\mu^{*}\right) \subset 2^{\Omega} .
$$

Since $\mu^{*}$ is countably additive when restricted to $\mathscr{M}\left(\mu^{*}\right)$ (Theorem 11.1 again), $\mu^{*}$ further restricted to $\sigma(\mathscr{A})$ is an extension of $\mu$ on $\mathscr{A}$, as required. $\square$

Example 11.2. For $\mathscr{A}$ take the semiring of subintervals of $\Omega=(0,1]$ (together with the empty set). For $\mu$ take length $\lambda: \lambda(a, b]=b-a$. The finite additivity and countable subadditivity of $\lambda$ follow by Theorem 1.3. ${ }^{\dagger}$ By Theorem 11.3, $\lambda$ extends to a measure on the class $\sigma(\mathscr{A})=\mathscr{B}$ of Borel sets in $(0,1]$. $\square$

[^12]This gives a second construction of Lebesgue measure in the unit interval. In the first construction $\lambda$ was extended first from the class of intervals to the field $\mathscr{B}_{0}$ of finite disjoint unions of intervals (see Theorem 2.2) and then by Theorem 11.2 (in its special form Theorem 3.1) from $\mathscr{B}_{0}$ to $\mathscr{B}=\sigma\left(\mathscr{B}_{0}\right)$. Using Theorem 11.3 instead of Theorem 11.2 effects a slight economy, since the extension then goes from $\mathscr{A}$ directly to $\mathscr{B}$ without the intermediate stop at $\mathscr{B}_{0}$, and the arguments involving (2.13) and (2.14) become unnecessary.

Example 11.3. In Theorem 11.3 take for $\mathscr{A}$ the semiring of finite intervals on the real line $R^{1}$, and consider $\lambda_{1}(a, b]=b-a$. The arguments for Theorem 1.3 in no way require that the (finite) intervals in question be contained in ( 0,1 ], and so $\lambda_{1}$ is finitely additive and countably subadditive on this class $\mathscr{A}$. Hence $\lambda_{1}$ extends to the $\sigma$-field $\mathscr{R}^{1}$ of linear Borel sets, which is by definition generated by $\mathscr{A}$. This defines Lebesgue measure $\lambda_{1}$ over the whole real line. $\square$

A subset of $(0,1]$ lies in $\mathscr{B}$ if and only if it lies in $\mathscr{P}^{1}$ (see (10.2)). Now $\lambda_{1}(A)=\lambda(A)$ for subintervals $A$ of ( 0.1 ], and it follows by uniqueness (Theorem 3.3) that $\lambda_{1}(A)=\lambda(A)$ for all $A$ in $\mathscr{B}$. Thus there is no inconsistency in dropping $\lambda_{1}$ and using $\lambda$ to denote Lebesgue measure on $\mathscr{R}^{1}$ as well as on $\mathscr{B}$.

Example 11.4. The class of bounded rectangles in $R^{k}$ is a semiring, a fact needed in the next section. Suppose that $A=\left[x: x_{i} \in I_{i}, i \leq k\right]$ and $B=[x: \left.x_{i} \in J_{i}, i \leq k\right]$ are nonempty rectangles, the $I_{i}$ and $J_{i}$ being finite intervals. If $A \subset B$, then $I_{i} \subset J_{i}$, so that $J_{i}-I_{i}$ is a disjoint union $I_{i}^{\prime} \cup I_{i}^{\prime \prime}$ of intervals (possibly empty). Consider the $3^{k}$ disjoint rectangles $\left[x: x_{i} \in U_{i}, i \leq k\right]$, where for each $i, U_{i}$ is $I_{i}$ or $I_{i}^{\prime}$ or $I_{i}^{\prime \prime}$. One of these rectangles is $A$ itself, and $B-A$ is the union of the others. The rectangles thus form a semiring. $\square$

## An Approximation Theorem

If $\mathscr{A}$ is a semiring, then by Theorem 10.3 a measure on $\sigma(\mathscr{A})$ is determined by its values on $\mathscr{A}$ if it is $\sigma$-finite there. Theorem 11.4 shows more explicitly how the measure of a $\sigma(\mathscr{A})$-set can be approximated by the measures of $\mathscr{A}$-sets.

Lemma 1. If $A, A_{1}, \ldots, A_{n}$ are sets in a semiring $\mathscr{A}$, then there are disjoint $\mathscr{A}$-sets $C_{1}, \ldots, C_{m}$ such that

$$
A \cap A_{1}^{c} \cap \cdots \cap A_{n}^{c}=C_{1} \cup \cdots \cup C_{m} .
$$

Proof. The case $n=1$ follows from the definition of semiring applied to $A \cap A_{1}^{c}=A-\left(A \cap A_{1}\right)$. If the result holds for $n$, then $A \cap A_{1}^{c} \cap \cdots \cap A_{n+1}^{c} =\bigcup_{j=1}^{m}\left(C_{j} \cap A_{n+1}^{c}\right)$; apply the case $n=1$ to each set in the union. $\square$

Theorem 11.4. Suppose that $\mathscr{A}$ is a semiring, $\mu$ is a measure on $\mathscr{F}=\sigma(\mathscr{A})$, and $\mu$ is $\sigma$-finite on $\mathscr{A}$.
(i) If $B \in \mathscr{F}$ and $\epsilon>0$, there exists a finite or infinite disjoint sequence $A_{1}, A_{2}, \ldots$ of $\mathscr{A}$-sets such that $B \subset \bigcup_{k} A_{k}$ and $\mu\left(\left(\bigcup_{k} A_{k}\right)-B\right)<\epsilon$.
(ii) If $B \in \mathscr{F}$ and $\epsilon>0$, and if $\mu(B)<\infty$, then there exists a finite disjoint sequence $A_{1}, \ldots, A_{n}$ of $\mathscr{A}$-sets such that $\mu\left(B \Delta\left(\bigcup_{k=1}^{n} A_{k}\right)\right)<\epsilon$.

Proof. Return to the proof of Theorem 11.3. If $\mu^{*}$ is the outer measure defined by (11.4), then $\mathscr{F} \subset \mathscr{M}\left(\mu^{*}\right)$ and $\mu^{*}$ agrees with $\mu$ on $\mathscr{A}$, as was shown. Since $\mu^{*}$ restricted to $\mathscr{F}$ is a measure, it follows by Theorem 10.3 that $\mu *$ agrees with $\mu$ on $\mathscr{F}$ as well.

Suppose now that $B$ lies in $\mathscr{F}$ and $\mu(B)=\mu^{*}(B)<\infty$. There exist $\mathscr{A}$-sets $A_{k}$ such that $B \subset \bigcup_{k} A_{k}$ and $\mu\left(\bigcup_{k} A_{k}\right) \leq \sum_{k} \mu\left(A_{k}\right)<\mu(B)+\epsilon$; but then $\mu\left(\left(\cup_{k} A_{k}\right)-B\right)<\epsilon$. To make the sequence $\left\{A_{k}\right\}$ disjoint, replace $A_{k}$ by $A_{k} \cap A_{1}^{c} \cap \cdots \cap A_{k-1}^{c}$; by Lemma 1, each of these sets is a finite disjoint union of sets in $\mathscr{A}$.

Next suppose that $B$ lies in $\mathscr{F}$ and $\mu(B)=\mu^{*}(B)=\infty$. By $\sigma$-finiteness there exist $\mathscr{A}$-sets $C_{m}$ such that $\Omega=\bigcup_{m} C_{m}$ and $\mu\left(C_{m}\right)<\infty$. By what has just been shown, there exist $\mathscr{L}$ sets $A_{m k}$ such that $B \cap C_{m} \subset \cup_{k} A_{m k}$ and $\mu\left(\left(\cup_{k} A_{m k}\right)-\left(B \cap C_{m}\right)\right)<\epsilon / 2^{m}$. The sets $A_{m k}$ taken all together provide a sequence $A_{1}, A_{2}, \ldots$ of $\mathscr{L}$-sets satisfying $B \subset \bigcup_{k} A_{k}$ and $\mu\left(\left(\bigcup_{k} A_{k}\right)-B\right)<\epsilon$. As before, the $A_{k}$ can be made disjoint.

To prove part (ii), consider the $A_{k}$ of part (i). If $B$ has finite measure, so has $A=\bigcup_{k} A_{k}$, and hence by continuity from above (Theorem 10.2(ii)), $\mu\left(A-\bigcup_{k \leq n} A_{k}\right)<\epsilon$ for some $n$. But then $\mu\left(B \Delta\left(\bigcup_{k=1}^{n} A_{k}\right)\right)<2 \epsilon$. $\square$

If, for example, $B$ is a linear Borel set of finite Lebesgue measure, then $\lambda\left(B \Delta\left(\bigcup_{k=1}^{n} A_{k}\right)\right)<\epsilon$ for some disjoint collection of finite intervals $A_{1}, \ldots, A_{n}$.

Corollary 1. If $\mu$ is a finite measure on a $\sigma$-field $\mathscr{F}$ generated by a field $\mathscr{F}_{0}$, then for each $\mathscr{F}_{\text {-set }} A$ and each positive $\epsilon$ there is an $\mathscr{F}_{0}$-set $B$ such that $\mu(A \Delta B)<\epsilon$.

Proof. This is of course an immediate consequence of part (ii) of the theorem, but there is a simple direct argument. Let $\mathscr{A}$ be the class of $\mathscr{F}$-sets with the required property. Since $A^{c} \Delta B^{c}=A \Delta B, \mathscr{G}$ is closed under complementation. If $A=\cup_{n} A_{n}$, where $A_{n} \in \mathscr{G}$, given $\epsilon$ choose $n_{0}$ so that $\mu\left(A-\bigcup_{n \leq n_{0}} A_{n}\right)<\epsilon$, and then choose $\mathscr{F}_{0}$-sets $B_{n}, n \leq n_{0}$, so that $\mu\left(A_{n} \Delta B_{n}\right)<\epsilon / n_{0}$. Since $\left(\mathrm{U}_{n \leq n_{0}} A_{n}\right) \Delta\left(\mathrm{U}_{n \leq n_{0}} B_{n}\right) \subset \bigcup_{n \leq n_{0}}\left(A_{n} \Delta B_{n}\right)$, the $\mathscr{F}_{0}$-set $B=\bigcup_{n \leq n_{0}} B_{n}$ satisfies $\mu(A \Delta B)<2 \epsilon$. Of course $\mathscr{F}_{0} \subset \mathscr{E}$; since $\mathscr{I}$ is a $\sigma$-field, $\mathscr{F} \subset \mathscr{G}$, as required. $\square$

Corollary 2. Suppose that $\mathscr{A}$ is a semiring, $\Omega$ is a countable union of $\mathscr{A}$ sets, and $\mu_{1}, \mu_{2}$ are measures on $\mathscr{F}=\sigma(\mathscr{A})$. If $\mu_{1}(A) \leq \mu_{2}(A)<\infty$ for $A \in \mathscr{A}$, then $\mu_{1}(B) \leq \mu_{2}(B)$ for $B \in \mathscr{F}$.

Proof. Since $\mu_{2}$ is $\sigma$-finite on $\mathscr{A}$, the theorem applies. If $\mu_{2}(B)<\infty$, choose disjoint $\mathscr{A}$-sets $A_{k}$ such that $B \subset \bigcup_{k} A_{k}$ and $\sum_{k} \mu_{2}\left(A_{k}\right)<\mu_{2}(B)+\epsilon$. Then $\mu_{1}(B) \leq \sum_{k} \mu_{1}\left(A_{k}\right) \leq \sum_{k} \mu_{2}\left(A_{k}\right)<\mu_{2}(B)+\epsilon$.

A fact used in the next section:

Lemma 2. Suppose that $\mu$ is a nonnegative and finitely additive set function on a semiring $\mathscr{A}$, and let $A, A_{1}, \ldots, A_{n}$ be sets in $\mathscr{A}$.
(i) If $\cup_{i=1}^{n} A_{i} \subset A$ and the $A_{i}$ are disjoint, then $\sum_{i=1}^{n} \mu\left(A_{i}\right) \leq \mu(A)$.
(ii) If $A \subset \cup_{i=1}^{n} A_{i}$, then $\mu(A) \leq \sum_{i=1}^{n} \mu\left(A_{i}\right)$.

Proof. For part (i), use Lemma 1 to choose disjoint $\mathscr{L}$-sets $C$, such that $A-\cup_{i=1}^{n} A_{i}=\cup_{j=1}^{m} C_{1}$. Since $\mu$ is finitely additive and nonnegative, it follows that $\mu(A)=\sum_{j=1}^{n} \mu\left(A_{i}\right)+\sum_{j=1}^{n} \mu\left(C_{j}\right) \geq \sum_{i=1}^{n} \mu\left(A_{i}\right)$.

For (ii), take $B_{1}=A \cap A_{1}$ and $B_{i}=A \cap A_{i} \cap A_{1}^{c} \cap \cdot \cdot \cap A_{1-1}^{c}$ for $i>1$. By Lemma 1, each $B_{i}$ is a finite disjoint unien of $\mathscr{A}$-sets $C_{i j}$. Since the $B_{i}$ are disjoint, $A=\bigcup_{i} B_{i}=\bigcup_{i j} C_{i j}$ and $\bigcup_{j} C_{i j} \subset A_{i}$, it foliows by finite additivity and part (i) that $\mu(A)=\sum_{i} \sum_{j} \mu\left(C_{i}\right) \leq \sum_{i} \mu\left(A_{i}\right)$.

Compare Theorem 1.3.

## PROBLEMS

11.1. The proof of Theorem 3.1 obviously applies if the probability measure is replaced by a finite measure, since this is only a matter of rescaling. Take as a starting point then the fact that a finite measure on a field extends uniquely to the generated $\sigma$-field. By the following steps, prove Theorem 11.2-that is, remove the assumption of finiteness.
(a) Let $\mu$ be a measure (not necessarily even $\sigma$-finite) on a field $\mathscr{F}_{0}$, and let $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$. If $A$ is a nonempty set in $\mathscr{F}_{0}$ and $\mu(A)<\infty$, restrict $\mu$ to a finite measure $\mu_{A}$ on the field $\mathscr{F}_{0} \cap A$, and extend $\mu_{A}$ to a finite measure $\hat{\mu}_{A}$ on the $\sigma$-field $\mathscr{F} \cap A$ generated in $A$ by $\mathscr{F}_{0} \cap A$.
(b) Suppose that $E \in \mathscr{F}$. If there exist disjoint $\mathscr{F}_{0}$-sets $A_{n}$ such that $E \subset \cup_{n} A_{n}$ and $\mu\left(A_{n}\right)<\infty$, put $\hat{\mu}(E)=\sum_{n} \hat{\mu}_{A_{n}}\left(E \cap A_{n}\right)$ and prove consistency. Otherwise put $\hat{\mu}(E)=\infty$.
(c) Show that $\hat{\mu}$ is a measure on $\mathscr{F}$ and agrees with $\mu$ on $\mathscr{F}_{0}$.
11.2. Suppose that $\mu$ is a nonnegative and finitely additive set function on a semiring $\mathscr{A}$.
(a) Use Lemmas 1 and 2, without reference to Theorem 11.3, to show that $\mu$ is countably subadditive if and only if it is countably additive.
(b) Find an example where $\mu$ is not countably subadditive.
11.3. Show that Theorem 11.4(ii) can fail if $\mu(B)=\infty$.
11.4. This and Problems $11.5,16.12,17.12,17.13$, and 17.14 lead to proofs of the Daniell-Stone and Riesz representation theorems.

Let $\Lambda$ be a real linear functional on a vector lattice $\mathscr{L}$ of (finite) real functions on a space $\Omega$. This means that if $f$ and $g$ lie in $\mathscr{L}$, then so do $f \vee g$ and $f \wedge g$ (with values max\{ $f(\omega), g(\omega))$ and $\min (f(\omega), g(\omega))$ ), as well as $\alpha f+\beta g$, and $\Lambda(\alpha f+\beta g)=\alpha \Lambda(f)+\beta \Lambda(g)$. Assume further of $\mathscr{L}$ that $f \in \mathscr{L}$ implies $f \wedge 1 \in \mathscr{L}$ (where 1 denotes the function identically equal to 1 ). Assume further of $\Lambda$ that it is positive in the sense that $f \geq 0$ (pointwise) implies $\Lambda(f) \geq 0$ and continuous from above at 0 in the sense that $f_{n} \downarrow 0$ (pointwise) implies $\Lambda\left(f_{n}\right) \rightarrow 0$.
(a) If $f \leq g(f, g \in \mathscr{L})$, define in $\Omega \times R^{1}$ an "interval"

$$
\begin{equation*}
(f, g]=[(\omega, t): f(\omega)<t \leq g(\omega)] . \tag{115}
\end{equation*}
$$

Show that these sets form a semiring $\mathscr{A}_{0}$.
(b) Define a set function $\nu_{0}$ on $\mathscr{A}_{0}$ by

$$
\begin{equation*}
\nu_{0}(f, g]=\Lambda(g-f) \tag{11.6}
\end{equation*}
$$

Show that $\nu_{0}$ is finitely additive and countably subadditive on $\mathscr{A}_{0}$.
11.5. $\uparrow$ (a) Assume $f \in \mathscr{L}$ and let $f_{n}=(n(f-f \wedge 1)) \wedge 1$. Show that $f(\omega) \leq 1$ implies $f_{n}(\omega)=0$ for all $n$ and $f(\omega)>1$ implies $f_{n}(\omega)=1$ for all sufficiently large $n$. Conclude that for $x>0$,

$$
\begin{equation*}
\left(0, x f_{n}\right] \uparrow[\omega . f(\omega)>1] \times(0, x] \tag{11.7}
\end{equation*}
$$

(b) Let $\mathscr{F}$ be the smallest $\sigma$-field with respect to which every $f$ in $\mathscr{L}$ is measurable: $\mathscr{F}=\sigma\left[f^{-1} H: f \in \mathscr{L}, H \in \mathscr{R}^{1}\right]$. Let $\mathscr{F}_{0}$ be the class of $A$ in $\mathscr{F}$ for which $A \times(0,1] \in \sigma\left(\mathscr{A}_{0}\right)$. Show that $\mathscr{F}_{0}$ is a semiring and that $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$.
(c) Let $\nu$ be the extension of $\nu_{0}$ (see (11.6)) to $\sigma\left(\mathscr{A}_{0}\right)$, and for $A \in \mathscr{F}_{0}$ define $\mu_{0}(A)=\nu(A \times(0,1])$. Show that $\mu_{0}$ is finiteiy additive and countably subadditive on the semiring $\mathscr{F}_{0}$.

## SECTION 12. MEASURES IN EUCLIDEAN SPACE

## Lebesgue Measure

In Example 11.3 Lebesgue measure $\lambda$ was constructed on the class $\mathscr{R}^{1}$ of linear Borel sets. By Theorem 10.3, $\lambda$ is the only measure on $\mathscr{R}^{1}$ satisfying $\lambda(a, b]=b-a$ for all intervals. There is in $k$-space an analogous $k$ dimensional Lebesgue measure $\lambda_{k}$ on the class $\mathscr{R}^{k}$ of $k$-dimensional Borel sets (Example 10.1). It is specified by the requirement that bounded rectangles have measure

$$
\begin{equation*}
\lambda_{k}\left[x: a_{i}<x_{i} \leq b_{i}, i=1, \ldots, k\right]=\prod_{i=1}^{k}\left(b_{i}-a_{i}\right) . \tag{12.1}
\end{equation*}
$$

This is ordinary volume-that is, length ( $k=1$ ), area ( $k=2$ ), volume ( $k=3$ ), or hypervolume ( $k \geq 4$ ).

Since an intersection of rectangles is again a rectangle, the uniqueness theorem shows that (12.1) completely determines $\lambda_{k}$. That there does exist such a measure on $\mathscr{R}^{k}$ can be proved in several ways. One is to use the ideas involved in the case $k=1$. A second construction is given in Theorem 12.5. A third, independent, construction uses the general theory of product measures; this is carried out in Section $18 .^{\dagger}$ For the moment, assume the existence on $\mathscr{R}^{k}$ of a measure $\lambda_{k}$ satisfying (12.1). Of course, $\lambda_{k}$ is $\sigma$-finite.

A basic property of $\lambda_{k}$ is translation invariance. ${ }^{\ddagger}$
Theorem 12.1. If $A \in \mathscr{R}^{k}$, then $A+x=[a+x: a \in A] \in \mathscr{R}^{k}$ and $\lambda_{k}(A)=\lambda_{k}(A+x)$ for all $x$.

Proof. If $\mathscr{A}$ is the class of $A$ such that $A+x$ is in $\mathscr{R}^{k}$ for all $x$, then $\mathscr{A}$ is a $\sigma$-field containing the bounded rectangles, and so $\mathscr{A} \supset \mathscr{R}^{k}$. Thus $A+x \in \mathscr{R}^{k}$ for $A \in \mathscr{R}^{k}$.

For fixed $x$ define a measure $\mu$ on $\mathscr{R}^{k}$ by $\mu(A)=\lambda_{k}(A+x)$. Then $\mu$ and $\lambda_{k}$ agree on the $\pi$-system of bounded rectangles and so agree for all Borel sets.

If $A$ is a ( $k-1$ )-dimensional subspace and $x$ lies outside $A$, the hyperplanes $A+t x$ for real $t$ are disjoint, and by Theorem 12.1, all have the same measure. Since only countably many disjoint sets can have positive measure (Theorem 10.2(iv)), the measure common to the $A+t x$ must be 0 . Every $(k-1)$-dimensional hyperplane has $k$-dimensional Lebesgue measure 0 .

The Lebesgue measure of a rectangle is its ordinary volume. The following theorem makes it possible to calculate the measures of simple figures.

Theorem 12.2. If $T: R^{k} \rightarrow R^{k}$ is linear and nonsingular, then $A \in \mathscr{R}^{k}$ implies that $T A \in \mathscr{P}^{k}$ and

$$
\begin{equation*}
\lambda_{k}(T A)=|\operatorname{det} T| \cdot \lambda_{k}(A) \tag{12.2}
\end{equation*}
$$

Since a parallelepiped is the image of a rectangle under a linear transformation, (12.2) can be used to compute its volume. If $T$ is a rotation or a reflection-an orthogonal or a unitary transformation-then $\operatorname{det} T= \pm 1$, and so $\lambda_{k}(T A)=\lambda_{k}(A)$. Hence every rigid transformation or isometry (an orthogonal transformation followed by a translation) preserves Lebesgue measure. An affine transformation has the form $F x=T x+x_{0}$ (the general

[^13]linear transformation $T$ followed by a translation); it is nonsingular if $T$ is. It follows by Theorems 12.1 and 12.2 that $\lambda_{k}(F A)=|\operatorname{det} T| \cdot \lambda_{k}(A)$ in the nonsingular case.

Proof of the Theorem. Since $T U_{n} A_{n}=U_{n} T A_{n}$ and $T A^{c}=(T A)^{c}$ because of the assumed nonsingularity of $T$, the class $\mathscr{A}=\left[A: T A \in \mathscr{R}^{k}\right]$ is a $\sigma$-field. Since $T A$ is open for open $A$, it follows again by the assumed nonsingularity of $T$ that $\mathscr{E}$ contains all the open sets and hence (Example 10.1'jall the Borel sets. Therefore, $A \in \mathscr{R}^{k}$ implies $T A \in \mathscr{R}^{k}$.

For $A \in \mathscr{R}^{k}$, set $\mu_{1}(A)=\lambda_{k}(T A)$ and $\mu_{2}(A)=|\operatorname{det} T| \cdot \lambda_{k}(A)$. Then $\mu_{1}$ and $\mu_{2}$ are measures, and by Theorem 10.3 they will agree on $\mathscr{R}^{k}$ (which is the assertion (12.2)) if they agree on the $\pi$-system consisting of the rectangles $\left[x: a_{i}<x_{i} \leq b_{i}, i=1, \ldots, k\right]$ for which the $a_{i}$ and the $b_{i}$ are all rational (Example 10.1). It suffices therefore to prove (12.2) for rectangles with sidcs of rational length. Since such a rectangle is a finite disjoint union of cubes and $\lambda_{k}$ is translation-invariant, it is enough to check (12.2) for cubes

$$
\begin{equation*}
A=\left[x: 0<x_{i} \leq c, i=1, \ldots, k\right] \tag{12.3}
\end{equation*}
$$

that have their lower corner at the origin.
Now the general $T$ can by elementary row and column operations ${ }^{\dagger}$ be represented as a product of linear transformations of these three special forms:
(1') $T\left(x_{1}, \ldots, x_{k}\right)=\left(x_{\pi 1}, \ldots, x_{\pi k}\right)$, where $\pi$ is a permutation of the set $\{1,2, \ldots, k\}$;
$\left(2^{\circ}\right) T\left(x_{1}, \ldots, x_{k}\right)=\left(\alpha x_{1}, x_{2}, \ldots, x_{k}\right)$;
$\left(3^{\circ}\right) T\left(x_{1}, \ldots, x_{k}\right)=\left(x_{1}+x_{2}, x_{2}, \ldots, x_{k}\right)$.

Because of the rule for multiplying determinants, it suffices to check (12.2) for $T$ of these three forms. And, as observed, for each such $T$ it suffices to consider cubes (12.3).
$\left(1^{\circ}\right)$ : Such a $T$ is a permutation matrix, and so $\operatorname{det} T= \pm 1$. Since (12.3) is invariant under $T$, (12.2) is in this case obvious.
$\left(2^{\circ}\right)$ : Here $\operatorname{det} T=\alpha$, and $T A=\left[x: x_{1} \in H, 0<x_{i} \leq c, i=2, \ldots, k\right]$, where $H=(0, \alpha c]$ if $\alpha>0, H=\{0\}$ if $\alpha=0$ (although $\alpha$ cannot in fact be 0 if $T$ is nonsingular), and $H=[\alpha c, 0)$ if $\alpha<0$. In each case, $\lambda_{k}(T A)=|\alpha| \cdot c^{k}=|\alpha|$. $\lambda_{k}(A)$.

[^14]![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-067.jpg?height=457&width=564&top_left_y=228&top_left_x=648)
$\left(3^{\circ}\right)$ : Here $\operatorname{det} T=1$. Let $B=\left[x: 0<x_{i} \leq c, i=3, \ldots, k\right]$, where $B=R^{k}$ if $k<3$, and define
$$
\begin{aligned}
& B_{1}=\left[x: 0<x_{1} \leq x_{2} \leq c\right] \cap B \\
& B_{2}=\left[x: 0<x_{2}<x_{1} \leq c\right] \cap B \\
& B_{3}=\left[x: c<x_{1} \leq c+x_{2}, 0<x_{2} \leq c\right] \cap B .
\end{aligned}
$$

Then $A=B_{1} \cup B_{2}, T A=B_{2} \cup B_{3}$, and $B_{1}+(c, 0, \ldots, 0)=B_{3}$. Since $\lambda_{k}\left(B_{1}\right)= \lambda_{k}\left(B_{3}\right)$ by translation invariance, (12.2) follows by additivity. $\square$

If $T$ is singular, then $\operatorname{det} T=0$ and $T A$ lies in a $(k-1)$-dimensional subspace. Since such a subspace has measure 0 , (12.2) holds if $A$ and $T A$ lie in $\mathscr{R}^{k}$. The surprising thing is that $A \in \mathscr{R}^{k}$ need not imply that $T A \in \mathscr{R}^{k}$ if $T$ is singular. Even for a very simple transformation such as the projection $T\left(x_{1}, x_{2}\right)=\left(x_{1}, 0\right)$ in the plane, there exist Borel sets $A$ for which $T A$ is not a Borel set. ${ }^{\dagger}$

## Regularity

Important among measures on $\mathscr{R}^{k}$ are those assigning finite measure to bounded sets. They share with $\lambda_{k}$ the property of regularity:

Theorem 12.3. Suppose that $\mu$ is a measure on $\mathscr{A}^{k}$ such that $\mu(A)<\infty$ if $A$ is bounded.
(i) For $A \in \mathscr{R}^{k}$ and $\epsilon>0$, there exist a closed $C$ an open $G$ such that $C \subset A \subset G$ and $\mu(G-C)<\epsilon$.
(ii) If $\mu(A)<\infty$, then $\mu(A)=\sup \mu(K)$, the supremum extending over the compact subsets $K$ of $A$.

Proof. The second part of the theorem follows form the first: $\mu(A)<\infty$ implies that $\mu\left(A-A_{0}\right)<\epsilon$ for a bounded subset $A_{0}$ of $A$, and it then follows from the first part that $\mu\left(A_{0}-K\right)<\epsilon$ for a closed and hence compact subset $K$ of $A_{0}$.

[^15]To prove (i) consider first a bounded rectangle $A=\left[x: a_{i}<x_{i} \leq b_{i}, i \leq k\right]$. The set $G_{n}=\left[x: a_{i}<x_{i}<b_{i}+n^{-1}, i \leq k\right]$ is open and $G_{n} \downarrow A$. Since $\mu\left(G_{1}\right)$ is finite by hypothesis, it follows by continuity from above that $\mu\left(G_{n}-A\right)<\epsilon$ for large $n$. A bounded rectangle can therefore be approximated from the outside by open sets.

The rectangles form a semiring (Example 11.4). For an arbitrary set $A$ in $\mathscr{R}^{k}$, by Theorem 11.4(i) there exist bounded rectangles $A_{k}$ such that $A \subset \cup_{k} A_{k}$ and $\mu\left(\left(\cup_{k} A_{k}\right)-A\right)<\epsilon$. Choose open sets $G_{k}$ such that $A_{k} \subset G_{k}$ and $\mu\left(G_{k}-A_{k}\right)<\epsilon / 2^{k}$. Then $G=\bigcup_{k} G_{k}$ is open and $\mu(G-A)<2 \epsilon$. Thus the general $k$-dimensional Borel set can be approximated from the outside by open sets. To approximate from the inside by closed sets, pass to complements. $\square$

## Specifying Measures on the Line

There are on the line many measures other than $\lambda$ that are important for probability theory. There is a useful way to describe the collection of all measures on $\mathscr{R}^{1}$ that assign finite measure to each bounded set.

If $\mu$ is such a measure, define a real function $F$ by

$$
F(x)=\left\{\begin{align*}
\mu(0, x] & \text { if } x \geq 0,  \tag{12.4}\\
-\mu(x, 0] & \text { if } x \leq 0 .
\end{align*}\right.
$$

It is because $\mu(A)<\infty$ for bounded $A$ that $F$ is a finite function. Clearly, $F$ is nondecreasing. Suppose that $x_{n} \downarrow x$. If $x \geq 0$, apply part (ii) of Theorem 10.2, and if $x<0$, apply part (i); in either case, $F\left(x_{n}\right) \downarrow F(x)$ follows. Thus $F$ is continuous from the right. Finally,

$$
\begin{equation*}
\mu(a, b]=F(b)-F(a) \tag{12.5}
\end{equation*}
$$

for every bounded interval ( $a, b$ ]. If $\mu$ is Lebesgue measure, then (12.4) gives $F(x)=x$.

The finite intervals form a $\pi$-system generating $\mathscr{P}^{1}$, and therefore by Theorem 10.3 the function $F$ completely determines $\mu$ through the relation (12.5). But (12.5) and $\mu$ do not determine $F$ : if $F(x)$ satisfies (12.5), then so does $F(x)+c$. On the other hand, for a given $\mu$, (12.5) certainly determines $F$ to within such an additive constant.

For finite $\mu$, it is customary to standardize $F$ by defining it not by (12.4) but by

$$
\begin{equation*}
F(x)=\mu(-\infty, x] ; \tag{12.6}
\end{equation*}
$$

then $\lim _{x \rightarrow-\infty} F(x)=0$ and $\lim _{x \rightarrow \infty} F(x)=\mu\left(R^{1}\right)$. If $\mu$ is a probability measure, $F$ is called a distribution function (the adjective cumulative is sometimes added).

Measures $\mu$ are often specified by means of the function $F$. The following theorem ensures that to each $F$ there does exist a $\mu$.

Theorem 12.4. If $F$ is a nondecreasing, right-continuous real function on the line, there exists on $\mathscr{R}^{1}$ a unique measure $\mu$ satisfying (12.5) for all a and $b$.

As noted above, uniqueness is a simple consequence of Theorem 10.3. The proof of existence is almost the same as the construction of Lebesgue measure, the case $F(x)=x$. This proof is not carried through at this point, because it is contained in a parallel, more general construction for $k$ dimensional space in the next theorem. For a very simple argument establishing Theorem 12.4, see the second proof of Theorem 14.1.

## Specifying Measures in $\boldsymbol{R}^{\boldsymbol{k}}$

The $\sigma$-field $\mathscr{R}^{k}$ of $k$-dimensional Borel sets is generated by the class of bounded rectangles

$$
\begin{equation*}
A=\left[x: a_{i}<x_{i} \leq b_{i}, i=1, \ldots, k\right] \tag{12.7}
\end{equation*}
$$

(Example 10.1). If $I_{i}=\left(a_{i}, b_{i}\right], A$ has the form of a Cartesian product

$$
\begin{equation*}
A=I_{1} \times \cdots \times I_{k} . \tag{12.8}
\end{equation*}
$$

Consider the sets of the special form

$$
\begin{equation*}
S_{x}=\left[y: y_{i} \leq x_{i}, i=1, \ldots, k\right] ; \tag{12.9}
\end{equation*}
$$

$S_{x}$ consists of the points "southwest" of $x=\left(x_{1}, \ldots, x_{k}\right)$; in the case $k=1$ it is the half-infinite interval $(-\infty, x]$. Now $S_{x}$ is closed, and (12.7) has the form

$$
\left.A=S_{\left(b_{1}\right.} \quad b_{k}\right)-\left[\begin{array}{lll}
\left.S_{\left(a_{1} b_{2}\right.} . . b_{k}\right) & \left.\cup S_{\left(b_{1} a_{2}\right.} \quad b_{k}\right)  \tag{12.10}\\
& \left.\cup \cdots \cup S_{\left(b_{1} b_{2}\right.} \quad a_{k}\right)
\end{array}\right] .
$$

Therefore, the class of sets (129) generates $\mathscr{R}^{k}$. This class is a $\pi$-system.
The objective is to find a version of Theorem 12.4 for $k$-space. This will in particular give $k$-dimensional Lebesgue measure. The first problem is to find the analogue of (12.5).

A bounded rectangle (12.7) has $2^{k}$ vertices-the points $x=\left(x_{1}, \ldots, x_{k}\right)$ for which each $x_{i}$ is either $a_{i}$ or $b_{i}$. Let $\operatorname{sgn}_{A} x$, the signum of the vertex, be +1 or -1 , according as the number of $i(1 \leq i \leq k)$ satisfying $x_{i}=a_{i}$ is even or odd. For a real function $F$ on $R^{k}$, the difference of $F$ around the vertices of $A$ is $\Delta_{A} F=\sum \operatorname{sgn}_{A} x \cdot F(x)$, the sum extending over the $2^{k}$ vertices $x$ of $A$. In the case $k=1, A=(a, b]$ and $\Delta_{A} F=F(b)-F(a)$. In the case $k=2$, $\Delta_{A} F=F\left(b_{1}, b_{2}\right)-F\left(b_{1}, a_{2}\right)-F\left(a_{1}, b_{2}\right)+F\left(a_{1}, a_{2}\right)$.

Since the $k$-dimensional analogue of (12.4) is complicated, suppose at first that $\mu$ is a finite measure on $\mathscr{R}^{k}$ and consider instead the analogue of (12.6), namely

$$
\begin{equation*}
F(x)=\mu\left[y: y_{i} \leq x_{i}, i=1, \ldots, k\right] . \tag{12.11}
\end{equation*}
$$

Suppose that $S_{x}$ is defined by (12.9) and $A$ is a bounded rectangle (12.7). Then

$$
\begin{equation*}
\mu(A)=\Delta_{A} F . \tag{12.12}
\end{equation*}
$$

To see this, apply to the union on the right in (12.10) the inclusion-exclusion formula (10.5). The $k$ sets in the union give $2^{k}-1$ intersections, and these are the sets $S_{x}$ for $x$ ranging over the vertices of $A$ other than ( $b_{1}, \ldots, b_{k}$ ). Taking into account the signs in (10.5) leads to (12.12).
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-070.jpg?height=274&width=461&top_left_y=1148&top_left_x=344)
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-070.jpg?height=384&width=576&top_left_y=1130&top_left_x=870)

Suppose $x^{(n)} \downarrow x$ in the sense that $x_{i}^{(n)} \downarrow x_{i}$ as $n \rightarrow \infty$ for each $i=1, \ldots, k$. Then $S_{x^{(n)}} \downarrow S_{x}$, and hence $F\left(x^{(n)}\right) \rightarrow F(x)$ by Theorem 10.2(ii). In this sense, $F$ is continuous from above.

Theorem 12.5. Suppose that the real function $F$ on $R^{k}$ is continuous from above and satisfies $\Delta_{A} F \geq 0$ for bounded rectangles $A$. Then there exists a unique measure $\mu$ on $\mathscr{R}^{k}$ satisfying (12.12) for bounded rectangles $A$.

The empty set can be taken as a bounded rectangle (12.7) for which $a_{i}=b_{i}$ for some $i$, and for such a set $A, \Delta_{A} F=0$. Thus (12.12) defines a finite-valued set function $\mu$ on the class of bounded rectangles. The point of the theorem is that $\mu$ extends uniquely to a measure on $\mathscr{R}^{k}$. The uniqueness is an immediate consequence of Theorem 10.3, since the bounded rectangles form a $\pi$-system generating $\mathscr{R}^{k}$.

If $F$ is bounded, then $\mu$ will be a finite measure. But the theorem does not require that $F$ be bounded. The most important unbounded $F$ is $F(x)=x_{1} \cdots x_{k}$. Here $\Delta_{A} F=\left(b_{1}-a_{1}\right) \cdots\left(b_{k}-a_{k}\right)$ for $A$ given by (12.7). This is the ordinary volume of $A$ as specified by (12.1). The corresponding measure extended to $\mathscr{R}^{k}$ is $k$-dimensional Lebesgue measure as described at the beginning of this section.

Proof of Theorem 12.5. As already observed, the uniqueness of the extension is easy to prove. To prove its existence it will first be shown that $\mu$ as defined by (12.12) is finitely additive on the class of bounded rectangles. Suppose that each side $I_{i}=\left(a_{i}, b_{i}\right]$ of a bounded rectangle (12.7) is partitioned into $n_{i}$ subintervals $J_{i j}=$ ( $\left.t_{i, j-1}, t_{i j}\right], j=1, \ldots, n_{i}$, where $a_{i}=t_{i 0}<t_{i 1}<\cdots<t_{i n_{i}}=b_{i}$. The $n_{1} n_{2} \cdots n_{k}$ rectangles

$$
\begin{equation*}
B_{j_{1}} \quad j_{k}=J_{1_{j_{1}}} \times \cdots \times J_{k j_{k}}, \quad 1 \leq j_{1} \leq n_{1}, \ldots, 1 \leq J_{k} \leq n_{k}, \tag{12.13}
\end{equation*}
$$

then partition $A$ Call such a partition regular. It will first be shown that $\mu$ adds for regular partitions:

$$
\mu(A)=\sum_{j_{1}} \mu\left(\begin{array}{ll}
B_{j_{1}} & j_{k} \tag{12.14}
\end{array}\right) .
$$

The right side of (12.14) is $\sum_{B} \sum_{x} \operatorname{sgn}_{B} x \cdot F(x)$, where the outer sum extends over the rectangles $B$ of the form (12.13) and the inner sum extends over the vertices $x$ of $B$. Now

$$
\begin{equation*}
\sum_{B} \sum_{x} \operatorname{sgn}_{B} x \cdot F(x)=\sum_{x} F(x) \sum_{B} \operatorname{sgn}_{B} x, \tag{12.15}
\end{equation*}
$$

where on the right the outer sum extends over each $x$ that is a vertex of one or more of the $B$ 's, and for fixed $x$ the inner sum extends over the $B$ 's of which it is a vertex. Suppose that $x$ is a vertex of one or more of the $B$ 's but is not a vertex of $A$. Then there must be an $i$ such that $x_{i}$ is neither $a_{i}$ nor $b_{i}$. There may be several such $i$, but fix on one of them and suppose for notational convenience that it is $i=1$. Then $x_{1}=t_{1 j}$ with $0<j<n_{1}$. The rectangles (12.13) of which $x$ is a vertex therefore come in pairs $B^{\prime}=B_{j j_{2}}, j_{1}$ and $B^{\prime \prime}=B_{j+1, j_{2}} j_{1}$, and $\operatorname{sgn}_{B^{\prime}} x=-\operatorname{sgn}_{B^{\prime \prime}} x$. Thus the inner sum on the right in (12.15) is 0 if $x$ is not a vertex of $A$.

On the other hand, if $x$ is a vertex of $A$ as well as of at least one $B$, then for each $i$ either $x_{i}=a_{i}=t_{i 0}$ or $x_{i}=b_{i}=t_{i n_{i}}$. In this case $x$ is a vertex of only one $B$ of the form (12.13)-the one for which $j_{i}=1$ or $j_{i}=n_{i}$, according as $x_{i}=a_{i}$ or $x_{i}=b_{i}$ - and $\operatorname{sgn}_{B} x=\operatorname{sgn}_{A} x$. Thus the right side of (12.15) reduces to $\Delta_{A} F$, which proves (12.14).

Now suppose that $A=\bigcup_{u=1}^{n} A_{u}$, where $A$ is the bounded rectangle (12.8), $A_{u}=I_{1 u} \times \cdots \times I_{k u}$ for $u=1, \ldots, n$, and the $A_{u}$ are disjoint. For each $i(1 \leq i \leq k)$, the intervals $I_{i 1}, \ldots, I_{i n}$ have $I_{i}$ as their union, although they need not be disjoint. But their endpoints split $I_{i}$ into disjoint subintervals $J_{i t}, \ldots, J_{i n_{i}}$ such that each $I_{i u}$ is the union of certain of the $J_{i j}$. The rectangles $B$ of the form (12.13) are a regular
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-071.jpg?height=307&width=1295&top_left_y=2471&top_left_x=246)
partition of $A$, as before; furthermore, the $B$ 's contained in a single $A_{u}$ form a regular partition of $A_{u}$. Since the $A_{u}$ are disjoint, it follows by (12.14) that

$$
\mu(A)=\sum_{B} \mu(B)=\sum_{u=1}^{n} \sum_{B \subset A_{u}} \mu(B)=\sum_{u=1}^{n} \mu\left(A_{u}\right) .
$$

Therefore, $\mu$ is finitely additive on the class $\mathscr{I}^{k}$ of bounded $k$-dimensional rectangles.

As shown in Example 114, $\mathscr{I}^{k}$ is a semiring, and so Theorem 11.3 applies. If $A, A_{1}, \ldots, A_{n}$ are sets in $\mathscr{I}^{k}$, then by Lemma 2 of the preceding section,

$$
\begin{equation*}
\mu(A) \leq \sum_{u=1}^{n} \mu\left(A_{u}\right) \quad \text { if } \quad A \subset \bigcup_{u=1}^{n} A_{u} . \tag{12.16}
\end{equation*}
$$

To apply Theorem 11.3 requires showing that $\mu$ is countably subadditive on $\mathscr{I}^{h}$. Suppose then that $A \subset \cup_{u=1}^{\infty} A_{u}$. where $A$ and the $A_{u}$ are in $\mathscr{I}^{k}$. The problem is to prove that

$$
\begin{equation*}
\mu(A) \leq \sum_{u=1}^{\infty} \mu\left(A_{a}\right) . \tag{12.17}
\end{equation*}
$$

Suppose that $\epsilon>0$. If $A$ is given by (12.7) and $B=\left[x \cdot a_{i}+\delta<x_{i} \leq b_{i}, i \leq k\right]$, then $\mu(B)>\mu(A)-\epsilon$ for small enough positive $\delta$, because $\mu$ is defined by (12.12) and $F$ is continuous from above. Note that $A$ contains the closure $B^{-}=\left[x: a_{i}+\delta \leq x_{i} \leq b_{i}\right.$, $i \leq k]$ of $B$. Similarly, for each $u$ there is in $\mathscr{I}^{k}$ a set $B_{u}=\left[x: a_{i u}<x_{i} \leq b_{i u}+\delta_{u}\right.$, $i \leq k]$ such that $\mu\left(B_{u}\right)<\mu\left(A_{u}\right)+\epsilon / 2^{u}$ and $A_{u}$ is in the interior $B_{u}^{\circ}=\left[x: a_{i u}<x_{i}<\right. \left.b_{i u}+\delta_{u}, i \leq k\right]$ of $B_{u}$

Since $B^{-} \subset A \subset \cup_{u=1}^{\infty} A_{u} \subset \cup_{u<1}^{\infty} B_{u}^{\circ}$, it follows by the Heine-Borel theorem that $B \subset B^{\circ} \subset \bigcup_{u=1}^{n} B_{u}^{\circ} \subset \bigcup_{n=1}^{n} B_{u}$ for some $n$. Now (12.16) applies, and so $\mu(A)-\epsilon< \mu(B) \leq \sum_{u=1}^{n} \mu\left(B_{u}\right)<\sum_{u=1}^{\infty} \mu\left(A_{u}\right)+\epsilon$. Since $\epsilon$ was arbitrary, the proof of (12.17) is complete.

Thus $\mu$ as defined by (12.12) is finitely additive and countably subadditive on the semiring $\mathscr{I}^{h}$. By Theorem 11.3, $\mu$ extends to a measure on $\mathscr{R}^{h}=\sigma\left(\mathscr{F}^{h}\right)$.

## Strange Euclidean Sets*

It is possible to construct in the plane a simple curve-the image of $[0,1]$ under a continuous, one-to-one mapping-having positive area. This is surprising because the curve is simple: if the continuous map is not required to be one-to-one, the curve can even fill a square. ${ }^{\dagger}$

Such constructions are counterintuitive, but nothing like one due to Banach and Tarski: Two sets in Euclidean space are congruent if each can be carried onto the other by an isometry, a rigid transformation. Suppose of sets $A$ and $B$ in $R^{k}$ that $A$ can be decomposed into sets $A_{1}, \ldots, A_{n}$ and $B$ can be decomposed into sets $B_{1}, \ldots, B_{n}$ in such a way that $A_{i}$ and $B_{i}$ are congruent for each $i=1, \ldots, n$. In this case $A$ and $B$ are said to be congruent by dissection. If all the pieces $A_{i}$ and $B_{i}$ are Borel sets, then of course $\lambda_{k}(A)=\sum_{i=1}^{n} \lambda_{k}\left(A_{i}\right)=\sum_{i=1}^{n} \lambda_{k}\left(B_{i}\right)=\lambda_{k}(B)$. But if nonmea-

[^16]surable sets are allowed in the dissections, then something astonishing happens: If $k \geq 3$, and if $A$ and $B$ are bounded sets in $R^{k}$ and have nonempty interiors, then $A$ and $B$ are congruent by dissection. (The result does not hold if $k$ is 1 or 2 .)

This is the Banach-Tarski paradox. It is usually illustrated in 3-space this way: It is possible to break a solid ball the size of a pea into finitely many pieces and then put them back together again in such a way as to get a solid ball the size of the sun. ${ }^{\dagger}$

## PROBLEMS

12.1. Suppose that $\mu$ is a measure on $\mathscr{R}^{1}$ that is finite for bounded sets and is translation-invariant: $\mu(A+x)=\mu(A)$. Show that $\mu(A)=\alpha \lambda(A)$ for some $\alpha \geq 0$. Extend to $R^{k}$
12.2. Suppose that $A \in \mathscr{R}^{1}, \lambda(A)>0$, and $0<\theta<1$. Show that there is a bounded open interval $I$ such that $\lambda(A \cap I) \geq \theta \lambda(I)$. Hint: Show that $\lambda(A)$ may be assumed finite, and choose an open $G$ such that $A \subset G$ and $\lambda(A) \geq \theta \lambda(G)$. Now $G=\bigcup_{n} I_{n}$ for disjoint open intervals $I_{n}$ [A12], and $\Sigma_{n} \lambda\left(A \cap I_{n}\right) \geq \theta \sum_{n} \lambda\left(I_{n}\right)$; use an $I_{n}$,
12.3. $\uparrow$ If $A \in \mathscr{R}^{1}$ and $\lambda(A)>0$, then the origin is interior to the difference set $D(A)=[x-y: x, y \in A]$. Hint Choose a bounded open interval $I$ as in Problem 12.2 for $\theta=\frac{3}{4}$. Suppose that $|z|<\lambda(I) / 2$; since $A \cap I$ and $(A \cap I)+z$ are contained in an interval of length less than $3 \lambda(I) / 2$ and hence cannot be disjoint, $z \in D(A)$.
12.4. ↑ The following construction leads to a subset $H$ of the unit interval that is nonmeasurable in the extreme sense that its inner and outer Lebesgue measures are 0 and 1: $\lambda_{*}(H)=0$ and $\lambda^{*}(H)=1$ (see (3.9) and (3.10)). Complete the details. The ideas are those in the construction of a nonmeasurable set at the end of Section 3. It will be convenient to work in $G=[0,1)$; let $\oplus$ and $\Theta$ denote addition and subtraction modulo 1 in $G$, which is a group with identity 0 .
(a) Fix an irrational $\theta$ in $G$ and for $n=0, \pm 1, \pm 2, \ldots$ let $\partial_{n}$ be $n \theta$ reduced module 1 . Show that $\theta_{n} \oplus \theta_{m}=\theta_{n+m}, \theta_{n} \ominus \theta_{m}=\theta_{n-m}$, and the $\theta_{n}$ are distinct. Show that $\left\{\theta_{2 n}: n=0, \pm 1, \ldots\right\}$ and $\left\{\theta_{2 n+1}: n=0, \pm 1, \ldots\right\}$ are dense in $G$.
(b) Take $x$ and $y$ to be equivalent if $x \in y$ lies in $\left\{\theta_{n}: n=0, \pm 1, \ldots\right\}$, which is a subgroup. Let $S$ contain one representative from each equivalence class (each coset). Show that $G=\mathrm{U}_{n}\left(S \oplus \theta_{n}\right)$, where the union is disjoint. Put $H=\cup_{n}\left(S \oplus \theta_{2 n}\right)$ and show that $G-H=H \oplus \theta$.
(c) Suppose that $A$ is a Borel set contained in $H$. If $\lambda(A)>0$, then $D(A)$ contains an interval ( $0, \epsilon$ ); but then some $\theta_{2 k+1}$ lies in $(0, \epsilon) \subset D(A) \subset D(H)$, and so $\theta_{2 k+1}=h_{1}-h_{2}=h_{1} \Theta h_{2}=\left(s_{1} \oplus \theta_{2 n_{1}}\right) \ominus\left(s_{2} \oplus \theta_{2 n_{2}}\right)$ for some $h_{1}, h_{2}$ in $H$ and some $s_{1}, s_{2}$ in $S$. Deduce that $s_{1}=s_{2}$ and obtain a contradiction. Conclude that $\lambda_{*}(H)=0$.
(d) Show that $\lambda_{*}(H \oplus \theta)=0$ and $\lambda^{*}(H)=1$.
${ }^{\dagger}$ See Wagon for an account of these prodigies.
12.5. $\uparrow$ The construction here gives sets $H_{n}$ such that $H_{n} \uparrow G$ and $\lambda_{*}\left(H_{n}\right)=0$. If $J_{n}=G-H_{n}$, then $J_{n} \downarrow \varnothing$ and $\lambda^{*}\left(J_{n}\right)=1$.
(a) Let $H_{n}=\cup_{k=-n}^{n}\left(S \oplus \theta_{k}\right)$, so that $H_{n} \uparrow G$. Show that the sets $H_{n} \oplus \theta_{(2 n+1) t}$ are disjoint for different $v$.
(b) Suppose that $A$ is a Borel set contained in $H_{n}$. Show that $A$ and indeed all the $A \oplus \theta_{(2 n+1) i}$ have Lebesgue measure 0 .
12.6. Suppose that $\mu$ is nonnegative and finitely additive on $\mathscr{R}^{k}$ and that $\mu\left(R^{k}\right)<\infty$. Suppose further that $\mu(A)=\sup \mu(K)$, where $K$ ranges over the compact subsets of $A$. Show that $\mu$ is countably additive (Compare Theorem 12.3(ii).)
12.7. Suppose $\mu$ is a measure on $\mathscr{R}^{k}$ such that bounded sets have finite measure. Given $A$, show that there exist an $F_{\sigma}$-set $U$ (a countable union of closed sets) and a $G_{\delta}$-set $V$ (a countable intersection of open sets) such that $U \subset A \subset V$ and $\mu(V-U)=0$.
12.8. $2.19 \uparrow$ Suppose that $\mu$ is a nonatomic probability measure on $\left(R^{k}, \mathscr{R}^{k}\right)$ and that $\mu(A)>0$. Show that there is an uncountable compact set $K$ such that $K \subset A$ and $\mu(K)=0$.
12.9. The minimal closed support of a measure $\mu$ on $\mathscr{R}^{k}$ is a closed set $C_{\mu}$ such that $C_{\mu} \subset C$ for closed $C$ if and only if $C$ supports $\mu$. Prove its existence and uniqueness. Characterize the points of $C_{\mu}$ as those $x$ such that $\mu(U)>0$ for every neighborhood $U$ of $x$. If $k=1$ and if $\mu$ and the function $F(x)$ are related by (12.5), the condition is $F(x-\epsilon)<F(x+\epsilon)$ for all $\epsilon ; x$ is in this case called a point of increase of $F$.
12.10. Of minor interest is the $k$-dimensional analogue of (12.4). Let $I_{i}$ be ( $0, t$ ] for $t \geq 0$ and $(t, 0]$ for $t \leq 0$, and let $A_{x}=I_{x_{1}} \times \cdots \times I_{x_{k}}$. Let $\varphi(x)$ be +1 or -1 according as the number of $i, 1 \leq i \leq k$, for which $x_{i}<0$ is even or odd. Show that, if $F(x)=\varphi(x) \mu\left(A_{x}\right)$, then (12.12) holds for bounded rectangles $A$.

Call $F$ degenerate if it is a function of some $k-1$ of the coordinates, the requirement in the case $k=1$ being that $F$ is constant. Show that $\Delta_{A} F=0$ for every bounded rectangle if and only if $F$ is a finite sum of degenerate functions; (12.12) determines $F$ to within addition of a function of this sort.
12.11. Let $G$ be a nondecreasing, right-continuous function on the line, and put $F(x, y)=\min \{G(x), y\}$. Show that $F$ satisfies the conditions of Theorem 12.5, that the curve $C=\left[(x, G(x)): x \in R^{1}\right]$ supports the corresponding measure, and that $\lambda_{2}(C)=0$.
12.12. Let $F_{1}$ and $F_{2}$ be nondecreasing, right-continuous functions on the line and put $F\left(x_{1}, x_{2}\right)=F_{1}\left(x_{1}\right) F_{2}\left(x_{2}\right)$. Show that $F$ satisfies the conditions of Theorem 12.5. Let $\mu, \mu_{1}, \mu_{2}$ be the measures corresponding to $F, F_{1}, F_{2}$, and prove that $\mu\left(A_{1} \times A_{2}\right)=\mu_{1}\left(A_{1}\right) \mu_{2}\left(A_{2}\right)$ for intervals $A_{1}$ and $A_{2}$. This $\mu$ is the product of $\mu_{1}$ and $\mu_{2}$; products are studied in a general setting in Section 18.

## SECTION 13. MEASURABLE FUNCTIONS AND MAPPINGS

If a real function $X$ on $\Omega$ has finite range, it is by the definition in Section 5 a simple random variable if $[\omega: X(\omega)=x]$ lies in the basic $\sigma$-field $\mathscr{F}$ for each $x$. The requirement appropriate for the general real function $X$ is stronger; namely, $[\omega: X(\omega) \in H]$ must lie in $\mathscr{F}$ for each linear Borel set $H$. An abstract version of this definition greatly simplifies the theory of such functions.

## Measurable Mappings

Let $(\Omega, \mathscr{F})$ and $\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)$ be two measurable spaces. For a mapping $T$ : $\Omega \rightarrow \Omega^{\prime}$, consider the inverse images $T^{-1} A^{\prime}=\left[\omega \in \Omega ; T \omega \in A^{\prime}\right]$ for $A^{\prime} \subset \Omega^{\prime}$ (See [A7] for the properties of inverse images.) The mapping $T$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$ if $T^{-1} A^{\prime} \in \mathscr{F}$ for each $A^{\prime} \in \mathscr{F}^{\prime}$.

For a real function $f$, the image space $\Omega^{\prime}$ is the line $R^{1}$, and in this case $\mathscr{R}^{1}$ is always tacitly understood to play the role of $\mathscr{F}^{\prime}$. A real function $f$ on $\Omega$ is thus measurable $\mathscr{F}$ (or simply measurable, if it is clear from the context what $\mathscr{F}$ is involved) if it is measurable $\mathscr{F} / \mathscr{R}^{1}$-that is, if $f^{-1} H= [\omega: f(\omega) \in H] \in \mathscr{F}$ for every $H \in \mathscr{R}^{1}$. In probability contexts, a real measurable function is called a random variable. The point of the definition is to ensure that $[\omega: f(\omega) \in H]$ has a measure or probability for all sufficiently regular sets $H$ of real numbers-that is, for all Borel sets $H$.

Example 13.1. A real function $f$ with finite range is measurable if $f^{-1}\{x\} \in \mathscr{F}$ for each singleton $\{x\}$, but his is too weak a condition to impose on the general $f$. (It is satisfied if $(\Omega, \mathscr{F})=\left(R^{1}, \mathscr{P}^{1}\right)$ and $f$ is any one-to-one map of the line into itself; but in this case $f^{-1} H$, even for so simple a set $H$ as an interval, can for an appropriately chosen $f$ be any uncountable set, say the non-Borel set constructed in Section 3.) On the other hand, for a measurable $f$ with finite range, $f^{-1} H \in \mathscr{F}$ for every $H \subset R^{1}$; but this is too stiong a condition to impose on the general $f$. (For $\left(\Omega, \mathscr{F}^{-}\right)=\left(R^{1}, \mathscr{R}^{1}\right)$, even $f(x) \equiv x$ fails to satisfy it.) Notice that nothing is required of $f A$; it need not lie in $\mathscr{R}^{1}$ for $A$ in $\mathscr{F}$.

If in addition to $(\Omega, \mathscr{F}),\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)$, and the map $T: \Omega \rightarrow \Omega^{\prime}$, there is a third measurable space ( $\Omega^{\prime \prime}, \mathscr{F}^{\prime \prime}$ ) and a map $T^{\prime}: \Omega^{\prime} \rightarrow \Omega^{\prime \prime}$, the composition $T^{\prime} T= T^{\prime} \circ T$ is the mapping $\Omega \rightarrow \Omega^{\prime \prime}$ that carries $\omega$ to $T^{\prime}(T(\omega))$.

Theorem 13.1. (i) If $T^{-1} A^{\prime} \in \mathscr{F}$ for each $A^{\prime} \in \mathscr{L}^{\prime}$ and $\mathscr{L}^{\prime}$ generates $\mathscr{F}^{\prime}$, then $T$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$.
(ii) If $T$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$ and $T^{\prime}$ is measurable $\mathscr{F}^{\prime} / \mathscr{F}^{\prime \prime}$ then $T^{\prime} T$ is measurable $\mathscr{F} / \mathscr{F}^{\prime \prime}$.

Proof. Since $T^{-1}\left(\Omega^{\prime}-A^{\prime}\right)=\Omega-T^{-1} A^{\prime}$ and $T^{-1}\left(\cup_{n} A_{n}^{\prime}\right)=\cup_{n} T^{-1} A_{n}^{\prime}$, and since $\mathscr{F}$ is a $\sigma$-field in $\Omega$, the class $\left[A^{\prime}: T^{-1} A^{\prime} \in \mathscr{F}\right]$ is a $\sigma$-field in $\Omega^{\prime}$. If this $\sigma$-field contains $\mathscr{A}^{\prime}$, it must also contain $\sigma\left(\mathscr{A}^{\prime}\right)$, and (i) follows.

As for (ii), it follows by the hypotheses that $A^{\prime \prime} \in \mathscr{F}^{\prime \prime}$ implies that $\left(T^{\prime}\right)^{-1} A^{\prime \prime} \in \mathscr{F}^{\prime}$, which in turn implies that $\left(T^{\prime} T\right)^{-1} A^{\prime \prime}=\left[\omega: T^{\prime} T \omega \in A^{\prime \prime}\right]= \left[\omega: T \omega \in\left(T^{\prime}\right)^{-1} A^{\prime \prime}\right]=T^{-1}\left(\left(T^{\prime}\right)^{-1} A^{\prime \prime}\right) \in \mathscr{F}$.

By part (i), if $f$ is a real function such that $[\omega: F(\omega) \leq x]$ lies in $\mathscr{F}$ for all $x$, then $f$ is measurable $\mathscr{F}$. This condition is usually easy to check.

## Mappings into $\boldsymbol{R}^{\boldsymbol{k}}$

For a mapping $f: \Omega \rightarrow R^{k}$ carrying $\Omega$ into $k$-space, $\mathscr{R}^{k}$ is always understood to be the $\sigma$-field in the image space. In probabilistic contexts, a measurable mapping into $R^{k}$ is called a random vector. Now $f$ must have the form

$$
\begin{equation*}
f(\omega)=\left(f_{1}(\omega), \ldots, f_{k}(\omega)\right) \tag{13.1}
\end{equation*}
$$

for real functions $f_{j}(\omega)$. Since the sets (12.9) (the "southwest regions") generate $\mathscr{R}^{k}$, Theorem 13.1(i) implies that $f$ is measurable $\mathscr{F}$ if and only if the set

$$
\begin{equation*}
\left[\omega: f_{1}(\omega) \leq x_{1}, \ldots, f_{k}(\omega) \leq x_{k}\right]=\bigcap_{j=1}^{k}\left[\omega: f_{j}(\omega) \leq x_{j}\right] \tag{13.2}
\end{equation*}
$$

lies in $\mathscr{F}$ for each $\left(x_{1}, \ldots, x_{k}\right)$. This condition holds if each $f_{j}$ is measurable $\mathscr{F}$. On the other hand, if $x_{j}=x$ is fixed and $x_{1}=\cdots=x_{j-1}=x_{j+1}=\cdots= x_{k}=n$ goes to $\infty$, the sets (13.2) increase to $\left[\omega: f_{j}(\omega) \leq x\right]$; the condition thus implies that each $f$, is measurable. Therefore, $f$ is measurable $\mathscr{F}$ if and only if each component function $f_{j}$ is measurable $\mathscr{F}$. This provides a practical criterion for mappings into $R^{k}$.

A mapping $f: R^{i} \rightarrow R^{k}$ is defined to be measurable if it is measurable $\mathscr{R}^{i} / \mathscr{R}^{k}$. Such functions are often called Borel functions. To sum up, $T$ : $\Omega \rightarrow \Omega^{\prime}$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$ if $T^{-1} A^{\prime} \in \mathscr{F}$ for all $A^{\prime} \in \mathscr{F}^{\prime} ; f: \Omega \rightarrow R^{k}$ is measurable $\mathscr{F}$ if it is measurable $\mathscr{F} / \mathscr{R}^{k}$; and $f: R^{i} \rightarrow R^{k}$ is measurable (a Borel function) if it is measurable $\mathscr{R}^{i} / \mathscr{R}^{k}$. If $H$ lies outside $\mathscr{R}^{1}$, then $I_{H} (i=k=1)$ is not a Borel function.

Theorem 13.2. If $f: R^{i} \rightarrow R^{k}$ is continuous, then it is measurable.
Proof. As noted above, it suffices to check that each set (13.2) lies in $\mathscr{R}^{i}$. But each is closed because of continuity.

Theorem 13.3. If $f_{j}: \Omega \rightarrow R^{1}$ is measurable $\mathscr{F}, j=1, \ldots, k$, then $g\left(f_{1}(\omega), \ldots, f_{k}(\omega)\right)$ is measurable $\mathscr{F}$ if $g: R^{k} \rightarrow R^{1}$ is measurable-in particular, if it is continuous.

Proof. If the $f_{j}$ are measurable, then so is (13.1), so that the result follows by Theorem 13.1(ii).

Taking $g\left(x_{1}, \ldots, x_{k}\right)$ to be $\sum_{i=1}^{k} x_{i}, \prod_{i=1}^{k} x_{i}$, and $\max \left\{x_{1}, \ldots, x_{k}\right\}$ in turn shows that sums, products, and maxima of measurable functions are measurable. If $f(\omega)$ is real and measurable, then so are $\sin f(\omega), e^{t f(\omega)}$, and so on, and if $f(\omega)$ never vanishes, then $1 / f(\omega)$ is measurable as well.

## Limits and Measurability

For a real function $f$ it is often convenient to admit the artificial values $\infty$ and $-\infty$-to work with the extended real line $[-\infty, \infty]$. Such an $f$ is by definition measurable $\mathscr{F}$ if $[\omega: f(\omega) \in H]$ lies in $\mathscr{F}$ for each Borel set $H$ of (finite) real numbers and if $[\omega: f(\omega)=\infty]$ and $[\omega: f(\omega)=-\infty]$ both lie in $\mathscr{F}$. This extension of the notion of measurability is convenient in connection with limits and suprema, which need not be finite.

Theorem 13.4. Suppose that $f_{1}, f_{2}, \ldots$ are real functions measurable $\mathscr{F}$.
(i) The functions $\sup _{n} f_{n}, \inf _{n} f_{n}, \limsup _{n} f_{n}$, and $\liminf _{n} f_{n}$ are measurable $\mathscr{F}$.
(ii) If $\lim _{n} f_{n}$ exists everywhere, then it is measurable $\mathscr{F}$.
(iii) The $\omega$-set where $\left\{f_{n}(\omega)\right\}$ converges lies in $\mathscr{F}$.
(iv) If $f$ is measurable $\mathscr{F}$, then the $\omega$-set where $f_{n}(\omega) \rightarrow f(\omega)$ lies in $\mathscr{F}$.

Proof. Clearly, $\left[\sup _{n} f_{n} \leq x\right]=\bigcap_{n}\left[f_{n} \leq x\right]$ lies in $\mathscr{F}$ even for $x=\infty$ and $x=-\infty$, and so $\sup _{n} f_{n}$ is measurable. The measurability of $\inf _{n} f_{n}$ follows the same way, and hence $\limsup _{n} f_{n}=\inf _{n} \sup _{k \geq n} f_{k}$ and $\liminf _{n} f_{n}= \sup _{n} \inf _{k \geq n} f_{k}$ are measurable. If $\lim _{n} f_{n}$ exists, it coincides with these last two functions and hence is measurable. Finally, the set in (iii) is the set where $\limsup _{n} f_{n}(\omega)=\liminf _{n} f_{n}(\omega)$, and that in (iv) is the set where this common value is $f(\omega)$. $\square$

Special cases of this theorem have been encountered before-part (iv), for example, in connection with the strong law of large numbers. The last three parts of the theorem obviously carry over to mappings into $R^{k}$.

A simple real function is one with finite range; it can be put in the form

$$
\begin{equation*}
f=\sum x_{i} I_{A_{i}}, \tag{13.3}
\end{equation*}
$$

where the $A_{i}$ form a finite decomposition of $\Omega$. It is measurable $\mathscr{F}$ if each $A_{i}$ lies in $\mathscr{F}$. The simple random variables of Section 5 have this form.

Many results concerning measurable functions are most easily proved first for simple functions and then, by an appeal to the next theorem and a passage to the limit, for the general measurable function.

Theorem 13.5. If $f$ is real and measurable $\mathscr{F}$, there exists a sequence $\left\{f_{n}\right\}$ of simple functions, each measurable $\mathscr{F}$, such that

$$
\begin{equation*}
0 \leq f_{n}(\omega) \uparrow f(\omega) \quad \text { if } f(\omega) \geq 0 \tag{13.4}
\end{equation*}
$$

and

$$
\begin{equation*}
0 \geq f_{n}(\omega) \downarrow f(\omega) \quad \text { if } f(\omega) \leq 0 \text {. } \tag{13.5}
\end{equation*}
$$

Proof. Define

$$
f_{n}(\omega)= \begin{cases}-n & \text { if }-\infty \leq f(\omega) \leq-n,  \tag{13.6}\\ -(k-1) 2^{-n} & \text { if }-k 2^{-n}<f(\omega) \leq-(k-1) 2^{-n}, \\ & \quad 1 \leq k \leq n 2^{n}, \\ (k-1) 2^{-n} & \text { if }(k-1) 2^{-n} \leq f(\omega)<k 2^{-n}, \\ & \quad \text { if } n \leq f(\omega) \leq \infty .\end{cases}
$$

This sequence has the required properties.
Note that (13.6) covers the possibilities $f(\omega)=\infty$ and $f(\omega)=-\infty$.
If $A \in \mathscr{F}$, a function $f$ defined only on $A$ is by definition measurable if $[\omega \in A: f(\omega) \in H]$ lies in $\mathscr{F}^{-}$for $H \in \mathscr{R}^{1}$ and for $H=\{\infty\}$ and $H=\{-\infty\}$.

## Transformations of Measures

Let $(\Omega, \mathscr{F})$ and $\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)$ be measurable spaces, and suppose that the mapping $T: \Omega \rightarrow \Omega^{\prime}$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$. Given a measure $\mu$ on $\mathscr{F}$, define a set function $\mu T^{-1}$ on $\mathscr{F}^{-1}$ by

$$
\begin{equation*}
\mu T^{-1}\left(A^{\prime}\right)=\mu\left(T^{-1} A^{\prime}\right), \quad A^{\prime} \in \mathscr{F}^{\prime} . \tag{13.7}
\end{equation*}
$$

That is, $\mu T^{-1}$ assigns value $\mu\left(T^{-1} A^{\prime}\right)$ to the set $A^{\prime}$. If $A^{\prime} \in \mathscr{F}^{\prime}$, then $T^{-1} A^{\prime} \in \mathscr{F}$ because $T$ is measurable, and hence the set function $\mu T^{-1}$ is well defined on $\mathscr{F}^{\prime}$. Since $T^{-1} \cup_{n} A_{n}^{\prime}=\cup_{n} T^{-1} A_{n}^{\prime}$ and the $T^{-1} A_{n}^{\prime}$ are disjoint
sets in $\Omega$ if the $A_{n}^{\prime}$ are disjoint sets in $\Omega^{\prime}$, the countable additivity of $\mu T^{-1}$ follows from that of $\mu$. Thus $\mu T^{-1}$ is a measure. This way of transferring a measure from $\Omega$ to $\Omega^{\prime}$ will prove useful in a number of ways.

If $\mu$ is finite, so is $\mu T^{-1}$; if $\mu$ is a probability measure, so is $\mu T^{-1} .^{\dagger}$

## PROBLEMS

13.1. Functions are often defined in pieces (foi example, let $f(x)$ be $x^{3}$ or $x^{-1}$ as $x \geq 0$ or $x<0$ ), and the following result shows that the function is measurable if the pieces are.

Consider measurable spaces ( $\Omega, \mathscr{F}^{\prime}$ ) and ( $\Omega^{\prime}, \mathscr{F}^{\prime}$ ) and a map $T \quad \Omega \rightarrow \Omega^{\prime}$ Let $A_{1}, A_{2}, \ldots$ be a countable covering of $\Omega$ by $\mathscr{F}$-sets. Consider the $\sigma$-field $\mathscr{F}_{n}=\left[A: A \subset A_{n}, A \in \mathscr{F}\right]$ in $A_{n}$ and the restriction $T_{n}$ of $T$ to $A_{n}$. Show that $T$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$ if and only if $T_{n}$ is measurable $\mathscr{F}_{n} / \mathscr{F}^{\prime}$ for each $n$.
13.2. (a) For a map $T$ and $\sigma$-fields $\mathscr{F}$ and $\mathscr{F}^{\prime}$, define $T^{-1} \mathscr{F}^{\prime}=\left[T^{-1} A^{\prime}: A^{\prime} \in \mathscr{F}^{\prime}\right]$ and $T \mathscr{F}=\left[A^{\prime}: T^{-1} A^{\prime} \in \mathscr{F}\right]$. Show that $T^{-1} \mathscr{F}^{\prime}$ and $T \mathscr{F}$ are $\sigma$-fields and that measurability $\mathscr{F} / \mathscr{F}^{\prime}$ is equivalent to $T^{-1} \mathscr{F}^{\prime} \subset \mathscr{F}$ and to $\mathscr{F}^{\prime} \subset T \mathscr{F}$.
(b) For given $\mathscr{F}^{\prime}, T^{-1} \mathscr{F}^{\prime}$, which is the smallest $\sigma$-field for which $T$ is measurable $\mathscr{F}^{\prime} \mathscr{F}^{\prime}$, is by definition the $\sigma$-field generated by $T$. For simpie random variables describe $\sigma\left(X_{1}, \ldots, X_{n}\right)$ in these terms.
(c) Let $\sigma^{\prime}\left(\mathscr{A}^{\prime}\right)$ be the $\sigma$-field in $\Omega^{\prime}$ generated by $\mathscr{A}^{\prime}$. Show that $\sigma\left(T^{-1} \mathscr{X}^{\prime}\right)= T^{-1}\left(\sigma^{\prime}\left(\mathscr{A}^{\prime}\right)\right)$. Prove Theorem 10.1 by taking $T$ to be the identity map from $\Omega_{0}$ to $\Omega$.
13.3. $\uparrow$ Suppose that $f: \Omega \rightarrow R^{1}$. Show that $f$ is measurable $T^{-1} \mathscr{F}^{\prime}$ if and only if there exists a map $\varphi: \Omega^{\prime} \rightarrow R^{1}$ such that $\varphi$ is measurable $\mathscr{F}^{\prime}$ and $f=\varphi T$. Hint: First consider simple functions and then use Theorem 13.5.
13.4. ↑ Relate the result in Problem 13.3 to Theorem 5.1(ii).
13.5. Show of real functions $f$ and $g$ that $f(\omega)+g(\omega)<x$ if and only if there exist rationals $r$ and $s$ such that $r+s<x, f(\omega)<r$, and $g(\omega)<s$. Prove directly that $f+g$ is measurable $\mathscr{F}$ if $f$ and $g$ are.
13.6. Let $\mathscr{F}$ be a $\sigma$-field in $R^{\prime}$. Show that $\mathscr{R}^{1} \subset \mathscr{F}$ if and only if every continuous function is measurable $\mathscr{F}$. Thus $\mathscr{R}^{1}$ is the smallest $\sigma$-field with respect to which all the continuous functions are measurable.
13.7. Consider on $R^{!}$the smallest class $\mathscr{X}$ (that is, the intersection of all classes) of real functions containing all the continuous functions and closed under pointwise passages to the limit. The elements of $\mathscr{X}$ are called Baire functions. Show that Baire functions and Borel functions on $R^{1}$ are the same thing.
13.8. A real function $f$ on the line is upper semicontinuous at $x$ if for each $\epsilon$ there is a $\delta$ such that $|x-y|<\delta$ implies that $f(y)<f(x)+\epsilon$. Show that, if $f$ is everywhere upper semicontinuous, then it is measurable.
${ }^{\dagger}$ But see Problem 13.14.
13.9. Suppose that $f_{n}$ and $f$ are finite-valued, $\mathscr{F}$-measurable functions such that $f_{n}(\omega) \rightarrow f(\omega)$ for $\omega \in A$, where $\mu(A)<\infty$ ( $\mu$ a measure on $\mathscr{F}$ ). Prove Egoroff's theorem: For each $\epsilon$ there exists a subset $B$ of $A$ such that $\mu(B)<\epsilon$ and $f_{n}(\omega) \rightarrow f(\omega)$ uniformly on $A-B$. Hint: Let $B_{n}^{(k)}$ be the set of $\omega$ in $A$ such that $\left|f(\omega)-f_{i}(\omega)\right|>k^{-1}$ for some $i \geq n$. Show that $B_{n}^{(k)} \downarrow / \varnothing$ as $n \uparrow \infty$, choose $n_{k}$ so that $\mu\left(B_{n_{k}}^{(k)}\right)<\epsilon / 2^{k}$, and put $B=\bigcup_{k=1}^{\infty} B_{n_{k}}^{(k)}$.
13.10. $\uparrow$ Show that Egoroff's theorem is false without the hypothesis $\mu(A)<\infty$.
13.11. $2.9 \uparrow$ Show that, if $f$ is measurable $\sigma(\mathscr{A})$, then there exists a countable subclass $\mathscr{A}_{f}$ of $\mathscr{A}$ such that $f$ is measurable $\sigma\left(\mathscr{A}_{f}\right)$.
13.12. Circular Lebesgue measure Let $C$ be the unit circle in the complex plane, and define $T:[0,1) \rightarrow \mathcal{C}$ by $T \omega=e^{2 \pi i \omega}$. Let $\mathscr{B}$ consist of the Borel subsets of $[0, i)$, and let $\lambda$ be Lebesgue measure on $\mathscr{B}$. Show that $\mathscr{b}=\left[A: T^{-1} A \in \mathscr{E}\right]$ consists of the sets in $\mathscr{R}^{2}$ (identify $R^{2}$ with the complex plane) that are contained in $C$ Show that $\mathscr{C}$ is generated by the arcs of $C$. Circular Lebesgue measure is defined as $\mu=\lambda T^{-1}$. Show that $\mu$ is invariant under rotations: $\mu[\theta z: z \in A]= \mu(A)$ for $A \in \mathscr{C}$ and $\theta \in C$.
13.13. $\uparrow$ Suppose that the circular Lebesgue measure of $A$ satisfies $\mu(A)>1-n^{-1}$ and that $B$ contains at most $n$ points. Show that some rotation carries $B$ into $A \theta B \subset A$ fol some $\theta$ in $C$.
13.14. Show by example that $\mu \sigma$-finite does not imply $\mu T^{-1} \sigma$-finite.
13.15. Consider Lebesgue measure $\lambda$ restricted to the class $\mathscr{B}$ of Borel sets in ( 0,1 ]. For a fixed permutation $n_{1}, n_{2}, \ldots$ of the positive integers, if $x$ has dyadic expansion.$x_{1} x_{2} \ldots$, take $T x=. x_{n_{1}} x_{n_{2}} \ldots$. Show that $T$ is measurable $\mathscr{B} / \mathscr{B}$ and that $\lambda T^{-1}=\lambda$.
13.16. Let $H_{k}$ be the union of the intervals $\left((i-1) / 2^{k}, i / 2^{k}\right]$ for $i$ even, $1 \leq i \leq 2^{k}$. Show that if $0<f(\omega) \leq 1$ for all $\omega$ and $A_{k}=f^{-1}\left(H_{k}\right)$, then $f(\omega)= \sum_{k=1}^{\infty} I_{A_{k}}(\omega) / 2^{k}$, an infinite linear combination of indicators.
13.17. Let $S=\{0,1\}$, and define a map $T$ from sequence space $S^{\infty}$ to $[0,1]$ by $T \omega=\sum_{k=1}^{\infty} a_{k}(\omega) / 2^{k}$. Define a map $U$ of $[0,1]$ to $S^{\infty}$ by $U x=\left(d_{1}(x), d_{2}(x), \ldots\right)$, where the $d_{k}(x)$ are the digits of the nonterminating dyadic expansion of $x$ (and $d_{k}(0) \equiv 0$ ). Show that $T$ is measurable $\mathscr{C} / \mathscr{B}$ and that $U$ is measurable $\mathscr{B} / \mathscr{C}$. Let $P$ be the measure specified by (2.21) for $p_{0}=p_{1}=\frac{1}{2}$. Describe $P T^{-1}$ and $\lambda U^{-1}$.

## SECTION 14. DISTRIBUTION FUNCTIONS

## Distribution Functions

A random variable as defined in Section 13 is a measurable real function $X$ on a probability measure space $(\Omega, \mathscr{F}, P)$. The distribution or law of the
random variable is the probability measure $\mu$ on $\left(R^{1}, \mathscr{R}^{1}\right)$ defined by

$$
\begin{equation*}
\mu(A)=P[X \in A], \quad A \in \mathscr{R}^{1} . \tag{14.1}
\end{equation*}
$$

As in the case of the simple random variables in Chapter 1, the argument $\omega$ is usually omitted: $P[X \in A]$ is short for $P[\omega: X(\omega) \in A]$. In the notation (13.7), the distribution is $P X^{-1}$.

For simple random variables the distribution was defined in Section 5-see (5.12). There $\mu$ was defined for every subset of the line, however; from now on $\mu$ will be defined only for Borel sets, because unless $X$ is simple, one cannot in general be sure that $[X \in A]$ has a probability for $A$ outside $\mathscr{R}^{1}$.

The distribution function of $X$ is defined by

$$
\begin{equation*}
F(x)=\mu(-\infty, x]=P[X \leq x] \tag{14.2}
\end{equation*}
$$

for real $x$. By continuity from above (Theorem 10.2(ii)) for $\mu, F$ is rightcontinuous. Since $F$ is nondecreasing, the left-hand limit $F(x-)= \lim _{y \uparrow x} F(y)$ exists, and by continuity from below (Theorem 10.2(i)) for $\mu$,

$$
\begin{equation*}
F(x-)=\mu(-\infty, x)=P[X<x] . \tag{14.3}
\end{equation*}
$$

Thus the jump or saltus in $F$ at $x$ is

$$
F(x)-F(x-)=\mu\{x\}=P[X=x] .
$$

Therefore (Theorem 10.2(iv)) $F$ can have at most countably many points of discontinuity. Clearly,

$$
\begin{equation*}
\lim _{x \rightarrow-\infty} F(x)=0, \quad \lim _{x \rightarrow \infty} F(x)=1 . \tag{14.4}
\end{equation*}
$$

A function with these properties must, in fact, be the distribution function of some random variable:

Theorem 14.1. If $F$ is a nondecreasing, right-continuous function satisfying (14.4), then there exists on some probability space a random variable $X$ for which $F(x)=P[X \leq x]$.

First Proof. By Theorem 12.4, if $F$ is nondecreasing and right-continuous, there is on $\left(R^{1}, \mathscr{R}^{1}\right)$ a measure $\mu$ for which $\mu(a, b]=F(b)-F(a)$. But $\lim _{x \rightarrow-\infty} F(x)=0$ implies that $\mu(-\infty, x]=F(x)$, and $\lim _{x \rightarrow \infty} F(x)=1$ implies that $\mu\left(R^{1}\right)=1$. For the probability space take $\left(\Omega, \mathscr{F}^{-}, P\right)=\left(R^{1}, \mathscr{P}^{1}, \mu\right)$, and for $X$ take the identity function: $X(\omega) \equiv \omega$. Then $P[X \leq x]=\mu\left[\omega \in R^{1}\right.$ : $\omega \leq x]=F(x)$. $\square$

Second Proof. There is a proof that uses only the existence of Lebesgue measure on the unit interval and does not require Theorem 12.4. For the probability space take the open unit interval: $\Omega$ is $(0,1), \mathscr{F}$ consists of the Borel subsets of $(0,1)$, and $P(A)$ is the Lebesgue measure of $A$.

To understand the method, suppose at first that $F$ is continuous and strictly increasing. Then $F$ is a one-to-one mapping of $R^{1}$ onto $(0,1)$; let $\varphi$ : $(0,1) \rightarrow R^{1}$ be the inverse mapping. For $0<\omega<1$, let $X(\omega)=\varphi(\omega)$. Since $\varphi$ is increasing, certainly $X$ is measurable $\mathscr{F}$. If $0<u<1$, then $\varphi(u) \leq x$ if and only if $u \leq F(x)$. Since $P$ is Lebesgue measure, $P[X \leq x]=P[\omega \in(0,1)$ : $\varphi(\omega) \leq x]=P[\omega \in(0,1): \omega \leq F(x)]=F(x)$, as required.
![](https://cdn.mathpix.com/cropped/9092a04c-b972-4b70-a092-92c3d622e41e-082.jpg?height=585&width=710&top_left_y=837&top_left_x=562)

If $F$ has discontinuities or is not strictly increasing, define ${ }^{\dagger}$

$$
\begin{equation*}
\varphi(u)=\inf [x: u \leq F(x)] \tag{14.5}
\end{equation*}
$$

for $0<u<1$. Since $F$ is nondecreasing, $[x: u \leq F(x)]$ is an interval stretching to $\infty$; since $F$ is right-continuous, this interval is closed on the left. For $0<u<1$, therefore, $[x: u \leq F(x)]=[\varphi(u), \infty)$, and so $\varphi(u) \leq x$ if and only if $u \leq F(x)$. If $X(\omega)=\varphi(\omega)$ for $0<\omega<1$, then by the same reasoning as before, $X$ is a random variable and $P[X \leq x]=F(x)$. $\square$

This second argument actually provides a simple proof of Theorem 12.4 for a probability distribution ${ }^{\ddagger} F$ : the distribution $\mu$ (as defined by (14.1)) of the random variable just constructed satisfies $\mu(-\infty, x]=F(x)$ and hence $\mu(a, b]=F(b)-F(a)$.

## Exponential Distributions

There are a number of results which for their interpretation require random variables, independence, and other probabilistic concepts, but which can be discussed technically in terms of distribution functions alone and do not require the apparatus of measure theory.

[^17]Suppose as an example that $F$ is the distribution function of the waiting time to the occurrence of some event-say the arrival of the next customer at a queue or the next call at a telephone exchange. As the waiting time must be positive, assume that $F(0)=0$. Suppose that $F(x)<1$ for all $x$, and furthermore suppose that

$$
\begin{equation*}
\frac{1-F(x+y)}{1-F(x)}=1-F(y), \quad x, y \geq 0 . \tag{14.6}
\end{equation*}
$$

The right side of this equation is the probability that the waiting time exceeds $y$; by the definition (4.1) of conditional probability, the left side is the probability that the waiting time exceeds $x+y$ given that it exceeds $x$. Thus (14.6) attributes to the waiting-time mechanism a kind of lack of memory or aftereffect: If after a lapse of $x$ units of time the event has not yet occurred, the waiting time stili remaining is conditionally distributed just as the entire waiting time from the beginning. For reasons that will emerge later (see Section 23), waiting times often have this property.

The condition (14.6) completely determines the form of $F$. If $U(x)= 1-F(x)$, (14.6) is $U(x+y)=U(x) U(y)$. This is a form of Cauchy's equation [A20], and since $U$ is bounded, $U(x)=e^{-\alpha x}$ for some $\alpha$. Since $\lim _{x \rightarrow \infty} U(x)=0, \alpha$ must be positive. Thus (14.6) implies that $F$ has the exponential form

$$
F(x)= \begin{cases}0 & \text { if } x \leq 0  \tag{14.7}\\ 1-e^{-\alpha x} & \text { if } x \geq 0\end{cases}
$$

and conversely.

## Weak Convergence

Random variables $X_{1}, \ldots, X_{n}$ are defined to be independent if the events $\left[X_{1} \in A_{1}\right], \ldots,\left[X_{n} \in A_{n}\right]$ are independent for all Borel sets $A_{1}, \ldots, A_{n}$, so that $P\left[X_{i} \in A_{i}, i=1, \ldots, n\right]=\prod_{i=1}^{n} P\left[X_{i} \in A_{i}\right]$. To find the distribution function of the maximum $M_{n}=\max \left\{X_{1}, \ldots, X_{n}\right\}$, take $A_{1}=\cdots=A_{n}=(-\infty, x]$. This gives $P\left[M_{n} \leq x\right]=\prod_{i=1}^{n} P\left[X_{i} \leq x\right]$. If the $X_{i}$ are independent and have common distribution function $G$ and $M_{n}$ has distribution function $F_{n}$, then

$$
\begin{equation*}
F_{n}(x)=G^{n}(x) \tag{14.8}
\end{equation*}
$$

It is possible without any appeal to measure theory to study the real function $F_{n}$ solely by means of the relation (14.8), which can indeed be taken as defining $F_{n}$. It is possible in particular to study the asymptotic properties of $F_{n}$ :

Example 14.1. Consider a stream or sequence of events, say arrivals of calls at a telephone exchange. Suppose that the times between successive events, the interarrival times, are independent and that each has the exponential form (14.7) with a common value of $\alpha$. By (14.8) the maximum $M_{n}$ among the first $n$ interarrival times has distribution function $F_{n}(x)=(1- \left.e^{-\alpha x}\right)^{n}, x \geq 0$. For each $x, \lim _{n} F_{n}(x)=0$, which means that $M_{n}$ tends to be large for $n$ large. But $P\left[M_{n}-\alpha^{-1} \log n \leq x\right]=F_{n}\left(x+\alpha^{-1} \log n\right)$. This is the distribution function of $M_{n}-\alpha^{-1} \log n$, and it satisfies

$$
\begin{equation*}
F_{n}\left(x+\alpha^{-1} \log n\right)=\left(1-e^{-(\alpha x+\log n)}\right)^{n} \rightarrow e^{-e^{-\alpha x}} \tag{14.9}
\end{equation*}
$$

as $n \rightarrow \infty$; the equality here holds if $\log n \geq-\alpha x$, and so the limit holds for all $x$. This gives for large $n$ the approximate distribution of the normalized random variable $M_{n}-\alpha^{-1} \log n$.

If $F_{n}$ and $F$ are distribution functions, then by definition, $F_{n}$ converges weakly to $F$, written $F_{n} \Rightarrow F$, if

$$
\begin{equation*}
\lim _{n} F_{n}(x)=F(x) \tag{14.10}
\end{equation*}
$$

for each $x$ at which $F$ is continuous. ${ }^{i}$ To study the approximate distribution of a random variable $Y_{n}$ it is often necessary to study instead the normalized or rescaled random variable $\left(Y_{n}-b_{n}\right) / a_{n}$ for appropriate constants $a_{n}$ and $b_{n}$. If $Y_{n}$ has distribution function $F_{n}$ and if $a_{n}>0$, then $P\left[\left(Y_{n}-b_{n}\right) / a_{n} \leq x\right] =P\left[Y_{n} \leq a_{n} x+b_{n}\right]$, and therefore $\left(Y_{n}-b_{n}\right) / a_{n}$ has distribution function $F_{n}\left(a_{n} x+b_{n}\right)$. For this reason weak convergence often appears in the form ${ }^{\ddagger}$

$$
\begin{equation*}
F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow F(x) \tag{14.11}
\end{equation*}
$$

An example of this is (14.9): there $a_{n}=1, b_{n}=\alpha^{-1} \log n$, and $F(x)=e^{-e^{-\alpha x}}$.
Example 14.2. Consider again the distribution function (14.8) of the maximum, but suppose that $G$ has the form

$$
G(x)= \begin{cases}0 & \text { if } x \leq 1, \\ 1-x^{-\alpha} & \text { if } x \geq 1,\end{cases}
$$

where $\alpha>0$. Here $F_{n}\left(n^{1 / \alpha} x\right)=\left(1-n^{-1} x^{-\alpha}\right)^{n}$ for $x \geq n^{-1 / \alpha}$, and therefore

$$
\lim _{n} F_{n}\left(n^{1 / \alpha} x\right)= \begin{cases}0 & \text { if } x \leq 0, \\ e^{-x^{-\alpha}} & \text { if } x>0 .\end{cases}
$$

This is an example of (14.11) in which $a_{n}=n^{1 / \alpha}$ and $b_{n}=0$.

[^18]Example 14.3. Consider (14.8) once more, but for

$$
G(x)= \begin{cases}0 & \text { if } x \leq 0, \\ 1-(1-x)^{\alpha} & \text { if } 0 \leq x \leq 1, \\ 1 & \text { if } x \geq 1,\end{cases}
$$

where $\alpha>0$. This time $F_{n}\left(n^{-1 / \alpha} x+1\right)=\left(1-n^{-1}(-x)^{\alpha}\right)^{n}$ if $-n^{1 / \alpha} \leq x \leq 0$. Therefore,

$$
\lim _{n} F_{n}\left(n^{-1 / \alpha} x+1\right)= \begin{cases}e^{-(-x)^{\alpha}} & \text { if } x \leq 0, \\ 1 & \text { if } x>0,\end{cases}
$$

a case of (14.11) in which $a_{n}=n^{-1 / \alpha}$ and $b_{n}=1$.
Let $\Delta$ be the distribution function with a unit jump at the origin:

$$
\Delta(x)= \begin{cases}0 & \text { if } x<0  \tag{14.12}\\ 1 & \text { if } x \geq 0\end{cases}
$$

If $X(\omega) \equiv 0$, then $X$ has distribution function $\Delta$.
Example 14.4. Let $X_{1} X_{2}, \ldots$ be independent random variables for which $P\left[X_{k}=1\right]=P\left[X_{k}=-1\right]=\frac{1}{2}$, and put $S_{n}=X_{1}+\cdots+X_{n}$. By the weak law of large numbers,

$$
\begin{equation*}
P\left[\left|n^{-1} S_{n}\right|>\epsilon\right] \rightarrow 0 \tag{14.13}
\end{equation*}
$$

for $\epsilon>0$. Let $F_{n}$ be the distribution function of $n^{-1} S_{n}$. If $x>0$, then $F_{n}(x)=1-P\left[n^{-1} S_{n}>x\right] \rightarrow 1$; if $x<0$, then $F_{n}(x) \leq P\left[\left|n^{-1} S_{n}\right| \geq|x|\right] \rightarrow 0$. As this accounts for all the continuity points of $\Delta, F_{n} \Rightarrow \Delta$. It is easy to turn the argument around and deduce (14.13) from $F_{n} \Rightarrow \Delta$. Thus the weak law of large numbers is equivalent to the assertion that the distribution function of $n^{-1} S_{n}$ converges weakly to $\Delta$.

If $n$ is odd, so that $S_{n}=0$ is impossible, then by symmetry the events [ $S_{n} \leq 0$ ] and $\left[S_{n} \geq 0\right]$ each have probability $\frac{1}{2}$ and hence $F_{n}(0)=\frac{1}{2}$. Thus $F_{n}(0)$ does not converge to $\Delta(0)=1$, but because $\Delta$ is discontinuous at 0 , the definition of weak convergence does not require this.

Allowing (14.10) to fail at discontinuity points $x$ of $F$ thus makes it possible to bring the weak law of large numbers under the theory of weak convergence. But if (14.10) need hold only for certain values of $x$, there
arises the question of whether weak limits are unique. Suppose that $F_{n} \Rightarrow F$ and $F_{n} \Rightarrow G$. Then $F(x)=\lim _{n} F_{n}(x)=G(x)$ if $F$ and $G$ are both continuous at $x$. Since $F$ and $G$ each have only countably many points of discontinuity, ${ }^{\dagger}$ the set of common continuity points is dense, and it follows by right continuity that $F$ and $G$ are identical. A sequence can thus have at most one weak limit.

Convergence of distribution functions is studied in detail in Chapter 5. The remainder of this section is devoted to some weak-convergence theorems which are interesting both for themselves and for the reason that they require so little technical machinery.

## Convergence of Types*

Distribution functions $F$ and $G$ are of the same type if there exist constants $a$ and $b, a>0$, such that $F(a x+b)=G(x)$ for all $x$. A distribution function is degenerate if it has the form $\Delta\left(x-x_{0}\right)$ (see (14.12)) for some $x_{0}$; otherwise, it is nondegenerate.

Theorem 14.2. Suppose that $F_{n}\left(u_{n} x+v_{n}\right) \Rightarrow F(x)$ and $F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow G(x)$, where $u_{n}>0, a_{n}>0$, and $F$ and $G$ are nondegenerate. Then there exist a and $b, a>0$, such that $a_{n} / u_{n} \rightarrow a,\left(b_{n}-v_{n}\right) / u_{n} \rightarrow b$, and $F(a x+b)=G(x)$.

Thus there can be only one possible limit type and essentially only one possible sequence of norming constants.

The proof of the theorem is for clarity set out in a sequence of lemmas. In all of them, $a$ and the $a_{n}$ are assumed to be positive.

Lemma 1. If $F_{n} \Rightarrow F, a_{n} \rightarrow a$, and $b_{n} \rightarrow b$, then $F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow F(a x+b)$.
Proof. If $x$ is a continuity point of $F(a x+b)$ and $\epsilon>0$, choose continuity points $u$ and $v$ of $F$ so that $u<a x+b<v$ and $F(v)-F(u)<\epsilon$; this is possible because $F$ has only countably many discontinuities. For large enough $n, u<a_{n} x+b_{n}<v,\left|F_{n}(u)-F(u)\right|<\epsilon$, and $\left|F_{n}(v)-F(v)\right|<\epsilon$; but then $F(a x+b)-2 \epsilon<F(u)-\epsilon<F_{n}(u) \leq F_{n}\left(a_{n} x+b_{n}\right) \leq F_{n}(v)<F(v)+\epsilon< F(a x+b)+2 \epsilon$. $\square$

Lemma 2. If $F_{n} \Rightarrow F$ and $a_{n} \rightarrow \infty$, then $F_{n}\left(a_{n} x\right) \Rightarrow \Delta(x)$.

Proof. Given $\epsilon$, choose a continuity point $u$ of $F$ so large that $F(u)> 1-\epsilon$. If $x>0$, then for all large enough $n, a_{n} x>u$ and $\left|F_{n}(u)-F(u)\right|<\epsilon$, so

[^19]that $F_{n}\left(a_{n} x\right) \geq F_{n}(u)>F(u)-\epsilon>1-2 \epsilon$. Thus $\lim _{n} F_{n}\left(a_{n} x\right)=1$ for $x>0$; similarly, $\lim _{n} F_{n}\left(a_{n} x\right)=0$ for $x<0$. $\square$

Lemma 3. If $F_{n} \Rightarrow F$ and $b_{n}$ is unbounded, then $F_{n}\left(x+b_{n}\right)$ cannot converge weakly.

Proof. Suppose that $b_{n}$ is unbounded and that $b_{n} \rightarrow \infty$ along some subsequence (the case $b_{n} \rightarrow-\infty$ is similar). Suppose that $F_{n}\left(x+b_{n}\right) \Rightarrow G(x)$. Given $\epsilon$, choose a contnuity point $u$ of $F$ so that $F(u)>1-\epsilon$. Whatever $x$ may be, for $n$ far enough out in the subsequence, $x+b_{n}>u$ and $F_{n}(u)>1- 2 \epsilon$, so that $F_{n}\left(x+b_{n}\right)>1-2 \epsilon$. Thus $G(x)=\lim _{n} F_{n}\left(x+b_{n}\right)=1$ for all continuity points $x$ of $G$, which is impossible. $\square$

Lemma 4. If $F_{n}(x) \Rightarrow F(x)$ and $F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow G(x)$, where $F$ and $G$ are nondegenerate, then

$$
\begin{equation*}
0<\inf _{n} a_{n} \leq \sup _{n} a_{n}<\infty, \quad \sup _{n}\left|b_{n}\right|<\infty . \tag{14.14}
\end{equation*}
$$

Proof. Suppose that $a_{n}$ is not bounded above. Arrange by passing to a subsequence that $a_{n} \mapsto \infty$. Then by Lemma 2,

$$
\begin{equation*}
F_{n}\left(a_{n} x\right) \Rightarrow \Delta(x) . \tag{14.15}
\end{equation*}
$$

Since

$$
\begin{equation*}
F_{n}\left(a_{n}\left(x+b_{n} / a_{n}\right)\right)=F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow G(x), \tag{14.16}
\end{equation*}
$$

it follows by Lemma 3 that $b_{n} / a_{n}$ is bounded along this subsequence. By passing to a further subsequence, arrange that $b_{n} / a_{n}$ converges to some $c$. By (14.15) and Lemma 1, $F_{n}\left(a_{n}\left(x+b_{n} / a_{n}\right)\right) \Rightarrow \Delta(x+c)$ along this subsequence. But (14.16) now implies that $G$ is degenerate, contrary to hypothesis.

Thus $a_{n}$ is bounded above. If $G_{n}(x)=F_{n}\left(a_{n} x+b_{n}\right)$, then $G_{n}(x) \Rightarrow G(x)$ and $G_{n}\left(a_{n}^{-1} x-a_{n}^{-1} b_{n}\right)=F_{n}(x) \Rightarrow F(x)$. The result just proved shows that $a_{n}^{-1}$ is bounded.

Thus $a_{n}$ is bounded away from 0 and $\infty$. If $b_{n}$ is not bounded, neither is $b_{n} / a_{n}$; pass to a subsequence along which $b_{n} / a_{n} \rightarrow \pm \infty$ and $a_{n}$ converges to a positive $a$. Since, by Lemma $1, F_{n}\left(a_{n} x\right) \Rightarrow F(a x)$ along the subsequence, (14.16) and $b_{n} / a_{n} \rightarrow \pm \infty$ stand in contradiction (Lemma 3 again). Therefore $b_{n}$ is bounded. $\square$

Lemma 5. If $F(x)=F(a x+b)$ for all $x$ and $F$ is nondegenerate, then $a=1$ and $b=0$.

Proof. Since $F(x)=F\left(a^{n} x+\left(a^{n-1}+\cdots+a+1\right) b\right)$, it follows by Lemma 4 that $a^{n}$ is bounded away from 0 and $\infty$, so that $a=1$, and it then follows that $n b$ is bounded, so that $b=0$. $\square$

Proof of Theorem 14.2. Suppose first that $u_{n}=1$ and $v_{n}=0$. Then (14.14) holds. Fix any subsequence along which $a_{n}$ converges to some positive $a$ and $b_{n}$ converges to some $b$. By Lemma $1, F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow F(a x+b)$ along this subsequence, and the hypothesis gives $F(a x+b)=G(x)$.

Suppose that along some other sequence, $a_{n} \rightarrow u>0$ and $b_{n} \rightarrow v$. Then $F(u x+v)=G(x)$ and $F(a x+b)=G(x)$ both hold, so that $u=a$ and $v=b$ by Lemma 5. Every convergent subsequence of $\left\{\left(a_{n}, b_{n}\right)\right\}$ thus converges to ( $a, b$ ), and so the entire sequence does.

For the general case, let $H_{n}(x)=F_{n}\left(u_{n} x+v_{n}\right)$. Then $H_{n}(x) \Rightarrow F(x)$ and $H_{n}\left(a_{n} u_{n}^{-1} x+\left(b_{n}-v_{n}\right) u_{n}^{-1}\right) \Rightarrow G(x)$, and so by the case already treated, $a_{n} u_{n}^{-1}$ converges to some positive $a$ and $\left(b_{n}-v_{n}\right) u_{n}^{-1}$ to some $b$, and as before, $F(a x+b)=G(x)$.

## Extremal Distributions*

A distribution function $F$ is extremal if it is nondegenerate and if, for some distribution function $G$ and constants $a_{n}\left(a_{n}>0\right)$ and $b_{n}$,

$$
\begin{equation*}
G^{n}\left(a_{n} x+b_{n}\right) \Rightarrow F(x) . \tag{14.17}
\end{equation*}
$$

These are the possible limiting distributions of normalized maxima (see (14.8)), and Examples 14.1, 14.2, and 14.3 give three specimens. The following analysis shows that these three examples exhaust the possible types.

Assume that $F$ is extremal. From (14.17) follow $G^{n k}\left(a_{n} x+b_{n}\right) \Rightarrow F^{k}(x)$ and $G^{n k}\left(a_{n k} x+b_{n k}\right) \Rightarrow F(x)$, and so by Theorem 14.2 there exist constants $c_{k}$ and $d_{k}$ such that $c_{k}$ is positive and

$$
\begin{equation*}
F^{k}(x)=F\left(c_{k} x+d_{k}\right) . \tag{14.18}
\end{equation*}
$$

From $F\left(c_{j k} x+d_{j k}\right)=F^{j k}(x)=F^{j}\left(c_{k} x+d_{k}\right)=F\left(c_{j}\left(c_{k} x+d_{k}\right)+d_{j}\right)$ follow (Lemma 5) the relations

$$
\begin{equation*}
c_{j k}=c_{j} c_{k}, \quad d_{j k}=c_{j} d_{k}+d_{j}=c_{k} d_{j}+d_{k} . \tag{14.19}
\end{equation*}
$$

Of course, $c_{1}=1$ and $d_{1}=0$. There are three cases to be considered separately.
Case 1. Suppose that $c_{k}=1$ for all $k$. Then

$$
\begin{equation*}
F^{k}(x)=F\left(x+d_{k}\right), \quad F^{1 / k}(x)=F\left(x-d_{k}\right) . \tag{14.20}
\end{equation*}
$$

This implies that $F^{j / k}(x)=F\left(x+d_{j}-d_{k}\right)$. For positive rational $r=j / k$, put $\delta_{r}=d_{j} -d_{k}$; (14.19) implies that the definition is consistent, and $F^{r}(x)=F\left(x+\delta_{r}\right)$. Since $F$ is nondegenerate, there is an $x$ such that $0<F(x)<1$, and it follows by (14.20) that $d_{k}$ is decreasing in $k$, so that $\delta_{r}$ is strictly decreasing in $r$.

[^20]For positive real $t$ let $\varphi(t)=\inf _{0<r<t} \delta_{r}$ ( $r$ rational in the infimum). Then $\varphi(t)$ is decreasing in $t$, and

$$
\begin{equation*}
F^{i}(x)=F(x+\varphi(t)) \tag{14.21}
\end{equation*}
$$

for all $x$ and all positive $t$. Further, (14.19) implies that $\varphi(s t)=\varphi(s)+\varphi(t)$, so that by the theorem on Cauchy's equation [A20] applied to $\varphi\left(e^{x}\right), \varphi(t)=-\beta \log t$, where $\beta>0$ because $\varphi(t)$ is strictly decreasing. Now (14.21) with $t=e^{x / \beta}$ gives $F(x)= \exp \left\{e^{-x / \beta} \log F(0)\right\}$, and so $F$ must be of the same type as

$$
\begin{equation*}
F_{1}(x)=e^{-e^{-x}} \tag{14.22}
\end{equation*}
$$

Example 14.1 shows that this distribution function can arise as a limit of distributions of maxima-that is, $F_{1}$ is indeed extremal.

Case 2. Suppose that $c_{k_{0}} \neq 1$ for some $k_{0}$, which necessarily exceeds 1 . Then there exists an $x^{\prime}$ such that $c_{k_{0}} x^{i^{0}}+d_{k_{11}}=x^{i}$; but (14.18) then gives $F^{k_{0}}\left(x^{i}\right)=F\left(x^{i}\right)$, so that $F\left(x^{\prime}\right)$ is 0 or 1 . (In Case $1, F$ has the type (14.22) and so never assumes the values 0 and 1.)

Now suppose further that, in fact, $F\left(x^{\prime}\right)=0$. Let $x_{0}$ be the supremum of those $x$ for which $F(x)=0$. By passing to a new $F$ of the same type one can arrange that $x_{0}=0$; then $F(x)=0$ for $x<0$ and $F(x)>0$ for $x>0$. The new $F$ will satisfy (14.18), but with new constants $d_{k}$.

If a (new) $d_{k}$ is distinct from 0 , then there is an $x$ near 0 for which the arguments on the two sides of (14.18) have opposite signs. Therefore, $d_{k}=0$ for all $k$, and

$$
\begin{equation*}
F^{k}(x)=F\left(c_{k} x\right), \quad F^{1 / k}(x)=F\left(\frac{x}{c_{k}}\right) \tag{14.23}
\end{equation*}
$$

for all $k$ and $x$. This implies that $F^{j / k}(x)=F\left(x c_{j} / c_{k}\right)$. For positive rational $r=j / k$, put $\gamma_{r}=c_{j} / c_{k}$. The definition is again consistent by (14.19), and $F^{r}(x)=F\left(\gamma_{r} x\right)$. Since $0<F(x)<1$ for some $x$, necessarily positive, it follows by (14.23) that $c_{k}$ is decreasing in $k$, so that $\gamma_{r}$ is strictly decreasing in $r$. Put $\psi(t)=\inf _{0<r<1} \gamma_{r}$ for positive real $t$. From (14.19) follows $\psi(s t)=\psi(s) \psi(t)$, and by the corollary to the theorem on Cauchy's equation [A20] applied to $\psi\left(e^{x}\right)$, it follows that $\psi(t)=t^{-\xi}$ for some $\xi>0$. Since $F^{\prime}(x)=F(\psi(t) x)$ for all $x$ and for $t$ positive, $F(x)= \exp \left\{x^{-1 / \xi} \log F(1)\right\}$ for $x>0$. Thus (take $\left.\alpha=1 / \xi\right) F$ is of the same type as

$$
F_{2, \alpha}(x)= \begin{cases}0 & \text { if } x<0  \tag{14.24}\\ e^{-x^{-\alpha}} & \text { if } x \geq 0\end{cases}
$$

Example 14.2 shows that this case can arise.
Case 3. Suppose as in Case 2 that $c_{k_{4}} \neq 1$ for some $k_{0}$, so that $F\left(x^{\prime}\right)$ is 0 or 1 for some $x^{\prime}$, but this time suppose that $F\left(x^{y}\right)=1$. Let $x_{1}$ be the infimum of those $x$ for which $F(x)=1$. By passing to a new $F$ of the same type, arrange that $x_{1}=0$; then $F(x)<1$ for $x<0$ and $F(x)=1$ for $x \geq 0$. If $d_{k} \neq 0$, then for some $x$ near 0 , one side of (14.18) is 1 and the other is not. Thus $d_{k}=0$ for all $k$, and (14.23) again holds. And
again $\gamma_{j / k}=c_{j} / c_{k}$ consistently defines a function satisfying $F^{r}(x)=F\left(\gamma_{r} x\right)$. Since $F$ is nondegenerate, $0<F(x)<1$ for some $x$, but this time $x$ is necessarily negative, so that $c_{k}$ is increasing.

The same analysis as before shows that there is a positive $\xi$ such that $F^{1}(x)= F\left(t^{\xi} x\right)$ for all $x$ and for $t$ positive. Thus $F(x)=\exp \left\{(-x)^{1 / \xi} \log F(-1)\right\}$ for $x<0$, and $F$ is of the type

$$
F_{3, \alpha}(x)= \begin{cases}e^{-(-x)^{\alpha}} & \text { if } x \leq 0  \tag{14.25}\\ 1 & \text { if } x \geq 0\end{cases}
$$

Example 143 shows that this distribution function is indeed extremal.
This completely characterizes the class of extremal distributions:
Theorem 14.3. The class of extremal distribution functions consists exactly of the distribution functions of the types (14.22), (14.24), and (14.25).

It is possible to go on and characterize the domains of attraction. That is. it is possible for each extremal distribution function $F$ to describe the class of $G$ satisfying (14.17) for some constants $a_{n}$ and $b_{n}$-the class of $G$ attracted to $F^{+}$

## PROBLEMS

14.1. The general nondecreasing function $F$ has at most countably many discontinuities. Prove this by considering the open intervals

$$
\left(\sup _{u<x} F(u), \inf _{\iota>x} F(v)\right)
$$

-each nonempty one contains a rational.
14.2. For distribution functions $F$, the second proof of Theorem 14.1 shows how to construct a measure $\mu$ on ( $R^{1}, \mathscr{R}^{1}$ ) such that $\mu(a, b]=F(b)-F(a)$.
(a) Extend to the case of bounded $F$.
(b) Extend to the general case. Hint: Let $F_{n}(x)$ be $-n$ or $F(x)$ or $n$ as $F(x)<-n$ or $-n \leq F(x)<n$ or $n \leq F(x)$. Construct the corresponding $\mu_{n}$ and define $\mu(A)=\lim _{n} \mu_{n}(A)$.
14.3. (a) Suppose that $X$ has a continuous, strictly increasing distribution function $F$. Show that the random variable $F(X)$ is uniformly distributed over the unit interval in the sense that $P[F(X) \leq u]=u$ for $0 \leq u \leq 1$. Passing from $X$ to $F(X)$ is called the probability transformation.
(b) Show that the function $\varphi(u)$ defined by (14.5) satisfies $F(\varphi(u)-) \leq u \leq F(\varphi(u))$ and that, if $F$ is continuous (but not necessarily strictly increasing), then $F(\varphi(u))=u$ for $0<u<1$.
(c) Show that $P[F(X)<u]=F(\varphi(u)-)$ and hence that the result in part (a) holds as long as $F$ is continuous.

[^21]14.4. $\uparrow$ Let $C$ be the set of continuity points of $F$.
(a) Show that for every Borel set $A, P[F(X) \in A, X \in C]$ is at most the Lebesgue measure of $A$.
(b) Show that if $F$ is continuous at each point of $F^{-1} A$, then $P[F(X) \in A]$ is at most the Lebesgue measure of $A$.
14.5. The Lévy distance $d(F, G)$ between two distribution functions is the infimum of those $\epsilon$ such that $G(x-\epsilon)-\epsilon \leq F(x) \leq G(x+\epsilon)+\epsilon$ for all $x$. Verify that this is a metric on the set of distribution functions. Show that a necessary and sufficient condition for $F_{n} \Rightarrow F$ is that $d\left(F_{n}, F\right) \rightarrow 0$.
14.6. $12.3 \uparrow$ A Borel function satisfying Cauchy's equation [A20] is automatically bounded in some interval and hence satisfies $f(x)=x f(1)$. Hint: Tak $\in K$ large enough that $\lambda[x: x>s,|f(x)| \leq K]>0$. Apply Problem 12.3 and conclude that $f$ is bounded in some interval to the right of 0
14.7. ↑ Consider sets $S$ of reals that are linearly independent over the field of rationals in the sense that $n_{1} x_{1}+\cdots+n_{k} x_{k}=0$ for distinct points $x_{i}$ in $S$ and integers $n_{i}$ (positive or negative) is impossible unless $n_{i} \equiv 0$.
(a) By Zorn's lemma find a maximal such $S$. Show that it is a Hamel basis. That is, show that each real $x$ can be written uniquely as $x=n_{1} x_{1}+\cdots+n_{k} x_{k}$ for distinct points $x_{i}$ in $S$ and integers $n_{i}$.
(b) Define $f$ arbitrarily on $S$, and define it elsewhere by $f\left(n_{1} x_{1}+\cdots+n_{k} x_{k}\right) =n_{1} f\left(x_{1}\right)+\cdots+n_{k} f\left(x_{k}\right)$. Show that $f$ satisfies Cauchy's equation but need not satisfy $f(x)=x f(1)$.
(c) By means of Problem 14.6 give a new construction of a nonmeasurable function and a nonmeasurable set.
14.8. $14.5 \uparrow$ (a) Show that if a distribution function $F$ is everywhere continuous, then it is uniformly continuous.
(b) Let $\delta_{F}(\epsilon)=\sup [F(x)-F(y):|x-y| \leq \epsilon]$ be the modulus of continuity of $F$. Show that $d(F, G)<\epsilon$ implies that $\sup _{x}|F(x)-G(x)| \leq \epsilon+\delta_{F}(\epsilon)$.
(c) Show that, if $F_{n} \Rightarrow F$ and $F$ is everywhere continuous, then $F_{n}(x) \rightarrow F(x)$ uniformly in $x$. What if $F$ is continuous over a closed interval?
14.9. Show that (14.24) and (14.25) are everywhere infinitely differentiable, although not analytic.

## CHAPTER 3

## Integration

## SECTION 15. THE INTEGRAL

Expected values of simple random variables and Riemann integrals of continuous functions can be brought together with other related concepts under a general theory of integration, and this theory is the subject of the present chapter.

## Definition

Throughout this section, $f, g$, and so on will denote real measurable functions, the values $\pm \infty$ allowed, on a measure space $(\Omega, \mathscr{F}, \mu) .^{\dagger}$ The object is to define and study the definite integral

$$
\int f d \mu=\int_{\Omega} f(\omega) d \mu(\omega)=\int_{\Omega} f(\omega) \mu(d \omega)
$$

Suppose first that $f$ is nonnegative. For each finite decomposition $\left\{A_{i}\right\}$ of $\Omega$ into $\mathscr{F}$-sets, consider the sum

$$
\begin{equation*}
\sum_{i}\left[\inf _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) . \tag{15.1}
\end{equation*}
$$

In computing the products here, the conventions about infinity are

$$
\begin{align*}
0 \cdot \infty & =\infty \cdot 0=0, \\
x \cdot \infty & =\infty \cdot x=\infty \quad \text { if } 0<x<\infty,  \tag{15.2}\\
\infty \cdot \infty & =\infty .
\end{align*}
$$

[^22]The reasons for these conventions will become clear later. Also in force are the conventions of Section 10 for sums and limits involving infinity; see (10.3) and (10.4). If $A_{i}$ is empty, the infimum in (15.1) is by the standard convention $\infty$; but then $\mu\left(A_{i}\right)=0$, so that by the convention (15.2), this term makes no contribution to the sum (15.1).

The integral of $f$ is defined as the supremum of the sums (15.1):

$$
\begin{equation*}
\int f d \mu=\sup \sum_{i}\left[\inf _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) . \tag{15.3}
\end{equation*}
$$

The supremum here extends over all finite decompositions $\left\{A_{i}\right\}$ of $\Omega$ into $\mathscr{F}$-sets.

For general $f$, consider its positive part,

$$
f^{+}(\omega)= \begin{cases}f(\omega) & \text { if } 0 \leq f(\omega) \leq \infty  \tag{15.4}\\ 0 & \text { if }-\infty \leq f(\omega) \leq 0\end{cases}
$$

and its negative part,

$$
f^{-}(\omega)= \begin{cases}-f(\omega) & \text { if }-\infty \leq f(\omega) \leq 0,  \tag{15.5}\\ 0 & \text { if } 0 \leq f(\omega) \leq \infty .\end{cases}
$$

These functions are nonnegative and measurable, and $f=f^{+}-f^{-}$. The general integral is defined by

$$
\begin{equation*}
\int f d \mu=\int f^{+} d \mu-\int f^{-} d \mu \tag{15.6}
\end{equation*}
$$

unless $\int f^{+} d \mu=\int f^{-} d \mu=\infty$, in which case $f$ has no integral.
If $\int f^{+} d \mu$ and $\int f^{-} d \mu$ are both finite, then $f$ is integrable, or integrable $\mu$, or summable, and has (15.6) as its definite integral. If $\int f^{+} d \mu=\infty$ and $\int f^{-} d \mu<\infty$, then $f$ is not integrable but in accordance with (15.6) is assigned $\infty$ as its definite integral. Similarly, if $\int f^{+} d \mu<\infty$ and $\int f^{-} d \mu=\infty$, then $f$ is not integrable but has definite integral $-\infty$. Note that $f$ can have a definite integral without being integrable; it fails to have a definite integral if and only if its positive and negative parts both have infinite integrals.

The really important case of (15.6) is that in which $\int f^{+} d \mu$ and $f f^{-} d \mu$ are both finite. Allowing infinite integrals is a convention that simplifies the statements of various theorems, especially theorems involving nonnegative functions. Note that (15.6) is defined unless it involves " $\infty-\infty$ "; if one term on the right is $\infty$ and the other is a finite real $x$, the difference is defined by the conventions $\infty-x=\infty$ and $x-\infty=-\infty$.

The extension of the integral from the nonnegative case to the general case is consistent: (15.6) agrees with (15.3) if $f$ is nonnegative, because then $f^{-} \equiv 0$.

## Nonnegative Functions

It is convenient first to analyze nonnegative functions.
Theorem 15.1. (i) If $f=\sum_{i} x_{i} I_{A_{i}}$ is a nonnegative simple function, $\left\{A_{i}\right\}$ being a finite decomposition of $\Omega$ into $\mathscr{F}_{\text {-sets, then }} \int f d \mu=\sum_{i} x_{i} \mu\left(A_{i}\right)$.
(ii) If $0 \leq f(\omega) \leq g(\omega)$ for all $\omega$, then $\int f d \mu \leq \int g d \mu$.
(iii) If $0 \leq f_{n}(\omega) \uparrow f(\omega)$ for all $\omega$, then $0 \leq \int f_{n} d \mu \uparrow \int f d \mu$.
(iv) For nonnegative functions $f$ and $g$ and nonnegative constants $\alpha$ and $\beta$, $\int(\alpha f+\beta g) d \mu=\alpha \int f d \mu+\beta \int g d \mu$.

In part (iii) the essential point is that $\int f d \mu=\lim _{n} \int f_{n} d \mu$, and it is important to understand that both sides of this equation may be $\infty$. If $f_{n}=I_{A_{n}}$ and $f=I_{A}$, where $A_{n} \uparrow A$, the conclusion is that $\mu$ is continuous from below (Theorem 10.2(i)): $\lim _{n} \mu\left(A_{n}\right)=\mu(A)$; this equation often takes the form $\infty=\infty$.

Proof of (i). Let $\left\{B_{j}\right\}$ be a finite decomposition of $\Omega$ and let $\beta_{j}$ be the infimum of $f$ over $B_{j}$. If $A_{i} \cap B_{j} \neq \varnothing$, then $\beta_{j} \leq x_{i}$; therefore, $\Sigma_{j} \beta_{j} \mu\left(B_{j}\right)= \sum_{i j} \beta_{j} \mu\left(\left(A_{i} \cap B_{j}\right)\right) \leq \sum_{i j} x_{i} \mu\left(A_{i} \cap B_{j}\right)=\sum_{i} x_{i} \mu\left(A_{i}\right)$. On the other hand, there is equality here if $\left\{B_{j}\right\}$ coincides with $\left\{A_{i}\right\}$. $\square$

Proof of (ii). The sums (15.1) obviously do not decrease if $f$ is replaced by $g$. $\square$

Proof of (iii). By (ii) the sequence $\int f_{n} d \mu$ is nondecreasing and bounded above by $\int f d \mu$. It therefore suffices to show that $\int f d \mu \leq \lim _{n} \int f_{n} d \mu$, or that

$$
\begin{equation*}
\lim _{n} \int f_{n} d \mu \geq S=\sum_{i=1}^{m} v_{i} \mu\left(A_{i}\right) \tag{15.7}
\end{equation*}
$$

if $A_{1}, \ldots, A_{m}$ is any decomposition of $\Omega$ into $\mathscr{F}$-sets and $v_{i}=\inf _{\omega \in A_{i}} f(\omega)$.
In order to see the essential idea of the proof, which is quite simple, suppose first that $S$ is finite and all the $v_{i}$ and $\mu\left(A_{i}\right)$ are positive and finite. Fix an $\epsilon$ that is positive and less than each $v_{i}$, and put $A_{i n}=\left[\omega \in A_{i}\right.$ : $\left.f_{n}(\omega)>v_{i}-\epsilon\right]$. Since $f_{n} \uparrow f, A_{i n} \uparrow A_{i}$. Decompose $\Omega$ into $A_{1 n}, \ldots, A_{m n}$ and the complement of their union, and observe that, since $\mu$ is continuous from below,

$$
\begin{align*}
\int f_{n} d \mu & \geq \sum_{i=1}^{m}\left(v_{i}-\epsilon\right) \mu\left(A_{i n}\right) \rightarrow \sum_{i=1}^{m}\left(v_{i}-\epsilon\right) \mu\left(A_{i}\right)  \tag{15.8}\\
& =S-\epsilon \sum_{i=1}^{m} \mu\left(A_{i}\right)
\end{align*}
$$

Since the $\mu\left(A_{i}\right)$ are all finite, letting $\epsilon \rightarrow 0$ gives (15.7).

Now suppose only that $S$ is finite. Each product $v_{i} \mu\left(A_{i}\right)$ is then finite; suppose it is positive for $i \leq m_{0}$ and 0 for $i>m_{0}$. (Here $m_{0} \leq m$; if the product is 0 for all $i$, then $S=0$ and (15.7) is trivial.) Now $v_{i}$ and $\mu\left(A_{i}\right)$ are positive and finite for $i \leq m_{0}$ (one or the other may be $\infty$ for $i>m_{0}$ ). Define $A_{\text {in }}$ as before, but only for $i \leq m_{0}$. This time decompose $\Omega$ into $A_{1 n}, \ldots, A_{m_{0} n}$ and the complement of their union. Replace $m$ by $m_{0}$ in (15.8) and complete the proof as before.

Finally, suppose that $S=\infty$. Then $v_{i_{0}} \mu\left(A_{i_{0}}\right)=\infty$ for some $i_{0}$, so that $v_{i_{0}}$ and $\mu\left(A_{i_{0}}\right)$ are both positive and at least one is $\infty$. Suppose $0<x<v_{i_{1}} \leq \infty$ and $0<y<\mu\left(A_{i_{0}}\right) \leq \infty$, and put $A_{i_{0} n}=\left[\omega \in A_{i_{0}}: f_{n}(\omega)>x\right]$. From $f_{n} \uparrow f$ follows $A_{i_{10} n} \uparrow A_{i_{10}}$; hence $\mu\left(A_{i_{10} n}\right)>y$ for $n$ exceeding some $n_{0}$. But then (decompose $\Omega$ into $A_{i_{0} n}$ and its complement) $\int f_{n} d \mu \geq x \mu\left(A_{i_{0} n}\right) \geq x y$ for $n>n_{0}$, and therefore $\lim _{n} \int f_{n} d \mu \geq x y$. If $v_{i_{0}}=\infty$, let $x \rightarrow \infty$, and if $\mu\left(A_{i_{0}}\right)= \infty$, let $y \rightarrow \infty$. In either case (15.7) follows: $\lim _{n} \int f_{n} d \mu=\infty$.

Proof of (iv). Suppose at first that $f=\sum_{i} x_{i} I_{A_{i}}$ and $g=\sum_{j} y_{j} I_{B_{i}}$ are simple. Then $\alpha f+\beta g=\sum_{i j}\left(\alpha x_{i}+\beta y_{j}\right) I_{A_{i} \cap B_{j}}$, and so

$$
\begin{aligned}
\int(\alpha f+\beta g) d \mu & =\sum_{i j}\left(\alpha x_{i}+\beta y_{j}\right) \mu\left(A_{i} \cap B_{j}\right) \\
& =\alpha \sum_{i} x_{i} \mu\left(A_{i}\right)+\beta \sum_{j} y_{j} \mu\left(B_{j}\right)=\alpha \int f d \mu+\beta \int g d \mu
\end{aligned}
$$

Note that the argument is valid if some of $\alpha, \beta, x_{i}, y_{j}$ are infinite. Apart from this possibility, the ideas are as in the proof of (5.21).

For general nonnegative $f$ and $g$, there exist by Theorem 13.5 simple functions $f_{n}$ and $g_{r}$ such that $0 \leq f_{r} \uparrow f$ and $0 \leq g_{n} \uparrow g$. But then $0 \leq \alpha f_{n}+ \beta g_{n} \uparrow \alpha f+\beta g$ and $\int\left(\alpha f_{n}+\beta g_{n}\right) d \mu=\alpha \int f_{n} d \mu+\beta \int g_{n} d \mu$, so that (iv) follows from (iii).

By part (i) of Theorem 15.1, the expected values of simple random variables in Chapter 1 are integrals: $E[X]=\int X(\omega) P(d \omega)$. This also covers the step functions in Section 1 (see (1.6)). The relation between the Riemann integral and the integral as defined here will be studied in Section 17.

Example 15.1. Consider the line $\left(R^{1}, \mathscr{R}^{1}, \lambda\right)$ with Lebesgue measure. Suppose that $-\infty<a_{0} \leq a_{1} \leq \cdots \leq a_{m}<\infty$, and let $f$ be the function with nonnegative value $x_{i}$ on $\left(a_{i-1}, a_{i}\right], i=1, \ldots, m$, and value 0 on $\left(-\infty, a_{0}\right]$ and ( $a_{m}, \infty$ ). By part (i) of Theorem 15.1, $\int f d \lambda=\sum_{i=1}^{m} x_{i}\left(a_{i}-a_{i-1}\right)$ because of the convention $0 \cdot \infty=0$-see (15.2). If the "area under the curve" to the left of $a_{0}$ and to the right of $a_{m}$ is to be 0 , this convention is inevitable. From $\infty \cdot 0=0$ it follows that $\int f d \lambda=0$ if $f$ is $\infty$ at a single point (say) and 0 elsewhere.

If $f=I_{(a, \infty)}$, the area-under-the-curve point of view makes $\int f d \mu=\infty$ natural. Hence the second convention in (15.2), which also requires that the integral be infinite if $f$ is $\infty$ on a nonempty interval and 0 elsewhere. $\square$

Recall that almost everywhere means outside a set of measure 0 .
Theorem 15.2. Suppose that $f$ and $g$ are nonnegative.
(i) If $f=0$ almost everywhere, then $\int f d \mu=0$.
(ii) If $\mu[\omega: f(\omega)>0]>0$, then $\int f d \mu>0$.
(iii) If $\int f d \mu<\infty$, then $f<\infty$ almost everywhere.
(iv) If $f \leq g$ almost everywhere, then $\int f d \mu \leq \int g d \mu$.
(v) If $f=g$ almost everywhere, then $\int f d \mu=\int g d \mu$.

Proof. Suppose that $f=0$ almost everywhere. If $A_{i}$ meets $[\omega: f(\omega)=0]$, then the infimum in (15.1) is 0 ; otherwise, $\mu\left(A_{i}\right)=0$. Hence each sum (15.1) is 0 , and (i) follows.

If $A_{\epsilon}=[\omega: f(\omega) \geq \epsilon]$, then $A_{\epsilon} \uparrow[\omega: f(\omega)>0]$ as $\epsilon \downarrow 0$, so that under the hypothesis of (ii) there is a positive $\epsilon$ for which $\mu\left(A_{\epsilon}\right)>0$. Decomposing $\Omega$ into $A_{\epsilon}$ and its complement shows that $f f d \mu \geq \epsilon \mu\left(A_{\epsilon}\right)>0$.

If $\mu[f=\infty]>0$, decompose $\Omega$ into [ $f=\infty$ ] and its compiement: $\int f d \mu \geq \infty \cdot \mu[f=\infty]=\infty$ by the conventions. Hence (iii).

To prove (iv), let $G=[f \leq g]$. For any finite decomposition $\left\{A_{1}, \ldots, A_{m}\right\}$ of $\Omega$,

$$
\begin{aligned}
\sum\left[\inf _{A_{i}} f\right] \mu\left(A_{i}\right) & =\sum\left[\inf _{A_{i}} f\right] \mu\left(A_{i} \cap G\right) \leq \sum\left[\inf _{A_{i} \cap G} f\right] \mu\left(A_{i} \cap G\right) \\
& \leq \sum\left[\inf _{A_{i} \cap G} g\right] \mu\left(A_{i} \cap G\right) \leq \int g d \mu
\end{aligned}
$$

where the last inequality comes from a consideration of the decomposition $A_{1} \cap G, \ldots, A_{m} \cap G, G^{c}$. This proves (iv), and (v) follows immediately. $\square$

Suppose that $f=g$ almost everywhere, where $f$ and $g$ need not be nonnegative. If $f$ has a definite integral, then since $f^{+}=g^{+}$and $f^{-}=g^{-}$ almost everywhere, it follows by Theorem 15.2(v) that $g$ also has a definite integral and $\int f d \mu=\int g d \mu$.

## Uniqueness

Although there are various ways to frame the definition of the integral, they are all equivalent-they all assign the same value to $f f d \mu$. This is because the integral is uniquely determined by certain simple properties it is natural to require of it.

It is natural to want the integral to have properties (i) and (iii) of Theorem 15.1. But these uniquely determine the integral for nonnegative functions: For $f$ nonnegative, there exist by Theorem 13.5 simple functions $f_{n}$ such that $0 \leq f_{n} \uparrow f$; by (iii), $\int f d \mu$ must be $\lim _{n} \int f_{n} d \mu$, and (i) determines the value of each $\int f_{n} d \mu$.

Property (i) can itself be derived from (iv) (linearity) together with the assumption that $\int I_{A} d \mu=\mu(A)$ for indicators $I_{A}: \int\left(\sum_{i} x_{i} I_{A_{i}}\right) d \mu=\sum_{i} x_{i} / I_{A_{i}} d \mu=\sum_{i} x_{i} \mu\left(A_{i}\right)$.

If (iv) of Theorem 15.1 is to persist when the integral is extended beyond the class of nonnegative functions, $\int f d \mu$ must be $\int\left(f^{+}-f^{-}\right) d \mu=\int f^{+} d \mu-\int f^{-} d \mu$, which makes the definition (15.6) inevitable.

## PROBLEMS

These problems outline alternative definitions of the integral and clarify the role measurability plays. Call (15.3) the lower integral, and write it as

$$
\begin{equation*}
\int_{*} f d \mu=\sup \sum_{i}\left[\inf _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) \tag{159}
\end{equation*}
$$

to distinguish it from the upper integral

$$
\begin{equation*}
\int^{*} f d \mu=\inf \sum_{i}\left[\sup _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) . \tag{15.10}
\end{equation*}
$$

The infimum in (15 10), like the supremum in (15.9), extends over all finite partitions $\left\{A_{i}\right\}$ of $\Omega$ into $\mathscr{F}$ sets.
15.1. Suppose that $f$ is measurable and nonnegative. Show that $\int^{*} f d \mu=\infty$ if $\mu!\omega$ : $f(\omega)>0]=\infty$ or if $\mu[\omega: f(\omega)>a]>0$ for all $a$

There are many functions familiar from calculus that ought to be integrable but are of the types in the preceding problem and hence have infinite upper integral. Examples are $x^{-2} I_{(1, \infty)}(x)$ and $x^{-1 / 2} I_{(0,1)}(x)$. Therefore, (15.10) is inappropriate as a definition of $\int f d \mu$ for nonnegative $f$. The only problem with (15.10), however, is that it treats infinity the wrong way. To see this, and to focus on essentials, assume that $\mu(\Omega)<\infty$ and that $f$ is bounded, although not necessarily nonnegative or measurable $\mathscr{F}$.
15.2. ↑ (a) Show that

$$
\sum_{i}\left[\inf _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) \leq \sum_{j}\left[\inf _{\omega \in B_{i}} f(\omega)\right] \mu\left(B_{j}\right)
$$

if $\left\{B_{j}\right\}$ refines $\left\{A_{i}\right\}$. Prove a dual relation for the sums in (15.10) and conclude that

$$
\begin{equation*}
\int_{*} f d \mu \leq \int^{*} f d \mu \tag{15.11}
\end{equation*}
$$

(b) Now assume that $f$ is measurable $\mathscr{F}$ and let $M$ be a bound for $|f|$. Consider the partition $A_{i}=[\omega: i \epsilon<f(\omega) \leq(i+1) \epsilon]$, where $i$ ranges from $-N$
to $N$ and $N$ is large enough that $N \epsilon>M$. Show that

$$
\sum_{i}\left[\sup _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right)-\sum_{i}\left[\inf _{\omega \in A_{i}} f(\omega)\right] \mu\left(A_{i}\right) \leq \epsilon \mu(\Omega) .
$$

Conclude that

$$
\begin{equation*}
\int_{*} f d \mu=\int^{*} f d \mu \tag{15.12}
\end{equation*}
$$

To define the integral as the common value in (15.12) is the Darboux-Young approach. The advantage of (15.3) as a definition is that (in the nonnegative case) it applies at once to unbounded $f$ and infinite $\mu$
15.3. 3.2 15.2 ↑ For $A \subset \Omega$, define $\mu^{*}(A)$ and $\mu_{*}(A)$ by (3.9) and (3.10) with $\mu$ in place of $P$. Show that $\int^{*} I_{A} d \mu=\mu^{*}(A)$ and $\int_{*} I_{A} d \mu=\mu_{*}(A)$ for every $A$. Therefore, (15.12) can fail if $f$ is not measurable $\mathscr{F}$. (Where was measurability used in the proof of (15.12)?)

The definitions (15.3) and (15.6) always make formal sense (for finite $\mu(\Omega)$ and supif D, but they are reasonable-accord with intuition-only if (15.12) holds. Under what conditions does it hold?
15.4. $10.515 .3 \uparrow$ (a) Suppose of $f$ that there exist an $\mathscr{F}$-set $A$ and a function $g$, measurable $\mathscr{F}$, such that $\mu(A)=0$ and $[f \neq g] \subset A$. This is the same thing as assuming that $\mu^{*}[f \neq g]=0$, or assuming that $f$ is measurable with respect to $\mathscr{F}$ completed with respect to $\mu$. Show that (15.12) holds.
(b) Show that if (15.12) holds, then so does the italicized condition in part (a).

Rather than assume that $f$ is measurable $\mathscr{F}$, one can assume that it satisfies the italicized condition in Problem 15.4(a)-which in case ( $\Omega, \mathscr{F}, \mu$ ) is complete is the same thing anyway. For the next three problems, assume that $\mu(\Omega)<\infty$ and that $f$ is measurable $\mathscr{F}$ and bounded.
15.5. ↑ Show that for positive $\epsilon$ there exists a finite partition $\left\{A_{i}\right\}$ such that, if $\left\{B_{j}\right\}$ is any finer partition and $\omega_{j} \in B_{j}$, then

$$
\left|\int f d \mu-\sum_{j} f\left(\omega_{j}\right) \mu\left(B_{j}\right)\right|<\epsilon .
$$

15.6. ↑ Show that

$$
\int f d \mu=\lim _{n} \sum_{|k| \leq n 2^{n}} \frac{k-1}{2^{n}} \mu\left[\omega: \frac{k-1}{2^{n}} \leq f(\omega)<\frac{k}{2^{n}}\right] .
$$

The limit on the right here is Lebesgue's definition of the integral.
15.7. ↑ Suppose that the integral is defined for simple nonnegative functions by $\int\left(\sum_{i} x_{i} I_{A_{i}}\right) d \mu=\sum_{i} x_{i} \mu\left(A_{i}\right)$. Suppose that $f_{n}$ and $g_{n}$ are simple and nondecreasing and have a common limit: $0 \leq f_{n} \uparrow f$ and $0 \leq g_{n} \uparrow f$. Adapt the arguments used to prove Theorem 15.1(iii) and show that $\lim _{n} \int f_{n} d \mu=\lim _{n} \int g_{n} d \mu$. Thus, in the nonnegative case, $\int f d \mu$ can (Theorem 13.5) consistently be defined as $\lim _{n} \int f_{n} d \mu$ for simple functions for which $0 \leq f_{n} \uparrow f$.

## SECTION 16. PROPERTIES OF THE INTEGRAL

## Equalities and Inequalities

By definition, the requirement for integrability of $f$ is that $\int f^{+} d \mu$ and $\int f^{-} d \mu$ both be finite, which is the same as the requirement that $\int f^{+} d \mu+ \int f^{-} d \mu<\infty$ and hence is the same as the requirement that $\int\left(f^{+}+f^{-}\right) d \mu<\infty$ (Theorem 15.1(iv)). Since $f^{+}+f^{-}=|f|, f$ is integrable if and only if

$$
\begin{equation*}
\int|f| d \mu<\infty . \tag{16.1}
\end{equation*}
$$

It follows that if $|f| \leq|g|$ almost everywhere and $g$ is integrable, then $f$ is integrable as well. If $\mu(\Omega)<\infty$, a bounded $f$ is integrable.

Theorem 16.1. (i) Monotonicity: If $f$ and $g$ are integrable and $f \leq g$ almost everywhere, then

$$
\begin{equation*}
\int f d \mu \leq \int g d \mu \tag{16.2}
\end{equation*}
$$

(ii) Linearity: If $f$ and $g$ are integrable and $\alpha, \beta$ are finite real numbers, then $\alpha f+\beta g$ is integrable and

$$
\begin{equation*}
\int(\alpha f+\beta g) d \mu=\alpha \int f d \mu+\beta \int g d \mu \tag{16.3}
\end{equation*}
$$

Proof of (i). For nonnegative $f$ and $g$ such that $f \leq g$ almost everywhere, (16.2) follows by Theorem 15.2(iv). And for general integrable $f$ and $g$, if $f \leq g$ almost everywhere, then $f^{+} \leq g^{+}$and $f^{-} \geq g^{-}$almost everywhere, and so (16.2) follows by the definition (15.6).

Proof of (ii). First, $\alpha f+\beta g$ is integrable because, by Theorem 15.1,

$$
\begin{aligned}
\int|\alpha f+\beta g| d \mu & \leq \int(|\alpha| \cdot|f|+|\beta| \cdot|g|) d \mu \\
& =|\alpha| \int|f| d \mu+|\beta| \int|g| d \mu<\infty .
\end{aligned}
$$

By Theorem 15.1(iv) and the definition (15.6), $\int(\alpha f) d \mu=\alpha \int f d \mu$-consider separately the cases $\alpha \geq 0$ and $\alpha<0$. Therefore, it is enough to check (16.3) for the case $\alpha=\beta=1$. By definition, $(f+g)^{+}-(f+g)^{-}=f+g=f^{+}-f^{-}+ g^{+}-g^{-}$and therefore $(f+g)^{+}+f^{-}+g^{-}=(f+g)^{-}+f^{+}+g^{+}$. All these functions being nonnegative, $\int(f+g)^{+} d \mu+\int f^{-} d \mu+\int g^{-} d \mu=\int(f+g)^{-} d \mu+ \int f^{+} d \mu+\int g^{+} d \mu$, which can be rearranged to give $\int(f+g)^{+} d \mu-\int(f+ g)^{-} d \mu=\int f^{+} d \mu-\int f^{-} d \mu+\int g^{+} d \mu-\int g^{-} d \mu$. But this reduces to (16.3). $\square$

Since $-|f| \leq f \leq|f|$, it follows by Theorem 16.1 that

$$
\begin{equation*}
\left|\int f d \mu\right| \leq \int|f| d \mu \tag{164}
\end{equation*}
$$

for integrable $f$. Applying this to integrable $f$ and $g$ gives

$$
\begin{equation*}
\left|\int f d \mu-\int g d \mu\right| \leq \int|f-g| d \mu \tag{16.5}
\end{equation*}
$$

Example 16.1. Suppose that $\Omega$ is countable, that $\mathscr{F}$ consists of all the subsets of $\Omega$, and that $\mu$ is counting measure: each singleton has measure 1 . To be definite, take $\Omega=\{1,2, \ldots\}$. A function is then a sequence $x_{1}, x_{2}, \ldots$. If $x_{n m}$ is $x_{m}$ or 0 as $m \leq n$ or $m>n$, the function corresponding to $x_{n 1}, x_{n 2}, \ldots$ has integral $\sum_{m=1}^{n} x_{m}$ by Theorem 15.1(i) (consider the decomposition $\{1\}, \ldots,\{n\},\{n+1, n+2, \ldots\}$ ). It follows by Theorem 15.1(iii) that in the nonnegative case the integral of the function given by $\left\{x_{m}\right\}$ is the sum $\sum_{m} x_{m}$ (finite or infinite) of the corresponding infinite series. In the general case the function is integrable if and only if $\sum_{m=1}^{\infty}\left|x_{m}\right|$ is a convergent infinite series, in which case the integral is $\Sigma_{m=1}^{\infty} x_{m}^{+}-\Sigma_{m=1}^{\infty} x_{m}^{-}$.

The function $x_{m}=(-1)^{m+1} m^{-1}$ is not integrable by this definition and even fails to have a definite integral, since $\Sigma_{m=1}^{\infty} x_{m}^{+}=\Sigma_{m=1}^{\infty} x_{m}^{-}=\infty$. This invites comparison with the ordinary theory of infinite series, according to which the alternating harmonic series does converge in the sense that $\lim _{M} \sum_{m=1}^{M}(-1)^{m+1} m^{-1}=\log 2$. But since this says that the sum of the first $M$ terms has a limit, it requires that the elements of the space $\Omega$ be ordered. If $\Omega$ consists not of the positive integers but, say, of the integer lattice points in 3 -space, it has no canonical linear ordering. And if $\sum_{m} x_{m}$ is to have the same finite value no matter what the order of summation, the series must be absolutely convergent. ${ }^{\dagger}$ This helps to explain why $f$ is defined to be integrable only if $\int f^{+} d \mu$ and $\int f^{-} d \mu$ are both finite. $\square$

Example 16.2. In connection with Example 15.1, consider the function $f=3 I_{(a, \infty)}-2 I_{(-\infty, a)}$. There is no natural value for $\int f d \lambda$ (it is " $\infty-\infty$ "), and none is assigned by the definition.

[^23]If a function $f$ is bounded on bounded intervals, then each function $f_{n}=f I_{(-n, n)}$ is integrable with respect to $\lambda$. Since $f=\lim _{n} f_{n}$, the limit of $\int f_{n} d \lambda$, if it exists, is sometimes called the "principal value" of the integral of $f$. Although it is natural for some purposes to integrate symmetrically about the origin, this is not the right definition of the integral in the context of general measure theory. The functions $g_{n}=f I_{(-n, n+1)}$ for example also converge to $f$, and $\int g_{n} d \lambda$ may have some other limit, or none at all; $f(x)=x$ is a case in point. There is no general reason why $f_{n}$ should take precedence over $g_{n}$.

As in the preceding example, $f=\sum_{k=1}^{\infty}(-1)^{k} k^{-1} I_{(k, k+1)}$ has no integral, even though the $\int f_{n} d \lambda$ above converge.

## Integration to the Limit

The first result, the monotone convergence theorem, essentially restates Theorem 15.1(iii).

Theorem 16.2. If $0 \leq f_{n} \uparrow f$ almost everywhere, then $\int f_{n} d \mu \uparrow \int f d \mu$.
Proof. If $0 \leq f_{n} \uparrow f$ on a set $A$ with $\mu\left(A^{c}\right)=0$, then $0 \leq f_{n} I_{A} \uparrow f I_{A}$ holds everywhere, and it follows by Theorem 15.1(iii) and the remark following Theorem 15.2 that $\int f_{n} d \mu=\int f_{n} I_{A} d \mu \uparrow \int f I_{A} d \mu=\int f d \mu$.

As the functions in Theorem 16.2 are nonnegative almost everywhere, all the integrals exist. The conclusion of the theorem is that $\lim _{n} \int f_{n} d \mu$ and $\int f d \mu$ are both infinite or both finite and in the latter case are equal.

Example 16.3. Consider the space $\{1,2, \ldots\}$ together with counting measure, as in Example 16.1. If for each $m$ one has $0 \leq x_{n m} \uparrow x_{m}$ as $n \rightarrow \infty$, then $\lim _{n} \sum_{m} x_{n m}=\sum_{m} x_{m}$, a standard result about infinite series. $\square$

Example 16.4. If $\mu$ is a measure on $\mathscr{F}$, and $\mathscr{F}_{0}$ is a $\sigma$-field contained in $\mathscr{F}$, then the restriction $\mu_{0}$ of $\mu$ to $\mathscr{F}_{0}$ is another measure (Example 10.4). If $f=I_{A}$ and $A \in \mathscr{F}_{0}$, then

$$
\int f d \mu=\int f d \mu_{0}
$$

the common value being $\mu(A)=\mu_{0}(A)$. The same is true by linearity for nonnegative simple functions measurable $\mathscr{F}_{0}$. It holds by Theorem 16.2 for all nonnegative $f$ that are measurable $\mathscr{F}_{0}$ because (Theorem 13.5) $0 \leq f_{n} \uparrow f$ for simple functions $f_{n}$ that are measurable $\mathscr{F}_{0}$. For functions measurable $\mathscr{F}_{0}$, integration with respect to $\mu$ is thus the same thing as integration with respect to $\mu_{0}$. $\square$

In this example a property was extended by linearity from indicators to nonnegative simple functions and thence to the general nonnegative function by a monotone passage to the limit. This is a technique of very frequent application.

Example 16.5. For a finite or infinite sequence of measures $\mu_{n}$ on $\mathscr{F}$, $\mu(A)=\sum_{n} \mu_{n}(A)$ defines another measure (countably additive because [A27] sums can be reversed in a nonnegative double series). For indicators $f$,

$$
\int f d \mu=\sum_{n} \int f d \mu_{n}
$$

and by linearity the same holds for simple $f \geq 0$. If $0 \leq f_{k} \uparrow f$ for simple $f_{k}$, then by Theorem 16.2 and Example 16.3, $\int f d \mu=\lim _{k} \int f_{k} d \mu= \lim _{k} \sum_{n} \int f_{k} d \mu_{n}=\sum_{n} \lim _{k} \int f_{k} d \mu_{n}=\sum_{n} \int f d \mu_{n}$. The relation in question thus holds for all nonnegative $f$.

An important consequence of the monotone convergence theorem is Fatou's lemma:

Theorem 16.3. For nonnegative $f_{n}$,

$$
\begin{equation*}
\int \lim \inf _{n} f_{n} d \mu \leq \lim \inf _{n} \int f_{n} d \mu \tag{16.6}
\end{equation*}
$$

Proof. If $g_{n}=\inf _{k \geq n} f_{k}$, then $0 \leq g_{n} \uparrow g=\liminf _{n} f_{n}$, and the preceding two theorems give $\int f_{n} d \mu \geq \int g_{n} d \mu \rightarrow \int g d \mu$.

Example 16.6. On ( $R^{1}, \mathscr{R}^{1}, \lambda$ ), the functions $f_{n}=n^{2} I_{\left(0, n^{-1}\right)}$ and $f \equiv 0$ satisfy $f_{n}(x) \rightarrow f(x)$ for each $x$, but $\int f d \lambda=0$ and $f f_{n} d \lambda=n \rightarrow \infty$. This shows that the inequality in (16.6) can be strict and that it is not always possible to integrate to the limit. This phenomenon has been encountered before; see Examples 5.7 and 7.7.

Fatou's lemma leads to Lebesgue's dominated convergence theorem:
Theorem 16.4. If $\left|f_{n}\right| \leq g$ almost everywhere, where $g$ is integrable, and if $f_{n} \rightarrow f$ almost everywhere, then $f$ and the $f_{n}$ are integrable and $\int f_{n} d \mu \rightarrow \int f d \mu$.

Proof. Assume at the outset, not that the $f_{n}$ converge, but only that they are dominated by an integrable $g$, which implies that all the $f_{n}$ as well
as $f^{*}=\limsup f_{n}$ and $f_{*}=\liminf f_{n}$ are integrable. Since $g+f_{n}$ and $g-f_{n}$ are nonnegative, Fatou's lemma gives

$$
\begin{aligned}
\int g d \mu+\int f_{*} d \mu & =\int \liminf _{n}\left(g+f_{n}\right) d \mu \\
& \leq \liminf _{n} \int\left(g+f_{n}\right) d \mu=\int g d \mu+\liminf _{n} \int f_{n} d \mu
\end{aligned}
$$

and

$$
\begin{aligned}
\int g d \mu-\int f^{*} d \mu & =\int \liminf _{n}\left(g-f_{n}\right) d \mu \\
& \leq \liminf _{n} \int\left(g-f_{r}\right) d \mu=\int g d \mu-\lim \sup _{n} \int f_{n} d \mu
\end{aligned}
$$

Therefore

$$
\begin{align*}
\int \liminf f_{n} d \mu & \leq \liminf \inf _{n} \int f_{n} d \mu  \tag{16.7}\\
& \leq \limsup \int_{n} \int f_{n} d \mu \leq \int \lim \sup _{n} f_{n} d \mu
\end{align*}
$$

(Compare this with (4.9).)
Now use the assumption that $f_{n} \rightarrow f$ almost everywhere: $f$ is dominated by $g$ and hence is integrable, and the extreme terms in (16.7) agree with $\int f d \mu$. $\square$

Example 16.6 shows that this theorem can fail if no dominating $g$ exists.
Example 16.7. The Weierstrass M-test for series. Consider the space $\{1,2, \ldots\}$ together with counting measure, as in Example 16.1. If $\left|x_{n m}\right| \leq M_{m}$ and $\sum_{m} M_{m}<\infty$, and if $\lim _{n} x_{n m}=x_{m}$ for each $m$, then $\lim _{n} \sum_{m} x_{n m}=\sum_{m} x_{m}$. This follows by an application of Theorem 16.4 with the function given by the sequence $M_{1}, M_{2}, \ldots$ in the role of $g$. This is another standard result on infinite series [A28]. $\square$

The next result, the bounded convergence theorem, is a special case of Theorem 16.4. It contains Theorem 5.4 as a further special case.

Theorem 16.5. If $\mu(\Omega)<\infty$ and the $f_{n}$ are uniformly bounded, then $f_{n} \rightarrow f$ almost everywhere implies $\int f_{n} d \mu \rightarrow \int f d \mu$.

The next two theorems are simply the series versions of the monotone and dominated convergence theorems.

Theorem 16.6. If $f_{n} \geq 0$, then $\int \sum_{n} f_{n} d \mu=\sum_{n} \int f_{n} d \mu$.
The members of this last equation are both equal either to $\infty$ or to the same finite, nonnegative real number.

Theorem 16.7. If $\sum_{n} f_{n}$ converges almost everywhere and $\left|\sum_{k=1}^{n} f_{k}\right| \leq g$ almost everywhere, where $g$ is integrable, then $\Sigma_{n} f_{n}$ and the $f_{n}$ are integrable and $\int \sum_{n} f_{n} d \mu=\sum_{n} \int f_{n} d \mu$.

Corollary. If $\Sigma_{n} f\left|f_{n}\right| d \mu<\infty$, then $\Sigma_{n} f_{n}$ converges absolutely almost everywhere and is integrable, and $\int \sum_{n} f_{n} d \mu=\sum_{n} \int f_{n} d \mu$.

Proof. The function $g=\sum_{n}\left|f_{n}\right|$ is integrable by Theorem 16.6 and is finite almost everywhere by Theorem 15.2(iii). Hence $\sum_{n}\left|f_{n}\right|$ and $\sum_{n} f_{n}$ converge almost everywhere, and Theorem 16.7 applies.

In place of a sequence $\left(f_{n}\right)$ of real measurable functions on $(\Omega, \mathscr{F}, \mu)$, consider a family $\left[f_{t}: t>0\right]$ indexed by a continuous parameter $t$. Suppose of a measurable $f$ that

$$
\begin{equation*}
\lim _{\omega \rightarrow \infty} f_{1}(\omega)=f(\omega) \tag{168}
\end{equation*}
$$

on a set $A$, where

$$
\begin{equation*}
A \in \mathscr{F}, \quad \mu(\Omega-A)=0 . \tag{16.9}
\end{equation*}
$$

A technical point arises here, since $\mathscr{F}$ need not contain the $\omega$-set where (16.8) holds:
Exampie 16.8. Let $\mathscr{F}$ consist of the Borel subsets of $\Omega=[0,1)$, and let $H$ be a nonmeasurable set-a subset of $\Omega$ that does not lie in $\mathscr{F}$ (see the end of Section 3). Define $f_{,}(\omega)=1$ if $\omega$ equals the fractional part $t-[t]$ of $t$ and their common value lies in $H^{c}$; define $f_{,}(\omega)=0$ otherwise. Each $f_{1}$ is measurable $\mathscr{F}$, but if $f(\omega) \equiv 0$, then the $\omega$-set where (16.8) holds is exactly $H$.

Because of such examples, the set $A$ above must be assumed to lie in $\mathscr{F}$. (Because of Theorem 13.4, no such assumption is necessary in the case of sequences.)

Suppose that $f$ and the $f$, are integrable. If $I_{t}=f f, d \mu$ converges to $I=f f d \mu$ as $t \rightarrow \infty$, then certainly $I_{I_{n}} \rightarrow I$ for each sequence $\left(t_{n}\right)$ going to infinity. But the converse holds as well: If $I$, does not converge to $I$, then there is a positive $\epsilon$ such that $\left|I_{t_{n}}-I\right|>\epsilon$ for a sequence $\left\{t_{n}\right\}$ going to infinity. To the question of whether $I_{t_{n}}$ converges to $I$ the previous theorems apply.

Suppose that (16.8) and $\left|f_{t}(\omega)\right| \leq g(\omega)$ both hold for $\omega \in A$, where $A$ satisfies (16.9) and $g$ is integrable. By the dominated convergence theorem, $f$ and the $f_{t}$ must then be integrable and $I_{t_{n}} \rightarrow I$ for each sequence ( $t_{n}$ ) going to infinity. It follows that $f f, d \mu \rightarrow f f d \mu$. In this result $t$ could go continuously to 0 or to some other value instead of to infinity.

Theorem 16.8. Suppose that $f(\omega, t)$ is a measurable and integrable function of $\omega$ for each $t$ in $(a, b)$. Let $\phi(t)=\int f(\omega, t) \mu(d \omega)$.
(i) Suppose that for $\omega \in A$, where $A$ satisfies (16.9), $f(\omega, t)$ is continuous in $t$ at $t_{0}$; suppose further that $|f(\omega, t)| \leq g(\omega)$ for $\omega \in A$ and $\left|t-t_{0}\right|<\delta$, where $\delta$ is independent of $\omega$ and $g$ is integrable. Then $\phi(t)$ is continuous at $t_{0}$.
(ii) Suppose that for $\omega \in A$, where $A$ satisfies (16.9), $f(\omega, t)$ has in ( $a, b$ ) a derivative $f^{\prime}(\omega, t)$; suppose further that $\left|f^{\prime}(\omega, t)\right| \leq g(\omega)$ for $\omega \in A$ and $t \in(a, b)$, where $g$ is integrable. Then $\phi(t)$ has derivative $\int f^{\prime}(\omega, t) \mu(d \omega)$ on $(a, b)$.

Proof Part (i) is an immediate consequence of the preceding discussion. To prove part (ii), consider a fixed $t$. If $\omega \in A$, then by the mean-value theorem,

$$
\frac{f(\omega, t+h)-f(\omega, t)}{h}=f^{\prime}(\omega, s),
$$

where $s$ lies between $t$ and $t+h$. The ratio on the left goes ${ }^{\dagger}$ to $f^{\prime}(\omega, t)$ as $h \rightarrow 0$ and is by hypothesis dominated by the integrable function $g(\omega)$. Therefore,

$$
\frac{\phi(t+h)-\phi(t)}{h}=\int \frac{f(\omega, t+h)-f(\omega, t)}{h} \mu(d \omega) \rightarrow \int f^{\prime}(\omega, t) \mu(d \omega)
$$

The condition involving $g$ in part (ii) can be weakened. It suffices to assume that for each $t$ there is an integrable $g(\omega, t)$ such that $\left|f^{\prime}(\omega, s)\right| \leq g(\omega, t)$ for $\omega \in A$ and all $s$ in some neighborhood of $t$.

## Integration over Sets

The integral of $f$ over a set $A$ in $\mathscr{F}$ is defined by

$$
\begin{equation*}
\int_{A} f d \mu=\int I_{A} f d \mu \tag{16.10}
\end{equation*}
$$

The definition applies if $f$ is defined only on $A$ in the first place (set $f=0$ outside $A$ ). Notice that $\int_{A} f d \mu=0$ if $\mu(A)=0$.

All the concepts and theorems above carry over in an obvious way to integrals over $A$. Theorems 16.6 and 16.7 yield this result:

Theorem 16.9. If $A_{1}, A_{2}, \ldots$ are disjoint, and if $f$ is either nonnegative or integrable, then $\int_{\mathrm{U}_{n} A_{n}} f d \mu=\sum_{n} \int_{A_{n}} f d \mu$.
${ }^{\dagger}$ Letting $h$ go to 0 through a sequence shows that each $f^{\prime}(\cdot, t)$ is measurable $\mathscr{F}$ on $A$; take it to be 0 , say, elsewhere.

The integrals (16.10) usually suffice to determine $f$ :
Theorem 16.10. (i) If $f$ and $g$ are nonnegative and $\int_{A} f d \mu=\int_{A} g d \mu$ for all $A$ in $\mathscr{F}$, and if $\mu$ is $\sigma$-finite, then $f=g$ almost everywhere.
(ii) If $f$ and $g$ are integrable and $\int_{A} f d \mu=\int_{A} g d \mu$ for all $A$ in $\mathscr{F}$, then $f=g$ almost everywhere.
(iii) If $f$ and $g$ are integrable and $\int_{A} f d \mu=\int_{A} g d \mu$ for all $A$ in $\mathscr{P}$, where $\mathscr{P}$ is a $\pi$-system generating $\mathscr{F}$ and $\Omega$ is a finite or countable union of $\mathscr{P}$-sets, then $f=g$ almost everywhere.

Proof. Suppose that $f$ and $g$ are nonnegative and that $\int_{A} f d \mu \leq \int_{A} g d \mu$ for all $A$ in $\mathscr{F}$. If $\mu$ is $\sigma$-finite, there are $\mathscr{F}$-sets $A_{n}$ such that $A_{n} \uparrow \Omega$ and $\mu\left(A_{n}\right)<\infty$. If $B_{n}=[0 \leq g<f, g \leq n]$, then the hypothesized inequality applied to $A_{n} \cap B_{n}$ implies $\int_{A_{n} \cap B_{n}} f d \mu \leq \int_{A_{n} \cap B_{n}} g d \mu<\infty$ (finite because $A_{n} \cap B_{n}$ has finite measure and $g$ is bounded there) and hence $\int I_{A_{n} \cap B_{n}}(f-g) d \mu=0$. But then by Theorem 15.2(ii), the integrand is 0 almost everywhere, and so $\mu\left(A_{n} \cap B_{n}\right)=0$. Therefore, $\mu[0 \leq g<f, g<\infty]=$ 0 , so that $f \leq g$ almost everywhere; (i) follows.

The argument for (ii) is simpler: If $f$ and $g$ are integrable and $\int_{A} f d \mu \leq \int_{A} g d \mu$ for all $A$ in $\mathscr{F}$, then $\int I_{[g<f]}(f-g) d \mu=0$ and hence $\mu[g<f]=0$ by Theorem 15.2(ii).

Part (iii) for nonnegative $f$ and $g$ follows from part (ii) together with Theorem 10.4. For the general case, prove that $f^{+}+g^{-}=f^{-}+g^{+}$almost everywhere.

## Densities

Suppose that $\delta$ is a nonnegative measurable function and define a measure $\nu$ by (Theorem 16.9)

$$
\begin{equation*}
\nu(A)=\int_{A} \delta d \mu, \quad A \in \mathscr{F} \tag{16.11}
\end{equation*}
$$

$\delta$ is not assumed integrable with respect to $\mu$. Many measures arise in this way. Note that $\mu(A)=0$ implies that $\nu(A)=0$. Clearly, $\nu$ is finite if and only if $\delta$ is integrable $\mu$. Another function $\delta^{\prime}$ gives rise to the same $\nu$ if $\delta=\delta^{\prime}$ almost everywhere. On the other hand, $\nu(A)=\int_{A} \delta^{\prime} d \mu$ and (16.11) together imply that $\delta=\delta^{\prime}$ almost everywhere if $\mu$ is $\sigma$-finite, as follows from Theorem 16.10(i).

The measure $\nu$ defined by (16.11) is said to have density $\delta$ with respect to $\mu$. A density is by definition nonnegative.

Formal substitution $d \nu=\delta d \mu$ gives the formulas (16.12) and (16.13).

Theorem 16.11. If $\nu$ has density $\delta$ with respect to $\mu$, then

$$
\begin{equation*}
\int f d \nu=\int f \delta d \mu \tag{16.12}
\end{equation*}
$$

holds for nonnegative $f$. Moreover, $f$ (not necessarily nonnegative) is integrable with respect to $\nu$ if and only if $f \delta$ is integrable with respect to $\mu$, in which case (16.12) and

$$
\begin{equation*}
\int_{A} f d \nu=\int_{A} f \delta d \mu \tag{16.13}
\end{equation*}
$$

both hold. For nonnegative $f,(16.13)$ always holds.

Here $f \delta$ is to be taken as 0 if $f=0$ or if $\delta=0$; this is consistent with the conventions (15.2). Note that $\nu[\delta=0]=0$.

Proof. If $f=I_{A}$, then $\int f d \nu=\nu(A)$, so that (16.12) reduces to the definition (16.11). If $f$ is a simple nonnegative function, (16.12) then follows by linearity. If $f$ is nonnegative, then $\int f_{n} d \nu=\int f_{n} \delta d \mu$ for the simple functions $f_{n}$ of Theorem 13.5, and (16.12) follows by a monotone passage to the limit-that is, by Theorem 16.2. Note that both sides of (16.12) may be infinite.

Even if $f$ is not nonnegative, (16.12) applies to $|f|$, whence it follows that $f$ is integrable with respect to $\nu$ if and only if $f \delta$ is integrable with respect to $\mu$. And if $f$ is integrable, (16.12) follows from differencing the same result for $f^{+}$and $f^{-}$. Replacing $f$ by $f I_{A}$ leads from (16.12) to (16.13). $\square$

Example 16.9. If $\nu(A)=\mu\left(A \cap A_{0}\right)$, then (16.11) holds with $\delta=I_{A_{0}}$, and (16.13) reduces to $\int_{A} f d \nu=\int_{A \cap A_{0}} f d \mu$. $\square$

Theorem 16.11 has two features in common with a number of theorems about integration:
(i) The relation in question, (16.12) in this case, in addition to holding for integrable functions, holds for all nonnegative functions-the point being that if one side of the equation is infinite, then so is the other, and if both are finite, then they have the same value. This is useful in checking for integrability in the first place.
(ii) The result is proved first for indicator functions, then for simple functions, then for nonnegative functions, then for integrable functions. In this connection, see Examples 16.4 and 16.5.

The next result is Scheffé's theorem.

Theorem 16.12. Suppose that $\nu_{n}(A)=\int_{A} \delta_{n} d \mu$ and $\nu(A)=\int_{A} \delta d \mu$ for densities $\delta_{n}$ and $\delta$. If

$$
\begin{equation*}
\nu_{n}(\Omega)=\nu(\Omega)<\infty, \quad n=1,2, \ldots, \tag{16.14}
\end{equation*}
$$

and if $\delta_{n} \rightarrow \delta$ except on a set of $\mu$-measure 0 , then

$$
\begin{equation*}
\sup _{A \in \mathscr{F}}\left|\nu(A)-\nu_{n}(A)\right| \leq \int_{\Omega}\left|\delta-\delta_{n}\right| d \mu \rightarrow 0 \tag{16.15}
\end{equation*}
$$

Proof. The inequality in (16.15) of course follows from (16.5). Let $g_{n}=\delta-\delta_{n}$. The positive part $g_{n}^{+}$of $g_{n}$ converges to 0 except on a set of $\mu$-measure 0 . Moreover, $0 \leq g_{n}^{+} \leq \delta$ and $\delta$ is integrable, and so the dominated convergence theorem applies: $\int g_{n}^{+} d \mu \rightarrow 0$. But $\int g_{n} d \mu=0$ by (16.14), and therefore

$$
\begin{aligned}
\int_{\Omega}\left|g_{n}\right| d \mu & =\int_{\left[g_{n} \geq 0\right]} g_{n} d \mu-\int_{\left[g_{n}<0\right]} g_{n} d \mu \\
& =2 \int_{\left[g_{n} \geq 0\right]} g_{n} d \mu=2 \int_{\Omega} g_{n}^{+} d \mu \rightarrow 0
\end{aligned}
$$ $\square$

A corollary concerning infinite series follows immediately-take $\mu$ as counting measure on $\Omega=\{1,2, \ldots\}$.

Corollary. If $\sum_{m} x_{n m}=\sum_{m} x_{m}<\infty$, the terms being nonnegative, and if $\lim _{n} x_{n m}=x_{m}$ for each $m$, then $\lim _{n} \sum_{m}\left|x_{n m}-x_{m}\right|=0$. If $y_{m}$ is bounded, then $\lim _{n} \sum_{m} y_{m} x_{n m}=\sum_{m} y_{m} x_{m}$.

## Change of Variable

Let ( $\Omega, \mathscr{F}$ ) and ( $\Omega^{\prime}, \mathscr{F}^{\prime}$ ) be measurable spaces, and suppose that the mapping $T: \Omega \rightarrow \Omega^{\prime}$ is measurable $\mathscr{F} / \mathscr{F}^{\prime}$. For a measure $\mu$ on $\mathscr{F}$, define a measure $\mu T^{-1}$ on $\mathscr{F}^{\prime}$ by

$$
\begin{equation*}
\mu T^{-1}\left(A^{\prime}\right)=\mu\left(T^{-1} A^{\prime}\right), \quad A^{\prime} \in \mathscr{F}^{\prime} \tag{16.16}
\end{equation*}
$$

as at the end of Section 13.
Suppose $f$ is a real function on $\Omega^{\prime}$ that is measurable $\mathscr{F}^{\prime}$, so that the composition $f T$ is a real function on $\Omega$ that is measurable $\mathscr{F}$ (Theorem 13.1(ii)). The change-of-variable formulas are (16.17) and (16.18). If $A^{\prime}=\Omega^{\prime}$, the second reduces to the first.

Theorem 16.13. If $f$ is nonnegative, then

$$
\begin{equation*}
\int_{\Omega} f(T \omega) \mu(d \omega)=\int_{\Omega^{\prime}} f\left(\omega^{\prime}\right) \mu T^{-1}\left(d \omega^{\prime}\right) \tag{16.17}
\end{equation*}
$$

A function $f$ (not necessarily nonnegative) is integrable with respect to $\mu T^{-1}$ if and only if $f T$ is integrable with respect to $\mu$, in which case (16.17) and

$$
\begin{equation*}
\int_{T^{-1} A^{\prime}} f(T \omega) \mu(d \omega)=\int_{A^{\prime}} f\left(\omega^{\prime}\right) \mu T^{-1}\left(d \omega^{\prime}\right) \tag{16.18}
\end{equation*}
$$

hold. For nonnegative $f,(16.18)$ always holds.
Proof. If $f=I_{A^{\prime}}$, then $f T=I_{T^{-1} A^{\prime}}$, and so (16.17) reduces to the definition (16.16). By linearity, (16.17) holds for nonnegative simple functions. If $f_{n}$ are simple functions for which $0 \leq f_{n} \uparrow f$, then $0 \leq f_{n} T \uparrow f T$, and (16.17) follows by the monotone convergence theorem.

An application of (16.17) to $|f|$ establishes the assertion about integrability, and for integrable $f$, (16.17) follows by decomposition into positive and negative parts. Finally, if $f$ is replaced by $f I_{A^{\prime}}$, (16.17) reduces to (16.18).

Example 16.10. Suppose that $\left(\Omega^{\prime}, \mathscr{F}^{\prime}\right)=\left(R^{1}, \mathscr{R}^{1}\right)$ and $T=\varphi$ is an ordinary real function, measurable $\mathscr{F}$. If $f(x)=x$, (16.17) becomes

$$
\begin{equation*}
\int_{\Omega} \varphi(\omega) \mu(d \omega)=\int_{R^{1}} x \mu \varphi^{-1}(d x) \tag{16.19}
\end{equation*}
$$

If $\varphi=\sum_{i} x_{i} I_{A_{i}}$ is simple, then $\mu \varphi^{-1}$ has mass $\mu\left(A_{i}\right)$ at $x_{i}$, and each side of (16.19) reduces to $\sum_{i} x_{i} \mu\left(A_{i}\right)$.

## Uniform Integrability

If $f$ is integrable, then $|f| I_{[|f| \geq \alpha]}$ goes to 0 almost everywhere as $\alpha \rightarrow \infty$ and is dominated by $|f|$, and hence

$$
\begin{equation*}
\lim _{\alpha \rightarrow \infty} \int_{[|f| \geq \alpha]}|f| d \mu=0 \tag{16.20}
\end{equation*}
$$

A sequence $\left(f_{n}\right)$ is uniformly integrable if (16.20) holds uniformly in $n$ :

$$
\begin{equation*}
\lim _{\alpha \rightarrow \infty} \sup _{n} \int_{\left[\left|f_{n}\right| \geq \alpha\right]}\left|f_{n}\right| d \mu=0 \tag{16.21}
\end{equation*}
$$

If (16.21) holds and $\mu(\Omega)<\infty$, and if $\alpha$ is large enough that the supremum in (16.21) is less than 1 , then

$$
\begin{equation*}
\int\left|f_{n}\right| d \mu \leq \alpha \mu(\Omega)+1 \tag{16.22}
\end{equation*}
$$

and hence the $f_{n}$ are integrable. On the other hand, (16.21) always holds if the $f_{n}$ are uniformly bounded, but the $f_{n}$ need not in that case be integrable if $\mu(\Omega)=\infty$. For this reason the concept of uniform integrability is interesting only for $\mu$ finite

If $h$ is the maximum of $|f|$ and $|g|$, then

$$
\int_{|f+g| \geq 2 \alpha}|f+g| d \mu \leq 2 \int_{h \geq \alpha} h d \mu \leq 2 \int_{|f| \geq \alpha}|f| d \mu+2 \int_{|g| \geq \alpha}|g| d \mu
$$

Therefore, if $\left\{f_{n}\right\}$ and $\left(g_{n}\right)$ are uniformly integrable, so is $\left\{f_{n}+g_{n}\right\}$.
Theorem 16.14. Suppose that $\mu(\Omega)<\infty$ and $f_{n} \rightarrow f$ almost everywhere.
(i) If the $f_{n}$ are uniformly integrable, then $f$ is integrable and

$$
\begin{equation*}
\int f_{n} d \mu \rightarrow \int f d \mu \tag{16.23}
\end{equation*}
$$

(ii) If $f$ and the $f_{n}$ are nonnegative and integrable, then (16.23) implies that the $f_{n}$ are uniformly integrable.

Proof. If the $f_{n}$ are uniformly integrable, it follows by (16.22) and Fatou's lemma that $f$ is integrable. Define

$$
f_{n}^{(\alpha)}=\left\{\begin{array}{ll}
f_{n} & \text { if }\left|f_{n}\right|<\alpha, \\
0 & \text { if }\left|f_{n}\right| \geq \alpha,
\end{array} \quad f^{(\alpha)}= \begin{cases}f & \text { if }|f|<\alpha, \\
0 & \text { if }|f| \geq \alpha .\end{cases}\right.
$$

If $\mu[|f|=\alpha]=0$, then $f_{n}^{(\alpha)} \rightarrow f^{(\alpha)}$ almost everywhere, and by the bounded convergence theorem,

$$
\begin{equation*}
\int f_{n}^{(\alpha)} d \mu \rightarrow \int f^{(\alpha)} d \mu \tag{16.24}
\end{equation*}
$$

Since

$$
\begin{equation*}
\int f_{n} d \mu-\int f_{n}^{(\alpha)} d \mu=\int_{\left|f_{n}\right| \geq \alpha} f_{n} d \mu \tag{16.25}
\end{equation*}
$$

and

$$
\begin{equation*}
\int f d \mu-\int f^{(\alpha)} d \mu=\int_{|f| \geq \alpha} f d \mu \tag{16.26}
\end{equation*}
$$

it follows from (16.24) that

$$
\lim \sup _{n}\left|\int f_{n} d \mu-\int f d \mu\right| \leq \sup _{n} \int_{\left|f_{\mu}\right| \geq \alpha}\left|f_{n}\right| d \mu+\int_{|f| \geq \alpha}|f| d \mu
$$

And now (16.23) follows from the uniform integrability and the fact that $\mu[|f|=\alpha]=0$ for all but countably many $\alpha$.

Suppose on the other hand that (16.23) holds, where $f$ and the $f_{n}$ are nonnegative and integrable. If $\mu[f=\alpha]=0$, then (16.24) holds, and from (16.25) and (16.26) follows

$$
\begin{equation*}
\int_{f_{n} \geq \alpha} f_{n} d \mu \rightarrow \int_{f \geq \alpha} f d \mu \tag{16.27}
\end{equation*}
$$

Since $f$ is integrable, there is, for given $\epsilon$, an $\alpha$ such that the limit in (1627) is less than $\epsilon$ and $\mu[f=\alpha]=0$. But then the integral on the left is less than $\epsilon$ for all $n$ exceeding some $n_{0}$. Since the $f_{n}$ are individually integrable, uniform integrability follows (increase $\alpha$ ).

Corollary. Suppose that $\mu(\Omega)<\infty$. If $f$ and the $f_{n}$ are integrable, and if $f_{n} \rightarrow f$ almost everywhere, then these conditions are equivalent:
(i) $f_{n}$ are uniformly integrable;
(ii) $\int\left|f-f_{n}\right| d_{\mu} \rightarrow 0$;
(iii) $f\left|f_{n}\right| d \mu \rightarrow f|f| d \mu$.

Proof. If (i) holds, then the differences $\left|f-f_{n}\right|$ are uniformly integrable, and since they converge to 0 almost everywhere, (ii) follows by the theorem. And (ii) implies (iii) because $\left||f|-\left|f_{n}\right|\right| \leq\left|f-f_{n}\right|$. Finally, it follows from the theorem that (iii) implies (i).

## Suppose that

$$
\begin{equation*}
\sup _{n} \int\left|f_{n}\right|^{1+\epsilon} d \mu<\infty \tag{16.28}
\end{equation*}
$$

for a positive $\epsilon$. If $K$ is the supremum here, then

$$
\int_{\left[\left|f_{n}\right| \geq \alpha\right]}\left|f_{n}\right| d \mu \leq \frac{1}{\alpha^{\epsilon}} \int_{\left[\left|f_{n}\right| \geq \alpha\right]}\left|f_{n}\right|^{1+\epsilon} d \mu \leq \frac{K}{\alpha^{\epsilon}}
$$

and so $\left(f_{n}\right)$ is uniformly integrable.

## Complex Functions

A complex-valued function on $\Omega$ has the form $f(\omega)=g(\omega)+i h(\omega)$, where $g$ and $h$ are ordinary finite-valued real functions on $\Omega$. It is, by definition, measurable $\mathscr{F}$ if $g$ and $h$ are. If $g$ and $h$ are integrable, then $f$ is by definition integrable, and its integral is of course taken as

$$
\begin{equation*}
\int(g+i h) d \mu=\int g d \mu+i \int h d \mu \tag{16.29}
\end{equation*}
$$

Since $\max \{|g|,|h|\} \leq|f| \leq|g|+|h|, f$ is integrable if and only if $f|f| d \mu<\infty$, just as in the real case.

The linearity equation (16.3) extends to complex functions and coefficients-the proof requires only that everything be decomposed into real and imaginary parts. Consider the inequality (16.4) for the complex case:

$$
\begin{equation*}
\left|\int f d \mu\right| \leq \int|f| d \mu \tag{16.30}
\end{equation*}
$$

If $f=g+i h$ and $g$ and $h$ are simple, the corresponding partitions can be taken to be the same ( $g=\sum_{k} x_{k} I_{A k}$ and $h=\sum_{k} y_{k} I_{A_{k}}$ ), and (16.30) follows by the triangle inequality. For the general integrable $f$, represent $g$ and $h$ as limits of simple functions dominated by $|f|$, and pass to the limit.

The results on integration to the limit extend as well. Suppose that $f_{k}=g_{k}+i h_{k}$ are complex functions satisfying $\sum_{k}| | f_{k} \mid d \mu<\infty$. Then $\sum_{k}| | g_{k} \mid d \mu<\infty$, and so by the corollary to Theorem 16.7, $\sum_{k} g_{k}$ is integrable and integrates to $\sum_{k} / g_{k} d \mu$. The same is true of the imaginary parts, and hence $\sum_{k} f_{k}$ is integrable and

$$
\begin{equation*}
\int \sum_{k} f_{k} d \mu=\sum_{k} \int f_{k} d \mu \tag{1631}
\end{equation*}
$$

## PROBLEMS

16.1. 13.9 ↑ Suppose that $\mu(\Omega)<\infty$ and $f_{n}$ are uniformly bounded.
(a) Assume $f_{n} \rightarrow f$ uniformly and deduce $\int f_{n} d \mu \rightarrow \int f d \mu$ from (16.5).
(b) Use part (a) and Egoroff's theorem to give another proof of Theorem 16.5.
16.2. Prove that if $0 \leq f_{n} \rightarrow f$ almost everywhere and $\int f_{n} d \mu \leq A<\infty$, then $f$ is integrable and $f d \mu \leq A$. (This is essentially the same as Fatou's lemma and is sometimes called by that name.)
16.3. Suppose that $f_{n}$ are integrable and $\sup _{n}\left(f_{n} d \mu<\infty\right.$. Show that, if $f_{n} \uparrow f$, then $f$ is integrable and $f f_{n} d \mu \rightarrow \int f d \mu$. This is Beppo Levi's theorem.
16.4. (a) Suppose that functions $a_{n}, b_{n}, f_{n}$ converge almost everywhere to functions $a, b, f$, respectively. Suppose that the first two sequences may be integrated to the limit-that is, the functions are all integrable and $\int a_{n} d \mu \rightarrow f a d \mu$, $\int b_{n} d \mu \rightarrow f b d \mu$. Suppose, finally, that the first two sequences enclose the third: $a_{n} \leq f_{n} \leq b_{n}$ almost everywhere. Show that the third may be integrated to the limit.
(b) Deduce Lebesgue's dominated convergence theorem from part (a).
16.5. About Theorem 16.8:
(a) Part (i) is local: there can be a different set $A$ for each $t_{0}$. Part (ii) can be recast as a local theorem. Suppose that for $\omega \in A$, where $A$ satisfies (16.9),
$f(\omega, t)$ has derivative $f^{\prime}\left(\omega, t_{0}\right)$ at $t_{0}$; suppose further that

$$
\begin{equation*}
\left|\frac{f\left(\omega, t_{0}+h\right)-f\left(\omega, t_{0}\right)}{h}\right| \leq g_{1}(\omega) \tag{16.32}
\end{equation*}
$$

for $\omega \in A$ and $0<|h|<\delta$, where $\delta$ is independent of $\omega$ and $g_{1}$ is integrable. Then $\phi^{\prime}\left(t_{0}\right)=\int f^{\prime}\left(\omega, t_{0}\right) \mu(d \omega)$.

The natural way to check (16.32), however, is by the mean-value theorem, and this requires (for $\omega \in A$ ) a derivative throughout a neighborhood of $t_{0}$
(b) If $\mu$ is Lebesgue measure on the unit interval $\Omega,(a, b)=(0,1)$, and $f(\omega, t)=I_{(0,1)}(\omega)$, then part (i) applies but part (ii) does not. Why? What about (16.32)?
16.6. Suppose that $f(\omega, \cdot)$ is, for each $\omega$, a function on an open set $W$ in the complex plane and that $f(\cdot, z)$ is for $z$ in $W$ measurable $\mathscr{F}$ and integrable. Suppose that $A$ satisfies (16.9), that $f(\omega, \cdot)$ is analytic in $W$ for $\omega$ in $A$, and that for each $z_{0}$ in $W$ there is an integrable $g\left(\cdot, z_{0}\right)$ such that $\left|f^{\prime}(\omega, z)\right| \leq g\left(\omega, z_{0}\right)$ for all $\omega \in A$ and all $z$ in some neighborhood of $z_{0}$. Show that $f f(\omega, z) \mu(d \omega)$ is analytic in $W$.
16.7. (a) Show that if $\left|f_{n}\right| \leq g$ and $g$ is integrable, then $\left(f_{n}\right)$ is uniformly integrable. Compare the hypotheses of Theorems 16.4 and 16.14
(b) On the unit interval with Lebesgue measure, let $f_{n}=(n / \log n) I_{0, n^{-1}}$, for $n \geq 3$. Show that the $f_{n}$ are uniformly integrable (and $\int f_{n} d \mu \rightarrow 0$ ) although they are not dominated by any integrable $g$.
(c) Show for $f_{n}=n I_{\left(0, n^{-1} 0\right)}-n I_{\left(n^{-1}, 2 n^{-1}\right)}$ that the $f_{n}$ can be integrated to the limit (Lebesgue measure) even though the $f_{n}$ are not uniformly integrable.
16.8. Show that if $f$ is integrable, then for each $\epsilon$ there is a $\delta$ such that $\mu(A)<\delta$ implies $\int_{A}|f| d \mu<\epsilon$.
16.9. $\uparrow$ Suppose that $\mu(\Omega)<\infty$. Show that $\left\{f_{n}\right\}$ is uniformly integrable if and only if (i) $\left|\left|f_{n}\right| d \mu\right.$ is bounded and (ii) for each $\epsilon$ there is a $\delta$ such that $\mu(A)<\delta$ implies $\int_{A}\left|f_{n}\right| d \mu<\epsilon$ for all $n$.
16.10. 2.19 16.9 ↑ Assume $\mu(\Omega)<\infty$.
(a) Show by examples that neither of the conditions (i) and (ii) in the preceding problem implies the other.
(b) Show that (ii) implies (i) for all sequences $\left\{f_{n}\right\}$ if and only if $\mu$ is nonatomic.
16.11. Let $f$ be a complex-valued function integrating to $r e^{i \theta}, r \geq 0$. From $f(|f(\omega)|- \left.e^{-i \theta} f(\omega)\right) \mu(d \mu)=f|f| d \mu-r$, deduce (16.30).
16.12. $11.5 \uparrow$ Consider the vector lattice $\mathscr{L}$ and the functional $\Lambda$ of Problems 11.4 and 11.5. Let $\mu$ be the extension (Theorem 11.3) to $\mathscr{F}=\sigma\left(\mathscr{F}_{0}\right)$ of the set function $\mu_{0}$ on $\mathscr{F}_{0}$.
(a) Show by (11.7) that for positive $x, y_{1}, y_{2}$ one has $\nu([f>1] \times(0, x])= x \mu_{0}[f>1]=x \mu[f>1]$ and $\nu\left(\left[y_{1}<f \leq y_{2}\right] \times(0, x]\right)=x \mu\left[y_{1}<f \leq y_{2}\right]$.
(b) Show that if $f \in \mathscr{L}$, then $f$ is integrable and

$$
\Lambda(f)=\int f d \mu
$$

(Consider first the case $f \geq 0$.) This is the Daniell-Stone representation theorem.

## SECTION 17. THE INTEGRAL WITH RESPECT TO LEBESGUE MEASURE

## The Lebesgue Integral on the Line

A real measurable function on the line is Lebesgue integrable if it is integrable with respect to Lebesgue measure $\lambda$, and its Lebesgue integral $\int f d \lambda$ is denoted by $f f(x) d x$, or, in the case of integration over an interval, by $\int_{a}^{b} f(x) d x$. The theory of the preceding two sections of course applies to the Lebesgue integral. It is instructive to compare it with the Riemann integral.

## The Riemann Integral

A real function $f$ on an interval ( $a, b$ ] is by definition ${ }^{\dagger}$ Riemann integrable, with integral $r$, if this condition holds: For each $\epsilon$ there exists a $\delta$ with the property that

$$
\begin{equation*}
\left|t-\sum_{i} f\left(x_{i}\right) \lambda\left(I_{i}\right)\right|<\epsilon \tag{17.1}
\end{equation*}
$$

if $\left\{I_{i}\right\}$ is any finite partition of $(a, b]$ into subintervals satisfying $\lambda\left(I_{i}\right)<\delta$ and if $x_{i} \in I_{i}$ for each $i$. The Riemann integral for step functions was used in Section 1.

Suppose that $f$ is Borel measurable, and suppose that $f$ is bounded, so that it is Lebesgue integrable. If $f$ is also Riemann integrable, the $r$ of (17.1) must coincide with the Lebesgue integral $\int_{a}^{b} f(x) d x$. To see this, first note that letting $x_{i}$ vary over $I_{i}$ leads from (17.1) to

$$
\begin{equation*}
\left|r-\sum_{i} \sup _{x \in I_{i}} f(x) \cdot \lambda\left(I_{i}\right)\right| \leq \epsilon . \tag{17.2}
\end{equation*}
$$

Consider the simple function $g$ with value $\sup _{x \in I_{i}} f(x)$ on $I_{i}$. Now $f \leq g$, and the sum in (17.2) is the Lebesgue integral of $g$. By monotonicity of the

[^24]Lebesgue integral, $\int_{a}^{b} f(x) d x \leq \int_{a}^{b} g(x) d x \leq r+\epsilon$. The reverse inequality follows in the same way, and so $\int_{a}^{b} f(x) d x=r$. Therefore, the Riemann integral when it exists coincides with the Lebsegue integral.

Suppose that $f$ is continuous on $[a, b]$. By uniform continuity, for each $\epsilon$ there exists a $\delta$ such that $|f(x)-f(y)|<\epsilon /(b-a)$ if $|x-y|<\delta$. If $\lambda\left(I_{i}\right)<\delta$ and $x_{i} \in I_{i}$, then $g=\sum_{i} f\left(x_{i}\right) I_{I_{i}}$ satisfies $|f-g|<\epsilon /(b-a)$ and hence $\left|\int_{a}^{b} f d x-\int_{a}^{b} g d x\right|<\epsilon$. But this is (17.1) with $r$ replaced (as it must be) by the Lebesgue integral $\int_{a}^{b} f d x$ : A continuous function on a closed interval is Riemann integrable.

Example 17.1. If $f$ is the indicator of the set of rationals in ( 0,1 ], then the Lebesgue integral $\int_{0}^{1}(x) d x$ is 0 because $f=0$ almost everywhere. But for an arbitrary partition $\left\{I_{i}\right\}$ of ( 0,1 ] into intervals, $\sum_{i} f\left(x_{i}\right) \lambda\left(I_{i}\right)$ with $x_{i} \in I_{i}$ is 1 if each $x_{i}$ is taken from the rationals and 0 if each $x_{i}$ is taken from the irrationals. Thus $f$ is not Riemann integrable. $\square$

Example 17.2. For the $f$ of Example 17.1, there exists a $g$ (namely, $g \equiv 0$ ) such that $f=g$ almost everywhere and $g$ is Riemann integrable. To show that the Lebesgue theory is not reducible to the Riemann theory by the casting out of sets of measure 0 , it is of interest to produce an $f$ (bounded and Borel measurable) for which no such $g$ exists.

In Examples 3.1 and 3.2 there were constructed Borel subsets $A$ of $(0,1]$ such that $0<\lambda(A)<1$ and such that $\lambda(A \cap I)>0$ for each subinterval $I$ of $(0,1]$. Take $f=I_{A}$. Suppose that $f=g$ almost everywhere and that $\left\{I_{i}\right\}$ is a decomposition of ( 0,1 ] into subintervals. Since $\lambda\left(I_{i} \cap A \cap[f=g]\right)=\lambda\left(I_{i} \cap A\right) >0$, it follows that $g\left(y_{i}\right)=f\left(y_{i}\right)=1$ for some $y_{i}$ in $I_{i} \cap A$, and therefore,

$$
\begin{equation*}
\sum_{i} g\left(y_{i}\right) \lambda\left(I_{i}\right)=1>\lambda(A) . \tag{17.3}
\end{equation*}
$$

If $g$ were Riemann integrable, its Riemann integral would coincide with the Lebesgue integrals $\int g d x=\int f d x=\lambda(A)$, in contradiction to (17.3). $\square$

It is because of their extreme oscillations that the functions in Examples 17.1 and 17.2 fail to be Riemann integrable. (It can be shown that a bounded function on a bounded interval is Riemann integrable if and only if the set of its discontinuities has Lebesgue measure $0 .^{\dagger}$ ) This cannot happen in the case of the Lebesgue integral of a measurable function: if $f$ fails to be Lebesgue integrable, it is because its positive part or its negative part is too large, not because one or the other is too irregular.

[^25]Example 17.3. It is an important analytic fact that

$$
\begin{equation*}
\lim _{l \rightarrow \infty} \int_{0}^{l} \frac{\sin x}{x} d x=\frac{\pi}{2} \tag{17.4}
\end{equation*}
$$

The existence of the limit is simple to prove, because $\int_{(n-1) \pi}^{n \pi} x^{-1} \sin x d x$ alternates in sign and its absolute value decreases to 0 ; the value of the limit will be identified in the next section (Example 18.4). On the other hand, $x^{-1} \sin x$ is not Lebesgue integrable over $(0, \infty)$, because its positive and negative parts integrate to $\infty$. Within the conventions of the Lebesgue theory, (17.4) thus cannot be written $\int_{0}^{\infty} x^{-1} \sin x d x=\pi / 2$-although such "improper" integrals appear in calculus texts. It is, of course, just a question of choosing the terminology most convenient for the subject at hand. $\square$

The function in Example 17.2 is not equal almost everywhere to any Riemann integrable function. Every Lebesgue integrable function can, however, be approximated in a certain sense by Riemann integrable functions of two kinds.

Theorem 17.1. Suppose that $f|f| d x<\infty$ and $\epsilon>0$.
(i) There is a step function $g=\sum_{i=1}^{k} x_{i} I_{A_{i}}$, with bounded intervals as the $A_{i}$, such that $\int|f-g| d x<\epsilon$.
(ii) There is a continuous integrable $h$ with bounded support such that $\int|f-h| d x<\epsilon$.

Proof. By the construction (13.6) and the dominated convergence theorem, (i) holds if the $A_{i}$ are not required to be intervals; moreover, $\lambda\left(A_{i}\right)<\infty$ for each $i$ for which $x_{i} \neq 0$. By Theorem 11.4 there exists a finite disjoint union $B_{i}$ of intervals such that $\lambda\left(A_{i} \Delta B_{i}\right)<\epsilon / k\left|x_{i}\right|$. But then $\sum_{i} x_{i} I_{B_{i}}$ satisfies the requirements of (i) with $2 \epsilon$ in place of $\epsilon$.

To prove (ii) it is only necessary to show that for the $g$ of (i) there is a continuous $h$ such that $\int|g-h| d x<\epsilon$. Suppose that $A_{i}=\left(a_{i}, b_{i}\right]$; let $h_{i}(x)$ be 1 on ( $a_{i}, b_{i}$ ] and 0 outside ( $a_{i}-\delta, b_{i}+\delta$ ], and let it increase linearly from 0 to 1 over ( $a_{i}-\delta, a_{i}$ ] and decrease linearly from 1 to 0 over ( $b_{i}, b_{i}+\delta$ ]. Since $\int\left|I_{A_{i}}-h_{i}\right| d x \rightarrow 0$ as $\delta \rightarrow 0, h=\sum x_{i} h_{i}$ for sufficiently small $\delta$ will satisfy the requirements. $\square$

The Lebesgue integral is thus determined by its values for continuous functions. ${ }^{\dagger}$

[^26]
## The Fundamental Theorem of Calculus

Adopt the convention that $\int_{\alpha}^{\beta}=-\int_{\beta}^{\alpha}$ if $\alpha>\beta$. For positive $h$,

$$
\begin{aligned}
\left|\frac{1}{h} \int_{x}^{x+h} f(y) d y-f(x)\right| & \leq \frac{1}{h} \int_{x}^{x+h}|f(y)-f(x)| d y \\
& \leq \sup [|f(y)-f(x)|: x \leq y \leq x+h]
\end{aligned}
$$

and the right side goes to 0 with $h$ if $f$ is continuous at $x$. The same thing holds for negative $h$, and therefore $\int_{a}^{x} f(y) d y$ has derivative $f(x)$ :

$$
\begin{equation*}
\frac{d}{d x} \int_{a}^{x} f(y) d y=f(x) \tag{17.5}
\end{equation*}
$$

if $f$ is continuous at $x$.
Suppose that $F$ is a function with continuous derivative $F^{\prime}=f$; that is, suppose that $F$ is a primitive of the continuous function $f$. Then

$$
\begin{equation*}
\int_{a}^{b} f(x) d x=\int_{a}^{b} F^{\prime}(x) d x=F(b)-F(a) \tag{17.6}
\end{equation*}
$$

as follows from the fact that $F(x)-F(a)$ and $\int_{a}^{x} f(y) d y$ agree at $x=a$ and by (17.5) have identical derivatives. For continuous $f$, (17.5) and (17.6) are two ways of stating the fundamental theorem of calculus. To the calculation of Lebesgue integrals the methods of elementary calculus thus apply.

As will follow from the general theory of derivatives in Section 31, (17.5) holds outside a set of Lebesgue measure 0 if $f$ is integrable-it need not be continuous. As the following example shows, however, (17.6) can fail for discontinuous $f$.

Example 17.4. Define $F(x)=x^{2} \sin x^{-2}$ for $0 \leq x \leq \frac{1}{2}$ and $F(x)=0$ for $x \leq 0$ and for $x \geq 1$. Now for $\frac{1}{2}<x<1$ define $F(x)$ in such a way that $F$ is continuously differentiable over $(0, \infty)$. Then $F$ is everywhere differentiable, but $F^{\prime}(0)=0$ and $F^{\prime}(x)=2 x \sin x^{-2}-2 x^{-1} \cos x^{-2}$ for $0<x<\frac{1}{2}$. Thus $F^{\prime}$ is discontinuous at $0 ; F^{\prime}$ is, in fact, not even integrable over ( 0,1 ], which makes ( 17.6 ) impossible for $a=0$.

For a more extreme example, decompose $(0,1]$ into countably many subintervals ( $a_{n}, b_{n}$ ]. Define $G(x)=0$ for $x \leq 0$ and $x \geq 1$, and on $\left(a_{n}, b_{n}\right]$ define $G(x)=F((x- \left.a_{n}\right) /\left(b_{n}-a_{n}\right)$ ). Then $G$ is everywhere differentiable, but (17.6) is impossible for $G$ if ( $a, b$ ] contains any of the $\left(a_{n}, b_{n}\right]$, because $G$ is not integrable over any of them. $\square$

## Change of Variable

For

$$
\begin{equation*}
[a, b] \xrightarrow{T}[u, v] \xrightarrow{f} R^{1}, \tag{17.7}
\end{equation*}
$$

the change-of-variable formula is

$$
\begin{equation*}
\int_{a}^{b} f(T x) T^{\prime}(x) d x=\int_{T a}^{T b} f(y) d y \tag{17.8}
\end{equation*}
$$

If $T^{\prime}$ exists and is continuous, and if $f$ is continuous, the two integrals are finite because the integrands are bounded, and to prove (17.8) it is enough to let $b$ be a variable and differentiate with respect to it. ${ }^{\dagger}$

With the obvious limiting arguments, this applies to unbounded intervals and to open ones:

Example 17.5. Put $T(x)=\tan x$ on $(-\pi / 2, \pi / 2)$. Then $T^{\prime}(x)=1+ T^{2}(x)$, and (17.8) for $f(y)=\left(1+y^{2}\right)^{-1}$ gives

$$
\begin{equation*}
\int_{-\infty}^{\infty} \frac{d y}{1+y^{2}}=\pi \tag{17.9}
\end{equation*}
$$ $\square$

## The Lebesgue Integral in $\boldsymbol{R}^{\boldsymbol{k}}$

The $k$-dimensional Lebesgue integral, the integral in ( $R^{k}, \mathscr{R}^{k}, \lambda_{k}$ ), is denoted $f f(x) d x$, it being understood that $x=\left(x_{1}, \ldots, x_{k}\right)$. In low-dimensional cases it is also denoted $\iint_{A} f\left(x_{1}, x_{2}\right) d x_{1} d x_{2}$, and so on.

As for the rule for changing variables, suppose that $T: U \rightarrow R^{k}$, where $U$ is an open set in $R^{k}$. The map has the form $T x=\left(t_{1}(x), \ldots, t_{k}(x)\right)$; it is by definition continuously differentiable if the partial derivatives $t_{i j}(x)=\partial t_{i} / \partial x_{j}$ exist and are continuous in $U$. Let $D_{x}=\left[t_{i j}(x)\right]$ be the Jacobian matrix, let $J(x)=\operatorname{det} D_{x}$ be the Jacobian determinant, and let $V=T U$.

Theorem 17.2. Let $T$ be a continuously differentiable map of the open set $U$ onto $V$. Suppose that $T$ is one-to-one and that $J(x) \neq 0$ for all $x$. If $f$ is nonnegative, then

$$
\begin{equation*}
\int_{U} f(T x)|J(x)| d x=\int_{V} f(y) d y . \tag{17.10}
\end{equation*}
$$

By the inverse-function theorem [A35], $V$ is open and the inverse point mapping $T^{-1}$ is continuously differentiable. It is assumed in (17.10) that $f$ : $V \rightarrow R^{1}$ is a Borel function. As usual, for the general $f,(17.10)$ holds with $|f|$ in place of $f$, and if the two sides are finite, the absolute-value bars can be removed; and of course $f$ can be replaced by $f I_{B}$ or $f I_{T A}$.

[^27]Example 17.6. Suppose that $T$ is a nonsingular linear transformation on $U=V=R^{k}$. Then $D_{x}$ is for each $x$ the matrix of the transformation. If $T$ is identified with this matrix, then (17.10) becomes

$$
\begin{equation*}
|\operatorname{det} T| \int_{U} f(T x) d x=\int_{V} f(y) d y \tag{17.11}
\end{equation*}
$$

If $f=I_{T A}$, this holds because of (12.2), and then it follows in the usual sequence for simple $f$ and for the general nonnegative $f$ : Theorem 17.2 is easy in the linear case.

Example 17.7. In $R^{2}$ take $U=[(\rho, \theta): \rho>0,0<\theta<2 \pi]$ and $T(\rho, \theta)= (\rho \cos \theta, \rho \sin \theta)$. The Jacobian is $J(\rho, \theta)=\rho$, and (17.10) gives the formula for integrating in polar coordinates:

$$
\begin{equation*}
\iint_{\rho>0} f(\rho \cos \theta, \rho \sin \theta) \rho d \rho d \theta=\iint_{R^{2}} f(x, y) d x d y \tag{17.12}
\end{equation*}
$$

Here $V$ is $R^{2}$ with the ray $[(x, 0): x \geq 0]$ removed; (17.12) obviously holds even though the ray is included on the right. If the constraint on $\theta$ is replaced by $0<\theta<4 \pi$, for example, then (17.12) is false (a factor of 2 is needed on the right). This explains the assumption that $T$ is one-to-one.

Theorem 17.2 is not the strongest possible; it is only necessary to assume that $T$ is one-to-one on the set $U_{0}=[x \in U: J(x) \neq 0]$. This is because, by Sard's theorem, ${ }^{\dagger} \lambda_{k}\left(V-T U_{0}\right)=0$.

Proof of Theorem 17.2. Suppose it is shown that

$$
\begin{equation*}
\int_{U} f(T x)|J(x)| d x \geq \int_{V} f(y) d y \tag{17.13}
\end{equation*}
$$

for nonnegative $f$. Apply this to $T^{-1}: V \rightarrow U$, which [A35] is continuously differentiable and has Jacobian $J^{-1}\left(T^{-1} y\right)$ at $y$ :

$$
\int_{V} g\left(T^{-1} y\right)\left|J^{-1}\left(T^{-1} y\right)\right| d y \geq \int_{U} g(x) d x
$$

for nonnegative $g$ on $V$. Taking $g(x)=f(T x)|J(x)|$ here leads back to (17.13), but with the inequality reversed. Therefore, proving (17.13) will be enough.

For $f=I_{T A}$, (17.13) reduces to

$$
\begin{equation*}
\int_{A}|J(x)| d x \geq \lambda_{k}(T A) \tag{17.14}
\end{equation*}
$$

${ }^{\dagger}$ Splvak, p. 72.

Each side of (17.14) is a measure on $\mathscr{U}=U \cap \mathscr{R}^{k}$. If $\mathscr{A}$ consists of the rectangles $A$ satisfying $A^{-} \subset U$, then $\mathscr{A}$ is a semiring generating $\mathscr{U}, U$ is a countable union of $\mathscr{A}$-sets, and the left side of (17.14) is finite for $A$ in $\mathscr{A}$ ( $\sup _{A}-|J|<\infty$ ). It follows by Corollary 2 to Theorem 11.4 that if (17.14) holds for $A$ in $\mathscr{A}$, then it holds for $A$ in $\mathscr{Q}$. But then (linearity and monotone convergence) (17.13) will follow.

Proof of (17.14) for $A$ in $\mathscr{A}$. Split the given rectangle $A$ into finitely many subrectangles $Q_{i}$ satisfying

$$
\begin{equation*}
\operatorname{diam} Q_{i}<\delta, \tag{17.15}
\end{equation*}
$$

$\delta$ to be determined. Let $x_{i}$ be some point of $Q_{i}$. Given $\epsilon$, choose $\delta$ in the first place so that $\left|J(x)-J\left(x^{\prime}\right)\right|<\epsilon$ if $x, x^{\prime} \in A^{-}$and $\left|x-x^{\prime}\right|<\delta$. Then (17.15) implies

$$
\begin{equation*}
\sum_{i}\left|J\left(x_{i}\right)\right| \lambda_{k}\left(Q_{i}\right) \leq \int_{A}|J(x)| d x+\epsilon \lambda_{k}(A) . \tag{17.16}
\end{equation*}
$$

Let $Q_{i}^{+\epsilon}$ be a rectangle that is concentric with $Q_{i}$ and similar to it and whose edge lengths are those of $Q_{i}$ multiplied by $1+\epsilon$. For $x$ in $U$ consider the affine transformation

$$
\begin{equation*}
\phi_{x} z=D_{x}(z-x)+T x, \quad z \in R^{k} ; \tag{17.17}
\end{equation*}
$$

$\phi_{x} z$ will [A34] be a good approximation to $T z$ for $z$ near $x$. Suppose, as will be proved in a moment, that for each $\epsilon$ there is a $\delta$ such that, if (17.15) holds, then, for each $i, \phi_{x_{i}}$ approximates $T$ so well on $Q_{i}$ that

$$
\begin{equation*}
T Q_{i} \subset \phi_{x_{i}} Q_{i}^{+\epsilon} \tag{17.18}
\end{equation*}
$$

By Theorem 12.2, which shows in the nonsingular case how an affine transformation changes the Lebesgue measures of sets, $\lambda_{k}\left(\phi_{x_{i}} Q_{i}^{+\epsilon}\right)=\left|J\left(x_{i}\right)\right| \lambda_{k}\left(Q_{i}^{+\epsilon}\right)$. If (17.18) holds, then

$$
\begin{align*}
\lambda_{k}(T A) & =\sum_{i} \lambda_{k}\left(T Q_{i}\right) \leq \sum_{i} \lambda_{k}\left(\phi_{x_{i}} Q_{i}^{+\epsilon}\right)  \tag{17.19}\\
& =\sum_{i}\left|J\left(x_{i}\right)\right| \lambda_{k}\left(Q_{i}^{+\epsilon}\right)=(1+\epsilon)^{k} \sum_{i}\left|J\left(x_{i}\right)\right| \lambda_{k}\left(Q_{i}\right) .
\end{align*}
$$

(This, the central step in the proof, shows where the Jacobian in (17.10) comes from.) If for each $\epsilon$ there is a $\delta$ such that (17.15) implies both (17.16) and (17.19), then (17.14) will follow. Thus everything depends on (17.18), and the remaining problem is to show that for each $\epsilon$ there is a $\delta$ such that (17.18) holds if (17.15) does.

Proof of (17.18). As ( $x, z$ ) varies over the compact set $A^{-} \times[z:|z|=1],\left|D_{x}^{-1} z\right|$ is continuous, and therefore, for some $c$,

$$
\begin{equation*}
\left|D_{x}^{-1} z\right| \leq c|z| \quad \text { for } x \in A, z \in R^{k} . \tag{17.20}
\end{equation*}
$$

Since the $t_{j l}$ are uniformly continuous on $A^{-}, \delta$ can be chosen so that $\left|t_{j l}(z)-t_{j l}(x)\right| \leq \epsilon / k^{2} c$ for all $j, l$ if $z, x \in A$ and $|z-x|<\delta$. But then, by linear approximation [A34: (16)], $\left|T z-T x-D_{x}(z-x)\right| \leq \epsilon c^{-1}|z-x|<\epsilon c^{-1} \delta$. If (17.15) holds and $\delta<1$, then by the definition (17.17),

$$
\begin{equation*}
\left|T z-\phi_{x_{i}} z\right|<\epsilon / c \quad \text { for } z \in Q_{i} . \tag{17.21}
\end{equation*}
$$

To prove (17.18), note that $z \in Q_{i}$ implies

$$
\begin{aligned}
\left|\phi_{x_{i}}^{-1} T z-z\right| & =\left|\phi_{x_{i}}^{-1} T z-\phi_{x_{i}}^{-1} \phi_{x_{i}} z\right|=\left|D_{x_{i}}^{-1}\left(T z-\phi_{x_{i}} z\right)\right| \\
& \leq c\left|T z-\phi_{x_{i}} z\right|<\epsilon
\end{aligned}
$$

where the first inequality follows by (17.20) and the second by (17.21). Since $\phi_{x_{1}}^{-1} T z$ is within $\epsilon$ of the point $z$ of $Q_{i}$, it lies in $Q_{i}^{+\epsilon}: \phi_{x_{i}}^{-1} T z \in Q_{i}^{+\epsilon}$, or $T z \in \phi_{x_{i}} Q_{i}^{+\epsilon}$. Hence (17.18) holds, which completes the proof.

## Stieltjes Integrals

Suppose that $F$ is a function on $R^{k}$ satisfying the hypotheses of Theorem 12.5, so that there exists a measure $\mu$ such that $\mu(A)=\Delta_{A} F$ for bounded rectangles $A$. In integrals with respect to $\mu, \mu(d x)$ is often replaced by $d F(x)$ :

$$
\begin{equation*}
\int_{A} f(x) d F(x)=\int_{A} f(x) \mu(d x) \tag{17.22}
\end{equation*}
$$

The left side of this equation is the Stieltjes integral of $f$ with respect to $F$; since it is defined by the right side of the equation, nothing new is involved.

Suppose that $f$ is uniformly continuous on a rectangle $A$, and suppose that $A$ is decomposed into rectangles $A_{m}$ small enough that $|f(x)-f(y)|< \epsilon / \mu(A)$ for $x, y \in A_{m}$. Then

$$
\left|\int_{A} f(x) d F(x)-\sum_{m} f\left(x_{m}\right) \Delta_{A_{m}} F\right|<\epsilon
$$

for $x_{m} \in A_{m}$. In this case the left side of (17.22) can be defined as the limit of these approximating sums without any reference to the general theory of measure, and for historical reasons it is sometimes called the Riemann-Stieltjes integral; (17.22) for the general $f$ is then called the Lebesgue-Stieltjes integral. Since these distinctions are unimportant in the context of general measure theory, $\int f(x) d F(x)$ and $\int f d F$ are best regarded as merely notational variants for $\int f(x) \mu(d x)$ and $\int f d \mu$.

## PROBLEMS

Let $f$ be a bounded function on a bounded interval, say $[0,1]$. Do not assume that $f$ is a Borel function. Denote by $L_{*} f$ and $L^{*} f$ ( $L$ for Lebesgue) the lower and upper integrals as defined by (15.9) and (15.10), where $\mu$ is now Lebesgue measure $\lambda$ on the Borel sets of [ 0,1 ]. Denote by $R_{*} f$ and $R^{*} f$ ( $R$ for Riemann) the same quantities but with the outer supremum and infimum in (15.9) and (15.10) extending only over finite partitions of $[0,1]$ into subintervals. It is obvious (see (15.11)) that

$$
\begin{equation*}
R_{*} f \leq L_{*} f \leq L^{*} f \leq R^{*} f \tag{17.23}
\end{equation*}
$$


[^0]:    *This topic may be omitted
    ${ }^{\mathrm{t}}$ For each $\epsilon$, however, there exist optimal policies under which the bet never exceeds $\epsilon$; see Dubins \& Savage.

[^1]:    ${ }^{\dagger}$ Sometimes in the definition of the Markov chain $P\left[X_{n+1}=j \mid X_{n}=i\right]$ is allowed to depend on $n$. A chain satisfying (8.3) is then said to have stationary transition probabilities, a phrase that will be omitted here because (83) will always be assumed.

[^2]:    ${ }^{\dagger}$ For an excellent collection of examples from physics and biology, see Feeler, Volume 1, Chapter XV.

[^3]:    ${ }^{\dagger}$ The details can be found in Dynkin \& Yushkevich. Chapter III.
    ${ }^{\ddagger}$ With the princess replaced by an executive and the suitors by applicants for an office job, this is known as the secretary problem

[^4]:    ${ }^{\dagger}$ For a different approach in the finite case, see Problem 8.1.

[^5]:    ${ }^{\dagger}$ See Problem 8.9.

[^6]:    *This topic may be omitted.
    ${ }^{\dagger}$ For other proofs, see Problems 8.18 and 827.

[^7]:    *This topic may be omitted.

[^8]:    ${ }^{\dagger}$ Compare the conditions (7.28) and (7.35).

[^9]:    *This section may be omitted

[^10]:    ${ }^{\dagger}$ For a related result, see Problem 25.19.

[^11]:    ${ }^{\dagger}$ See also Problem 11.1.

[^12]:    ${ }^{\dagger}$ On a field, countable additivity implies countable subadditivity, and $\lambda$ is in fact countably additive on $\mathscr{A}$-but $\mathscr{A}$ is merely a semiring. Hence the separate consideration of additivity and subadditivity; but see Problem 11.2.

[^13]:    ${ }^{\dagger}$ See also Problems 17.14 and 20.4
    ${ }^{\ddagger}$ An analogous fact was used in the construction of a nonmeasurable set on p. 45

[^14]:    ${ }^{\dagger}$ Birkhoff \& Mac Lane, Section 8.9

[^15]:    ${ }^{\dagger}$ See Hausdorff, p. 241.

[^16]:    *This topic may be omitted.
    ${ }^{\dagger}$ A Peano curve see Hausdorre, p 231 For the construction of simple curves of positive area, see Gribaum \& Oimstrid, pp. 135 ff .

[^17]:    ${ }^{\dagger}$ This is called the quantile function
    ${ }^{\ddagger}$ For the general case, see Problem 142.

[^18]:    ${ }^{\dagger}$ For the role of continuity, see Example 14.4.
    ${ }^{\ddagger}$ To write $F_{n}\left(a_{n} x+b_{n}\right) \Rightarrow F(x)$ ignores the distinction between a function and its value at an unspecified value of its argument, but the meaning of course is that $F_{n}\left(a_{n} x+b_{n}\right) \rightarrow F(x)$ at continuity points $x$ of $F$.

[^19]:    ${ }^{\dagger}$ The proof following (14.3) uses measure theory, but this is not necessary If the saltus $\sigma(x)=F(x)-F(x-)$ exceeds $\epsilon$ at $x_{1}<\cdots<x_{n}$, then $F\left(x_{i}\right)-F\left(x_{i-1}\right)>\epsilon\left(\right.$ take $\left.x_{0}<x_{1}\right)$, and so $n \epsilon \leq F\left(x_{n}\right)-F\left(x_{0}\right) \leq 1$; hence $[x \cdot \sigma(x)>\epsilon]$ is finite and $[x: \sigma(x)>0]$ is countable
    ${ }^{*}$ This topic may be omitted.

[^20]:    *This topic may be omitted.

[^21]:    ${ }^{\dagger}$ This theory is associated with the names of Fisher, Fréchet, Gnedenko, and Tippet. For further information, see Galambos.

[^22]:    ${ }^{\dagger}$ Although the definitions (15.3) and (15.6) apply even if $f$ is not measurable $\mathscr{F}$, the proofs of most theorems about integration do use the assumption of measurability in one way or another. For the role of measurability, and for alternative definitions of the integral, see the problems.

[^23]:    ${ }^{\dagger}$ Rudin $_{1}$, p. 76.

[^24]:    ${ }^{\dagger}$ For other definitions, see the first problem at the end of the section and the Note on terminology following it.

[^25]:    ${ }^{\dagger}$ See Problem 17.1.

[^26]:    ${ }^{\dagger}$ This provides another way of defining the Lebesgue integral on the line. See Problem 17.13.

[^27]:    ${ }^{\dagger}$ See Problem 17.11 for extensions.

