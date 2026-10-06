# RL67 checkpoint verification record

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout.

**Method.** One read-only Workflow (run wf_077f1c6f-f18) ran 4 independent adversarial referees, each instructed to REFUTE one block of RL67_H67_ASSESSMENT.md. They made no edits and used no network. They read the cited F1.txt lines in the scratch extraction (not committed).

**Result.**
- W1 (quotations, Lemma R67): **CONFIRMED**.
- W2 (Proposition V67): **GAP**.
- W3 (counterpattern G*): **CONFIRMED**.
- W4 (variant and scope): **GAP**, with **1 blocking issue**.
- No assigned mathematical claim was found false.

| Referee | Verdict | Issues (blocking / minor / wording) |
|---|---|---|
| W1-quotes-and-LemmaR67 | CONFIRMED | 0 / 1 / 3 |
| W2-V67 | GAP | 0 / 3 / 2 |
| W3-counterpattern-Gstar | CONFIRMED | 0 / 2 / 4 |
| W4-variant-and-scope | GAP | 1 / 4 / 2 |

W1's referee also ran a throwaway exhaustive check of Lemma R67 on S1* and on perturbations of it, finding 0 violations. This is recorded as a **process deviation**. The RL67 brief sets computation to 0, the script was unrequested, and no claim depends on it. Future referees under a 0-computation brief should run no scripts.

## Triage (all applied)

| Issue | Action |
|---|---|
| **Blocking (W4).** "Any such lemma must use K7^- -freeness" is mis-scoped: G* contains K7, so it satisfies a K7^- -forcing conclusion | Rescoped everywhere. G* constrains only arguments that **exclude** the configuration or show G'/G^x 4-bilight, and these need K7^- -freeness or minimality. A direct forcing argument is not constrained. Changed in the assessment §4 and §6, the checkpoint summary, the FL-068 draft and the RL68 rationale |
| **W2.** Every H67 instance also makes S1 a C66 counterexample (P66a + Lemma D), so the brief's falsification-condition remark is wrong | **Correction C67-1** recorded explicitly (scope remark; not a theorem demotion). V67 now states C66 ⇒ H67 vacuously, and that any instance refutes (2.8⁻) and C66 |
| W2: \|V(G)\| bound unargued; Step 0 separation not identified; consequence (iii) over-claimed; a false generalization about minimal-counterexample lemmas | Argument added (\|V(G)\| >= 8). Separation identified. (iii) rewritten as "realistic outcomes are proved or open; refutable only together with (2.8⁻) and C66". The generalization was replaced |
| W4: the variant reframed as proved minimality-derived hypotheses ("G^x is not 4-bilight for every root x with deg_X(x) <= 3"); probe extended to all eligible x by symmetry; the dependency is equivalent to the minimality-assisted H67; e_{S1} defined; labels unified | All applied. The variant is now labelled OPEN (probe only) everywhere |
| W3: "x5 adjacent to all but q1, q2" was wrong (x5 is universal); 5-connectivity case analysis incomplete; S2* is G0 plus root edges; summands unlabelled; 4-bilight implication cited at Level A | All fixed. The case analysis is complete, the S2* transfer is justified, the summands are labelled, and the F1.txt:392–393 implication is re-proved inline |
| W1: citation 335–338; n(S2) >= 2 justified; edge-count wording; symmetric T case | All fixed |

**Outcome.**
- Theorem demotions: NONE.
- Correction C67-1: a scope remark in the RL67 brief.
- The H67 classification (CANDIDATE / NOT ESTABLISHED; open) is unchanged.
- The barrier is now correctly scoped.
