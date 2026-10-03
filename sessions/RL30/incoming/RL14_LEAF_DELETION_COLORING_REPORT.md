> **RL14 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint text follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL14_SESSION_STATE_AND_RL15_KICKOFF.md and RL15_MIXED_KEMPE_COMPONENT_RESOURCE_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL14/checkpoint/. No RL15 work has begun.

# RL14 leaf-deletion coloring / one-component Kempe insertion assessment

Date: 2026-10-02 Europe/Madrid. RL14 OPEN; complete bounded analytic checkpoint, NOT PROMOTED.

## Outcome

The prepared one-component insertion mechanism is **blocked in every palette by vertex-criticality itself**. More precisely, for the actual six-coloring d of G-x and gamma=d(v), no single gamma/delta Kempe-component swap, for any delta!=gamma, can make gamma absent from N_G(x). This remains true even if the requirement that the swapped component avoid v is dropped.

This is a scoped negative result about the proposed recoloring mechanism. It does not exclude m=1, construct a second resource, produce a clique minor, or give a counterexample to Hadwiger.

## Exact setup retained

Retain the full C_7 degree-seven domain and the m=1 minimum S-complete resource T from the RL14 brief. Fix a spanning-tree leaf x and private endpoints a,b with

    N_H(a)∩T = N_H(b)∩T = {x}.

Let d be an arbitrary actual proper six-coloring of G-x and put gamma=d(v). Since v is adjacent exactly to S, gamma is absent on S. No favorable choice of d is made.

For any color rho define

    A_rho = N_G(x) ∩ d^{-1}(rho).

Because chi(G)=7, every one of the six colors used by d occurs in N_G(x). Otherwise a missing color could be assigned to x, producing a proper six-coloring of G. In particular A_gamma is nonempty and, for every delta!=gamma, A_delta is nonempty.

## Exact one-swap criterion

Fix delta!=gamma and let Q_delta be the subgraph of G-x induced by vertices colored gamma or delta. A swap on one connected component K of Q_delta changes gamma to delta and delta to gamma on K.

After this swap, gamma is absent from N_G(x) **if and only if**

1. A_gamma is contained in K; and
2. K is disjoint from A_delta.

If the RL14 restriction is imposed, one additionally requires v notin K.

Necessity is immediate: any gamma-neighbor of x outside K stays gamma, and any delta-neighbor of x inside K becomes gamma. Sufficiency is also exact. A whole bichromatic-component swap preserves propriety: internal edges remain bichromatic, an outside vertex colored gamma or delta cannot be adjacent into K without belonging to the same component, and edges to other colors remain proper. If (1)-(2) hold, no neighbor of x is gamma afterwards, so assigning gamma to x would produce a proper six-coloring of G.

Thus any successful RL14 insertion is equivalent to the existence of such a safe component.

## Critical Kempe-lock lemma

For every pair of distinct colors p,q in d, some p/q Kempe component meets both A_p and A_q.

Proof. Suppose no p/q component meeting A_p also meets A_q. Swap p and q simultaneously on every p/q component that meets A_p. These components are disjoint and none contains a q-colored neighbor of x. Hence every p-colored neighbor of x changes to q, while no q-colored neighbor of x changes to p. The result is another proper six-coloring of G-x with color p absent from N_G(x). Assigning p to x then six-colors G, contradicting chi(G)=7. Therefore such a mixed component exists.

Apply this with p=gamma and q=delta. Let M_delta be a gamma/delta component meeting both A_gamma and A_delta.

## Failure of every permitted palette

Assume a single gamma/delta component K could satisfy the one-swap criterion. Since A_gamma is contained in K, the mixed component M_delta meets K in a gamma-neighbor of x. Components of Q_delta are disjoint, so M_delta=K. But M_delta also meets A_delta, contradicting criterion (2).

Therefore no such K exists for this delta. The argument is identical for each of the at most five choices delta!=gamma.

The conclusion is stronger than the prepared gate requested: no one-component gamma/delta swap can free gamma at x even if K is allowed to contain v. Hence the additional "avoiding v" condition cannot rescue the mechanism.

## Role of the private endpoints

The identities for a,b remain valid and useful inherited structure, but they do not defeat the Kempe lock. They say that a and b have no neighbor in T-{x}; they do not control gamma/delta connectivity through S, residual components, or other exterior vertices.

For delta=d(a), any safe component would have to avoid a because a is a delta-colored neighbor of x; for delta=d(b), it would have to avoid b. Criticality nevertheless forces a mixed gamma/delta component meeting some delta-neighbor of x, which need not be the private endpoint. If d(a)=d(b), the same observation applies to both. Nothing in the private-endpoint identities forces the mixed component to use, avoid, or terminate at a or b.

Thus the first required independent component-incidence implication for the prepared mechanism would be:

    for some delta!=gamma, all gamma-neighbors of x lie in one
    gamma/delta component K and K contains no delta-neighbor of x.

The critical Kempe-lock lemma proves the negation of this conjunction for every delta.

## Precise remaining obstruction

For each of the five palettes {gamma,delta}, there is a gamma/delta component meeting N_G(x) in both colors. Equivalently, every palette is Kempe-locked at x. If the gamma-neighbors occupy more than one gamma/delta component, one swap cannot remove them all; if they occupy one component, criticality forces that component also to contain a delta-neighbor, which would become a new gamma-neighbor after the swap.

This is the exact stopping frontier. No second recoloring mechanism is started.

## Classification and obligation accounting

RL14-P01: the one-swap criterion and the critical Kempe-lock obstruction above are proved scoped analytic mathematics, same-worker review only. No formal checker or external independent certification is claimed. No novelty claim is made.

The RL14 candidate mechanism is decisively assessed negatively. No named inherited mathematical obligation is reduced: BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order-seven coverage, all higher orders, and full sharp Hadwiger remain open. The m=1 case remains unresolved; no second resource or exclusion of m=1 is obtained. The m=2,3,4 S-complete cases remain untouched.

RL13-P00/P01/P02, all inherited source limits, countermodels, certificates, and FL-001 through FL-016 retain their exact prior classifications. Mathematical numerical computation, new source queries, and new source opens are all zero.

Programme active.
