# RL3 sufficiency attacks and scoped proofs

Cutoff: 2026-09-30. Status: **NOT PROMOTED**. The following are elementary analytic reductions and method barriers, plus one exact finite base certificate. They establish no ordinary-Hadwiger counterexample and make no claim of research novelty.

## Shared complete-bipartite calculation

For integers 1<=a<=b, h(K_(a,b))=a+1. Let the sides be x_1,...,x_a and y_1,...,y_b. A model has mixed branches {x_i,y_i} for 1<=i<a, followed by {x_a} and {y_a}. They are connected, disjoint and all pairs are adjacent.

For the upper bound, a model with a+2 branches would have at least two branches avoiding the entire a-vertex side. A connected branch wholly in the independent b-side is a singleton, and those two branches cannot be adjacent. This contradiction proves the exact upper bound. No asymptotic density estimate is used.

Joining a universal clique Q of order q to a graph P increases h by exactly q: the lower bound joins singleton Q vertices to any model in P; for the upper bound, at most q disjoint branch sets meet Q and all others form a model entirely inside P. Also chi(Q join P)=q+chi(P).

## CM-B — huge bipartite side is not sharp completion

For every integer t>=7 set a=floor(sqrt(log t)), b=ceil(exp(t)), and G_t=K_(a,b). Then chi(G_t)=2 and h(G_t)=a+1<t. Its sides exceed the weaker thresholds in B_t of BR-03, regardless of how large the graph order becomes.

Thus the bare bipartite seed does not force M_t. The exponentially large side does not compensate for the small side's model capacity. This **does not** refute the bridge with C_t or chi>=t retained: chi(G_t)=2 violates those premises. The outcome is a method barrier for seed-only sufficiency, not a counterexample to the conjecture or to the inherited dichotomy.

## CM-D — nearly quadratic neighborhood edges are not sharp completion

For every integer t>=7 let p=floor(t/2), q=ceil(t/2), and G_t=K_1 join K_(p,q). The neighborhood of the universal vertex contains H_t=K_(p,q), with |V(H_t)|=t and |E(H_t)|=floor(t^2/4). For t>=4096 this is at least t^(7/4), so D_t(G_t) holds in the precise BR-03 form.

But chi(G_t)=3 and h(G_t)=p+2<t. More generally, for every epsilon>0 and all integers t>=max(7,ceil(8^(1/epsilon))), the neighborhood has at least t^(2-epsilon) edges and still fails to supply M_t. The unknown subpolynomial loss in an edge exponent is not an exact clique-size guarantee.

Again chi(G_t)<t prevents calling it a Hadwiger counterexample or a rejection of the criticality-qualified D bridge. Its role is to falsify that neighborhood density alone closes the bridge.

## CM-R — a sharp unrooted model and matching connectivity do not root it

### Exact nine-vertex base

Let P have vertices x_0,...,x_3, y_0,...,y_3, z. Subscripts are modulo four. Edges are x_i x_(i+1), y_i y_(i+1), x_i y_i, x_i y_(i-1), and z y_i, for every i. There are 9 vertices and 20 edges. The four x vertices form the root set X.

P has a planar embedding with X bounding the outer face: draw concentric squares, rotate the inner square by 45 degrees, add the two incident cross edges per outer vertex, and place z in the inner square. The explicit K4 model is {z}, {y_0}, {y_1}, {y_2,y_3}. Planarity gives h(P)<=4, so h(P)=4.

P is 4-connected. The supplied exact verifier checks **every** deletion set of size 0,1,2,3: 130 cases. Removing the four neighbors of x_0 disconnects P, establishing equality. The verifier also enumerates all 5^5=3125 assignments of the five nonroot vertices to four prescribed branch labels or “unused”; none is a rooted K4 model. This covers all X-rooted models: four disjoint branches meeting a four-element set must each contain a distinct root, so relabel by that root.

An independent analytic explanation of the rooted obstruction is useful. If an X-rooted K4 model existed, adding a new vertex adjacent to X in the outer face and making it a singleton branch would yield a K5 minor in a planar graph. Planar minors remain planar and K5 is not planar (its 10 edges exceed 3*5-6). This is impossible.

chi(P)=4. An optimal coloring gives y_i alternating colors 0,1, x_i alternating 2,3, and z color 2. In a hypothetical 3-coloring, the y cycle can only use the two colors other than z's color; it must alternate them. Every x_i is adjacent to both colors and would be forced to z's color, contradicting an outer-cycle edge. The finite verifier independently checks all 3^9=19683 candidate 3-colorings.

X is **not** colorful: the displayed optimal coloring uses only colors 2,3 on X.

### Universal lift

For every integer s>=4 let Q_s be a clique of order s-4, H_s=Q_s join P, and S_s=V(Q_s) union X. Then

* |S_s|=s, chi(H_s)=h(H_s)=s;
* kappa(H_s)=s;
* there is no S_s-rooted K_s model in H_s.

For connectivity, delete fewer than s vertices. If a Q vertex remains, it joins all remaining vertices. If all s-4 Q vertices are removed, at most three vertices of P are removed, leaving P connected. The neighborhood of x_0 has exactly s vertices and isolates x_0 when removed, so connectivity is exactly s.

For nonexistence of the rooted model, s disjoint branches meeting the s-element S_s must allocate its vertices bijectively. Each Q vertex lies in its own branch. Consequently none of the four branches rooted at X can contain any Q vertex. Those four branches would give an X-rooted K4 model wholly in P, contradicting the base obstruction.

This proof covers every s>=4, including s=t-1 for every t>=7. The **finite** certificate verifies only P; it is not an enumeration of all lifted orders. The separate analytic argument supplies the unbounded parameter coverage.

The displayed coloring of H_s still misses two colors on S_s. Adding v adjacent exactly to S_s produces a graph colorable with s colors: use one of those missed colors for v. Hence this family **does not satisfy the colorful premise** of BR-01. It refutes BR-02 and any claim that sharp connectivity plus an unrooted sharp model automatically gives simultaneous compatibility with required roots.

## Classification and reproducibility

| Item | Classification | Scope |
|---|---|---|
| Bipartite formula and CM-B/CM-D | Proved analytic mathematics supporting method barriers | All stated integer parameters; complete proofs above |
| CM-R finite base | Exact finite certificate | The single labeled 9-vertex P; all 130 deletion sets, 3125 model assignments and 19683 colorings |
| CM-R universal lift | Proved analytic mathematics supporting a method barrier | Every integer s>=4; analytic proof, not finite evidence extrapolated |
| BR-01 / CR_6 | Conjecture / candidate lemma and open obligation | No satisfying-premise countermodel, universal proof, or current-status certification produced |
| Ordinary sharp root | Open obligation | All t>=7 and arbitrary graph order |

Run `python3 -I verification/verify_rooted_barrier.py` from this checkpoint directory. It regenerates [verification/ROOTED_BARRIER_CERTIFICATE.json](verification/ROOTED_BARRIER_CERTIFICATE.json). The graph generator, domains, assignments and witnesses are explicit; there is no random sampling or omitted range. Code is proof support for the base, not a verifier for the root conjecture.
