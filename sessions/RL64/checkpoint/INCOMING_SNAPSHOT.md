# RL64 incoming snapshot (scratch, non-authoritative)

BASE_HEAD: b313c5c865b01805261d7cb8ebb7c0232783051f
BASE_TREE: 6e72d0fb62e32bc7eb45b1222d199acfd358d24a
AUTHORITATIVE_TREE: 88db7077963cf53032cbc4cbd2880e51f0e53a87

Start-gate checks (2026-10-06):
- live main (git ls-remote origin main) = b313c5c865b01805261d7cb8ebb7c0232783051f, matching the user's expected predecessor (checked twice: at plan start and at Phase 0);
- sessions/RL64 does not exist;
- authoritative/START_HERE.md names RL64 as the unique incoming session, with sole brief RL64_HC7_TWO_EDGE_DEFICIENT_FRONTIER_ADMISSION_GATE_BRIEF.md;
- no unresolved integrity failure: RL63 closeout PASS; ledger FL-001..FL-064 present with no gaps;
- required reading completed: AGENTS.md, START_HERE, RL64_STATE, RL64 brief, HC7_RESEARCH_PROGRAMME §10, PROOF_STATE_AND_OPEN_OBLIGATIONS, RL63_STRATEGIC_VERDICT, RL63_SOURCE_GAP_REGISTER, RL63_ROUTE_PORTFOLIO_AND_KILL_LIST, FAILURE_AND_LESSON_LEDGER FL-055..FL-064;
- **precondition (arxiv.org reachable): FAILED** (see RL64_RETRIEVAL_LOG.md, A0 and A0b). User has not supplied exact arXiv versions.

Per-file sha256 of the 22 incoming authoritative files: authoritative_sha256.txt (this directory).
