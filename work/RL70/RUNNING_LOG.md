# RL70 running log — all-out HC7 frontier push

Non-authoritative working record. Labels follow the RL70 brief:
PROVED / EXACT COMPUTER CERTIFICATE / COMPUTATIONAL EVIDENCE / CONJECTURE / FAILED.

## Start gate (2026-10-06)

- BASE_HEAD = 0d177830536cd5bc2e3b6b6c99b9a07e1788946b (local main = origin/main).
- Incoming authority tree (git rev-parse HEAD:authoritative) = 94b6ffa48bb21416d0de556af4a34b426f3de903.
- Unique incoming RL: RL70. Sole brief: authoritative/RL70_FRONTIER_PUSH_BRIEF.md.
- Mode: all-out frontier push. The AGENTS.md tenth-session audit is waived for RL70 by the
  direct user instruction dated 2026-10-06 recorded verbatim in START_HERE.md, the brief and
  sessions/RL69/checkpoint/RL69_SESSION_STATE_AND_RL70_KICKOFF.md (committed in 0d17783).
- Unresolved integrity failure in current authority: none recorded.
- Working branch: rl70-frontier-push. Working directory: work/RL70/.
- Local tooling: Python 3.12 (networkx 3.4.2, numpy, scipy), Rust 1.97.1 (MSVC, links OK),
  Node. NOT present: nauty/geng, any SAT solver, C compiler, Sage, WSL. 16 logical CPUs.

## Phase 0 — literature map

(in progress)

Phase 0 outcome: see notes/PHASE0_MAP_AND_RANKING.md. Two fan-out attempts (9 parallel workers)
were cut off by the account usage limit; partial notes in literature/ were used to finish inline.
Killed by Phase 0 (already known): chunk D (alpha=2: Bosse 2019 / Carter 2022) and chunk B at
n <= 13 (Song-Thomas 2006 Lemma 3.7 computer search).  Selected: chunk B beyond n = 13.

## Execution log

1. recon/recon.rs — exact K7-minor tester + sampling. 100k random edge-minimal min-degree-7 graphs
   on 13..18 vertices: all have K7 minors (COMPUTATIONAL EVIDENCE only; expected).
2. recon/proto.rs — first rooted DFS prototype, n=13: 0 graphs, 8,693,996 nodes, 615 s single thread.
3. census/census.rs (tool A: rooted level search, isomorph rejection by canonical form):
   n=8..13 all 0 graphs (n=13: levels 876 / 38,627 / 1,102,792 / 4,705,988 / 38,666 / 0; 436 s,
   14 threads).  Middle levels blow up; tool A is not usable at n=14.
4. census/censusB.rs (tool B: rooted row-ordered DFS, sorted patterns + Aut(H) symmetry breaking):
   n=8..13 all 0 graphs; n=13: 8,693,120 nodes, 68,324,231 minor tests, 74 s on 14 threads.
   Tools A and B agree for n <= 13 (both empty).  Shards verified to partition the work (n=12).
5. census/crosscheck.rs — second, independent exact minor tester (spanning branch-set partition
   search) vs the contraction tester: 300,000 random graphs (n=7..14, t=4..7, 34,349 negatives):
   0 disagreements.
6. census/censusD.rs (tool D: minimal-counterexample search with Dirac bound + Mader edge budget):
   n=10..13, root degree 7: no leaf.  n=13: 924,466 nodes (9x fewer than tool B).
7. RUNNING: tool B n=14 in 6 shards (shard 0 started; ~36k nodes/s on 12 threads),
   tool D n=14 d=7 on 4 threads.
Growth per extra vertex is ~x80 (tool B) and ~x46 (tool D): n=15 is out of reach for tool B and
costs roughly 10 h x 14 threads for tool D.  KILLED for this session: tool A beyond n=13.
