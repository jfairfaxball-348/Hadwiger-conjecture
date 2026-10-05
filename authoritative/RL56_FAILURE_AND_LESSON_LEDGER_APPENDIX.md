# FL-057 — degree eight does not force a new model-relative attachment without a model-union degree/escape bound

Date: 2026-10-05.
Origin: RL56 HC7 K4,4 model-relative degree attachment gate.
Classification: model-relative degree/attachment insufficiency barrier accompanying a proved conditional payoff; not a mathematical error, theorem demotion, source-status change, counterexample, or finite certificate.

Expectation tested: whether delta(G)>=8 in the ORIGINAL GRAPH, relative to a minimum-total-size K4,4 model, universally forces a controlled attachment with an explicit K7 or proper-minor-coloring payoff.

Assessed candidate RL56-C01: for every graph G in the certified RL56 domain and every minimum-total-size K4,4 model M=(A_1,...,A_4;B_1,...,B_4), with U the union of the eight branch sets, there exist disjoint nonempty connected sets P,Q subseteq V(G)\U such that P and Q are adjacent and each has a neighbour in every one of the eight branch sets.

Conditional payoff proved: such P,Q yield a K7 minor. The K4,4 model contains a K5 model with branch sets A_1 union B_1, A_2 union B_2, A_3 union B_3, A_4, B_4. P and Q are then two further pairwise adjacent branch sets adjacent to all five K5 branch sets.

Actual observation: current authority does not prove the universal existence of P,Q. More basically, it does not force even one neighbour outside U from the degree-eight condition. RL55-P01 controls indispensability of attachment sets, not multiplicity of neighbours inside one opposite branch set, internal branch-set degree, or total degree inside U.

Concrete degree-absorption pattern: current authority permits a spanning-tree leaf x of a branch set X to be the unique supporter of one opposite branch set Y_1 while x has one internal neighbour in X and seven distinct neighbours in Y_1. Then d_G(x)=8 although every counted neighbour is internal to the existing model or belongs to the already-required X-Y_1 attachment type. This is a local falsification pattern for the naive degree-surplus inference, not an asserted full HC7 counterexample.

First missing implication: **HC7-K44-MODEL-UNION-DEGREE-ABSORPTION/ESCAPE**. A sufficient first candidate is a universal in-model degree cap such as: for every graph and minimum model in the certified domain, with U the model union, there exists v in U with |N_G(v) intersect U|<=7. Combined with delta(G)>=8 in the original graph, this would force at least one neighbour outside U. It would not by itself prove the double-apex attachment or K7.

Surviving valid scope: RL56-P01 is proved analytic mathematics only as a conditional double-apex payoff. RL56-C01 remains NOT ESTABLISHED. RL55-P01, the incoming K4,4-minor conclusion, delta(G)>=7, all inherited theorem scopes, SRC-0025 classification, and FL-043 through FL-056 remain unchanged.

Downstream effect: delta(G)>=8 remains OPEN / NOT ELIMINATED. The HC7-universal graph-level residual is not genuinely narrowed. No HC7-universal obligation is discharged.

Lesson: degree lower bounds count neighbours, not attachment types. Repeated neighbours in one already-required opposite branch set or other neighbours inside the model union can absorb the entire degree-eight lower bound unless a separate universal model-union cap/escape theorem is proved.

Correction/demotion: NONE.
Inherited mathematical theorem classification changes: NONE.
Source-status changes: NONE.

Retry condition: assess exactly one universal model-union degree/escape statement, preferably the explicit bound |N_G(v) intersect U|<=7 for some v in U. Do not infer a double apex from one escape edge, do not catalogue attachment types, do not repeat branch-set reducibility, do not compare model sizes across graphs, do not transfer minimum degree to a quotient, and do not return to degree-seven/resource/Kempe/M3 machinery.

Selected successor: RL57 HC7-K44-MODEL-UNION-DEGREE-ABSORPTION-ESCAPE-GATE.
Programme ACTIVE.
