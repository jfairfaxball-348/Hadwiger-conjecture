# RL28 isolated work verification

Date: 2026-10-03 Europe/Madrid.
Status: RL28 OPEN / checkpoint verified / NOT PROMOTED.

BASE_HEAD/default branch remained

    3a90dd79fc56e9238c10229c0a32e3602bc16924

after the isolated checkpoint artifacts were written. No authoritative/default-branch file was mutated.

The required incoming authority was pinned by BASE_HEAD plus exact blob SHAs in INCOMING_SNAPSHOT.json. RL28 was confirmed unique and no unresolved start-gate integrity failure was found.

## Mathematical verification

The checkpoint report was read back from the isolated branch.

Verified scoped claims:

1. G-xz is a proper minor because exactly one edge is deleted from the finite simple graph G.
2. For the one fixed proper six-coloring d of G-xz, d(x)=d(z); otherwise restoring xz gives a proper six-coloring of G.
3. With delta=d(x)=d(z),

       d(N_G(x)\{z})=[6]\{delta}.

   If a non-delta color were absent, recoloring x with it and restoring xz would six-color G.
4. The retained repair pattern gives N_G(a) intersect R_1={x}, hence az is absent for z in R_1\{x}.
5. No retained premise identifies the independently fixed coloring d with the quotient coloring c that defines A, or locates the five d-color witnesses inside R_1/K. Therefore no upper bound on d_K(x) and no contradiction is certified.

The assessment stops at that first missing implication. No second consequence or fixed-choice substitution was used.

## Classification check

Candidate RL28-P01/P02 remain same-worker scoped elementary analytic mathematics, NOT PROMOTED until normal closeout.

Candidate FL-031 is a method-barrier/recovery lesson only.

Named mathematical obligations genuinely reduced: none.
Correction/demotion: NONE.
Saturation V(P)=T_2 excluded: no.
RL25 gate 1 resolved: no.
RL25 gates 2-6: NOT REACHED.
Minimum-total-size invocation in RL28: 0.
New mathematical sources: 0.
Mathematical numerical work: 0.

Programme ACTIVE.
