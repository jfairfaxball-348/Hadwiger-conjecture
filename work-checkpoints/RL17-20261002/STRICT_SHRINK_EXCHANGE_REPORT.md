# RL17 strict-shrink resource exchange assessment

Date: 2026-10-02 Europe/Madrid.
Status: **RL17 OPEN; bounded assessment complete; NOT PROMOTED.**

## Outcome

The strict-shrink mechanism stops at its first mandated gate. The retained
full-critical/Kempe/resource facts do **not currently prove**
`y∉T`. Consequently RL17 does not choose a vertex
`z∈T-{x}`, does not form a candidate R_z for analysis, and does not invoke
minimum-cardinality to claim a contradiction.

This is an inconclusive missing implication, not a proved counterexample to
the implication in the full C_7 domain and not a Hadwiger counterexample.

## Retained facts

Keep exactly the inherited setup. T is a nonempty connected exterior
resource, minimum-cardinality among all resources in the m=1 S-complete
case. The fixed leaf x satisfies |T|>=2; B=T-{x} is nonempty and connected
but is not a resource because it fails cyclic coverage. For the private
endpoint a,

    N_H(a) ∩ T = {x}.

The fixed coloring d of G-x is proper. Put gamma=d(v), alpha=d(a), and
A_rho=N_G(x)∩d^{-1}(rho). In the failed-anchor branch
`C_a∩A_gamma=empty`, the fixed witness y lies in
`(A_alpha\C_a)\S`, hence y is an alpha-colored neighbor of x, y is in
V(H)\S, and y lies in a gamma/alpha component distinct from C_a. RL16-P01
proves that the exterior singleton {y} is not a resource.

## First gate: can y∉T be forced?

No retained implication excludes the case y∈T.

First, y is a vertex of G-x, so y!=x. If y∈T then necessarily

    y ∈ T-{x} = B.

This is exactly the location case already left open by RL16. It does not
contradict resource minimality: B is known to be a smaller connected
exterior set but is also known to fail cyclic coverage, so minimality has
no valid smaller resource to reject.

Second, the private-endpoint identity does not exclude y from T. If y∈T,
then N_H(a)∩T={x} merely gives ay∉E(H). That is fully compatible with the
fixed proper coloring, since d(a)=d(y)=alpha already forbids an edge ay in
G-x.

Third, the Kempe-component separation does not control membership in T.
C_a and the component containing y are components only of the
gamma/alpha-induced subgraph of G-x. By contrast, connectedness of H[T]
may use vertices of any colors and paths not contained in that bichromatic
subgraph. The guaranteed edge xy also disappears from G-x. Thus
`y∈T` does not itself create a gamma/alpha path from y to a or v and does
not merge the two components.

Fourth, S-completeness of T supplies boundary coverage but no rule saying
that an off-S alpha neighbor of x must lie outside T. Full criticality and
RL14-P01 provide the locked component and the witness, but the current
authority contains no additional T-membership exclusion theorem.

Therefore the assessment cannot establish y∉T. The branch y∈B remains
compatible with all currently proved consequences. No claim of semantic
independence from all full C_7 hypotheses is made; what is established is
the exact proof frontier of this authorized mechanism.

## Mandated stop

The RL17 brief requires y∉T to be proved before one additional vertex z is
chosen. Since that first gate is missing, the assessment stops now.

In particular, RL17 makes no claim about:
- existence of any suitable z;
- nonemptiness of R_z;
- connectedness of R_z;
- all-seven cyclic coverage by R_z;
- exterior/resource validity of R_z;
- strict size of R_z in the unresolved y∈T case;
- a contradiction from minimum-cardinality.

The conditional arithmetic already stated in the incoming brief, namely
|R_z|=|T|-1 when y∉T and z is a distinct deleted member of T-{x}, is not
used because its hypothesis has not been established.

## Classification and obligation accounting

No new positive mathematical theorem is promoted in RL17-U01. The outcome
is a **blocked/inconclusive analytic assessment at the first required
implication**, with same-worker review only.

RL16-P01 is preserved exactly. RL15-P01, RL14-P01, RL13-P00/P01/P02, every
earlier scoped result/countermodel/certificate, all inherited source limits,
and FL-001 through FL-019 retain their exact classifications.

No named mathematical obligation is reduced. The m=1 case, endpoint
anchoring, a second resource, BR-00, BR-01 universal coverage, general UP_6,
CR_6, ordinary order-seven coverage, all higher orders, and full sharp
Hadwiger remain open.

Mathematical numerical computation: 0.
New source queries: 0.
New source opens: 0.
No formal or external independent certification and no novelty claim.
Programme ACTIVE.
