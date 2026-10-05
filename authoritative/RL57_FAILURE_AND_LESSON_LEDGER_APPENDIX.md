# FL-058 — RL55-P01 permits a dense model-union interface; a degree-cap proof needs an HC7-specific dense-union payoff

Date: 2026-10-05.
Origin: RL57 HC7 K4,4 model-union degree absorption / escape gate.
Classification: method barrier / counterpattern at the RL55 model-interface scope; not a mathematical error, theorem demotion, source-status change, certified HC7 counterexample, or exact finite certificate.

Expectation tested: RL57-C01 proposed that for every hypothetical minor-minimal HC7 counterexample G on the delta(G)>=8 residual and every minimum-total-size K4,4 model M with union U, some v in U satisfies |N_G(v) intersect U|<=7.

Actual observation: current authority does not prove this cap. RL55-P01 can coexist with a legitimate displayed K4,4 model interface in which every model vertex has eight neighbours inside U.

Concrete interface counterpattern: index the eight branch sets by the vertices of K4,4 and choose an alternating Hamilton cycle of K4,4. Replace every branch set by a three-vertex path. For the two opposite-side branch sets adjacent to it on the chosen cycle, use the two path endpoints as distinct singleton supporters and place one corresponding endpoint-to-endpoint cross edge on each cycle pair. For each of the other two opposite-side branch sets, join the two three-vertex paths completely. Then for each branch set the four attachment sets are its two singleton endpoints and two copies of the whole three-vertex path. Hence no proper nonempty connected subset meets all four attachment sets, exactly as RL55-P01 requires at the displayed interface. Each endpoint has one internal path neighbour, one sparse cycle cross-neighbour, and six neighbours in the two completely joined opposite paths; the middle vertex has two internal path neighbours and those six dense cross-neighbours. Thus every displayed model vertex has exactly eight neighbours inside U.

Scope warning: this construction is not asserted to satisfy chi(G)=7, proper-minor 6-colorability, K7-minor-freeness, or global minimum-total-size of the displayed K4,4 model. It therefore does not falsify RL57-C01 in the certified domain. It proves only that RL55-P01 plus the basic legitimate-model interface is insufficient to derive the desired in-union degree cap.

First missing implication: **HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF** — use the full certified HC7 hypotheses, beyond RL55-P01 alone, to show that a minimum K4,4 model with |N_G(v) intersect U|>=8 for every v in U has a direct K7 payoff, or identify the first further universal dependency.

Surviving valid scope: RL55-P01 remains proved exactly at minimum-model scope. RL56-P01 remains a conditional double-apex payoff only. RL56-C01 remains NOT ESTABLISHED. RL57-C01 remains NOT ESTABLISHED / NOT PROMOTED, and is not certified-domain falsified.

Downstream effect: delta(G)>=8 remains OPEN / NOT ELIMINATED. No universal escape edge has been proved. The HC7-universal graph-level residual was not genuinely narrowed, and no HC7-universal obligation was genuinely reduced.

Lesson: a minimum-model irreducibility condition controls indispensable support, not dense redundant adjacency inside the model union. A retry must exploit a genuinely stronger HC7-specific consequence of dense in-union adjacency; repeating degree counting, RL55 reducibility, or the RL57 cap argument is not a changed mechanism.

Correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.

Retry condition: do not retry RL57-C01 from RL55-P01, degree eight, quotient degree, or attachment counting. Assess exactly one direct dense-model-union K7-payoff candidate: in the certified domain, if every vertex of U has at least eight neighbours in U, does that force a K7 minor? The proof attempt must seek a direct root-facing payoff from dense U, not first infer an escape edge or reopen RL56-C01.

Selected successor: RL58 HC7-K44-DENSE-MODEL-UNION-K7-PAYOFF-GATE.
Programme ACTIVE.