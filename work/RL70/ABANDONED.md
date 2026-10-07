# RL70 — ABANDONED, NOT PROMOTED

Status: ABANDONED / NOT PROMOTED / NO CLOSEOUT.
Recorded: 2026-10-07, by direct user instruction (programme amendment of that date).

RL70 (the all-out HC7 frontier push briefed in `authoritative/RL70_FRONTIER_PUSH_BRIEF.md`
at main commit `0d17783`, RL69 closeout) was stopped without closeout.

- No RL70 result was certified. Nothing on this branch is authority.
- No `sessions/RL70/` freeze exists and none will be created.
- No successor `authoritative/` state was written by RL70.
- Any label used inside the files under `work/RL70/` (for example "PROVED", "certificate",
  "verified") is the working label of an unfinished session. None of them passed an
  adversarial referee pass, an independent re-verification, or a closeout verification, so
  none of them may be cited as a proved result or an exact certificate.
- Incomplete computations are incomplete. In particular `logs/census_B_n14_shard0of6.err`
  ends at 38000 of 72772 tasks; that run covers one shard of six and did not finish.

What this branch holds: the RL70 working directory as it stood when the session was
stopped — Phase 0 literature notes, the running log, census and cross-check tools with
their logs for n <= 13 and partial n = 14, and draft notes.

Why it is kept: the repository's rule is that failed or unfinished work is preserved
honestly rather than erased.

What happened next: on 2026-10-07 the user retired the HC7 root (not solved) and
re-rooted the repository on a Lean 4 formalisation of the paper
"A counterexample to Hadwiger's conjecture" (OpenAI, 23 September 2026). See
`START_HERE.md` on the reorganisation branch. This branch is not merged into it.

Local build products (`*.exe`, `*.pdb` under `work/RL70/scripts/census/`) are ignored by
this branch's `.gitignore` and are not part of the record.
