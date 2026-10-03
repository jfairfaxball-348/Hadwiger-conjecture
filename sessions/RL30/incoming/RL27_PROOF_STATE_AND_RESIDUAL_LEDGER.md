# RL27 checkpoint proof state and residual ledger

Date: 2026-10-03 Europe/Madrid.
Status: RL27 OPEN / bounded unit complete / NOT PROMOTED.

Root remains h(G)>=chi(G) for every finite simple graph.

Within the exact retained non-singleton m=2, A=S fixed-choice setup and only under V(P)=T_2, retain the same proper minor J=G/R_1 and the same one fixed six-coloring c from RL26. For A(u)=[6]\c(N_G(u)\R_1), the fixed quotient color gamma belongs to every A(u).

RL27 proves at checkpoint scope that G[R_1] has no proper A-list coloring: any such coloring combines edge-by-edge with c outside R_1 to give a proper six-coloring of original G.

Fix once and for all one inclusion-minimal induced non-A-list-colorable K. For every u in K, K-u is A-list-colorable. Explicitly extending such a coloring proves

    |A(u)| <= d_K(u)

for every u in K. Since gamma belongs to A(u), d_K(u)>=1.

Exactly one endpoint/path consequence was fixed after this proof:

    if x is in K, then d_K(x)=1, hence A(x)={gamma}.

It is not certified. The first missing implication is the upper bound d_K(x)<=1. The fixed Q_1 leaf condition controls only tree edges, and x being the endpoint of the spanning path W controls only W-edges. Neither excludes extra original-G chords/attachments from x to other vertices of R_1, and any such edge into K raises d_K(x).

The symmetric endpoint y is not tested. No second K, coloring, path or consequence is selected. No explicit contradiction with saturation/full C_7 is reached.

Candidate positive results RL27-P01/P02 remain same-worker analytic results and are not promoted until normal closeout. Candidate FL-030 records the endpoint-degree barrier.

No named inherited mathematical obligation is reduced. RL25 gate 1 remains unresolved; gates 2-6 remain NOT REACHED. The full m=2, A=S branch and selected repair pattern remain open, as do m=1, m=3, m=4, BR-00, BR-01 universal coverage, general UP_6, CR_6, ordinary order seven, every higher order and full sharp Hadwiger.

Correction/demotion: NONE. Preserve RL26/FL-029, RL25/FL-028, RL24/FL-027, RL23/FL-026, RL22-P01/FL-025, RL21-P01/P02/FL-024 and RL20 NONE/FL-023 exactly. The m=1 failed-anchor/private-endpoint line remains suspended.

All inherited source/certificate, simultaneous-compatibility, sharpness and unbounded-parameter limits remain unchanged. Programme ACTIVE.
