> **RL20 CLOSED/FROZEN — completed mandatory audit record.** This record is promoted as an audit finding/research-control decision only; RL20 promotes no new mathematical theorem. Original checkpoint status wording below is historical and preserved exactly in sessions/RL20/checkpoint/.

# Selected post-RL20 successor task — m=2 S-complete pair leaf-pruning gate

Status: **SELECTED BY RL20 AUDIT; NOT STARTED / NOT PROMOTED.**

This is the sole recommended discovery task after RL20 closeout. RL20 did not execute it.

## Domain

Keep the full C_7 degree-seven cyclic domain and RL13's maximum-cardinality / minimum-total-size partial resource family construction.

Work only in the untouched branch:
- m=2;
- family {T_1,T_2};
- U=T_1∪T_2;
- N_H(U)∩S=S.

T_1 and T_2 are disjoint resources and have at least one actual joining edge by the family definition.

## One bounded gate

Fix one actual joining edge pq with p∈T_1 and q∈T_2.

If |T_1|=1, stop immediately and record the singleton-side obstruction; do not switch resources in the same unit.

Otherwise choose a spanning tree Q_1 of H[T_1] rooted at p and choose exactly one leaf x≠p. Put B=T_1-{x}. Then B is nonempty and connected, and the fixed joining edge pq still joins B to T_2.

Because {T_1,T_2} has minimum total size among maximum size-two families, {B,T_2} cannot remain a valid size-two partial resource family. Disjointness, exteriority, connectedness of B and the joining edge are already preserved, so the only possible failure is that B is not a resource, i.e. B has a cyclic coverage defect.

Assess exactly the consequences of one such defect e=ab:
- use only that T_1 itself is a resource, the union U is S-complete, and T_2 remains a resource;
- classify how a,b can be repaired by x and/or T_2;
- test whether this one-sided private/repair pattern supports one scope-valid five-color boundary compression or one strictly smaller valid pair;
- stop at the first missing implication.

## Quantifier and compatibility guards

- One fixed family {T_1,T_2}.
- One fixed joining edge pq.
- One fixed rooted spanning tree Q_1 and one leaf x.
- One selected defect edge e.
- No simultaneous claim over all leaves, all joining edges, both resources, or multiple defect edges.
- Do not import the m=1 private identity N_H(a)∩T={x}; here T_2 may repair either endpoint.
- Do not splice different star colorings or residual blockers.
- Do not assume individual S-completeness of T_1 or T_2.
- No quotient-coloring lift without a proof.
- No second candidate mechanism in the same unit.

## Falsification / stopping criteria

Stop with a barrier if:
1. |T_1|=1;
2. the defect classification does not force enough endpoint incidence for a valid boundary recoloring;
3. a proposed smaller pair loses cyclic coverage in B;
4. a proposed coloring uses an equality pattern not licensed by one actual star-minor coloring;
5. any step needs a uniform blocker across choices.

Success means a rigorously scoped new implication that either:
- constructs a valid size-two pair of strictly smaller total size (contradiction), or
- reduces the m=2, A=S branch by a scope-valid boundary/augmentation theorem.

Anything weaker is recorded as structure only, not named-obligation closure.

## Bounds

Desk-based analytic assessment only by default.
New mathematical source queries: 0.
New source opens: 0.
Mathematical numerical computation: 0.
No m=1, m=3 or m=4 work in the same successor unit.
