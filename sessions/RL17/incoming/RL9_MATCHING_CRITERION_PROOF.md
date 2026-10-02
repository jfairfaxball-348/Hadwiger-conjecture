# Self-contained perfect-matching criterion

Status: complete analytic reconstruction, RL9 CLOSED/FROZEN; same-worker review.
Admitted only at its exact stated matching-criterion scope.
This is the classical Tutte criterion, not a novelty claim. The proof below
is the load-bearing justification. No inaccessible primary text is consumed.

## Statement

For every finite simple graph L of even order, L has a perfect matching
if and only if q(L-X)<=|X| for EVERY X subseteq V(L), where q counts
connected components of odd order, and L-X is induced vertex deletion.
In RL9 this criterion is applied only to the ten-vertex graph K in P02.

## Necessity

In a perfect matching, an odd component of L-X cannot be matched entirely
inside itself. It has a matching edge to X. Distinct odd components require
distinct matched vertices of X. Thus q(L-X)<=|X|.

## Sufficiency

Assume the condition and suppose L has no perfect matching. Add edges on
the same vertex set until obtaining an edge-maximal graph Q with no perfect
matching. This finite maximal extension exists. Adding edges can only merge
components after any deletion X. Merging two odd components reduces their
odd-component count by two; any other merge does not increase it. Hence Q
still satisfies the condition for every X.

Let U be the vertices of Q adjacent to every other vertex. We first prove
that every connected component of Q-U is a clique. Otherwise a shortest
path between two nonadjacent vertices in such a component has three initial
vertices a,b,c with ab and bc edges and ac a nonedge. Since b is outside U,
some vertex d is nonadjacent to b. It is distinct from a,b,c. The two missing
edges ac and bd are disjoint.

By edge maximality, Q+ac has a perfect matching M_ac, necessarily containing
ac, and Q+bd has a perfect matching M_bd, necessarily containing bd. Their
union consists of alternating even cycles and shared matching edges. Both
added edges lie on alternating cycles, because neither can be shared.

If the two added edges lie on different cycles, use M_bd on the cycle
containing ac and M_ac elsewhere. This avoids ac and bd and gives a perfect
matching in Q, a contradiction.

If they lie on the same alternating cycle C, delete ac and bd from C.
The result is two vertex-disjoint paths, each with an even number of edges
and hence an odd number of vertices. Indeed one removed edge belongs to
each alternating matching, so each remaining path starts and ends with
opposite matching types. Each path has one endpoint in {a,c} and one in
{b,d}. Their endpoint pairings are either (a,b),(c,d), or (a,d),(c,b).
In the first case join the paths by the existing edge bc. In the second
case join them by the existing edge ab. Use that joining edge in a matching,
then match each remaining path after deleting its joined endpoint. Each
remaining path has an even number of vertices and is matched by successive
path edges, all present in Q. Use M_ac outside C. This gives a perfect
matching of Q, another contradiction.

Therefore every component of Q-U is a clique. Let r=q(Q-U). The assumed
condition with X=U gives r<=|U|. Match one vertex from each odd clique
component to a distinct vertex of U, using universality. Every remaining
component has even order and is matched internally as a clique. The
remaining |U|-r vertices of U also form a clique and have even order:
the even total order gives r congruent to |U| modulo two. Match them
internally. This is a perfect matching of Q, the final contradiction.

Thus L has a perfect matching. The proof covers every deletion set; it
uses no matching decomposition theorem, criticality or desired conclusion.

## Source inspection and scope limits

A new matching-theorem check was considered under RL9's explicit allowance
for a new external theorem. The 1947 Tutte bibliographic identity was read
at the publisher's page, DOI 10.1112/jlms/s1-22.2.107:
https://londmathsoc.onlinelibrary.wiley.com/doi/abs/10.1112/jlms/s1-22.2.107
The PDF route returned the metadata page, not the proof. Two author-paper
PDF mirrors of A Short Proof of the Factor Theorem failed (502 / unavailable).
The Cioaba-Murty PDF route redirected to an author's home page. No theorem
or full proof is classified as primary-text checked from these routes.

Exact new queries (2026-10-01; two, no further queries):

1. Tutte 1947 On the factorization of linear graphs theorem perfect matching odd components original paper
2. W T Tutte A short proof of the factor theorem 1954 Theorem A odd components

The second engine returned irrelevant results as well as matching-related
entries; irrelevant results were ignored. Exact direct opens were the Wiley
PDF URL, the web.eecs.umich.edu and ftp.eecs.umich.edu Tutte PDF mirrors,
and https://mast.queensu.ca/~murty/Cioaba-Murty.pdf. These are a check of one
new general matching criterion, not a replay of the CR_6/Holroyd source gate.
No original or current-status claim follows from failed retrieval.

T-008: the local pre-assessment record set a zero-query default and was not
amended before this explicitly permitted new-theorem check. This is a
process-record defect, not a mathematical scope error. Preserve the original
record and append this exact deviation. No unread theorem was consumed;
the complete independent analytic reconstruction above removes the external
proof dependency. No further search is scheduled. The inherited source
corpus, all sixteen unchecked labels and all original access limits remain
unchanged. Review is same-worker, with no formal or independent certification.
