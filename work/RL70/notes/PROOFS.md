# RL70 — written proofs for the reduction lemmas

Status: RL70 working note. Each statement carries its RL70 label. The label PROVED in the RL70
brief requires an adversarial referee pass; where that pass has not been run the label says so.

Conventions: graphs are finite and simple. A *minor* of G is obtained by deleting vertices,
deleting edges and contracting edges (removing loops and parallel edges). K7^- is K7 minus an edge.
"δ" is minimum degree, "α" independence number, N(v) the neighbourhood, N[v] = N(v) ∪ {v}.

## Lemma R (reduction to minimum degree 7)

**Statement.** Let N ≥ 1. Suppose there is a graph G0 on at most N vertices with χ(G0) ≥ 7 and no
K7 minor. Then there is a graph G on at most N vertices such that
(i) χ(G) ≥ 7; (ii) G has no K7 minor; (iii) every proper minor of G is 6-colourable;
(iv) δ(G) ≥ 7; (v) α(G[N(v)]) ≤ d(v) − 5 for every vertex v.

**Proof.** Among all minors of G0 with chromatic number at least 7 choose G with |V(G)| + |E(G)|
minimum. G is a minor of G0, so |V(G)| ≤ N and (minors of minors are minors) G has no K7 minor;
(i) holds by choice. A proper minor H of G (one not isomorphic to G) satisfies
|V(H)| + |E(H)| < |V(G)| + |E(G)| (RL65_B65_BRIDGE.md, Lemma B65.0) and is a minor of G0, so
χ(H) ≤ 6 by the choice of G: this is (iii).

*Claim A.* Let v ∈ V(G) and let I ⊆ N(v) be independent with |I| ≥ 1. Then |I| ≤ d(v) − 5.
Contract the connected set {v} ∪ I to a single vertex z. The result G' has fewer vertices than G,
hence is a proper minor and has a proper 6-colouring c'. Define c on G − v by c(x) = c'(z) for
x ∈ I and c(x) = c'(x) otherwise. c is proper: two vertices of I are non-adjacent; a vertex
y ∉ I ∪ {v} adjacent to some x ∈ I is adjacent to z in G', so c(y) = c'(y) ≠ c'(z) = c(x); other
adjacent pairs keep their distinct c'-colours. Under c the set N(v) receives at most
d(v) − |I| + 1 colours. If that number were at most 5, a sixth colour would be free for v and G
would be 6-colourable, contradicting (i). Hence d(v) − |I| + 1 ≥ 6. ∎

(v) is Claim A applied to a maximum independent set of G[N(v)] when N(v) ≠ ∅.

(iv). Let v ∈ V(G). G − v is a proper minor, so it has a proper 6-colouring; if d(v) ≤ 5 a
colour is free at v and G is 6-colourable, a contradiction. So d(v) ≥ 6 and in particular
N(v) ≠ ∅. If d(v) = 6: by Claim A every independent subset of N(v) has size ≤ 1, so N(v) is a
clique and N[v] induces K7, contradicting (ii). Hence d(v) ≥ 7. ∎

**Label.** PROVED — elementary (Dirac 1960 in the literature; proof written out here);
adversarial referee pass: see RL70 report §"referee status".

## Corollary S (what a small-order certificate must exclude)

If no graph on at most N vertices satisfies simultaneously δ ≥ 7, "no K7 minor" and
"not 6-colourable", then every graph on at most N vertices with χ ≥ 7 has a K7 minor
(HC7 holds for all graphs on at most N vertices). Immediate from Lemma R (i), (ii), (iv).

## Lemma E (edge-minimal reduction, used by tools A and B)

**Statement.** If a graph G on n vertices has δ(G) ≥ 7 and no K7 minor, then G has a spanning
subgraph G' with δ(G') ≥ 7, no K7 minor, in which every edge has an end of degree exactly 7; G'
has a vertex of degree exactly 7; and G is obtained from G' by adding edges, every intermediate
graph having δ ≥ 7 and no K7 minor.

**Proof.** Delete edges one at a time as long as the minimum degree stays ≥ 7. Every graph in
the sequence is a spanning subgraph of G, hence K7-minor-free. In the final graph G' no edge can
be deleted, i.e. every edge has an end of degree exactly 7. G' has at least 7n/2 > 0 edges, so it
has a vertex of degree exactly 7. Reversing the deletion sequence gives the last assertion. ∎

**Consequence.** The set c(n) of all K7-minor-free graphs with δ ≥ 7 on n vertices is exactly the
set of graphs reachable from the edge-minimal ones (tool A/B output) by repeatedly adding one edge
while staying K7-minor-free ("closure" step of census.rs / closure.rs).

**Label.** PROVED — elementary.

## Lemma L (lock lemma; not consumed by any RL70 certificate, recorded as a tool)

**Statement.** Let n ≥ 9 and assume every graph on n − 1 vertices with minimum degree ≥ 7 has a
K7 minor. Let G be a graph on n vertices with δ(G) ≥ 7 and no K7 minor. Then
(a) every vertex of G has a neighbour of degree exactly 7;
(b) for every edge uv, either u and v have a common neighbour of degree exactly 7, or
    d(u) = d(v) = 7 and N[u] = N[v].

**Proof.** (a) G − x has n − 1 vertices and no K7 minor, so δ(G − x) ≤ 6; only neighbours of x
lose degree, each exactly one. (b) G/uv has n − 1 vertices and no K7 minor, so some vertex has
degree ≤ 6 in G/uv. A vertex w ∉ {u, v} has degree d(w) − 1 if it is adjacent to both u and v and
d(w) otherwise. The new vertex has degree d(u) + d(v) − 2 − c with c = |N(u) ∩ N(v)| ≤
min(d(u), d(v)) − 1, so its degree is ≥ max(d(u), d(v)) − 1 ≥ 6, with equality iff
d(u) = d(v) = 7 and c = 6, i.e. N[u] = N[v]. ∎

**Label.** PROVED — elementary. With Certificate C13 its hypothesis holds for n = 14.

## Observation J (C68 and DNR Conjecture 1.5 at orders ≤ 20)

**Inherited input (NOT inspected in the original).** Jakobsen 1983, as quoted in Song–Thomas
(2006) and Rolek–Song (2017): every graph on n ≥ 7 vertices with at least (9n − 24)/2 edges has
a K7^- minor or is a (K_{2,2,2,2}, K6, 4)-cockade.

**Statement.** Every graph with 7 ≤ n ≤ 19 vertices and at least 4n − 2 edges has a K7^- minor;
every 5-connected graph on 20 vertices with at least 78 edges has a K7^- minor. Hence DNR
Conjecture 1.5 (repo C65) and its 7-connected case C68 hold for all n ≤ 20: the first open order
is n = 21, and only for 4n − 2 ≤ e < (9n − 24)/2.

**Proof.** 4n − 2 ≥ (9n − 24)/2 ⟺ n ≤ 20, with equality only at n = 20. Every cockade in the
class has exactly (9n − 24)/2 edges (K6: 15; K_{2,2,2,2}: 24; a 4-clique identification gives
n = n1 + n2 − 4 and e = e1 + e2 − 6). So for n ≤ 19 a graph with ≥ 4n − 2 edges has more edges
than any cockade and Jakobsen gives the minor. For n = 20 a cockade has more than one piece
(pieces have 6 or 8 vertices), so the identified K4 separates it: it is not 5-connected.
For n = 6 the hypothesis e ≥ 22 > 15 is void. ∎

**Corollary (relative to F1 Thm 1.6, Level A statement).** A minor-minimal non-6-colourable
K7^- -minor-free graph has at least 21 vertices and 4n − 2 ≤ e ≤ (9n − 25)/2.

**Label.** PROVED relative to two INHERITED statements (Jakobsen via secondary quotation;
F1 Thm 1.6). It supersedes the RL68 hand bases n = 8, 9 for C68.
