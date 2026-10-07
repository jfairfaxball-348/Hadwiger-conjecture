# RL64 admission record — F1 and F2

Status: RL64 record. CLOSED/FROZEN on promotion at RL64 closeout.

Root: HC7 only. Method: statement, definition and hypothesis check against version-pinned primary text. Proofs were NOT read, checked or reconstructed.
Text references are `F1.txt:<line>` / `F2.txt:<line>` in the pdftotext extractions whose sha256 values are in RL64_RETRIEVAL_LOG.md (R3, R4).

## F1 — arXiv:2609.17760v1

| Field | Inspected value |
|---|---|
| Title | "Every graph with no K_7^= minor is 6-colorable" (abs page R1; PDF metadata) |
| Authors | Zdeněk Dvořák (Charles University), Sergey Norin (McGill), Neil Rahman (McGill) |
| Version | v1 only: submitted Tue 15 Sep 2026 19:10:20 UTC (abs page). PDF stamp "arXiv:2609.17760v1 [math.CO] 15 Sep 2026"; manuscript dated "23 August 2026" (F1.txt:9) |
| Status | Unrefereed preprint: no Journal-ref or DOI field on the abs page as of 2026-10-06. Not withdrawn. 35 pages. |
| Main theorem (F1.txt:56) | "Theorem 1.1. Every K7= -minor-free graph is 6-colorable." |
| Definition (F1.txt:34–36) | "Let Kk− , Kk∨ , and Kk= denote the graphs obtained from the clique Kk by removing a single edge, two edges incident with the same vertex, and two independent edges, respectively." The abstract says the same: "K_7^= denotes the graph obtained from K_7 by deleting two independent edges". |
| Minor relation (F1.txt:186–197) | "a model of H in G is a function µ that maps vertices of H to pairwise disjoint non-empty subsets of vertices of G which induce connected subgraphs of G, and maps each edge e = uv of H to an edge µ(e) of G with one end in the set µ(u) and the other end in the set µ(v). If there exists a model of H in G, we say that H is a minor of G. Equivalently, H is a minor of G if a graph isomorphic to H can be obtained from a subgraph of G by repeatedly contracting edges." This is the standard minor relation. |
| Graph convention | No explicit "finite simple" declaration was found in the inspected text. The proof of Thm 1.1 (F1.txt:1607–1612) selects a counterexample "with \|V(G)\|+\|E(G)\| minimal", which is a finite setting. Edge-count statements such as "4n − 7 edges" are simple-graph counts. No multigraph or loop convention is invoked. |
| Hypotheses / conditionality | None beyond K7^=-minor-freeness. The theorem is stated unconditionally. The proof (F1.txt:1607–1612) combines Thm 1.6 with Thm 1.3. |
| Disclosed caveat | §1.1 "AI usage" (F1.txt:154–181): "AI was used to obtain the proofs of these results based on an outline of the expected approach … The main ideas of the argument (including the statements of all major results and key technical lemmas) were provided by the co-authors." This is recorded as a reliance caveat. It is not a falsification condition under the brief. |
| Load-bearing preprint input | Dvořák [Dvo26] "Extremal function for rooted K5 minors", arXiv 2609.13818 (2026), consumed in the proof of Thm 1.3 (Theorems 2.6, 2.7, 2.9). This is a second unrefereed 2026 preprint. |

**Mapping to repository notation.** "6-colorable" means chi(G)<=6. K7^= is K7−{e,f} with e,f disjoint edges of K7.

**Falsification checks under the brief:**

| Condition | Result |
|---|---|
| Extra hypotheses | NONE |
| Non-simple setting | NONE. If the paper's "graph" were broader than finite simple, finite simple graphs would be a special case. If it means finite simple, the match is exact. |
| Different K7^= meaning | NONE |
| Non-standard minor | NONE |
| Conditional main theorem | NONE |
| Withdrawn version | NONE |

**Decision: F1 ADMITTED at Level A.** Level A here means: statement-checked primary preprint, proof unread, version-pinned to arXiv:2609.17760v1 (PDF sha256 6af798e5…c907). Status: unrefereed preprint, with the AI-usage disclosure and the Dvo26 dependency recorded.

## F2 — arXiv:2507.03244v1

| Field | Inspected value |
|---|---|
| Title | "Every graph with no K_7^{\vee}-minor is 6-colorable" |
| Authors | Sergey Norin, Agnès Totschnig (McGill). The RL63 excerpts lacked the author list. |
| Version | v1 only: submitted Fri 4 Jul 2025 01:34:26 UTC. PDF stamp "arXiv:2507.03244v1 [math.CO] 4 Jul 2025" (F2.txt:8) |
| Status | Unrefereed preprint: no Journal-ref or DOI field on the abs page as of 2026-10-06. Not withdrawn. 17 pages. Licence CC BY 4.0. |
| Main theorem (F2.txt:45) | "Theorem 4. Every graph with no K7∨ -minor is 6-colorable." This matches the RL63 excerpt, which called it "Theorem 4". |
| Definition (F2.txt:32–35) | "For t ≥ 4, let Kt∨ denote the graph obtained from Kt by deleting two edges with a common end, and let Kt= denote the graph obtained from Kt by deleting a two-edge matching. Thus every graph obtained from Kt by deleting two edges is isomorphic to Kt∨ or Kt=." |
| Minor relation (F2.txt:86–100) | Defined through models with disjoint non-null connected bags and an edge between bags for each edge of H: "contracting all the bags of the model to single vertices we obtain a minor of G". This is the standard minor relation. |
| Graph convention (F2.txt:71) | "We use standard graph theoretical notation." There is no multigraph or loop convention. The proof uses a "minor-minimal counterexample" and degree-sum counting (F2.txt:546–562), which is a finite setting. |
| Hypotheses / conditionality | None beyond K7^vee-minor-freeness. The theorem is stated unconditionally. |
| Load-bearing preprint input | Kriesell–Mohr [KM19], arXiv:1911.09998 (2019), Lemma 2 (Theorem 14), used to dismiss the one exceptional degree-7 neighbourhood (F2.txt:66–68, 285–288). |

**Mapping to repository notation.** K7^vee is K7−{e,f} with e,f distinct edges sharing an end.

**Falsification checks:** NONE triggered, item by item as for F1.

**Decision: F2 ADMITTED at Level A** (statement-checked primary preprint, proof unread, version-pinned to arXiv:2507.03244v1, PDF sha256 14c46598…245). Status: unrefereed preprint.

**Independence of F1 and F2.** F1 cites F2 as [NT25] and restates F2's Theorem 6 as F1 Thm 1.2 (F1.txt:68–70). F1's derivation of Thm 1.1 (F1.txt:1607–1612) uses only F1's Thms 1.3 and 1.6, so F1's final argument as written does not consume F2. F2 predates F1 and does not cite it.

## Universal consequence (pure logic; U8, promoted at RL64 closeout)

Any two distinct edges of K7 share exactly one end or are disjoint. So K7 minus two edges is K7^vee or K7^=, as F2.txt:34–35 also states. F1 and F2 therefore give:

**U8.** Every finite simple graph G with chi(G)>=7 contains K7−{e,f} as a minor for every pair of distinct edges e,f of K7.

In particular this holds for every hypothetical HC7 counterexample (chi(G)=7, no K7 minor). Minimality is not used.

Classification: Level A source-consumed at statement level (two unrefereed preprints, proofs unread, version-pinned v1). It is not proved analytic mathematics in the repository.

**Recorded precisions:**
- **U8 does not imply U7.** K4,4 has 8 vertices, and every minor of a 7-vertex graph has at most 7 vertices. U7 (SRC-0025) is therefore retained as a separate certified item. K4,4 is superseded only as near-K7 *structure/strategy*: routes R16 and R18 are formally superseded.
- **U8 does not give K7^-.** The open interval for HC7 is now: K7 minus any two edges (certified) → K7^- (open) → K7 (the root).
- U8 does not change U1–U6.
- No K7^= or K7^vee model is upgraded, and none may be (FL-055..FL-062 pattern).
