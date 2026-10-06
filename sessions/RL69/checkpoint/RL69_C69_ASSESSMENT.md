# RL69 C69 assessment — safe-contraction mechanism

Status: CLOSED RL69 record on promotion.
Root: HC7 only.
Candidate C69: every 7-connected K7^- -minor-free graph G with n>=10 and |E(G)|>=4n-2 contains an edge uv with
1. |N(u)∩N(v)|<=3; and
2. no 7-vertex separator contains both u and v.

Classification: CANDIDATE / NOT ESTABLISHED / OPEN. No falsifier was found.

## 1. Frozen minimum-counterexample mechanism

RL68 proved:
- |E(G/uv)|=|E(G)|-1-|N(u)∩N(v)|;
- if |N(u)∩N(v)|<=3, the threshold 4n-2 survives contraction;
- in a 7-connected graph of order at least 10, G/uv is 7-connected iff no 7-separator contains u and v;
- R68: in a minimum-order C68 counterexample, every edge uv with |N(u)∩N(v)|<=3 lies in a 7-separator.

C69 is equivalent to C68, not a weaker dependency.

## 2. Lemma L69-A — six-vertex extension

**PROVED ANALYTIC.** Let G be 7-connected of order at least 8. If G contains a K6^- subgraph on a six-vertex set X, then G contains a K7^- minor.

Proof. Since |X|=6<7, G-X is connected; it is nonempty. Also δ(G)>=7, while each x∈X has at most five neighbours in X, so every x has a neighbour in G-X. Use X as six singleton branch sets and G-X as the seventh connected branch set. The seventh bag is adjacent to all six singleton bags, and among the six singletons at most one edge is missing. Hence they form a K7^- model. ∎

Consequences in a 7-connected K7^- -minor-free graph:
- no K6^- subgraph occurs;
- for every v, G[N(v)] has no five vertices spanning K5^-;
- if every edge uv has |N(u)∩N(v)|>=4, then every G[N(v)] has minimum degree at least 4 while remaining K5^- -subgraph-free.

The last item isolates a local low-codegree sub-obligation but is not promoted as a second candidate.

## 3. Lemma L69-B — 7-separator structure

**PROVED ANALYTIC.** Let G be 7-connected and K7^- -minor-free. If S is a 7-vertex separator, then G[S] is K5-minor-free.

Proof. Let C be any component of G-S. Its neighbourhood is contained in S. If N(C) were a proper subset of S, then |N(C)|<=6 and deleting N(C) would separate C from another component of G-S, contrary to 7-connectivity. Thus N(C)=S for every component C of G-S. Choose two distinct components C1,C2. They are nonadjacent to one another and each is adjacent to every vertex of S. If G[S] had a K5 minor, its five branch sets together with C1 and C2 would form a K7^- minor, contradiction. ∎

### Seven-vertex edge corollary

**PROVED ANALYTIC.** Every such separator satisfies |E(G[S])|<=17.

Proof. A graph H on seven vertices with at least 18 edges has complement with at most three edges. If those missing edges have a vertex cover of size at most two, deleting that cover leaves a K5. The only remaining case is three independent missing edges. Label them aa', bb', cc' and let d be the seventh vertex. Then the five branch sets {a,b}, {a',c}, {b'}, {c'}, {d} form a K5 minor. Therefore every 7-vertex graph with at least 18 edges has a K5 minor. Apply L69-B. ∎

## 4. Required relaxed falsification

The forbidden-minor hypothesis is genuinely load-bearing.

- Q10=K10-E(P8) contains a K6 (hence a K6^- subgraph): the two vertices outside P8 together with p1,p3,p5,p7.
- Q10 also refutes the relaxed separator lemma. Let S={x,y,p4,p5,p6,p7,p8}. Then Q10-S has components {p2} and {p1,p3}, while {x,y,p4,p6,p8} induces K5 in S.
- K_{2×5} contains K6^- by taking both vertices of one part and one vertex from each of four other parts. It is 8-connected, so the 7-separator test is vacuous there.

Thus neither local conclusion follows from connectivity/density alone.

## 5. Mechanism boundary

The new local information does not prove C69. A proof would still need to force a low-codegree edge from the neighbourhood restrictions and then escape the K5-minor-free 7-separator obstruction imposed by R68.

The natural continuations are linkage/rooted-minor or separation-density arguments. Under FL-068, extending such architecture in RL69 is forbidden. The drift boundary is therefore reached and RL69 stops here.

## 6. Frontier

- U1-U8: unchanged and certified.
- U9: remains CONDITIONAL on C68 plus F1 Theorem 1.6 at Level A statement.
- C68/C69: OPEN / NOT ESTABLISHED.
- S1: Level B and not assumed in the certified frontier.
- S2: Level C and unused.
- S4/U8: certified.
- K7^- target: still open.
- K7 density route: still blocked by the two-apex family.
- Corrections/demotions: NONE.
- Source-status changes: NONE.
- External retrievals: 0. Mathematical computation: 0. Census: 0.
