# Prepared recovery after RL27

Status: candidate future work only; NOT STARTED / NOT PROMOTED.

## Exact obstacle

For the fixed coloring c and lists A, RL27 proves a fixed inclusion-minimal obstruction K satisfies |A(u)|<=d_K(u). The sole endpoint consequence C27-X then fails because the retained tree/path data do not prove d_K(x)<=1 when x is in K. Extra original-G edges from x to R_1 are not controlled.

Repeating the same list-degree inequality, switching to y, or calling W/Q_1 induced would not address FL-030.

## One changed bounded mechanism

Prepare one **edge-critical extra-neighbor gate**, to be used only in a successor session if authorized.

Retain the same conditional V(P)=T_2 scope and the same fixed R_1, c, A, K, x and W. Let w_1 denote the fixed W-neighbor of x.

Assess exactly the conditional branch

    x in V(K) and N_K(x) not subseteq {w_1}.

If that branch holds, fix exactly one vertex z in N_K(x)\{w_1}; do not replace z after failure. Use the proper-minor fact for the single edge deletion G-xz and fix exactly one proper six-coloring d of G-xz.

Because xz is the only deleted edge and chi(G)=7, every proper six-coloring of G-xz must satisfy

    d(x)=d(z);

otherwise the same coloring would be proper on G.

Test only whether this forced equality, together with the retained x/a/b/resource incidences and the already fixed obstruction data, yields an explicit contradiction or an actual internal-degree restriction at x. Stop at the first missing implication.

If the displayed conditional branch does not hold, this recovery mechanism has no extra edge to consume and must record that fact rather than switch endpoint or obstruction.

## Bounds and guards

- one retained K only;
- one endpoint x only;
- at most one extra neighbor z and one edge xz;
- exactly one new proper-minor coloring d, only of G-xz;
- no second z/coloring/endpoint/path/contraction/resource side/family;
- do not resume RL26 quotient pullback or reverse-greedy expansion;
- do not import RL23 recoloring or m=1 identities;
- no RL25 gates 2-6 and no minimum-total-size exchange in this unit;
- no source retrieval or numerical census by default.

A positive result must still reach an explicit contradiction at the retained saturation scope or a rigorously sufficient degree restriction that closes the exact FL-030 gap. Structural equality d(x)=d(z) alone reduces no named obligation.

Payoff remains narrow. Even exclusion of V(P)=T_2 would address only RL25's first nonemptiness obstacle for the fixed choices. It would not certify later exchange gates, universal m=2 exclusion, UP_6, CR_6, ordinary order seven or full Hadwiger.

Programme ACTIVE.
