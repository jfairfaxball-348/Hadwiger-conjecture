# RL3 bridge ledger

Cutoff: 2026-09-30. Status: **CLOSED/FROZEN RL3 record; carried into incoming RL4.** Definitions M_t, R_s, C_t, F_s are in DEPENDENCY_MAP.md. Every graph below is finite and simple; graph order is unrestricted unless a bound is written.

## BR-00 — full contraction-critical completion

**Statement:** for every integer t>=7 and every G, C_t(G) implies M_t(G).
**Evidence/classification:** open obligation, root-equivalent after inherited cases t<=6 (A7). No project proof.
**Falsification:** no counterexample to its full premises/conclusion is produced. Necessary local conditions are not its full premise.
**Outcome:** useful coordinate, **equivalent reformulation; no obligation reduced**. All t>=7 and all graph orders remain.

## BR-01 — colorful-neighborhood completion

**Universal route statement:** for every s>=6, every H and every S subseteq V(H), F_s(H,S) implies R_s(H,S). In the minimal-counterexample application H=G-v, S=N(v), s=t-1; A2 independently supplies the premise and A3 retains exact order t.
**Evidence/classification:** conjecture / candidate lemma, known Holroyd strengthening; RL3-SRC-01. The contraction-critical-only completion coordinate is not a reduction in difficulty. The general colorful theorem adds a rooting demand to ordinary Hadwiger; it is not inherited as a theorem for s>=6.
**Falsification:** CM-R has chi(H_s)=kappa(H_s)=h(H_s)=s and |S_s|=s but no R_s(H_s,S_s). Its exhibited optimal coloring misses two colors on S_s, so it **does not** refute BR-01. It refutes omission of colorfulness. No countermodel satisfying F_s is found here; that is not evidence of truth.
**Outcome/residuals:** priority for a bounded admissibility assessment only. N1 fixes s=6 while preserving arbitrary H and every colorful S. Global CR_s for all s>=7 remains after a successful N1. New current-status gap RL3-GAP-01 remains.

## BR-02 — connectivity/unrooted model as a replacement

**Claimed statement:** for every s>=6, H and S subseteq V(H), if kappa(H)>=s, chi(H)=s, h(H)>=s and |S|>=s, then R_s(H,S).
**Evidence/classification:** **method barrier / dead route at exactly this scope**. CM-R is a countermodel for every s>=6, even with |S|=s and h(H)=s. See analytic lift and finite base certificate.
**Imported-tool check:** SRC-0012 v5 Lemma 5.14 supplies prescribed rooted order a under kappa>=a and a K_(2a) minor. For a=t-1 its larger minor is forbidden in a K_t-minor-free counterexample. It cannot fill the sharp bridge. Original-proof reconstruction is not claimed.
**Stopping rule:** do not revive the same-order arbitrary-root claim with more separate path calculations. Require a named new premise, such as genuine colorfulness, and reassess its exact sufficiency.

## BR-03 — structural dichotomy completion

Fix epsilon=1/4. The revalidated asymptotic RES-0030 yields a lower-threshold consequence: **there exists an integer T>=7 such that for every integer t>=T and every t-counterexample G**, at least one of:

* B_t(G): G contains a K_(a,b) subgraph with integer a>=floor((log t)^(1/4)) and b>=floor(exp(t^(3/4)));
* D_t(G): there exist v and a subgraph H subseteq G[N(v)] with |V(H)|<=t and |E(H)|>=t^(7/4).

T is uniform in G but has not been numerically extracted. log is natural. Rounding only makes the inherited asymptotic thresholds weaker for large t. This is an explicit quantified consequence, not the preprint's full sharper statement.

**Missing bridges:** (i) for every t>=T and C_t graph satisfying B_t, produce M_t; (ii) the same for D_t; (iii) exclude every C_t counterexample at every 7<=t<T. Each graph family still has unbounded order. A proved model construction for one OR branch leaves the other branch and prefix open.
**Falsification/classification:** CM-B refutes B_t(G)->M_t(G) without criticality; CM-D refutes D_t(G)->M_t(G). These are analytic method barriers. Their chi(G)<t prevents using them against the criticality-qualified bridges. The latter remain open obligations, not proved, false, or newly reduced.
**Additional guard:** the sides of a K_(a,b) **subgraph** need not be independent in G. Assuming independence, chromatic retention after extraction, or simultaneous external attachments would add unproved premises.
**Source limit:** SRC-0018 v1 Corollary 1.8 and its proof location revalidated; the full preprint proof was not independently certified. The asymptotic statement is not a t=7 theorem.

## BR-04 — linear-to-sharp upgrade

**Established transfer:** for the absolute C in RES-0012, [for every integer a>=3, every K_a-minor-free H with |H|<=Ca log^4(a) has chi(H)<=Ca] implies [for every t>=3, every K_t-minor-free G has chi(G)<=C^2 t]. This is inherited, with one C for the whole family.
**Missing statement:** a new theorem must justify the exact chi(G)<=t-1 conclusion from sufficient independent input; no general implication from C^2 t alone is supplied.
**Sufficiency attack/outcome:** substituting sharp local bounds chi(H)<=a-1 into RES-0011 only gives f_C<1 at fixed t and a bound below 2Ct, not t-1. No contradiction to a hypothetical t-chromatic counterexample follows. The gap is a scope/constant barrier, not a proof that sharper transfer is impossible. All unbounded t remain. Catalog OPEN-0003 and source gap OPEN-0008 persist.

## BR-05 — fractional or restricted-class transfer

**Required template:** specify predicates Q_t and a theorem, for every t>=7 and every C_t counterexample G, producing a graph/interface satisfying Q_t with enough retained sharp chromatic and attachment information; then prove a simultaneous model or sharp coloring theorem for that interface. Neither arrow is inherited for the general root.
**Evidence:** RES-0007, RES-0013, RES-0019–RES-0022, RES-0029. Fractional chi_f<=2(t-1) is not integral chi<=t-1; alpha-based h>=n/(2alpha-1) is not h>=chi; probability tending to one is not exhaustive graph coverage. A bounded-degree triangle-free theorem retains its degree condition.
**Classification/outcome:** open coverage/transfer/rounding obligations. The template is not a candidate theorem until Q_t and every preservation condition are supplied. OPEN-0004–OPEN-0006, including fractional freshness, remain.

## BR-06 — unavoidability and reducibility

**Quantified architecture:** for every t>=7 there is an explicitly specified configuration family F_t such that every C_t counterexample contains some configuration in F_t, and for every configuration in F_t a scope-matched reduction/extension excludes that counterexample. Each reduction must decrease a fixed well-founded measure and avoid consuming the desired conclusion.
**Evidence/classification:** candidate architecture / open obligations; fixed-case precedents RES-0006 and RES-0026 are inherited at their own scopes. No F_t or unrestricted coverage theorem has been constructed.
**Falsification/outcome:** a local reducibility catalog without the first universal assertion is incomplete coverage. No computation can promote it without a coverage theorem handling all t and residual parameters. Retain the fixed t=6 apex boundary; do not extrapolate it.

## BR-07 — forbidden strengthening substitutions

**Statements rejected as replacement objectives:** for all G, chi(G)>=t forces a K_t subdivision, odd K_t model, or dominating K_t model; sharp list-coloring substitutes list chromatic number for chi. They differ from ordinary M_t.
**Evidence/classification:** inherited variant counterexamples RES-0016, RES-0017, RES-0023–RES-0025; checked September 28 preprint RL3-SRC-02 for dominating models, with full-proof verification explicitly not performed. This is an external method barrier, not an ordinary-Hadwiger counterexample.
**Stopping rule:** adding all-vertex domination or parity to make assembly easier changes the target. If a restricted bridge genuinely uses such a condition, prove its restricted antecedent and distinguish it from the rejected unrestricted strengthening. No unrestricted substitution is authorized.

## BR-08 — extraction at the sharp critical density

**Available antecedent:** every C_t graph has minimum degree at least t-1, hence d(G)=|E|/|V|>=(t-1)/2. Indeed, a vertex of degree <=t-2 could be added to a proper (t-1)-coloring of G-v using a missing neighbor color.
**Imported conclusion and hypotheses:** RES-0014 needs integers k>=t>=3 and d(G)>=Ck for an absolute C>=1 to extract a small k-connected subgraph. The displayed criticality bound does not meet that threshold. K_t itself is C_t and has density (t-1)/2, refuting a claim that C_t alone implies this stronger density antecedent. It is not a counterexample at t and does not disprove a future counterexample-specific density theorem.
**Classification/outcome:** open obligation / scope barrier. Even when the extraction hypotheses do hold, RES-0014 does not promise chi(H)=chi(G), colorfulness on an inherited interface, or a complete rooted model. State and prove each preservation assertion before consuming it. Small size and high connectivity cannot silently supply sharp chromatic retention.

## Progress accounting

Closed at their actual scopes: the start gate, inherited package checks, the finite CM-R base verification, the three weak-premise falsifications, and the logical sufficiency checks A1–A6. Remaining: every universal sharp completion bridge. No route is promoted by lengthening its list of local consequences.
