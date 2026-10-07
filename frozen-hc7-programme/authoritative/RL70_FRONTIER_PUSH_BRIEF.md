# RL70 brief — all-out HC7 frontier push

Status: READY / NOT STARTED.
Programme: ACTIVE.
Root: HC7 only.
Predecessor: RL69 CLOSED/FROZEN under sessions/RL69/.
Mode: explicit direct-user-authorised all-out frontier push.

Required startup authority: AGENTS.md; authoritative/START_HERE.md; this brief; authoritative/RL70_STATE.md; authoritative/PROOF_STATE_AND_OPEN_OBLIGATIONS.md; authoritative/RL69_REPORT.md; authoritative/RL69_C69_ASSESSMENT.md; authoritative/FAILURE_AND_LESSON_LEDGER.md. Historical records should be loaded as needed for the chosen attack chunks.

The exact authorisation follows verbatim.

=== DIRECT USER INSTRUCTION — RL70 PIVOT (dated 2026-10-06). Appended to the RL69 kickoff. ===

Do RL69 exactly as briefed above. Your bounds and the drift rule still bind RL69 itself.
This instruction changes only the handover you write at RL69 closeout.
When you create the successor authoritative/ state, do NOT write an ordinary bounded gate brief for RL70.
Write RL70 as a single all-out frontier-push session, per the specification below.
Copy this instruction verbatim into the RL70 brief and START_HERE as its authorisation.
This is an explicit user-authorised programme amendment under AGENTS.md (direct user instruction outranks AGENTS.md, the programme and all briefs).
The RL69 handover checks and critics must treat it as authorised, not as drift.

RL70 SPECIFICATION (to be written into the RL70 brief):

1. Mode and authority.
   - RL70 is NOT the tenth-session audit. The audit is waived for RL70; RL71 decides whether to reinstate it.
   - RL70 is NOT a bounded candidate gate. Suspended for RL70:
     - the drift rule;
     - the one-candidate rule;
     - all retrieval, computation and census bounds;
     - the RL64 admission levels as barriers to consumption;
     - the prohibited-route list;
     - the checkpoint/work-unit cadence;
     - the atomic-closeout ceremony.
   - RL70 runs locally with full shell, internet and compute, and should use them aggressively, including parallel subagents.
   - Goal: take a real chunk out of HC7 in one session. Ignore long-term programme hygiene.
   - Root target stays HC7: every finite simple graph with chi=7 has a K7 minor.
   - Any sub-target is fair game if it is a genuine piece of HC7 or of its minimal-counterexample theory.

2. The only two rules that remain:
   (a) Honest labels. Every result is exactly one of:
       - PROVED (written proof, checked by an adversarial referee pass);
       - EXACT COMPUTER CERTIFICATE (reproducible script, logged inputs and outputs, independently re-verified by a second method or implementation);
       - COMPUTATIONAL EVIDENCE;
       - CONJECTURE;
       - FAILED.
       Never present evidence or a sketch as proof.
   (b) Save the work. Commit early and often to a working branch (scripts, logs, notes). Large raw data goes in .gitignore with hashes recorded. Push before the session ends.

3. Phase 0 — state of the art (time-box about 1 hour).
   - Search arXiv and the literature for the current state of:
     - HC for k=7;
     - K7, K7^- and K7^= minors in 7-chromatic and 7-contraction-critical graphs;
     - extremal functions of K7 and K7^-;
     - known minimal-counterexample constraints (connectivity, minimum degree, edge bounds, local structure);
     - small-order verifications of HC;
     - the alpha(G)=2 case.
   - Starting names (not exhaustive):
     - Dvořák–Norin–Rahman 2026 (arXiv:2609.17760; arXiv:2507.03244);
     - Mader;
     - Jakobsen;
     - Kawarabayashi–Toft;
     - Song and Thomas;
     - Rolek–Song;
     - Lafferty–Song;
     - Albar–Gonçalves;
     - Kriesell–Mohr;
     - Norin–Postle–Song;
     - Plummer–Stiebitz–Toft.
   - Read proofs where needed, not just statements.
   - Output a short map: what is known, the strongest constraints on a minimal HC7 counterexample, and 3–5 attack chunks ranked by (chance of success in this session) × (value). The ranking must ensure any result would be NEW relative to the literature.

4. Candidate chunks for Phase 0 to rank (add better ones if found):
   A. Unconditional U9: every 7-chromatic graph has a K7^- minor.
      - Route via C68: every 7-connected graph with n>=8 and >=4n-2 edges has a K7^- minor. Combined with F1 Thm 1.6, this gives U9 (repo: RL65_B65_BRIDGE.md, B65⁷).
      - Steps: computer search for C68 counterexamples on small n; then the K7^- extremal literature; then a proof attempt (structure theorems, discharging, computer-assisted case analysis allowed).
      - If C68 is false, find the counterexample and check what it refutes.
   B. Small-order certificate: HC7 holds for all graphs on <= N vertices, with N as large as possible.
      - Prune with minimal-counterexample constraints: contraction-critical; min degree >= 7; at most 5n-15 edges since K7-minor-free (Mader); 7-connected and similar, where established.
      - Tools: nauty/geng or orderly generation; SAT solvers for 6-colourability and K7-minor tests; a second independent verifier.
      - Check the existing record first, so the result is new.
   C. Structure of a minimal counterexample: new provable or computer-certified constraints, e.g. on neighbourhoods of degree-7/8/9 vertices, on K7^- or K7^= models, or on separations.
      - Routes previously banned (degree-7 local work, Kempe chains, K4,4, model upgrades) are re-opened.
      - First read their FL ledger entries (FL-055..FL-062 and others) and do not repeat the exact recorded failures.
   D. Special classes where computation can close a gap, e.g. HC7 for alpha(G)=2 or another bounded class, if the literature shows an open window.
   E. Verify the key F1 proofs (unrefereed and AI-assisted), e.g. Thm 1.6. Do this only if it materially strengthens A, since it would turn U8/U9 dependencies from "statement only" into checked mathematics.

5. Execution.
   - Pick the top 1–2 chunks after Phase 0 and go hard.
   - Run independent lines as parallel subagents.
   - Kill a route quickly when computation refutes it.
   - Keep a running log: what was tried, what happened, what was killed and why.
   - Spend most effort where a definite, checkable outcome is reachable: a theorem, a certificate, or a counterexample.

6. Deliverables at the end of RL70:
   - RL70_FRONTIER_PUSH_REPORT.md containing:
     (a) the literature map;
     (b) every result with its honest label, plus exact reproduction instructions;
     (c) any counterexamples found, to any candidate;
     (d) failed routes and why;
     (e) the single best next target.
   - Scripts and logs committed.
   - A handover to RL71 with an updated proof state.
   - RL71 decides whether to return to the old conveyor rules, keep the open mode, or run the deferred audit.

=== END DIRECT USER INSTRUCTION ===
