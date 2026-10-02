# RL13-U02: leaf-private boundary compression and residual obstruction

Date: 2026-10-02 Europe/Madrid. RL13 remains OPEN / NOT PROMOTED.
One bounded analytic continuation of checkpoint
`bf6a4ad12bde1d20216b65dd9df51ea09930878e` on
`work/rl13-critical-resource-20261002`.

## Outcome and exact scope

**RL13-P02, proved scoped analytic mathematics in unpromoted work:** the
previously uncovered **m=1, S-complete minimum-resource** case admits a
proper six-label coloring of H[S union T] using exactly five colors on S.
The construction uses one actual original-G star-minor coloring and
recolors just one vertex of S. Every vertex of T retains its source color.

For each such constructed boundary there is an inextendible residual
component C. It has an explicit two-color attachment obstruction and one
of the following mutually exclusive augmentation defects:

1. C has an actual edge to T but misses both endpoints of some cyclic
   nonedge in its S-neighborhood; or
2. C has no edge to T and supports a path between the chosen private
   endpoints with all internal vertices in C.

In the second case no assertion that C is or is not a resource is needed.
The path does not supply an edge from C to T. In the first case an edge to
T does not supply the other cyclic coverage demands.

This is a necessary obstruction under the stated hypotheses, not an
example of a full-critical graph realizing them, and not a refutation of
augmentation as a possible theorem. The first missing independent step is
to eliminate these defects or construct another resource that avoids them.
Research stops at that step.

The domain is exactly the full C_7 cyclic degree-seven domain of the RL13
brief: G is finite simple, chi(G)=7, every proper minor is six-colorable;
v has degree seven; H=G-v; S=N_G(v)={u_0,...,u_6}; the only nonedges of
H[S] are e_i=u_i u_(i+1), with indices modulo seven. A2 supplies exact
chi(H)=6 and every proper H -> [6] uses all six colors on S.

A resource is a nonempty connected exterior vertex set whose neighborhood
in S meets every e_i. A partial family consists of disjoint resources with
an actual edge between every pair. Among families of maximum cardinality
capped at five, choose one of minimum total size. Assume its cardinality
is m=1, its sole member is T, and N_H(T) intersect S = S. Then T has
minimum cardinality among ALL resources: every resource by itself is an
admissible maximum family when m=1.

All statements below hold for every such G and chosen T. They concern one
leaf/coloring at a time; no simultaneous compatibility across different
leaves or different source colorings is asserted.

## 1. Minimality and private endpoints

The singleton case is impossible. If T={x} and N_H(T) intersect S=S,
then x is adjacent to all six colors occurring on S in any proper
six-coloring of H, so x has no permissible color. Thus |T|>=2.

Fix any spanning tree Q of H[T], and any leaf x of Q. Put B=T minus {x}.
Q-x shows B is nonempty and connected. If B were a resource, the family
{B} would have the same maximum cardinality and smaller total size.
Therefore B fails coverage: for some e_i=ab,

    N_H(a) intersect B = N_H(b) intersect B = empty.

Since T sees all of S, both endpoints have a T-neighbor, necessarily x.
The stronger private-endpoint identities are therefore

    N_H(a) intersect T = N_H(b) intersect T = {x}.             (1)

In particular xa and xb are actual edges. This uses S-completeness;
mere resource coverage would only require one of them.

For accounting, witnesses selected for distinct leaves cannot share an
endpoint: (1) would make that endpoint's unique T-neighbor two distinct
vertices. Thus their cyclic edges form a matching, and any such Q has at
most three leaves. This does not bound |T| or any internal path length.
No special tree shape is assumed in the coloring argument.

## 2. One actual star coloring gives the five-color boundary

Choose any cyclic edge f disjoint from ab. Such an f exists in the
seven-cycle. Contract the connected original-G star consisting of v and
the two endpoints of f. This is precisely one of the seven permitted star
types. The resulting proper minor J_f has a proper coloring into [6].
Choose ANY such coloring and pull it back to H, calling the result c.

The pullback is proper on H: the only identified H vertices are the two
nonadjacent endpoints of f, and every other H edge is constrained by the
minor coloring. By A2 all six colors occur on S. Seven S vertices in six
nonempty classes therefore have exactly one repeated pair, namely f.
Because f is disjoint from ab, set alpha=c(a) and beta=c(b); they are
distinct, and each occurs at just its indicated vertex within S.

Keep c on every vertex of (S union T) minus {a}, and set

    psi(a)=beta.                                               (2)

This is proper on H[S union T]. Only edges incident with a changed:

- Within S the only other beta-colored vertex is b, and ab is a nonedge.
- Within T the only neighbor of a is x by (1), and c(x)!=beta because xb
  is an actual edge in the original proper coloring c.

All other edges retain their original proper colors. On S the old pair f
remains repeated, the new pair ab is repeated, and the other three roots
remain singleton classes. Hence |psi(S)|=5. In particular the missing
alpha label may still occur on T; nothing requires T to use five colors.

Either orientation of ab works, using the same argument with a,b reversed.
No contraction of T or lift through its interior occurs. This is a local
recoloring, not a permutation of the source labels on all S. It therefore
does not contradict or alter RL13-P01's recorded A=S permutation barrier.

## 3. A fixed-boundary residual obstruction must exist

Let R=V(H) minus (S union T). For a component C of H[R], define the exact
fixed-boundary lists

    L_psi(z) = [6] minus {psi(w): w in N_H(z) intersect (S union T)}
    for z in C.                                               (3)

If every residual component had a proper coloring from these lists, the
colorings would combine with psi: distinct residual components have no
edges between them. This would give a proper H -> [6] with only five
colors on S, contrary to A2. Thus R is nonempty and at least one component
C is not colorable from (3). Choose any such C.

The original c|C was proper and compatible with the source boundary.
The only boundary change is (2). Consequently C has a neighbor of a whose
source color is beta; otherwise c|C itself would still extend psi.

## 4. The blocker has a precise two-color attachment

For a set W write W_alpha={z in W:c(z)=alpha} and similarly W_beta.
Consider the components D of H[C_alpha union C_beta]. Call D affected
when D_beta meets N_H(a). For an affected D, the possible obstructions to
swapping alpha and beta on D, while keeping the boundary psi fixed, are
exactly these actual edges:

    E_H(D_alpha, {b} union T_beta), or E_H(D_beta, T_alpha).    (4)

Here E_H(X,Y) denotes the set of edges with one end in X and the other in
Y. At least one affected D has a nonempty edge set in (4).

Proof: suppose no affected D has any edge in (4). Swap alpha and beta on
every affected D inside C, leaving every other C color fixed. These are
whole two-color components, so internal C edges remain proper. Every
beta-colored neighbor of a changes to alpha; originally a had color
alpha and had no alpha-colored neighbor. Thus all edges to a are proper
against its new color beta. No root except a,b uses alpha or beta after
(2), so other S edges are safe except possibly those to b. A swapped
alpha vertex now has beta and can conflict only with b or T_beta; a
swapped beta vertex now has alpha and can conflict only with T_alpha.
Exactly those edges were excluded by (4). Unchanged vertices retain their
original compatibility, and the only changed-boundary conflict, at a,
has been repaired. The resulting coloring extends psi to C, contradicting
the choice of C. This proves (4).

This is a necessary attachment obstruction to this explicit repair.
The presence of (4) alone is NOT asserted to characterize all list
uncolorability; C's uncolorability was separately established by (3).

If E_H(C,T) is empty, (4) must include an edge from D_alpha to b. Since
D is connected and also has a beta vertex adjacent to a, it gives a
simple a-b path with all internal vertices in C, using just alpha,beta.
Both endpoints lie in S. Neither their common neighbor x in T nor this
path supplies a direct C-T edge.

If E_H(C,T) is nonempty, C cannot be a resource: otherwise {T,C} would be
a family of size two, contradicting m=1. Hence some e_k has no endpoint
neighbor in C. Because C has a neighbor of a, e_k is not incident with a.
This proves the exclusive alternatives stated at the start.

## 5. First missing implication and stopping frontier

The proved data do not supply the following still-needed independent
implication: a residual connected set disjoint from T can be chosen with
BOTH cyclic coverage for all seven e_i AND an actual joining edge to T.

A list obstruction, or the path in the no-joining-edge case, does not
prove that conjunction. In the joining-edge case the missing coverage is
explicit. In the other case even full coverage would leave the joining
edge absent. Adding x to the residual set would destroy disjointness from
T. Different leaves, source stars and source colorings may have different
blocking components; their separate certificates cannot be spliced.

This is the first unresolved augmentation implication of this mechanism.
No attempt is made after this point to prove all blockers impossible,
shrink T through an unjustified coloring, exchange resources, combine
leaf witnesses, or start another route. In particular no assertion is
made that an arbitrary quotient coloring lifts to H.

## 6. Coverage, verification status, and obligation accounting

The quantifiers cover every minimum resource in the stated m=1 case,
every spanning-tree leaf, every private edge supplied by (1), every
disjoint permitted star type f, every actual J_f coloring, and either
orientation of the private edge. The component C and D can depend on all
those choices. There is no uniform component or simultaneous leaf claim.

All graph order, resource size, spanning-tree shape, internal path length,
residual-component number and size, attachment data, and coloring choices
remain unbounded. No graph or coloring census was used. At most the seven
original star types occur symbolically; no extra minor type was used in
this unit. Mathematical numerical computation: 0. New source queries: 0.
New primary-source opens: 0. The proof does not use RL12-SRC-01; its
inherited m=0 use and verification status are unchanged.

The recorded RL13 **m=1, A=S boundary-coloring subcase is reduced**:
its five-color boundary is now constructed, and its residual blocker is
classified. This does NOT exclude m=1 or construct a second resource.
The m=2,3,4 S-complete union cases are untouched.

**No named inherited universal mathematical obligation is reduced.**
BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven
coverage, all higher orders and full sharp Hadwiger remain open here.
RL13-P01, RL13-P00 and all inherited results, countermodels and source
limits retain their exact classifications. The original P01 report is
preserved byte-identically.

Classification is a complete scoped analytic proof with same-worker
review only, not formal checking or external independent certification.
No novelty claim, full-domain counterexample, or root outcome is claimed.

The next prepared task uses a genuinely additional full-critical input,
an actual coloring of G-x, to assess one leaf-insertion recoloring gate.
It is NOT STARTED; see NEXT_RECOVERY_TASK.md. RL13 remains OPEN and the
programme ACTIVE. Further work would require a new independent step;
it makes sense to finish up here
