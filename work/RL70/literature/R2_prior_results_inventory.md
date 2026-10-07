# R2 — Inventory of what the repository has actually proved (RL70 Phase 0)

Status: NON-AUTHORITATIVE working note for RL70 (work/RL70/). Complete draft, 2026-10-06.
Method: repository reading only. No web retrieval, no computation, no script was run.
Nothing under authoritative/, sessions/, docs/ or AGENTS.md was modified.

Root: HC7 — every finite simple graph with chi = 7 has a K7 minor.
Notation: K7^- = K7 minus one edge; K7^= = K7 minus two disjoint edges; K7^vee = K7 minus two adjacent edges.
"Minimal counterexample" G: chi(G)=7, no K7 minor, every proper minor 6-colourable (7-contraction-critical; the repo calls this "full-C7 critical").

## 0. How to read this note

**Verification tags (about THIS worker's reading, not about the mathematics):**
- **[READ]** — the statement (and, where short, its proof) was read this session in the cited repo file.
- **[READ+RECHECKED]** — additionally the short proof was re-derived by hand by this worker and no error was found. This is a light independent pass, not a formal referee report.
- **[SUMMARY]** — taken from a repo summary (usually authoritative/RL63_SESSION_MATRIX.md); the frozen original was not opened.
- **[RECALLED]** — from this worker's memory of the literature; NOT in the repo; must be verified before use.

**Repo proof-state labels** are quoted as the repo records them (PROVED ANALYTIC, CONDITIONAL, CANDIDATE / NOT ESTABLISHED, Level A/B/C ...).
Mapping to the RL70 label set: the repo's "PROVED ANALYTIC" items of RL65–RL69 each had a written proof plus a same-session
adversarial red-team pass (RL65–RL67: multi-referee workflows; RL68/RL69: "analytic inspection only", sessions/RL68|RL69/checkpoint/*_RED_TEAM_RECORD.md).
None has an external or computational second check. Treat them as PROVED in the RL70 sense only after RL70's own referee pass if they become load-bearing.

**Files read in full this session.** authoritative/: START_HERE, RL70_STATE, RL70_FRONTIER_PUSH_BRIEF, PROOF_STATE_AND_OPEN_OBLIGATIONS,
HC7_RESEARCH_PROGRAMME, RL63_{GLOBAL_AUDIT_REPORT, SESSION_MATRIX, STRATEGIC_VERDICT, PROOF_VS_DISPROOF_ATTACK_MAP, HC7_DEPENDENCY_AND_SCOPE_AUDIT, ROUTE_PORTFOLIO_AND_KILL_LIST},
RL64_{REPORT, CLASSICAL_INPUT_TABLE, SOURCE_REGISTER, FRONTIER_OBSTRUCTION_MAP, ADMISSION_RECORD},
RL65_{REPORT, FALSIFICATION_TEST, LOCUS_ASSESSMENT, B65_BRIDGE}, RL66_{REPORT, C66_ASSESSMENT, FALSIFICATION_TEST, PAYOFF_CHAIN},
RL67_{REPORT, H67_ASSESSMENT}, RL68_{REPORT, C68_ASSESSMENT, FALSIFICATION_TEST}, RL69_{REPORT, C69_ASSESSMENT},
FAILURE_AND_LESSON_LEDGER.md entries FL-055..FL-070 (lines 2128–2890).
sessions/: RL52/checkpoint/RL52_REPORT.md; RL3/DEPENDENCY_MAP.md (A1–A9 rows); RL6/RL6_RECOVERY_REPORT.md (RL6-P03 and star-fold passage, lines 110–137);
RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md (P03, star-fold, C2, C3 rows); RL68 and RL69 red-team records; headers of the four Python scripts.

---

## 1. The certified frontier (what every minimal HC7 counterexample G is known to satisfy)

Source: authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md [READ].

| ID | Statement | Repo justification | Repo status |
|---|---|---|---|
| U1 | G finite simple, chi=7, no K7 minor, every proper minor 6-colourable | elementary (RL3 A1; RL52-C01) | certified |
| U2 | every proper subgraph 6-colourable; G connected; delta>=6 | elementary | certified |
| U3 | "A2": every 6-colouring of G-v uses all six colours on N(v) | RL3 A2 | certified, proved in-repo |
| U4 | alpha(G[N(v)]) <= d(v)-5 for every v | RL6-P03 "star-fold context" (= Dirac 1960 at k=7, RL64-SRC-02) | certified, proved in-repo |
| U5 | delta(G) >= 7 | RL52-C02 (U4 + K7-minor-freeness) | certified, proved in-repo |
| U6 | some vertex has degree 7, or delta >= 8 (trivial split; "degree-7 existence" is RETIRED as a target) | RL52-C03 | certified |
| U7 | G has a K4,4 minor | SRC-0025 Kawarabayashi–Toft 2005, title/abstract statement level, proof unread | certified at statement level |
| U8 | G has K7-{e,f} as a minor for every two distinct edges e,f (both K7^= and K7^vee). Holds for every graph with chi>=7; minimality not needed | F1 Thm 1.1 + F2 Thm 4, Level A statement, two unrefereed preprints, proofs unread, F1 discloses AI-generated proofs | certified at statement level |

Not certified:

| ID | Statement | Status |
|---|---|---|
| U9 | every graph with chi>=7 has a K7^- minor | CONDITIONAL on C68 (=C65^7) + F1 Thm 1.6 (Level A statement) via bridge B65^7 |
| S1 | G is 7-connected | Level B (three restatements of Mader; originals not inspected; FL-063). NOT consumed in the certified frontier |
| S2 | delta in {7,8,9}; 3n7+2n8+n9>=30; 7n/2<=e<=5n-15; n>=10 | Level C (Mader, Math. Ann. 178; located, not inspected). NOT used |
| S3 | n >= 13 | Level C (Gallai + HC6; not located). NOT used |

**Note for RL70 chunk B (small-order certificate).** The brief's pruning inputs "at most 5n-15 edges (Mader)" and "7-connected" are S2 (Level C)
and S1 (Level B) in the repo: neither statement has been inspected in a primary source by any session. RL70 suspends the admission levels as barriers,
but any certificate that prunes with them inherits "external theorem, statement not inspected in-repo" unless Phase 0 verifies it from source.
Only delta>=7, vertex-criticality, alpha(N(v))<=d(v)-5 and "N(v) is K6-minor-free" are proved inside the repo.

---

## 2. Reusable proved analytic results

### 2a. Universal facts about a minimal counterexample (proofs and dependencies of U3–U5)

| ID | Exact statement and proof (as recorded) | Depends on | File | Tag |
|---|---|---|---|---|
| A1 (U1) | A failure at fixed t yields a minor-minimal t-counterexample G in which every proper minor has chi<=t-1 and chi(G)=t. Proof: choose among minors with chi>=t (they stay K_t-minor-free); vertex deletion gives chi(G)<=t. No chromatic minor-monotonicity used. | nothing | sessions/RL3/DEPENDENCY_MAP.md row A1; rechecked in RL63_HC7_DEPENDENCY_AND_SCOPE_AUDIT.md §3 | [READ] |
| A2 (U3) | If G is C_t (chi=t, all proper minors (t-1)-colourable) then for every v, chi(G-v)=t-1 and every (t-1)-colouring of G-v uses all t-1 colours on N(v). Proof: chi(G-v)<=t-1 by criticality, >=t-1 since v adds one colour; a colouring missing a colour on N(v) extends to v. "This also holds for t-vertex-critical graphs." | A1 | sessions/RL3/DEPENDENCY_MAP.md row A2 | [READ+RECHECKED] |
| A3 | A rooted K_{t-1} model in G-v with every branch set meeting N(v) plus the singleton {v} gives a K_t model in G. | nothing | sessions/RL3/DEPENDENCY_MAP.md row A3 | [READ] |
| Star-fold (U4) | In every C_7 graph, alpha(G[N(v)]) <= d(v)-5 for every v. Proof: for an independent I ⊆ N(v), |I|>=2, contract the connected set {v}∪I; the proper minor is 6-colourable; pull the colouring back to H=G-v giving all of I the contracted vertex's colour; then N(v) uses at most 1+d(v)-|I| colours, while A2 needs 6. Singletons: d(v)>=6. | A1, A2 (uses 6-colourability of a proper MINOR, not only of subgraphs) | sessions/RL6/RL6_RECOVERY_REPORT.md line 133; ledger row "RL6-P03 star-fold context" in sessions/RL6/RL6_PROOF_STATE_AND_RESIDUAL_LEDGER.md | [READ+RECHECKED] |
| U5 (RL52-C02) | delta(G)>=7. Proof: d(v)=6 forces alpha(N(v))<=1, so N(v)=K6 and N[v]=K7. | star-fold, K7-minor-freeness | sessions/RL52/checkpoint/RL52_REPORT.md | [READ+RECHECKED] |
| Degree-7 corollary | At a degree-7 vertex the complement of G[N(v)] is triangle-free (alpha<=2). At degree 8: alpha<=3; degree 9: alpha<=4. | star-fold | RL6_RECOVERY_REPORT.md line 133; RL63 dependency audit §1.2 | [READ] |
| RL6-P03 (proper) | No C_7 graph has a degree-7 vertex whose neighbourhood's nonedge graph is a (possibly empty) matching. Proof: contract {v,x,y} for a missing pair xy, pull back, get five uniquely coloured roots plus x, build an S-rooted K6 via RL6-P02 (L_6 + F_6 ⇒ R_6: at most three Kempe-type repair paths), add {v}: a proper K7 minor. | A2, A3, RL6-P01/P02 | sessions/RL6/RL6_RECOVERY_REPORT.md lines 120–131 | [READ] (P02 construction not re-derived) |
| K6-minor-free neighbourhood | G[N(v)] has no K6 minor (else v plus it is a K7 minor). Recorded as an elementary observation, "not promoted". | nothing | RL63_HC7_DEPENDENCY_AND_SCOPE_AUDIT.md §1 item 2 | [READ] |
| RL4-P03 | Every chi=7 K7-minor-free G with chi(G-v)=6 for all v has no universal vertex in any G-v; hence d(u)<=n-3. CONDITIONAL on admitting HC6 (RST93, statement-checked). | HC6 (SRC-0003) | RL63_SESSION_MATRIX.md row 4 (original: sessions/RL4/PROOF_STATE_AND_RESIDUAL_LEDGER.md) | [SUMMARY] |
| RL6 C2 | In a C_t graph (t>=7), if A,B disjoint, all A–B edges present, B independent, X=V∖(A∪B): the sets N(y)∩X, y∈B, form an antichain; |B|<=2^{|X|}. | vertex-criticality | sessions/RL6/RL6_RECOVERY_REPORT.md line 65–67 | [READ] |
| RL6 C3 | One-defect clique separator exclusion (2<=|K|<=t-1, x–y path through each side), all C_t, t>=7. Vacuous under 7-connectivity. | proper-minor colourability | RL6 ledger row C3 | [READ, statement only] |
| RL12-P01 | No A/Q/B separator with 4<=|Q|<=t-1 and two disjoint nonedges plus paths, all C_t, t>=7. Vacuous at t=7 under S1. | — | RL63_SESSION_MATRIX.md row 12 | [SUMMARY] |
| RL14-P01 | "Kempe lock" — a classical vertex-critical Kempe fact, proved at Dcyc7 m=1 scope. | — | RL63_SESSION_MATRIX.md row 14 | [SUMMARY] |

### 2b. C68 / C69 mechanics (RL68, RL69) — directly reusable for RL70 chunk A

C68 (= C65^7): every 7-connected graph with n>=8 and |E|>=4n-2 has a K7^- minor. OPEN.
C69 (equivalent to C68): every 7-connected K7^- -minor-free graph with n>=10 and |E|>=4n-2 has an edge uv with |N(u)∩N(v)|<=3 lying in no 7-separator. OPEN.

| ID | Exact statement | Proof idea | File | Tag |
|---|---|---|---|---|
| n=8,9 bases | No C68 counterexample has n<=9. | n=8: 4n-2=30 > C(8,2)=28. n=9: 7-connected ⇒ delta>=7 ⇒ complement is a matching; |E|>=34 ⇒ at most 2 missing edges; delete one end of each ⇒ K7 subgraph. | authoritative/RL68_C68_ASSESSMENT.md §1 | [READ+RECHECKED] |
| Contraction edge identity | For an edge uv with c(uv)=|N(u)∩N(v)|: |E(G/uv)| = |E(G)| - 1 - c(uv). So c(uv)<=3 preserves the threshold: |E(G/uv)| >= 4(n-1)-2. | count merged edges | RL68_C68_ASSESSMENT.md §2 | [READ+RECHECKED] |
| 7-connectivity contraction criterion | G 7-connected, n>=10. Then G/uv is 7-connected iff no 7-vertex separator of G contains both u and v. | a separator of size <=6 in G/uv must contain the contracted vertex; un-contract. | RL68_C68_ASSESSMENT.md §3 | [READ+RECHECKED] |
| R68 | In a minimum-order C68 counterexample: n>=10 and every edge uv with c(uv)<=3 lies in a 7-separator. | else G/uv is a smaller counterexample (minor transitivity). | RL68_C68_ASSESSMENT.md §4 | [READ+RECHECKED] |
| Safe-edge equivalence | The safe-edge statement (C69) is EQUIVALENT to C68, not weaker. | minimum-order argument one way; vacuity the other. | RL68_C68_ASSESSMENT.md §6 | [READ] |
| Q10 stress test | Q10 = K10 - E(P8) (P8 a path on 8 of the 10 vertices): 38 = 4·10-2 edges, 7-connected, every edge has >=4 common neighbours, contains K7^- as a SUBGRAPH (x,y,p1,p3,p5,p7,p8), contains K6 (x,y,p1,p3,p5,p7). S={x,y,p4,...,p8} is a 7-separator whose induced graph contains K5 on {x,y,p4,p6,p8}; Q10-S has components {p2},{p1,p3}. So density+7-connectivity alone force neither a low-codegree edge nor L69-A/L69-B. | direct | RL68_C68_ASSESSMENT.md §5; RL69_C69_ASSESSMENT.md §4 | [READ+RECHECKED] |
| L69-A | G 7-connected, n>=8, G has a K6^- subgraph on a 6-set X ⇒ K7^- minor. | G-X connected nonempty; each x∈X has a neighbour outside (delta>=7, <=5 nbrs in X); X as singletons + G-X. | authoritative/RL69_C69_ASSESSMENT.md §2 | [READ+RECHECKED] |
| L69-A corollaries | In a 7-connected K7^- -minor-free graph: (i) no K6^- subgraph; (ii) no G[N(v)] contains a K5^- subgraph; (iii) if every edge has codegree >=4 then every G[N(v)] has min degree >=4 and is K5^- -subgraph-free. | (ii): v + K5^- = K6^-. (iii): deg in G[N(v)] of u is c(uv). | RL69_C69_ASSESSMENT.md §2 | [READ+RECHECKED] |
| L69-B | G 7-connected and K7^- -minor-free, S a 7-vertex separator ⇒ G[S] is K5-minor-free. Also: every component C of G-S has N(C)=S. | two components, each adjacent to all of S and mutually nonadjacent, plus a K5 model in S = K7^- model. | RL69_C69_ASSESSMENT.md §3 | [READ+RECHECKED] |
| 17-edge corollary | Such S has |E(G[S])|<=17. | every 7-vertex graph with >=18 edges has a K5 minor (complement <=3 edges; cover <=2 ⇒ K5 subgraph; else 3-matching aa',bb',cc' ⇒ bags {a,b},{a',c},{b'},{c'},{d}). | RL69_C69_ASSESSMENT.md §3 | [READ+RECHECKED] (not sharp — see §7 item D1) |
| K_{2×5} relaxed test | K_{2×5} contains K6^- (both vertices of one part + one from each of four others); it is 8-connected so the 7-separator test is vacuous. | direct | RL69_C69_ASSESSMENT.md §4 | [READ+RECHECKED] |

Recorded "exact remaining mechanism gap" (RL69_REPORT.md): (1) force an edge of codegree <=3 from K7^- -minor-freeness + density/connectivity;
(2) for a minimum counterexample, stop every such edge being trapped in a 7-separator whose induced graph is K5-minor-free.
RL69 stopped there because the next moves are separation/linkage/rooted-minor arguments (then barred by FL-068; un-barred in RL70).

### 2c. The bridge to U9

| ID | Exact statement | Status | File | Tag |
|---|---|---|---|---|
| Lemma B65.0 | If H is a minor of a finite graph G and H is not isomorphic to G then |V(H)|+|E(H)| < |V(G)|+|E(G)|. | PROVED ANALYTIC | authoritative/RL65_B65_BRIDGE.md | [READ+RECHECKED] |
| B65 | C65 + F1 Thm 1.6 ⇒ every finite simple graph with chi>=7 has a K7^- minor (⇒ U9). Proof: take a (|V|+|E|)-minimal K7^- -minor-free graph with chi>=7; all proper minors 6-colourable; F1 Thm 1.6 gives 7-connected and |E|>=4n-2; n>=8 (a 7-vertex graph with chi>=7 is K7); apply C65. | PROVED ANALYTIC, CONDITIONAL on C65 (conjecture) and F1 Thm 1.6 (Level A statement; proof unread; internally uses Level-B Mader 7-connectivity) | RL65_B65_BRIDGE.md | [READ] |
| B65^7 precision | B65 applies C65 only to a 7-connected graph with n>=8, so C65^7 = C68 suffices. | PROVED ANALYTIC, CONDITIONAL as B65 | authoritative/RL66_C66_ASSESSMENT.md §1 end | [READ] |
| U9 ⇒ U8 | K7^= and K7^vee are subgraphs of K7^-. Strictness not claimed. | elementary | RL65_B65_BRIDGE.md | [READ] |
| B65 = (C65 ⇒ F2 Conj 21) | F2 Conjecture 21: "Every graph with no K7^- minor is 6-colorable". | — | RL65_B65_BRIDGE.md | [READ] |

F1 Theorem 1.6 as quoted in the repo (F1.txt:109–111): "Let G be a K7− -minor free graph of chromatic number at least seven.
If every proper minor of G is 6-colorable, then G is 7-connected and |E(G)| ≥ 4|V(G)| − 2."
Per RL64_FRONTIER_OBSTRUCTION_MAP.md §1, its proof route in F1 §7 is: Mader 7-connectivity (Thm 7.1), Dirac (Thm 7.3), KT05 §2 (Thm 7.4: 7-vertex graph with alpha<=2 contains K4 or the Moser spindle),
Kriesell–Mohr (Thm 7.5), then Lemma 7.6 (every degree-7 vertex lies in a 5-clique) and Lemma 7.7 (at most one 5-clique) ⇒ at most five degree-7 vertices ⇒ |E|>=4n-2.
No session has read the F1 §7 proofs (RL65 red team scanned §7 for citations only).

### 2d. Rooted-graph (F1-interface) lemmas, RL65–RL67

Definitions (F1's, quoted in authoritative/RL65_LOCUS_ASSESSMENT.md §2 and RL67_H67_ASSESSMENT.md §1): a 5-rooted graph R has root set X, |X|=5;
n(R)=|V∖X|; rho(R)=#edges not inside X; rho4=rho-4n; m(R)=10-|E(R[X])|; a fragment Y is a nonempty set of non-roots with boundary ∂Y;
rho4(R,Y)=#(edges with an end in Y)-4|Y|; R is 4-light iff every fragment with |∂Y|<=4 has rho4(R,Y)<=0;
quite heavy iff rho4>=2, or rho4=1 and no non-root is adjacent to all five roots.
K6↓5 = 6-vertex 5-rooted graph: K5 on the roots plus one non-root adjacent to all roots. Vampire, K2,↓5: F1's Thm 2.9 outcomes (7 vertices, two non-roots p,q).
4-bilight (unrooted): no dense (<=4)-bifragment. (2.8^-): "4-bilight, n>=3, |E|>=4n-2 ⇒ K7^- minor" — NOT claimed, NOT assessed; it would imply C65.

| ID | Exact statement | Repo status | File | Tag |
|---|---|---|---|---|
| Step 0 identity | For any separation (A,B) with |A∩B|=5, m=10-|E(G[A∩B])|: rho4(R_AB)+rho4(R_BA) = |E(G)|-4|V(G)|+10+m. Hence |E|>=4n-2 ⇒ the two sides sum to >= m+8 (F1 has m+3 at 4n-7). | PROVED ANALYTIC | authoritative/RL66_PAYOFF_CHAIN.md Step 0 | [READ+RECHECKED] |
| G0 / T2.9^- false | T2.9^- ("4-light and quite heavy ⇒ rooted 7-vertex outcome missing at most one non-root edge") is FALSE. Counterpattern G0 = two-fanged vampire: independent roots x1..x5; p~X∖{x2}, q~X∖{x1}, pq; 9 edges; rho4=1; 4-light vacuously; quite heavy; K5(X)∪G0 ≅ K7^= has no K7^- minor. | PROVED ANALYTIC; METHOD BARRIER at lemma level only (does not refute C65) | RL65_LOCUS_ASSESSMENT.md §3–§4 | [READ] |
| Lemma D | R1, R2 5-rooted on a common X with disjoint non-roots; R1 has a rooted K6↓5; R2 is 4-light with rho4(R2)>0 ⇒ R1∪R2 has a K7^- minor. (Key step: a 4-light R2 with rho4>0 has a component C of R2-X with ∂C=X.) | PROVED ANALYTIC | RL65_LOCUS_ASSESSMENT.md §5 | [READ+RECHECKED] |
| Lemma F' | If R has tau(M)+1 pairwise disjoint full sets then R has a rooted K6↓5. (M = graph of missing root pairs, tau = vertex-cover number <= min(m,4); full set = connected set of non-roots with a neighbour at every root.) So 5 disjoint full sets always suffice. | PROVED ANALYTIC | authoritative/RL66_C66_ASSESSMENT.md §1 | [READ+RECHECKED] |
| Cor F'.1 | 4-light with rho4>0 ⇒ R-X has a full component. C66 holds when m=0. A C66 counterexample has m>=1 and 1 <= nu_full <= tau(M) <= 4. | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ] |
| Contraction formula | Contracting a root–non-root edge xv (T=N(x)∩N(v)): (rho4-m) changes by 3-|T|. | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ] |
| Lemma P / Cor P.1 | If root x has a unique non-root neighbour v then R/xv is 4-light, K6↓5 lifts, and (rho4-m) changes by 3-|T|. In a (|V|+|E|)-minimal C66 counterexample such x is adjacent to all other roots and v to all five roots. | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ] |
| Lemma S / Cor S.1 | R 4-light, Z a set of s non-roots, Y the other non-roots; if |N_X(Y)|<=4-s then rho4(R) <= |E(R[Z])|+|E(Z,X)|-4s <= C(s,2)+s. So contacts concentrated on <=3 non-roots are below the C66 threshold; on 4 non-roots give K6↓5. | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ] |
| Lemma K4r | G 3-connected (|V|>=4), u,v,w distinct ⇒ a K4 model with u,v,w in three distinct bags. Proof via a cycle through v,w in G-u and a 3-fan from u. | PROVED ANALYTIC ("textbook Menger/fan facts") | RL66_C66_ASSESSMENT.md §1 | [READ+RECHECKED] |
| E66 | Let G'=R+z' (z' adjacent exactly to X). (a) R has a rooted K6↓5 iff G' has a K7^- model with {z'} a bag. (b) |E(G')|-4|V(G')| = rho4(R)-m(R)-9, so rho4>=m+7 ⟺ |E(G')|>=4|V(G')|-2. | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ; (b) RECHECKED] |
| S66 | C66 ⇒ every 5-connected graph with a vertex of degree exactly 5 and |E|>=4n-2 has a K7^- minor (C65's degree-5 case). | PROVED ANALYTIC | RL66_C66_ASSESSMENT.md §1 | [READ] |
| P66a | Assume C66. Then no K7^- -minor-free graph has a 5-separation with both sides 4-light, one side rho4>=m+7 and the other rho4>=1. | PROVED, CONDITIONAL on C66 | RL66_PAYOFF_CHAIN.md Step 3 | [READ] |
| P66b | C66 + H54^- ⇒ no r=1 configuration in a minimal (2.8^-)-counterexample. | PROVED, CONDITIONAL on C66 and NOT-PROMOTED H54^- | RL66_PAYOFF_CHAIN.md Step 3 | [READ] |
| Lemma R67 | S1 4-light 5-rooted, G'=S1+z'. Every dense (<=4)-bifragment (S,T) of G' has z'∉S∪T, z'∈∂S∩∂T, |S∩X|>=2, |T∩X|>=2, no root of S adjacent to a root of T, and at most 3 boundary vertices of each side inside S1. | PROVED ANALYTIC | authoritative/RL67_H67_ASSESSMENT.md §2 | [READ] |
| Prop V67 | Any pair (S1,S2) satisfying H67's hypotheses makes G=S1∪S2 a (2.8^-)-counterexample (n>=8) and S1 a C66 counterexample. So H67 is refutable only together with (2.8^-) and C66. | PROVED ANALYTIC | RL67_H67_ASSESSMENT.md §3 | [READ] |
| G* | 15 vertices, 62 edges, 5-connected, satisfies every H67 hypothesis except K7^- -freeness (has a K7 minor, S1* contains K8); S1*+z' is NOT 4-bilight. So H67 without the forbidden-minor hypothesis is false. Weak: excluded by omega<=7 and by edge-minimality. | PROVED ANALYTIC (counterpattern to the relaxed statement only) | RL67_H67_ASSESSMENT.md §4 | [READ; edge count 62 RECHECKED] |
| G^x implication | In a minimal (2.8^-)-counterexample with an r=1 5-separation whose lighter side has a full component, G^x is not 4-bilight for every root x with deg_X(x) <= rho4(S1)-m-4 (in particular <=3). | PROVED ANALYTIC (with presuppositions) | RL67_H67_ASSESSMENT.md §5 | [READ] |
| P67 | H67 + H54^- ⇒ r=1 cannot occur in a minimal (2.8^-)-counterexample. | PROVED, CONDITIONAL on H67 (open) and H54^- (not promoted) | RL67_H67_ASSESSMENT.md §1, §6 | [READ] |
| Face argument | If some roots lie on a common face of a plane graph H, then H has no K4 model with four of those roots in distinct bags. | PROVED (elementary, uses planar ⇒ no K5 minor) | authoritative/RL66_FALSIFICATION_TEST.md preamble | [READ] |
| 2-apex K6↓5 criterion | For R = two apices a,b over planar P with X⊆V(P): R has a rooted K6↓5 iff (a) some P-x_i has a K4 model rooted at the other four roots, or (b) some P-x_i-x_j has a K4 model with the other three roots in distinct bags (fourth bag free). R is 4-light iff P is "2-sparse". | PROVED ANALYTIC | RL66_FALSIFICATION_TEST.md (ii) | [READ] |

### 2e. Elementary facts about named graph families proved in the falsification records (reusable as test oracles)

Source: authoritative/RL65_FALSIFICATION_TEST.md, RL68_FALSIFICATION_TEST.md [READ; models RECHECKED for K_{2×5}, C_n^4, K5□K5, K2,2,2,2, G_n].

| Graph | Proved facts |
|---|---|
| K6 | 5-connected; 15=4n-9 edges; no 7-vertex minor |
| x + T (apex over a 5-connected plane triangulation, |T|>=12) | 6-connected; 4n-10 edges; no K6 minor |
| F2's G_n (A = 4 universal vertices forming K4, G_n[B] a matching) | 4-connected, NOT 5-connected for n>=7; 4n+⌊n/2⌋-12 edges (>=4n-2 iff n>=20); no K7^- minor (direct proof). ⇒ 5-connectivity in C65 cannot be weakened to 4-connectivity |
| K2,2,2,2 | 6-connected; 24=4n-8 edges; no K7^- minor; best is K7^= |
| x,y + T (two adjacent apices over a 5-connected plane triangulation; n>=14) | 7-connected; 5n-15 edges; HAS a K7^- minor (K5^- model in T from a vertex link + two apices); NO K7 minor |
| K_{2×t}, t>=5 | connectivity 2t-2; 2t(t-1) >= 4n-2 edges; has K7^- (subgraph for t>=6; explicit 7-bag model for t=5) |
| C_n^4, n>=10 | 8-regular, 4n edges, 8-connected; K7^- model: singletons v0..v5 + {v6..v_{n-1}} |
| K5 □ K5 | 25 vertices, 8-regular, 100 edges, 8-connected; has a K7 minor (one row as 5 singletons + two full rows) |
| K2,2,2,2,1 | 7-connected but 32 < 34 edges — outside C68 |
| Q10 = K10 - E(P8) | see §2b |
| icosahedron | 5-connected, neighbourhoods are 5-cycles (used as standard fact P7) |

### 2f. Older scoped results (RL6–RL61) — valid at scope, no coverage bridge to HC7

All [SUMMARY] from RL63_SESSION_MATRIX.md unless noted. They are relevant only to RL70 chunk C (re-opened degree-7 / Kempe / K4,4 local work), and the brief requires reading FL-055..FL-062 first.

- **Degree-7 cyclic slice ("Dcyc7": d(v)=7, H=G-v, H[N(v)] = K7 - C7)**: RL7–RL9, RL11, RL13–RL19 (m=1), RL21–RL29 (m=2), RL31–RL39 (m=3 terminal core), RL41–RL49 (fixed triple / Kempe), RL51 (M3 dichotomy, ADMITTED/UNPROVED; RL51-P01 conditional payoff).
  Coverage gaps: (i) a degree-7 vertex need not exist; (ii) triangle-free non-matching complements other than C7 were never covered; (iii) resource-case exhaustiveness unproved; (iv) RL47–RL49 assume an unproved pivotal edge.
  RL31-P01 makes M3-CORE equivalent to emptiness of the retained configuration (a renamed root bridge).
- **Countermodels outside the minimal-counterexample class**: RL7 (SP_6 refuted on a 12-vertex witness), RL11 (MK2 false on an 18-vertex K), RL41-P01 (symbolic triple with no common J), RL6-P04 (C5∨C5 barrier).
- **K4,4 minimum-model results** [READ in ledger FL-056..FL-062]:
  - RL55-P01 (PROVED at minimum-total-size model scope): for a branch set X and the four opposite branch sets Y_j with T_j = vertices of X adjacent to Y_j, no proper nonempty connected subset of X meets all four T_j; every spanning tree of G[X] has at most four leaves.
  - RL56-P01 (PROVED, conditional): if disjoint adjacent connected P,Q outside the model each touch all eight branch sets then G has a K7 minor (K5 from A1∪B1, A2∪B2, A3∪B3, A4, B4 plus P,Q). Existence of P,Q: NOT ESTABLISHED.
  - RL59 valid step: for a spanning minimum K4,4 model with delta>=8, the 8-vertex quotient Q is a proper minor, hence 6-colourable, with disjoint A-side/B-side palettes. The lift to G is missing (FL-060).
  - RL61 barrier: chi(G) <= chi(G[A])+chi(G[B]) for every partition, so "side-chromatic sum <= 6" merely restates the root contradiction (FL-062).
  - RL57 three-vertex-path interface pattern: a method barrier only (every model vertex has 8 neighbours inside the model union while RL55-P01 holds).

### 2g. Open candidates and non-promoted readings (do NOT consume as proved)

| Item | Statement | Status |
|---|---|---|
| C65 = F1 Conj 1.5 | every 5-connected graph with n>=6 and >=4n-2 edges has a K7^- minor | CONJECTURE (F1 authors'); no falsifier among named families |
| C68 = C65^7 = C69 | 7-connected, n>=8, >=4n-2 edges ⇒ K7^- minor | OPEN; no falsifier; NO computational search ever run |
| C66 (= H65) | 4-light 5-rooted R with rho4>=m+7 has a rooted K6↓5 | OPEN; at least as strong as C65's degree-5 case (S66) |
| H67, Var, H67^G | S1+z' is 4-bilight in the r=1 configuration; minimality-assisted variants | OPEN; H67^G NOT ASSESSED beyond G* |
| H54^- | K7^- analogue of F1 Lemma 5.4 (both sides of every 5-separation of a minimal (2.8^-)-counterexample are 4-light) | NOT PROMOTED (reading-level only) |
| (2.8^-) | 4-bilight, n>=3, >=4n-2 edges ⇒ K7^- minor | not claimed, not assessed |
| T2.9^- at rho4>=2; r>=2 sub-cases; K7^- analogues of F1 Lemmas 5.9, 6.1/6.2, 6.4/6.6, Cor 6.7 | — | NOT ASSESSED |
| Uniform-threshold H65 (⌈(m+8)/2⌉) expected to fail on apex-over-planar | — | orientation note, NOT PROMOTED, untested |
| HC7-CRITICAL-7-CONNECTIVITY | every minimal HC7 counterexample is 7-connected | CANDIDATE / NOT ESTABLISHED in-repo (Level B source only); elementary separator proof stopped at colouring compatibility across a <=6 separator (RL62) |
| M3-CLIQUE-SEPARATOR-DICHOTOMY; RL56-C01..RL59-C01; HC7-K44-SPANNING-SIDE-CHROMATIC-SUM | — | UNPROVED / NOT ESTABLISHED |

---

## 3. Source register — every external theorem the repo depends on

Consolidated register: authoritative/RL64_SOURCE_REGISTER.md [READ]. Level A = statement inspected in a version-pinned primary text (proof NOT read);
Level B = inspected only as a restatement in a later paper; Level C = orientation only (excerpt/memory). RL70 suspends the levels as consumption barriers, not as honesty labels.

| Repo ID | Citation as recorded | Statement used | Level | Consumer in the repo |
|---|---|---|---|---|
| SRC-0025 | Kawarabayashi & Toft, "Any 7-chromatic graph has K7 or K4,4 as a minor", Combinatorica 25 (2005) 327–353, DOI 10.1007/s00493-005-0019-1 | chi=7 ⇒ K7 or K4,4 minor | A (title/abstract statement; proof unread; catalog entry stale "not_directly_checked") | U7 (RL54); RL55–RL61 K4,4 work |
| SRC-0003 / RES-0005 | Robertson, Seymour, Thomas, "Hadwiger's conjecture for K6-free graphs", Combinatorica 13 (1993) 279–361 | K6-minor-free ⇒ 5-colourable | A (statement, RL2) | RL4-P03; S3 |
| SRC-0004 | Robertson, Sanders, Seymour, Thomas, "The Four-Colour Theorem" (1997) | planar ⇒ 4-colourable | A (statement) | via HC6; RL64 reading that the 2-apex examples are 6-colourable |
| RL12-SRC-01 | Lafferty, Liu, Rolek, Yu, "Connectivity of contraction-critical graphs", arXiv:2509.07144v1, Thm 1.1 | for k>=7 every noncomplete k-contraction-critical graph is 7-connected (a restatement of Mader) | B | RL13-P00 (conditional) only; S1 |
| RL63-SRC-01 | W. Mader, "Über trennende Eckenmengen in homomorphiekritischen Graphen", Math. Ann. 175 (1968) 243–252, DOI 10.1007/BF02052726 | 7-connectivity of k-contraction-critical graphs, k>=7 (F1 Thm 7.1: "...other than Kk is 7-connected") | B (original never inspected; FL-063) | S1 (not consumed); internally inside F1 Thm 1.6 |
| RL64-SRC-01 | W. Mader, "Homomorphieeigenschaften und mittlere Kantendichte von Graphen", Math. Ann. 174 (1967) 265–268 | cited by F2 Thm 16 for the same 7-connectivity statement (F2 wording omits the K_k exception) | B; ATTRIBUTION DISCREPANCY with F1 | S1 attribution question SQ3 |
| RL63-SRC-02 | W. Mader, "Homomorphiesätze für Graphen", Math. Ann. 178 (1968) 154–168, DOI 10.1007/BF01350657 | expected: K7-minor-free, n>=6 ⇒ e<=5n-15 ("general knowledge, unverified") | C (located, not inspected; not cited by F1 or F2) | S2 — unused |
| RL63-SRC-03 (F1) | Z. Dvořák, S. Norin, N. Rahman, "Every graph with no K_7^= minor is 6-colorable", arXiv:2609.17760v1 (15 Sep 2026; manuscript 23 Aug 2026; 35 pp); PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907 | Thm 1.1 (K7^= -minor-free ⇒ 6-colourable); Thm 1.3 (5-connected, n>=6, e>=4n-7 ⇒ K7^=); Thm 2.8 (4-bilight version); Thm 2.9 (4-light quite heavy ⇒ vampire or K2,↓5); Thm 1.6 (bridge); Conj 1.4, 1.5; definitions | A (statement; unrefereed; §1.1 discloses AI-obtained proofs; depends on unrefereed [Dvo26]); full text NOT stored in repo (licence) | U8; B65/B65^7 (Thm 1.6); all RL65–RL67 rooted definitions; C65 |
| RL63-SRC-04 (F2) | S. Norin, A. Totschnig, "Every graph with no K_7^{\vee}-minor is 6-colorable", arXiv:2507.03244v1 (4 Jul 2025; 17 pp; CC BY 4.0); PDF sha256 14c465983a80a6f48e69b92d56c8d1d40c7428e495bc144ab322070478ca1245 | Thm 4 (K7^vee -minor-free ⇒ 6-colourable); Thm 6 (4-connected, e>=4n-8 ⇒ K7^vee unless K2,2,2,2); G_n example; Conj 19–21 | A (statement; unrefereed; proof unread) | U8; G_n family in RL65 |
| RL63-SRC-05 | Waterloo Graphs & Matroids seminar listing, A. Totschnig (Feb 2026) | announces the K7^vee result | C | orientation |
| RL63-GAP-01 | Gallai 1963 (k-critical on <=2k-2 vertices has disconnected complement) | with HC<=6 ⇒ n>=13 | C (NOT LOCATED) | S3 — unused |
| RL63-GAP-02 | Jakobsen 1971: Studia Sci. Math. Hungar. 6 (1971) 151–160; Aarhus Preprint Series 22 (1971) | no K7^vee and no K7^= minor ⇒ 6-colourable; K7^- -minor-free ⇒ 7-colourable (per F1) | B (F1 and F2 attribute the two-edge result to different Jakobsen items) | none (superseded by U8) |
| RL63-GAP-03 | small-graph verification / order lower bound for HC7 | — | NOT RETRIEVED (Q6 unanswered) | R20 disproof domain |
| RL64-SRC-02 | G. A. Dirac, J. Reine Angew. Math. 204 (1960) 116–131 | k-contraction-critical ⇒ alpha(G[N(v)]) <= deg v - k + 2 | B | none needed: equals U4 at k=7, proved in-repo |
| RL64-SRC-03 | RST93 items (2.4), (2.6) | crossing paths; rooted-K4 alternatives | B | only inside F2 |
| RL64-SRC-04 | L. K. Jørgensen, "Contractions to K8", J. Graph Theory 18(5) (1994) 431–448 | 4-connected, e>=4n-7 ⇒ K4,4 minor unless K7; Lemma 16(2); Lemma 17 | B | only inside F2 |
| RL64-SRC-05 | M. Kriesell, S. Mohr, "Kempe chains and rooted minors", arXiv:1911.09998 (2019), Lemma 2 | cycle of Kempe-adjacent distinctly coloured vertices ⇒ rooted C_k model | B | only inside F1/F2 |
| RL64-SRC-06 | Kawarabayashi, Luo, Niu, Zhang, European J. Combin. 26(3) (2005) 293–308 | (k+2)-connected, k>=5, three k-cliques with |L1∪L2∪L3|>=3k-3 ⇒ K_{k+2} minor | B | only inside F2 |
| RL64-SRC-07 | KT05 Lemma 3(i) | 7-contraction-critical, three 5-cliques pairwise meeting exactly in a 2-set Z ⇒ K7 minor | B | only inside F2 |
| RL64-SRC-08 | KT05 Section 2 | a 7-vertex graph with alpha<=2 contains K4 or the Moser spindle | B | only inside F1 (Lemma 7.6) |
| RL64-SRC-09 | Z. Dvořák, "Extremal function for rooted K5 minors", arXiv:2609.13818v1 (12 Sep 2026; 85 pp; CC BY 4.0; unrefereed) | abstract: 5-connected, >=4n-10 edges ⇒ any five vertices root a K5 minor (best possible); Thm 4, Cor 13, Cor 16 as restated in F1 | B (abstract metadata pinned; PDF never read) | F1 Thm 1.3 only; not used by B65 |
| RL64-SRC-10 | R. Fabila-Monroy, D. R. Wood, "Rooted K4-minors", Electron. J. Combin. 20(2) (2013) P64 | source of Dvořák Cor 13 | B | indirect |
| (surfaced, never opened) | arXiv:1402.2806 "Coloration of K_7^- -minor free graphs"; arXiv:1606.05507 Rolek–Song; arXiv:2208.07335; arXiv:2104.13519 | titles only | C | none |
| (background, not registered) | Albar–Gonçalves [AG18] K7-minor-free ⇒ 8-colourable; Rolek–Song–Thomas [RST23]; Song et al. t=8,9 relaxations | as mentioned by F1/F2 | not registered | none |
| RL5-SRC-01 | Dvořák–Swart (statement checked in RL5) | CR_6-related | checked-primary statement | none live |

Textbook facts used inside repo proofs without registration: Menger / fan lemma; two vertices of a 2-connected graph lie on a cycle; planar graphs have no K5 minor;
Euler's formula; outerplanar graphs have a vertex of degree <=2; a 5-connected plane triangulation has delta>=5 and >=12 vertices; deleting an edge lowers connectivity by at most 1; the icosahedron is 5-connected.

Open source questions recorded: SQ2 (inspectable Mader 178 / 5n-15), SQ3 (inspectable Mader 7-connectivity original; 174 vs 175), SQ4 (Gallai), SQ5 (small-graph/order bounds), SQ6 (F1 §2–6 lemma level and [Dvo26] PDF; partially resolved).
What has been READ of F1: §1, §2 definitions, §5 in full, §6 for proof order only, statements of Obs 4.1 / Cor 4.2, definitions at F1.txt:335–338, 383–387, 1061–1065. NOT read: proofs of Thm 2.9 (§4), §3, §7 (the proof of Thm 1.6).
AI-origin flags recorded for F1: Lemmas 4.5 and 4.9 (inside Thm 2.9's proof), the weaker form of Lemma 6.4, the idea of Lemma 6.6.

---

## 4. The two-apex density barrier and why K7^- → K7 has no mechanism

What the repo records:

1. **The family.** Two adjacent universal vertices x,y added to a 5-connected plane triangulation T (|T|>=12, n>=14). Proved in-repo (RL65_FALSIFICATION_TEST.md F-e; RL68_FALSIFICATION_TEST.md (a)):
   7-connected; exactly 5n-15 edges; contains a K7^- minor; contains NO K7 minor (at most two bags meet {x,y}, the other five would give a K5 minor of planar T).
2. **Source quote** (F1.txt:112–119, via RL64_FRONTIER_OBSTRUCTION_MAP.md §4): "a density result analogous to Theorem 1.3 is false for K7 -minor-free graphs ... making the 'final step' from K7− -minor-free graphs to K7 -minor-free graphs would be substantially more difficult."
3. **Consequence recorded.** No edge bound below 5n-15 can hold for 7-connected K7-minor-free graphs, so the two-part architecture of F1/F2
   ((A) colouring half giving an edge lower bound, (B) density half forcing the minor) cannot reach K7 (FL-065 lesson: do not pursue such an edge bound).
4. **It is a method obstruction, not a counterexample** (RL64 reading, "not a theorem"): these graphs are 6-colourable (4CT on T + two colours).
5. **Route state.** R21-K7 SUSPENDED "density documented false, no scoped mechanism"; open obligation O3: "A non-density mechanism for K7^- → K7. Unscoped."
6. **Why model-upgrade does not work (FL-055..FL-062, the recorded failure pattern).** Upgrading a near-K7 minor model (K4,4, or K7^=/K7^vee) by minimality of the model fails because:
   - contracting inside a branch set gives a proper minor that criticality says is 6-colourable — no contradiction (FL-056);
   - model size cannot be compared across different graphs; delta>=8 is not inherited by quotients (FL-056);
   - degree lower bounds count neighbours, not attachment types — the whole degree can be absorbed inside the model union (FL-057, FL-058);
   - a dense model union supplies the canonical K5 but no two further disjoint branch sets (FL-059);
   - a 6-colouring of the quotient does not lift to the side unions (FL-060); and any "side-chromatic sum <= 6" target just restates chi=7 (FL-062).
   Standing rule FL-065: "Do not upgrade a K7^= or K7^vee model to K7^- or K7 by model minimality."
7. **Literature state as recorded** (F2.txt:24–28 via RL64): Albar–Gonçalves: K7-minor-free ⇒ 8-colourable; "even the question whether every such graph is 7-colorable is open."
8. **Even full success of chunk A leaves HC7 one edge short**: C68 ⇒ U9 (K7^- minor) only (RL66_REPORT.md §8 chain-cost weighing).

For K7^- itself the recorded picture is different: F1's authors see "no fundamental obstruction"; the gap is exactly a density theorem (C65/C68), and F1's colouring half (Thm 1.6) already works under K7^- -minor-freeness.

---

## 5. Graph families already tested as potential falsifiers (do not re-test) and items flagged NOT ASSESSED

All tests were ANALYTIC (hand arguments). No family was ever tested by computer.

### 5a. C65 (5-connected, n>=6, e>=4n-2 ⇒ K7^-) — RL65_FALSIFICATION_TEST.md
| Family | Outcome |
|---|---|
| K6 | not a falsifier (15 < 22 edges) |
| apex + 5-connected plane triangulation | not a falsifier (4n-10 edges; no K6 minor) |
| F2's G_n | not a falsifier (not 5-connected for n>=7); shows 5-connectivity is necessary (4-connected K7^- -free with >=4n-2 edges for n>=20) |
| K2,2,2,2 | not a falsifier (24 < 30 edges; K7^- -free) |
| two adjacent apices + 5-connected plane triangulation | satisfies hypotheses, HAS K7^- ; K7-free |

### 5b. C68 / C69 (7-connected) — RL68_FALSIFICATION_TEST.md, RL69_C69_ASSESSMENT.md
| Family | Outcome |
|---|---|
| two adjacent apices over a 5-connected plane triangulation | consistent (has K7^-) |
| K_{2×t}, t>=5 (K_{2t} minus a perfect matching) | consistent (has K7^-) |
| C_n^4, n>=10 | consistent (has K7^-) |
| K5 □ K5 | consistent (has K7) |
| K2,2,2,2,1; 7-regular 7-connected graphs | below the edge threshold — outside C68, "do not test sharpness" |
| orders n=8, 9 | impossible as counterexample orders |
| Q10 = K10 - E(P8) | relaxed stress test only (has K7^-); shows connectivity+density force neither a low-codegree edge nor the L69 lemmas |
| K_{2×5} | relaxed test for L69-A (contains K6^-) |

### 5c. C66 (rooted) — RL66_FALSIFICATION_TEST.md
| Family | Outcome |
|---|---|
| (i) apex z over planar P (witness z + icosahedron, X=N(v)) | always below threshold (rho4<=m); never K6↓5; threshold-necessity witness only |
| (ii) two apices over planar P: (ii-1) P=T any roots; (ii-2) four roots on a 4-face; (ii-3) five roots on a 5-face; (ii-4) richness criterion | every tested member has K6↓5 |
| (iii) dense blob attached to X by a matching (incl. D=K_t, t>=6); sparse variants | reduces one-directionally to a "core" of surplus >=12 (cores NOT excluded); concentrated contacts excluded |
| (iv-a) t copies of G0 glued on X | K6↓5 once t>=tau(M)+1 |
| (iv-b) K2,2,2,2 with 5 roots (types 1, 2) and glued copies | K6↓5 already for one copy |

### 5d. H67 — RL67_H67_ASSESSMENT.md
- G* (15 vertices) refutes only the relaxed H67^0 (no forbidden-minor hypothesis). No genuine H67 instance known; "none was sought by computation".

### 5e. Flagged NOT ASSESSED / untested (explicit in the repo)
1. Family (ii) "all-components-poor regime" for C66 (open obligation O1a').
2. Family (iii): cores of surplus >=12 not excluded; unique-neighbour residual |T|=4 not excluded.
3. H67^G beyond the G* probe; an edge-tight (|E|=4|V|-2) or K7-subgraph-free counterpattern "was not constructed".
4. Uniform-threshold H65 on apex-over-planar with m>=8 — orientation only.
5. T2.9^- at rho4>=2; all r>=2 sub-cases; the K7^- analogues of F1 Lemmas 5.4 (H54^-), 5.9, 6.1/6.2, 6.4/6.6, Cor 6.7.
6. C65's degree-5 case: "its literature status was not assessed".
7. (P5) existence of 5-connected plane triangulations on arbitrarily many vertices, and the red-team remark that none exists on exactly 13 vertices — "orientation only; not re-verified".
8. Small-graph verification / order lower bounds for HC7 (RL63-GAP-03, Q6): never retrieved.
9. Sharpness of C68's constant: nothing at or just below 4n-2 with 7-connectivity was examined beyond K2,2,2,2,1 and 7-regular graphs. Whether C65^7 is strictly weaker than C65: "not claimed".
10. The repo contains NO record of testing C68 on: any exhaustive small-order range (n=10, 11, ...); complete multipartite graphs other than K_{2×t}; random or random-regular graphs; strongly regular / Kneser / Johnson / Cayley graphs other than C_n^4 and K5□K5; graphs glued along 7-separators; graphs with many degree-7 vertices at exactly 4n-2 edges. (A grep of authoritative/ for Petersen, Kneser, Paley, strongly regular, Cayley, circulant, Johnson, random, torus finds only the icosahedron and unrelated "random" process notes.)

---

## 6. Computation and tooling in the repository

**Tracked files** (git ls-files): 4740 .md, 1610 .json, 180 .jsonl, 123 .py, 5 .txt. No .rs, .g6, .cnf, .sage, .c/.cpp, .ipynb, DRAT/LRAT files are tracked anywhere.
Archive/ and knowledge/ each contain only a README.md. There is no .rl-work/ directory.

**The 123 .py files are copies of exactly four distinct scripts** (by git blob hash), all standard-library Python, all from RL2–RL8 and carried forward through the "incoming" snapshots up to RL30:

| Script (first location) | Blob | What it does |
|---|---|---|
| sessions/RL2/background/verification/verify_corpus.py (163 lines) | 2e210600 | Schema/consistency check of the RL2 literature catalogue. "This is not a mathematical proof verifier." |
| sessions/RL3/verification/verify_rooted_barrier.py (99 lines) + ROOTED_BARRIER_CERTIFICATE.json | aa525daf | Exact check of ONE labelled 9-vertex, 20-edge graph P: connectivity 4 (130 cuts), all 5^5=3125 rooted assignments ⇒ no K4 model rooted at x0..x3, chi=4. Contains small helpers `connected(part)` and `complete_model(parts)` (branch-set model checker). |
| sessions/RL7/verify_auxiliary_countermodel.py (127 lines) + AUXILIARY_COUNTERMODEL.json | 2c9dad3d | Checks one desk-derived 12-vertex RL7 witness (SP_6 countermodel); has `check_model(vertices, edges, branches, roots)`. |
| sessions/RL8/verify_uncolored_core.py (150 lines) + UNCOLORED_CORE_WITNESS.json | db1adb8d | Checks one explicit RL8 core/witness; same `check_model` helper. |

None is an HC7 certificate. RL63's audit: "no tooling for graph generation, SAT/ILP, chromatic-number certificates or minor testing. Mathematical computation since RL12 has been zero."
RL63–RL69 all ran with computation 0 and census 0. One process deviation: an RL67 referee ran an unrequested throwaway exhaustive/random check of Lemma R67 and of G* (0 violations); the script was not saved and no claim depends on it.

**The .json files** are manifests, snapshots and the three witness/certificate files above. **The .jsonl files** are the RL2 literature catalogue (SOURCE/RESULT/TOPIC/OPEN_CASE catalogues, glossary).

**RL70-era, untracked, NOT a prior-session artifact:** work/RL70/scripts/recon/recon.rs (496 lines, std-only Rust; plus recon.exe/.pdb). Per its header and main():
exact K_t-minor test by contraction search with memo and node limit, k-colourability, icosahedron / apex-join / complete-multipartite constructors, a random min-degree>=7 graph sampler, graph6 output;
modes `sanity` and `sample n trials [seed]`. work/RL70/logs/, certificates/ and notes/ are empty, so no output of this tool is recorded yet. It has no second implementation and is labelled "NON-AUTHORITATIVE scratch".
Local tooling per work/RL70/RUNNING_LOG.md: Python 3.12 (networkx 3.4.2, numpy, scipy), Rust 1.97.1, Node; NOT present: nauty/geng, any SAT solver, C compiler, Sage, WSL.

**Design notes already in the repo for a computational track** (RL63_PROOF_VS_DISPROOF_ATTACK_MAP.md §C): certificate stack (graph6 + SHA-256; explicit 7-colouring; DRAT/LRAT non-6-colourability; two independent K7-minor encodings or an exhaustive verifier in a second language; independent re-checker);
"smallest defensible complete finite domain" = graphs on n<=N vertices with delta>=7, 7n/2<=e<=5n-15, chi=7, vertex-critical (needs S2); neighbourhood catalogue sizes 1044 / 12346 / 274668 graphs on 7 / 8 / 9 vertices.

---

## 7. Discrepancies, caveats and surprises

- **D1 (worker observation; non-sharpness, not an error).** The "17-edge corollary" is elementary but not sharp. [RECALLED, not in repo] the classical extremal bound for K5 minors (K5-minor-free graphs on n>=3 vertices have at most 3n-6 edges; Wagner/Mader) would give |E(G[S])|<=15 for a 7-separator S in L69-B. This needs a source or a tiny exhaustive check over 7-vertex graphs before use.
- **D2.** Mader 7-connectivity is cited to two different papers (Math. Ann. 175 (1968) by F1/RL12/RL62; Math. Ann. 174 (1967) by F2), and F2's wording omits the "other than K_k" exception. No original was ever inspected (FL-063). Every use of "minimal counterexample is 7-connected" is Level B.
- **D3.** Jakobsen's two-edge result is attributed to different items by F1 and F2.
- **D4.** F1 Thm 1.6 — the only link from C68 to U9 — is Level A at STATEMENT level: unrefereed, AI-assisted proofs disclosed, its §7 proof never read in the repo, and it internally uses D2's Mader theorem.
- **D5.** Under the repo's own labels the RL70 brief's pruning inputs "e<=5n-15 (Mader)" (S2, Level C) and "7-connected" (S1, Level B) are not established in-repo.
- **D6.** RL63's attack map says "The four existing scripts are fixed-witness checkers"; more precisely three are fixed-witness checkers and one is a corpus schema checker (RL63 dependency audit §1.7 has it right).
- **D7.** PROOF_STATE lists RL65/RL66/RL67 results under "Retained scoped results" but RL68/RL69 results appear only in the classification-summary tables; their statements live in RL68_C68_ASSESSMENT.md and RL69_C69_ASSESSMENT.md.
- **D8.** U4's ledger name is "RL6-P03 star-fold context", a separate row from RL6-P03 proper; RL52 cites it as "RL6-P03" (citation-precision note recorded by RL63).
- **D9.** SRC-0025's catalogue entry still says not_directly_checked (stale); current authority treats it as checked at title/abstract statement level, full proof not reconstructed.
- **D10.** Correction C67-1 (the only correction RL63–RL69): any H67 instance refutes (2.8^-) and C66 (and C65 if 5-connected), contrary to a scope remark in the RL67 brief. No theorem demoted.
- **D11.** Every C65/C66/C68 falsification test was analytic on hand-picked families; "no falsifier found" carries no exhaustive content at any order n>=10.
- **D12.** RL63 records that 46 of 62 early sessions are "valid at scope and strategically irrelevant"; no mathematical correction or demotion was ever recorded in RL1–RL69.

---

## 8. Quick reuse map for RL70

- **Chunk A (C68 search / proof).** Use: n>=10 base; contraction identity; 7-connectivity criterion; R68; L69-A (no K6^- subgraph ⇒ cheap pre-filter: any 6-set spanning >=14 edges kills a candidate);
  L69-B + edge corollary (every 7-separator induces a K5-minor-free graph and every component of G-S is full to S); Q10, K_{2×5}, C_n^4, K5□K5, two-apex+icosahedron as test oracles with known answers;
  B65^7 for the payoff. Remember the payoff still rests on F1 Thm 1.6 (D4).
- **Chunk B (small-order HC7).** Proved in-repo pruning: vertex-critical, delta>=7, alpha(N(v))<=d(v)-5, N(v) K6-minor-free, RL6-P03 (degree-7 neighbourhood complement is triangle-free and not a matching), U8 (statement-level: contains every K7 minus two edges). External (unverified in-repo): 7-connected, e<=5n-15, n>=13.
- **Chunk C (minimal-counterexample structure).** Start from §2a; the K4,4 and degree-7 local records are in §2f with their FL barriers in §4 item 6.
- **Chunk E (verify F1 Thm 1.6).** Nothing of F1 §7 has been read; the citation list of §7 is recorded in RL65_B65_BRIDGE.md ("Mader, Dirac, KT05, Kriesell–Mohr, Menger and F1's internal Lemmas 7.2, 7.6 and 7.7").
