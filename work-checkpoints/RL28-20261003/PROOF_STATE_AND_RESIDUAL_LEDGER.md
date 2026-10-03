# RL28 checkpoint proof state and residual ledger

Date: 2026-10-03 Europe/Madrid.
Status: RL28 OPEN / bounded unit complete / NOT PROMOTED.

Root remains h(G)>=chi(G) for every finite simple graph.

Work only at the retained conditional non-singleton m=2, A=S fixed-choice scope under V(P)=T_2 and, additionally, under

    x in V(K) and N_K(x) not subseteq {w_1}.

Fix one z in N_K(x)\{w_1} and one proper six-coloring d of the proper minor G-xz.

RL28 proves at checkpoint scope:

1. d(x)=d(z). If the colors differed, restoring xz would leave d proper and six-color original G, contradicting chi(G)=7.
2. For delta=d(x)=d(z), the one fixed consequence C28-X holds:

       d(N_G(x)\{z})=[6]\{delta}.

   Otherwise x could be recolored with a missing non-delta color in G-xz and xz could then be restored, again six-coloring G.

The retained repair pattern also gives N_G(a) intersect R_1={x}, hence az is a nonedge. This does not turn C28-X into internal-degree control.

The first missing implication is compatibility/localization between the new coloring d and the fixed quotient coloring c defining A. C28-X supplies five d-color witnesses in N_G(x)\{z}, but current authority does not force those witnesses into R_1 or K and does not identify d-color classes with c-color classes. Therefore RL27-P02 remains only the lower bound |A(x)|<=d_K(x); no upper bound on d_K(x) is obtained.

No explicit contradiction excludes V(P)=T_2. RL25 gate 1 remains unresolved; gates 2-6 remain NOT REACHED and minimum total size is not invoked.

Candidate RL28-P01/P02 are same-worker scoped analytic results only and remain NOT PROMOTED pending normal closeout.

No named inherited mathematical obligation is genuinely reduced. Correction/demotion: NONE. All inherited source/certificate, simultaneous-compatibility, sharpness and unbounded-parameter limits remain unchanged.

Programme ACTIVE.
