# RL70 Phase 0 — state-of-the-art map and chunk ranking

Non-authoritative RL70 working note. Sources and verification tags are in
`work/RL70/literature/L1..L7, R1, R2` (partial saves: the Phase 0 fan-out was interrupted twice by
the account usage limit; every file was written incrementally and is usable, but L2, L3 §4–6,
L4 §6–10, L5 (c)(d), L7 §3–6 are unfinished). Tags below: **V** = read in the source this session
by a Phase 0 worker; **S** = secondary quotation or recalled; **own** = RL70 derivation.

## 1. What is known (October 2026)

| Topic | Best known | Source |
|---|---|---|
| HC7 itself | OPEN | — |
| 7-chromatic ⇒ K7^vee minor | PROVED (preprint) | Norin–Totschnig arXiv:2507.03244 Thm 4 (**V**) |
| 7-chromatic ⇒ K7^= minor | PROVED (preprint, AI-assisted proofs) | Dvořák–Norin–Rahman arXiv:2609.17760 Thm 1.1 (**V**) |
| 7-chromatic ⇒ K7^- minor | OPEN (NT Conj. 21). K7^- -minor-free ⇒ 7-colourable (Jakobsen) | **V**/**S** |
| K7-minor-free ⇒ 7-colourable | OPEN; 8-colourable (Albar–Gonçalves 2018; Rolek–Song 2017) | **S** |
| 7-chromatic ⇒ K7 or K4,4 | Kawarabayashi–Toft 2005 | **S** |
| ex(n, K7) | e ≥ 5n−14 ⇒ K7 minor (Mader, Math. Ann. 178 (1968)) | **V** as quoted in Song–Thomas, Rolek–Song |
| ex(n, K7^-) | e ≥ (9n−24)/2 ⇒ K7^- minor or (K_{2,2,2,2}, K6, 4)-cockade (Jakobsen 1983) | **V** as quoted (two independent quotations) |
| 5-connected, e ≥ 4n−7 ⇒ K7^= | DNR Thm 1.3; sharpened to 4n−9 (n ≥ 7) by Chang–Deng–Tang–Yang arXiv:2609.26041 (22 Sep 2026) | **V** |
| 5-connected, e ≥ 4n−2 ⇒ K7^- | OPEN = DNR Conj. 1.5 (= repo C65; C68 is its 7-connected case). Authors: "no apparent fundamental obstruction" | **V** |
| Minimal K7^- -free non-6-colourable graph | 7-connected, e ≥ 4n−2, ≤ one K5, no K6^- (DNR Thm 1.6, Lemmas 7.2/7.6/7.7) | **V**; §7 proof re-read step by step by worker L1, no gap found (single pass, not a referee report) |
| Connectivity of 7-contraction-critical graphs | 7-connected (Mader, Math. Ann. 175 (1968)); nothing better for k < 17 | **V** as quoted in five papers. F2's citation of Math. Ann. 174 (1967) is a slip: 174 is the density paper, 178 the extremal-function paper, 175 the connectivity paper |
| alpha(G) ≤ 2 | HC7 restricted to alpha ≤ 2 is PROVED without computer (Bosse 2019 Remark 1.7 via Chudnovsky–Seymour seagulls); a minimal alpha=2 counterexample to HC has 31 or ≥ 33 vertices (Carter arXiv:2211.00259) | **V** |
| δ ≥ 7, n ≤ 13 | Song–Thomas 2006 Lemma 3.7 (computer; McKay's list): exactly 14 graphs with δ ≥ 7, 9 ≤ n ≤ 13 and no K7 ∪ K1 minor. Program re-run after a 2017 bug fix | **V** |
| δ ≥ 7, n ≥ 14, K7-minor-free | NOT LOCATED in the literature; no analogue of Mader's "δ ≥ 5 ⇒ minor in {K6, I, C5*K3bar, K_{2,2,2,1}−e}" for δ ≥ 7 (Fijavž–Wood leave even D̂_4 undetermined) | **V** |
| Order of a minimal HC7 counterexample | No explicit bound located beyond Gallai-type n ≥ 13 and what Song–Thomas' list implies | L5 (c),(d) unfinished |
| Large graphs | Norin–Thomas (announced, slides only): large t-connected K_t-minor-free graphs are (t−5)-apex planar | **V** (slides) |
| Asymptotics | Norin–Steiner arXiv:2610.05291 (4 Oct 2026): linear Hadwiger, proof "found by GPT-6 Astra" | **V** abstract; irrelevant to t = 7 |

## 2. Strongest constraints on a minimal HC7 counterexample G

1. 7-contraction-critical, K7-minor-free, δ ≥ 7, alpha(G[N(v)]) ≤ d(v) − 5 (Dirac).
2. 7-connected (Mader 175); hence ω ≤ 5.
3. e ≤ 5n − 15 (Mader 178); hence δ ∈ {7, 8, 9} and Σ_v (10 − d(v)) ≥ 30.
4. Contains K7^=, K7^vee (DNR, NT) and K4,4 (KT) minors.
5. A degree-7 neighbourhood contains K4 or the Moser spindle (KT §2; exhaustively re-checked by worker L1).
6. Any three 5-cliques have union of size ≤ 11 (Kawarabayashi–Luo–Niu–Zhang form, 7-connected).
7. Not double-critical (Kawarabayashi–Pedersen–Toft).
8. Rolek–Song Kempe-path lemma at a degree-7 vertex (no connectivity needed).
9. NOT available at K7 strength: "every degree-7 vertex lies in a K5", "at most one K5", any bound on the
   number of degree-7 vertices — all known proofs end in K7^- or K7^vee, not K7.

## 3. Chunk ranking, (chance in this session) × (value), novelty checked

| Rank | Chunk | Chance | Value | New? | Decision |
|---|---|---|---|---|---|
| 1 | **B. Census of K7-minor-free graphs with δ ≥ 7 beyond n = 13, and "HC7 holds for all graphs on ≤ N vertices"** | high for N = 14; unknown beyond | modest but definite | yes: Song–Thomas stop at 13 and exclude K7 ∪ K1 rather than K7; no HC7 small-order statement located | **ATTACK** |
| 2 | A-obs. C68 / DNR Conj. 1.5 at small order from Jakobsen's extremal function | certain | small | not stated in F1/F2 | record |
| 3 | E. Check of F1 §7 (Thm 1.6) | done at single-pass level by L1 | supports U8/U9 dependencies | — | record, not promoted |
| 4 | A. Prove C68 / Conj. 1.5 | low | high (gives U9) | yes, but advertised and under active attack (one-week turnaround on Conj. 1.4) | not attempted |
| 5 | C. New K7-strength local structure at degree-7 vertices | low (45 recorded failed sessions; KM19 Thm 2 barrier) | high | yes | not attempted |
| — | D. alpha = 2 | — | — | **NO: already a theorem** | KILLED |
| — | B at N ≤ 13 | — | — | **NO: Song–Thomas 2006** | reproduced only as a control |

## 4. Phase 0 process record

- Fan-out of 9 parallel workers twice hit the account session limit (2026-10-06 ~19:45 and ~20:11
  Europe/London); 1 of 9 returned a structured result (ledger digest), the other 8 left partial notes.
- Phase 0 was completed inline from those notes. No further fan-out was used for execution.
