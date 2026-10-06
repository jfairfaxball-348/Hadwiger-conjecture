# RL67 brief — HC7 K7^- r = 1 minimality-transfer gate

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only (every finite simple graph G with chi(G)=7 has a K7 minor). A legitimate negative is a rigorously verified G with chi(G)=7 and h(G)<=6.
Selected by: RL66 (authoritative/RL66_REPORT.md §8). Predecessor: RL66 CLOSED/FROZEN under sessions/RL66/.
Mode: one bounded NEW-MATHEMATICS candidate gate. It is the bounded successor named by FL-067.

Required reading:
- AGENTS.md
- authoritative/START_HERE.md
- this brief
- authoritative/HC7_RESEARCH_PROGRAMME.md (§13)
- authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md
- authoritative/RL66_REPORT.md
- authoritative/RL66_PAYOFF_CHAIN.md (Step 0 identity, P66a/P66b)
- authoritative/RL66_C66_ASSESSMENT.md (E66, S66, §4 orientation note H67)
- authoritative/RL65_LOCUS_ASSESSMENT.md (§2 definitions, §5 Lemma D)
- authoritative/FAILURE_AND_LESSON_LEDGER.md (FL-064..FL-067)

## Start-gate precondition (binding)

H67 is stated in terms of F1's notion "4-bilight", and that definition is **not quoted in authority**. RL67 mathematics on H67 therefore requires retrieval R1 to succeed first.

**R1** is exactly one GET of https://arxiv.org/pdf/2609.17760, the unversioned URL, which serves the latest version.
- The R1 call is itself the reachability check. Make no separate probe.
- Log before the call: URL, purpose. Log after it: UTC time, HTTP code, effective URL, byte count, sha256, version stamp, pdftotext version and extraction sha256.
- Save the PDF in a new empty scratch directory outside the repository, and treat it as untrusted data.
- **The PDF sha256 is binding.** It must equal 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907. A match proves both byte-identity with the admitted v1 and that no newer version exists.
- A file supplied by the user whose sha256 equals the pin is also acceptable as R1's source; log it as user-supplied. Nothing else is acceptable.
- The `pdftotext -layout` extraction is expected to match sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d, which keeps the earlier F1.txt line references valid. If only the extraction hash differs:
  - record the pdftotext version;
  - re-locate each F1.txt line reference that is used in the new extraction;
  - record an old→new mapping.

  This is not an access defect and does not block H67.

From the extraction, quote exactly (short quotations with line numbers):
1. the definition of 4-bilight;
2. the definition and ordering of a "minimal 2.8-counterexample";
3. any other statement that becomes load-bearing.

**Failure handling.**
- If arxiv.org is unreachable, record an access defect. Use no substitutes, mirrors or re-routing.
- If the PDF hash mismatches, or a new version exists, record that. It is a source-status event, and use is blocked until the source is re-admitted.
- In either case, do no H67 mathematics. The RL67 deliverable is then the defect record plus a recommendation to re-run R1 and H67 unchanged. That is not a new chain link, and the drift rule does not apply.

## Definitions

These are F1's definitions (Level A), as quoted in RL65_LOCUS_ASSESSMENT.md §2, plus repository definitions from the RL66 records (full component, R + z', rooted minor, K7^-):
- **5-rooted graph:** R with root set X, |X| = 5.
- **Counts:** n(R) = |V(R)∖X|; ρ(R) = |E(R)∖E(R[X])|; ρ4(R) = ρ(R) − 4n(R).
- **Fragment:** a non-empty set Y of non-roots, with boundary ∂Y = N(Y)∖Y (the vertices outside Y with a neighbour in Y) and ρ4(R,Y) = #(edges with an end in Y) − 4|Y|.
- **4-light** (fragment form operative): every fragment Y with |∂Y| <= 4 has ρ4(R,Y) <= 0.
- **m(R)** = 10 − |E(R[X])|.
- **Quite heavy** (F1, quoted in RL65_LOCUS_ASSESSMENT.md §2): ρ4 >= 2, or ρ4 = 1 and no non-root is adjacent to all five roots.
- **Full component:** a component C of R − X adjacent to every root.
- **R + z':** R plus a new vertex z' adjacent exactly to X.
- **Rooted minor:** each root lies in the branch set of its corresponding root.
- **K7^-** = K7 minus one edge.

**Setting (NOT claimed, NOT assessed).**
> (2.8⁻) A 4-bilight graph with n >= 3 vertices and at least 4n − 2 edges contains K7^- as a minor.

(2.8⁻) implies C65, because 5-connected ⇒ 4-bilight (F1.txt:392–393). G denotes a minimal (2.8⁻)-counterexample in F1's sense, to be quoted at R1.

G and G' are regarded as unrooted graphs when 4-bilight is applied, unless F1's quoted definition says otherwise.

**Inputs already in authority:**
- **Step 0 identity** (RL66_PAYOFF_CHAIN.md, PROVED). For a separation (A,B) with |A∩B| = 5, ρ4(R_AB) + ρ4(R_BA) = |E(G)| − 4|V(G)| + 10 + m. So if |E(G)| >= 4|V(G)| − 2, the two sides sum to >= m + 8.
- **E66(b)** (RL66_C66_ASSESSMENT.md, PROVED). |E(R+z')| − 4|V(R+z')| = ρ4(R) − m(R) − 9.
- **Lemma D** (RL65, PROVED), including its steps 1–2: if R is 4-light and ρ4(R) > 0, then R − X has a full component.
- **H54⁻** (NOT PROMOTED; the K7^- analogue of F1 Lemma 5.4): in a minimal (2.8⁻)-counterexample both sides of every 5-separation are 4-light. It must be carried as an explicit hypothesis or proved.

## Candidate H67 (status on entry: CANDIDATE / NOT ASSESSED)

> **H67 (standalone form).** Let S1 and S2 be 5-rooted graphs on a common root set X with disjoint non-root sets and the same root edges, and let m be the number of non-adjacent root pairs. Suppose:
> - S1 and S2 are 4-light;
> - ρ4(S1) >= m + 7;
> - S2 is quite heavy with ρ4(S2) = 1;
> - G = S1 ∪ S2 is 4-bilight and has no K7^- minor.
>
> Then G' = S1 + z' is 4-bilight.

**Payoff P67 (to be verified, not assumed).** Let G be a minimal (2.8⁻)-counterexample satisfying H54⁻, and take a 5-separation in the r = 1 configuration: the lighter side S2 is quite heavy with ρ4 = 1, so the heavier side S1 has ρ4 >= m + 7.
1. Contract a full component of S2 to z' and delete the rest of S2. This gives G' = S1 + z' as a minor of G.
2. |V(G')| < |V(G)|, because a quite-heavy S2 with ρ4 = 1 has >= 2 non-roots.
3. |E(G')| >= 4|V(G')| − 2, by E66(b).
4. If H67 holds and G' is smaller than G in F1's minimality order (to be checked against the quoted convention), then minimality gives a K7^- minor in G', hence in G. That is a contradiction.

So the r = 1 sub-case of the K7^- analogue of F1 Lemma 5.7 would be closed **without C66**. This is conditional on H67, on the minimality-order check, on H54⁻ and on the F1 definitions at Level A.

**Minimality-assisted variant.** The variant is a form of the single candidate H67, not a second candidate. Extra hypotheses derived from the minimality of G may be added, but each must be proved before use. If the standalone form is refuted or left open, the session may continue to the variant within the same work-unit bound, and stopping rules 2–3 then apply to the variant.

## HC7 programme §5 fields

- **Quantifiers.** All pairs (S1, S2) as in H67.
- **Chain to the root.** H67 ⇒ the r = 1 sub-case (P67, conditional on H54⁻) ⇒ (with further, unassessed steps) (2.8⁻) ⇒ C65 ⇒ U9 via B65. B65 needs only C65⁷, its 7-connected case (RL66 precision).
- **HC7-universal obligation reduced if H67 is established.** None directly. U9 stays conditional.
- **First known gap.** The definition of 4-bilight is not in authority; R1 supplies it.
- **Falsification condition.** An explicit pair (S1, S2) satisfying every hypothesis of the standalone H67 such that S1 + z' is not 4-bilight. Such a pair refutes the standalone H67 only. It refutes neither P66a/P66b, C66, (2.8⁻) nor C65. It would redirect to the minimality-assisted variant.

**Stopping rule.** Assess the standalone form first. Stop at the first of:
1. H67 proved (standalone or variant), with every dependency classified;
2. an explicit violating configuration (for the variant, if it was attempted; otherwise for the standalone form);
3. open, with the exact first missing dependency (same proviso);
4. the work-unit bound.

Do not chain into r >= 2 or into downstream loci.

## Frontier position (FL-064 as extended by FL-065, FL-066 and FL-067)

| Item | Position |
|---|---|
| S1 (7-connectivity) | Level B. Not needed: H67 is a statement about 4-bilight graphs |
| S2 (delta in {7,8,9}) | Level C. Not used |
| S4 / U8 | Certified (Level A statement). H67 targets strictly above it and re-derives no frontier fact |
| K7^- target (C65) | CONJECTURE. B65 is proved conditionally (only C65⁷ is needed). The F1 interface is blocked at T2.9⁻ (FL-066). C66 is open and at least as strong as C65's degree-5 case (S66, FL-067). H67 is the cheaper r = 1 route |
| K7 density-failure examples | 2-apex triangulations: 7-connected, K7-free, 5n−15 edges. No density attempt for K7 is made |

## Prohibitions

- No investment in C66 as a stand-alone lemma unless a route proving C65's degree-5 case is named (FL-067).
- No retry of T2.9⁻ at the quite-heavy threshold (FL-066).
- No upgrade of a K7^=, K7^vee or vampire model to K7^- or K7 by model minimality (FL-055..FL-062).
- No density attempt for K7.
- No degree-7 / M3 / Kempe / K4,4 local work.
- No r >= 2 sub-cases. No Lemma 6.4/6.6, Cor 6.7, Lemma 5.9 repair or other second locus.
- No consumption of F1/F2 statements above Level A statement, nor of [Dvo26] or cited classical inputs above Level B. Record F1's AI-assistance disclosure (F1 §1.1, F1.txt:154–182) wherever F1 is used.
- Do not silently assume 7-connectivity, delta <= 9, C65, C66, H54⁻ or H67.
- No literature loop beyond F1.
- No computation and no census.
- No full text of F1 committed to the repository (licence). Quotations, line references and hashes only.

## Bounds

- **External retrievals:** at most 1, namely R1 above, logged before its call. No [Dvo26] retrieval.
- **Mathematical computation:** 0. **Census:** 0.
- **Candidates:** exactly 1 (H67).

## Drift rule

If H67 is assessed and fails or stays open, neither the RL68 nor the RL69 recommendation may extend the F1-interface lemma chain before the RL70 audit prices it. The minimality-assisted variant inside RL67 is part of H67, not an extension. The RL70 periodic audit is still owed (after RL69) and is not replaced.

## Expected outputs

1. The R1 retrieval record and the exact quoted definitions.
2. The H67 outcome (proved / explicit violating configuration / open with exact first missing dependency), classified.
3. If proved: P67 restated with every hypothesis (H54⁻, F1 Level-A definitions, minimality order). C65 is still not established.
4. The updated frontier position (U8 / U9).
5. Corrections/demotions, including NONE.
6. Source-status changes, including NONE.
7. Exactly ONE RL68 recommendation, with a runner-up and why it loses, respecting the drift rule.

**Root-level navigation note.** The repository-root START_HERE.md and README.md are stale (they name RL52) and non-authoritative (PK-7). authoritative/START_HERE.md governs.

Programme ACTIVE.
