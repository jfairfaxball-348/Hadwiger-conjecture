# RL23 fixed one-sided leaf-color compatibility assessment

Date: 2026-10-02 Europe/Madrid.
Status: bounded analytic work complete; RL23 OPEN / NOT PROMOTED.

## Exact conditional scope

Retain exactly the RL22 fixed choices described in WORK_UNIT_SCOPE.md. Work only under

    c(x)=beta=c(b).

The source coloring c is a proper six-coloring of H obtained from the same fixed permitted star minor. Because the repeated S-pair is the fixed cyclic nonedge f disjoint from e=ab, both a and b are singleton color classes on S and

    alpha=c(a) != beta=c(b).

No global uniqueness of alpha or beta outside S is part of the retained source-coloring facts.

## Properness at the one-sided leaf

The selected repair pattern gives

    xa in E(H), xb notin E(H).

Under c(x)=beta, the edge xa has endpoint colors beta and alpha. Since alpha!=beta, this edge is proper.

The pair xb is a nonedge. Therefore x and b may share color beta without violating properness. The statement that b is the unique beta-colored S vertex is only a statement about the restriction c|S; it does not forbid an exterior vertex such as x from carrying beta.

This is the first exact compatibility witness at the boundary-color interface.

## Rooted-tree and resource consequences

Let r be the unique neighbor of the leaf x in the fixed spanning tree of H[T_1]. Since x!=p, r lies in B and xr is an edge of H. Properness of the already fixed coloring therefore gives

    c(r) != beta.

This is consistent with c(x)=beta. Neither connectedness of T_1 nor the selected-defect identities force c(r)=beta.

Likewise:

- N_H(a) intersect B=empty and N_H(a) intersect T_2=empty constrain neighbors of a, not the color available at x;
- N_H(b) intersect B=empty and N_H(b) intersect T_2!=empty imply every actual T_2-neighbor of b has color different from beta by properness, but do not force any such vertex to be adjacent to x or to carry a color that contradicts c(x)=beta;
- connectedness/resource coverage of T_2 is incidence structure and supplies no fixed beta-colored x-neighbor;
- the fixed joining edge pq gives only c(p)!=c(q). It supplies no forced equality c(p)=beta or c(q)=beta and no forced edge from x to a beta-colored joining endpoint;
- RL21-P01/P02 and RL22-P01 add no further fixed-scope color identity involving x beyond those already listed.

Thus the permitted structure reaches no contradiction.

## First missing implication and stopping verdict

To contradict c(x)=beta using only properness, one would need a retained fixed-scope consequence that forces some neighbor of x to have color beta, or an equivalent color/incidence statement that makes beta unavailable at x.

No such consequence is present in the permitted premises.

Therefore the conditional equality c(x)=beta survives this bounded assessment in the precise sense required by the brief: the available fixed-scope consequences do not contradict it. This is not an existence proof for a new full C_7 critical graph or a claim that the branch occurs in every or any independently exhibited instance.

The already prepared recoloring a->beta cannot certify boundary compression in this branch: after recoloring, ax would have color beta at both endpoints because c(x)=beta. The assessment stops here and does not test any opposite orientation or second mechanism.

## Classification and obligation accounting

Classification: scoped analytic compatibility/stopping result with same-worker review only / method barrier.

Candidate FL-026 records that S-singleton color information does not globalize to exterior color exclusion and that connected resource structure plus the fixed joining edge supplies no replacement implication at this scope.

No correction or demotion is triggered. No named inherited mathematical obligation is genuinely reduced. The full m=2, A=S branch remains open, including this selected repair pattern. RL22-P01, RL21-P01/P02, FL-025, FL-024, the RL20 NONE result, FL-023, all inherited source/certificate limits, simultaneous-compatibility requirements, sharpness conditions and unbounded residual parameters remain unchanged.

New mathematical numerical computation: 0.
New mathematical source queries/opens: 0.
Programme ACTIVE.
