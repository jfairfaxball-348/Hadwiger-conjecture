# RL64 frontier-obstruction map

Status: RL64 record. CLOSED/FROZEN on promotion at RL64 closeout.

Source: inspected text of F1 (arXiv:2609.17760v1) and F2 (arXiv:2507.03244v1) only. This map locates and quotes; it reconstructs no proof. Statements labelled *RL64 reading* are this session's summary of the authors' own words, not new mathematics.

## 1. Proof architecture, as the authors describe it

The authors describe a two-part architecture, and both papers follow it.

**(A) Colouring/criticality half.** Take a minor-minimal counterexample, which is 7-contraction-critical. Then:
- Mader gives 7-connectivity;
- Dirac gives dense neighbourhoods of degree-7 vertices;
- Kawarabayashi–Toft and Kriesell–Mohr force degree-7 vertices into 5-cliques;
- clique counting turns this into a bound on the number of degree-7 vertices.

The result is a lower bound on |E(G)| in terms of n.

**(B) Density half.** An extremal theorem says that sufficiently connected graphs above that edge bound contain the excluded minor. That contradicts (A).

F1, quoted (F1.txt:58–67): "one uses Kempe chain arguments to restrict the structure of a hypothetical minimal counterexample … Mader [Mad68] proved that every such graph other than K7 is 7-connected, and in particular has minimum degree at least 7. Moreover, it is possible to similarly show that a 7-contraction-critical K7∨-minor-free graph can only have very few vertices of degree exactly 7, and thus its average degree cannot be much smaller than 8. One then obtains a contradiction by using the following density result."

F2, quoted (F2.txt:51–56, 64–70): "First, we restrict our attention to 7-contraction-critical graphs … Second, we determine the maximum number of edges in G … By Theorem 6, we can conclude that G contains many degree seven vertices. The neighborhood of every degree seven vertex contains a clique of size five, except for one case, which we dismiss using a recent theorem of Kriesell and Mohr [KM19]. The resulting cliques can than be connected to obtain the required minor. This last part closely follows the argument in [KT05]".

**Is there a finite low-degree case analysis?** Yes. Both colouring halves run through **degree-seven vertices**:
- F2: Claim 4.3 gives "at least 18 degree seven vertices" (F2.txt:558–563). Claims 4.4–4.10 then analyse the family of 5-cliques.
- F1: Lemma 7.6, every degree-7 vertex lies in a 5-clique (F1.txt:1532–1533). Lemma 7.7, at most one 5-clique (F1.txt:1568–1569). Hence "at most five vertices of degree seven" and |E(G)| ≥ 4|V(G)| − 2 (F1.txt:1597–1601).
- F1's density proof (Theorem 2.8) also analyses vertices of degree <=7 in a minimal counterexample: Lemma 6.4, Lemma 6.6 and Corollary 6.7 (minimum degree at least 8) at F1.txt:1372–1450.

**Neither paper uses a delta in {7,8,9} partition, the K7 extremal function 5n−15, Gallai, or a computer search.** No computation is mentioned in either inspected text.

## 2. Where only a two-edge-deficient minor is obtained

| Locus | What the text shows | Reference |
|---|---|---|
| F2 density theorem | Thm 6 yields only K7^vee: 4-connected, e >= 4n−8, K2,2,2,2 excepted. Its direct analogue for K7^= is false. | F2.txt:59–60, 650–658 |
| F2's counterexample to the K7^= analogue | "Gn … \|A\| = 4 … every vertex of A is adjacent to every other vertex of Gn and E(Gn[B]) is a matching … Gn is 4-connected … \|E(Gn)\| = 4n + ⌊n/2⌋ − 12 … K7= is not a minor of Gn." | F2.txt:651–658 |
| F1 density theorem | Thm 1.3 / Thm 2.8 yield only K7^=, and need 5-connectivity or "4-bilight". | F1.txt:80–81, 389–390 |
| F1's 5-separation tool: the matching-type deficiency is spent here | "a 7-vertex graph containing the five roots which is obtained from K7 by removing the edges between the roots and at most two additional edges forming a matching" (Section 4). In rooted form: the "vampire" and K2,↓5, which "only miss edges of a matching among those incident with p and q". Thm 2.9: "If G is quite heavy, then G contains a vampire or K2,↓5 as a rooted minor." | F1.txt:127–135, 398–413 |
| F1's low-degree step: K5^- in a neighbourhood plus two vertices gives K7^= | Lemma 6.4: "For every set S ⊆ V(H) of size five, the 5-rooted graph H↓S contains K5− as a rooted minor." Lemma 6.6 then: "we can contract H to K5− on S … we obtain K7= on S∪{u,v}". | F1.txt:1372–1376, 1432–1436 |
| F1 colouring half: ALREADY at K7^- strength | Thm 1.6 (F1.txt:109–111): "Let G be a K7− -minor free graph of chromatic number at least seven. If every proper minor of G is 6-colorable, then G is 7-connected and \|E(G)\| ≥ 4\|V(G)\| − 2." Lemmas 7.2, 7.6 and 7.7 all assume only K7^- -minor-freeness. | F1.txt:109–111, 1492, 1532, 1568 |

*RL64 reading.* In F1 the two-edge deficiency is spent **only in the density half**: Theorem 1.3, Section 4 and Section 6. The colouring half (Theorem 1.6) is already proved under K7^- -minor-freeness.

## 3. The authors' stated obstruction to K7^- (one edge missing)

F1 (F1.txt:97–108): "there does not seem to be any fundamental obstruction that would prevent our approach from working for K7− -minor-free graphs instead of K7= -minor-free ones (though of course a number of technical issues would have to be worked out). Hence, we in particular believe the following could be true (likely even with 2 replaced by a slightly larger constant). **Conjecture 1.5.** Every 5-connected graph with n ≥ 6 vertices and at least 4n − 2 edges contains K7− as a minor. This would be sufficient to prove that K7− -minor-free graphs are 6-colorable. Indeed, our proof of Theorem 1.1 is by combination of Theorem 1.3 with the following result [Theorem 1.6]."

F2 (F2.txt:666–670): "Conjecture 21. Every graph with no K7− -minor is 6-colorable. Again proving Conjecture 21 using the strategy similar to the one used in this paper would require a corresponding extremal result. It is possible that a variant of Conjecture 20 holds for K7− -minors with a longer list of small exceptional graphs."

F1 on the K7^= constant (F1.txt:89–97): "Conjecture 1.4. Every 5-connected graph with n ≥ 7 vertices and at least 4n − 9 edges contains K7= as a minor … there are several places in our argument where increasing the constant from 7 to 9 would require substantial additional effort".

**Documented K7^- obstruction.** The missing piece is exactly a density/extremal theorem, F1 Conjecture 1.5. The bridge from it to colouring, F1 Theorem 1.6, is stated and proved in F1, so it is Level A at statement level, proof unread.

## 4. The authors' stated obstruction to K7 (the HC7 root)

F1 (F1.txt:112–119): "However, let us remark that a density result analogous to Theorem 1.3 is false for K7 -minor-free graphs. Indeed, graphs obtained from 5-connected (n − 2)-vertex plane triangulations by adding two universal vertices are K7 -minor-free, 7-connected, and have 5n − 15 edges. Hence, making the 'final step' from K7− -minor-free graphs to K7 -minor-free graphs would be substantially more difficult."

F2 (F2.txt:24–28): "Settling the conjecture in this case appears to be extremely challenging. Albar and Gonçalves [AG18] proved that every graph with no K7 minor is 8-colorable, but even the question whether every such graph is 7-colorable is open."

**Documented K7 obstruction.** The (A)+(B) architecture cannot reach K7. 7-connected K7-minor-free graphs with 5n−15 edges exist (two apices over a 5-connected planar triangulation). So no edge bound below 5n−15 can hold for 7-connected K7-minor-free graphs.

*RL64 reading, not a theorem.* These examples are 6-colourable: the planar part is 4-colourable by the Four Colour Theorem (SRC-0004), and the two apices take two further colours. So the obstruction is to the *method*, not a counterexample to HC7.

## 5. Position of HC7 relative to the frontier (FL-064)

| Item | Status after RL64 |
|---|---|
| S4: K7 minus any two edges | **Certified as U8** at Level A (statement, two unrefereed preprints, proofs unread) |
| K7^- | **OPEN.** Sufficient: F1 Conjecture 1.5, using F1 Thm 1.6 (Level A statement). Equivalently, F2 Conjecture 21. |
| K7 (HC7) | **OPEN.** The density method is documented to fail (5n−15 examples); a new mechanism is needed. |
| S1: 7-connectivity | Level B only (RL12-SRC-01 plus F1 Thm 7.1 plus F2 Thm 16). The two restatements cite different Mader papers. FL-063 is unsatisfied. Load-bearing inside both frontier proofs. |
| S2: delta in {7,8,9} / 5n−15 | Level C. **Not used by either frontier proof.** |
| S3: Gallai, n>=13 | Level C. Not used. |

*RL64 reading (route relevance, not a correction).* The degree-7 analysis at K7^- / K7^vee strength already exists in the literature: F1 Lemmas 7.6/7.7 and F2 Claims 4.3–4.10. That confirms R15 (the repository's degree-7 programme) as CONDITIONAL ONLY. Nothing here reopens R10–R15.
