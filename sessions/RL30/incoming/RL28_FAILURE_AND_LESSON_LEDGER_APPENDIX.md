# FL-031 — edge-critical color saturation is not internal-degree control

Origin: RL28 at BASE_HEAD 3a90dd79fc56e9238c10229c0a32e3602bc16924.
Classification: method barrier accompanying RL28-P01/P02.
Scope: retained V(P)=T_2 conditional scope, additionally x in K with one fixed off-path K-neighbor z.

Positive facts: d(x)=d(z) for the fixed coloring d of G-xz, and every other color occurs on N_G(x) minus {z}.

Barrier: the witnesses are defined in coloring d. The fixed lists A are defined from the independent coloring c. Current premises provide no localization of the d-witnesses to R_1 or K and no valid identification of c- and d-color classes.

Effect: FL-030 remains open. No saturation exclusion or named-obligation reduction follows.
Lesson: edge-critical saturation naturally supplies lower-degree information; it is not an internal-degree upper bound.
Retry condition: the next mechanism uses the fixed A-list system itself and the same fixed edge xz.
Programme: ACTIVE.
