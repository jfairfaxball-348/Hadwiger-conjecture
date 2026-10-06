# RL66 — payoff chain of C66

Status: RL66 record. CLOSED/FROZEN on promotion at RL66 closeout.

Root: HC7 only. This record restates exactly what C66 would buy, and under which hypotheses. Nothing here is promoted.

**F1 caveat.** F1 = arXiv:2609.17760v1 is used only through statements and definitions already quoted in authority (RL65_LOCUS_ASSESSMENT.md §2–§5). It is an unrefereed preprint, and its §1.1 (F1.txt:154–182) discloses AI-obtained proofs; at this locus that includes F1 Lemmas 4.5 and 4.9, inside the proof of Thm 2.9.
- No F1 proof is verified.
- RL65 read F1 §5 (F1.txt:1058–1277) at reading level only; that reading is the source of H54⁻. The proofs of Thm 2.9 (§4) and of §7 are unread.
- No F1 statement is consumed in Steps 0–3; the counting identity is re-proved.
- Caveat 5's chain uses F1.txt:392–393 (5-connected ⇒ 4-bilight) and F1 Thm 1.6, both at Level A statement.

## Definitions (fragment form operative)

As in the RL66 brief:
- 5-rooted graph R with root set X; n(R), ρ(R), ρ4(R) = ρ(R) − 4n(R);
- fragment Y with boundary ∂Y, and ρ4(R,Y) = #(edges with an end in Y) − 4|Y|;
- 4-light: every fragment Y with |∂Y| <= 4 has ρ4(R,Y) <= 0;
- m(R) = 10 − |E(R[X])|;
- K6↓5 rooted minor.

**Setting (NOT claimed, NOT assessed).**
> (2.8⁻) A 4-bilight graph with n >= 3 vertices and at least 4n − 2 edges contains K7^- as a minor.

G denotes a minimal (2.8⁻)-counterexample, in F1's sense of "minimal". Neither the definition of 4-bilight nor the minimality convention is quoted in authority, and the chain below does not use either of them except through H54⁻.

## Step 0 — counting identity (PROVED ANALYTIC, elementary)

Let (A,B) be a separation of any finite simple graph G with X = A ∩ B and |X| = 5. Write:
- R_AB = G[B] rooted at X, and R_BA = G[A] rooted at X;
- m = 10 − |E(G[X])|.

Then

    ρ4(R_AB) + ρ4(R_BA) = (|E(G)| − 4|V(G)|) + 10 + m.

*Proof.*
- E(G) = E(G[A]) ∪ E(G[B]), with intersection E(G[X]). Hence ρ(R_AB) + ρ(R_BA) = |E(G[A])| + |E(G[B])| − 2|E(G[X])| = |E(G)| − |E(G[X])| = |E(G)| − 10 + m.
- n(R_AB) + n(R_BA) = |B| − 5 + |A| − 5 = |V(G)| − 5.
- Therefore the sum of the ρ4 values is |E(G)| − 10 + m − 4|V(G)| + 20. ∎

This agrees with F1's displayed identity (F1.txt:1207–1208, as quoted in RL65_LOCUS_ASSESSMENT.md §3), cited for comparison only.

**Corollary 0.1.** If |E(G)| >= 4|V(G)| − 2, then ρ4(R_AB) + ρ4(R_BA) >= m + 8.

## Step 1 — the r = 1 sub-case

Now let G be a (2.8⁻)-counterexample, so |E(G)| >= 4|V(G)| − 2, and let (A,B) be a 5-separation with sides R_AB and R_BA. Suppose both sides are quite heavy and the lighter side S2 has ρ4(S2) = r = 1. By Corollary 0.1 the heavier side S1 has ρ4(S1) >= m + 7. Both sides cannot have ρ4 = 1, because 2 < m + 8. Both sides have the same root set X, so m(S1) = m(S2) = m.

## Step 2 — the hypothesis H54⁻ (NOT PROMOTED)

**H54⁻.** In a minimal (2.8⁻)-counterexample, both sides of every 5-separation are 4-light.

This is the K7^- analogue of F1 Lemma 5.4, held at reading level in RL65 (RL65_LOCUS_ASSESSMENT.md §5) and NOT PROMOTED. It is carried below as an explicit hypothesis.

## Step 3 — the payoff (PROVED ANALYTIC; P66a CONDITIONAL on C66, P66b CONDITIONAL on C66 and H54⁻)

**Claim P66a.** Assume C66. Then no K7^- -minor-free graph G has a 5-separation whose sides S1, S2 satisfy all of the following:
- both are 4-light;
- ρ4(S1) >= m + 7;
- ρ4(S2) >= 1.

**Claim P66b.** Assume C66 and H54⁻. Then in a minimal (2.8⁻)-counterexample G, no 5-separation is in the r = 1 configuration. In particular, the r = 1 both-quite-heavy sub-case of the K7^- analogue of F1 Lemma 5.7 does not occur.

*Proof of P66a.* By symmetry let S1 = R_AB = G[B] and S2 = R_BA = G[A].
1. C66 applied to S1 (4-light, and ρ4(S1) >= m(S1) + 7) gives a rooted K6↓5 minor in S1.
2. Lemma D (RL65, PROVED) applies with R1 = S1 and R2 = S2:
   - the root set is the common X;
   - the non-root sets B∖A and A∖B are disjoint;
   - R2 is 4-light with ρ4(R2) >= 1 > 0.

   So S1 ∪ S2 = G[A] ∪ G[B] = G contains K7^- as a minor, contradicting K7^- -minor-freeness. ∎

*Proof of P66b.* G is K7^- -minor-free.
- By H54⁻, both sides of the 5-separation are 4-light.
- By Corollary 0.1 and Step 1, the heavier side has ρ4 >= m + 7 and the lighter side has ρ4 = 1.
- Apply P66a. ∎

Notes:
- "Quite heavy" is not used beyond ρ4(S2) >= 1.
- **Fragment-form reading of Lemma D.** Lemma D is used in its fragment-form reading (same proof; its step 2 is then just the definition). Obs 2.5 is not needed.
- **Separation-form H54⁻.** If H54⁻ is ever obtained in F1's separation form, convert it as follows. For a fragment Y with |∂Y| <= 4, (V∖Y, Y ∪ ∂Y) is a root separation of order |∂Y|; its A∖B contains a root, since |∂Y| < 5; and its right-hand side has ρ4 = ρ4(R,Y). So the separation form gives the fragment form with no appeal to Obs 2.5.

## Caveats that travel with P66

1. **H54⁻ is NOT PROMOTED.** P66b is void without it; P66a does not use it. H54⁻'s only recorded support is RL65's reading of F1 Lemma 5.4's proof (F1.txt:1129–1145), via Cor 5.3 → Cor 4.2 → Thm 2.9. Thm 2.9's proof contains the AI-suggested Lemmas 4.5 and 4.9.
2. **The setting is not established.** (2.8⁻) is not claimed and not assessed. P66 only says what C66 would contribute inside a proof attempt of (2.8⁻).
3. **C66 itself is OPEN** (RL66_C66_ASSESSMENT.md). P66 is a conditional implication only. By S66, C66 implies the 5-connected, degree-5 case of C65, which is not established. So P66 is conditional on a hypothesis at least as strong as part of the target. The orientation note H67 (RL66_C66_ASSESSMENT.md §4) describes an r = 1 route that would not use C66.
4. **Open after P66 (non-exhaustive):**
   - the r >= 2 sub-cases (O1b);
   - the K7^- analogues of F1 Lemma 5.9, Lemmas 6.1/6.2, Lemma 6.4/6.6 and Cor 6.7 (O1c);
   - the other unassessed (2.8⁻) analogues of F1 §5–§6 (e.g. Lemma 5.8, Cor 5.10);
   - (2.8⁻) itself;
   - C65 = F1 Conjecture 1.5.
5. **Chain to the root:** P66b ⇒ (with further, unassessed steps) (2.8⁻) ⇒ C65 ⇒ (B65, conditional on F1 Thm 1.6 at Level A) U9. **U9 stays CONDITIONAL. No HC7-universal obligation is reduced.**

Programme ACTIVE.
