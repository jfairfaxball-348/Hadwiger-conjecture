# RL63 proof-versus-disproof attack map

Status: RL63 global-audit record. CLOSED/FROZEN on promotion at RL63 closeout.
Root: HC7 only.
Gap types: NEW-MATH, SOURCE, COVERAGE, COMPUTATION.

## A. What would actually settle HC7

**Proof.** For every minor-minimal counterexample G (U1–U7 in the dependency audit), derive a contradiction.

**Disproof.** An explicit finite simple G together with:
- a certificate that chi(G)=7;
- a certificate that G has no K7 minor.

Both are open in the literature: RL63 orientation confirms HC7 is not claimed resolved as of the 2026 excerpts. Nothing in RL1–RL62 brings either within bounded reach. The ranking below is about the best rigorous next moves, not about any route being near completion.

## B. Ranked proof routes

### P1 — Two-edge-deficient frontier admission (R02). Rank 1.

**Theorem to admit**
- F1 (arXiv:2609.17760, Dvořák–Norin–Rahman): every graph with no K7^= minor is 6-colourable. K7^= is K7 minus two independent edges.
- F2 (arXiv:2507.03244, Thm 4 per excerpt): every graph with no K7^vee minor is 6-colourable. K7^vee is K7 minus two edges at one vertex.

**Proved antecedents.** None needed. Each theorem applies directly to chi=7 graphs.

**First missing dependency.** Inspected statement, definitions and hypotheses from the version-pinned arXiv texts. arxiv.org is blocked in the RL63 environment.

**Gap type.** SOURCE.

**Reduction of the universal obligation.** If both are admitted, every HC7 counterexample contains K7−{e,f} as a minor for every pair of distinct edges e,f. This is the strongest universal narrowing available and supersedes K4,4 as near-K7 structure. More importantly, the papers' own text locates the actual remaining gap: K7^- (one edge missing), then K7.

**Strongest barrier / counterpattern.** The FL-055..062 pattern: a near-K7 minor does not upgrade by model minimality. Upgrading is therefore explicitly out of scope.

**Shortest chain to HC7.** F1+F2 ⇒ extract the frontier obstruction ⇒ new mathematics at that obstruction (P4) ⇒ K7^- ⇒ K7. The final two arrows are research-frontier NEW-MATH.

**Falsification test.** The inspected statements differ from the excerpts: extra hypotheses, a different K7^= convention, a multigraph setting, or a withdrawn version.

### P2 — Mader K7 extremal function ⇒ finite degree partition (R03). Rank 2.

**Theorem to admit.** A K7-minor-free graph with n>=6 has e<=5n−15. The admission check must confirm the exact n-range and the meaning of "kontrahierbar" (Mader 1968b, Math. Ann. 178:154–168).

**Proved antecedents.** U5 (delta>=7).

**First missing dependency.** An inspectable original, or a complete proof in an inspectable primary source.

**Gap type.** SOURCE.

**Reduction of the universal obligation.** delta in {7,8,9}, 3n7+2n8+n9>=30, 7n/2<=e<=5n−15 and n>=10. This excludes every candidate with delta>=10 and turns degree coverage into three named branches.

**Strongest barrier.** It closes no branch. The delta=8 and delta=9 neighbourhood problems are harder than delta=7, which is itself open.

**Shortest chain to HC7.** P2 + P3 ⇒ close each of the three branches (P5) ⇒ HC7.

**Falsification test.** The original statement differs: a different edge bound or an exceptional family.

### P3 — 7-connectivity (R04). Rank 3.

**Theorem to admit.** Every noncomplete 7-contraction-critical graph is 7-connected (Mader 1968a).

**Proved antecedents.** U1 (C7 = k-contraction-critical at k=7), and noncomplete-ness.

**First missing dependency.** An inspectable original. RL12-SRC-01 is only a Level-B restatement, and FL-063 still applies.

**Gap type.** SOURCE.

**What it buys:**
- It excludes all separators of size <=6.
- It makes RL12-P01, RL6 C3 and the RL51 clique-separator alternative vacuous.
- It makes RL13-P00 unconditional.
- It supplies Menger linkages, which every known K7-from-neighbourhood construction uses. For example, the Kawarabayashi–Toft lemma "three 5-cliques pairwise meeting in a 2-set Z ⇒ K7" is stated for 7-contraction-critical graphs (orientation, RL63 R7).
- It is a search filter.

**What it does not buy.** No partition, no degree exclusion, and no closure of any branch.

**Strongest barrier.** FL-063 (source access). The elementary separator proof stops at colouring compatibility (RL62).

**Shortest chain to HC7.** Only as a tool inside P5.

### P4 — K7^- and then K7 beyond the frontier (R21). Rank 4.

**Theorem to prove.** chi=7 ⇒ K7^- minor, then K7.

**Antecedents.** P1, and probably P2/P3, as consumed by the frontier papers.

**Gap type.** NEW-MATH, open at research frontier.

**Status.** Cannot be scoped before P1 supplies the documented obstruction.

**Shortest chain.** This is the chain to HC7.

### P5 — Branch closure on delta=7, 8, 9 (R15 generalised). Rank 5.

**Theorem to prove.** For each d in {7,8,9} and each admissible neighbourhood N(v), a K7 minor exists. Admissible means:
- d vertices;
- alpha<=d−5;
- K6-minor-free;
- plus the A2 constraints.

**Antecedents.** P2 and P3.

**Gap type.** NEW-MATH + COMPUTATION + COVERAGE.

**Computation component.** The neighbourhood catalogue is finite and small: there are 1044, 12346 and 274668 graphs on 7, 8 and 9 vertices up to isomorphism (known counts). Enumerating admissible neighbourhoods would be an exact finite certificate. The linkage step outside N[v] is unbounded analysis.

**Barrier.** Kawarabayashi–Toft and the 2025–26 frontier already ran this kind of analysis and stopped at K4,4 or K7 minus two edges.

**Shortest chain.** All three branches closed ⇒ HC7.

### P6 — Repository degree-7 local machinery (R14/R15). CONDITIONAL ONLY.

**Theorem required.** Close the Dcyc7 m-cases.

**Gap type.** COVERAGE, three times over:
- the delta=7 branch;
- K7−C7 among the complements;
- resource-case exhaustiveness.

**Status.** Even if closed, it settles one complement type on one branch. It has no strategic value without P2 and a frontier review (P1).

### P7 — K4,4 model routes (R16/R17/R18). RETIRED / SUSPENDED

Minimum-model minimality gives no payoff (FL-056..059). The colour-lift approach only restates the root contradiction (FL-060..062). No non-colouring mechanism has been found.

KT's K4,4 is the *residue* of their method, not a lever. P1 would supersede it as near-K7 structure.

## C. Disproof track

### What a certified HC7 counterexample requires

1. **G.** A finite simple graph, published as graph6 plus SHA-256.
2. **chi(G)<=7.** An explicit proper 7-colouring. It can be checked in linear time.
3. **chi(G)>=7.** A non-6-colourability certificate: a DRAT or LRAT refutation of a CNF 6-colouring encoding, checked by a formally verified checker (e.g. cake_lpr) or drat-trim.
   - Symmetry breaking may only fix the colours of an explicit clique.
   - The CNF must be regenerated by an independent script and compared byte-for-byte.
4. **No K7 minor.** One of:
   - (a) UNSAT certificates for two independently written K7-minor encodings, each a sound model of the branch-set definition:
     - 7 disjoint nonempty connected sets;
     - every pair adjacent;
     - connectivity encoded by ordering/levels in one encoding and by cut constraints in the other;
     - both encodings validated against graph families with known Hadwiger number;
   - or (b) an exhaustive branch-set/contraction verifier in a second implementation and language, for small n.
5. **Independent verifier.** A separate codebase that re-checks items 1–4 and also checks the derived properties: vertex-criticality, delta>=7, and so on.

### Domain reductions and their gates

| Reduction | Gate |
|---|---|
| delta>=7 | proved |
| K4,4 minor | statement-level SRC-0025 |
| 7-connected | S1 |
| e<=5n−15 and delta<=9 | S2 |
| n>=13 | S3 (Gallai + HC6) |
| contains K7 minus any two edges | S4 |
| vertex-critical: chi(G−v)=6 for all v | proved (U2) |
| alpha(N(v))<=d(v)−5, and N(v) K6-minor-free | proved / elementary |

### Smallest defensible complete finite domain

"All graphs on n<=N vertices with delta>=7, 7n/2<=e<=5n−15, chi=7 and vertex-critical."
- Exhaustiveness requires S2 for the edge band. Without S2, the edge range at n=13 runs up to 78 and the domain is not feasible.
- Completeness claim: "no HC7 counterexample has <=N vertices". This is an exact finite certificate. It is a genuine but weak narrowing, because no theorem bounds counterexample order from above. **No exhaustive disproof domain exists.**

### Heuristic or structured search

A search of the constrained class (constructions, local search) is evidence only unless it finds a fully certified counterexample. Expected yield is very low:
- HC7 is widely believed true;
- if S4 holds, any counterexample already contains every K7 minus two edges.

### Current capability

ZERO. There is no generator, SAT/ILP stack, minor tester or verifier. The four existing scripts are fixed-witness checkers. Small-graph verification and order lower-bound literature (Q6) was not retrieved, because the retrieval cap was reached.

### Disposition and strongest disproof route

The track is COMPUTE-GATED. The strongest disproof route is an exhaustive order-N sweep with the full certificate stack. It needs S2 first, plus tooling and verifier construction (multi-session). A negative result is an exact certificate that n>N, not a disproof.

## D. Proof versus disproof

The proof track dominates in expected rigorous root-facing output.

The disproof track has:
- no exhaustive domain;
- zero tooling;
- a prerequisite (S2) that is itself proof-track source work.

Both tracks share the same first need: importing the literature frontier.
