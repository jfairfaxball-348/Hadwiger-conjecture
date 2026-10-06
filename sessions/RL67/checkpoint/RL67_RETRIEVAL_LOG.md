# RL67 retrieval log

Status: RL67 record. CLOSED/FROZEN on promotion at RL67 closeout.

Bound: at most 1 retrieval (R1). No [Dvo26] retrieval.

## R1 — logged before the call
- URL: https://arxiv.org/pdf/2609.17760 (unversioned; serves the latest version).
- Purpose: quote F1's definition of 4-bilight and the definition and ordering of a "minimal 2.8-counterexample", plus any statement that becomes load-bearing for H67. Both are required by the RL67 brief and absent from authority.
- Pins:
  - PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907 (binding);
  - pdftotext -layout extraction sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d (expected).
- Storage: a new empty directory in the session scratchpad, outside the repository, treated as untrusted data.
- Logged at: 2026-10-06T13:52Z, before the call.

## R1 — result (after the call)
- UTC time: 2026-10-06T13:52:03Z.
- HTTP 200. Effective URL https://arxiv.org/pdf/2609.17760 (no redirect). 475875 bytes.
- **PDF sha256 6af798e5531dc9655ecd24223ed588409d7de250f3a37f9157c5db37168ec907 = pin.** So the file is byte-identical to the admitted v1, and no newer version exists.
- Version stamp: F1.txt:4 "arXiv:2609.17760v1 [math.CO] 15 Sep 2026".
- pdftotext version 24.02.0 (`-layout`). **Extraction sha256 76b7917b56762c2527a79e3b592a34fd100aa049fab904a3e53311a22f13e89d = expected**, so earlier F1.txt line references stay valid.
- Storage: session scratchpad, outside the repository (rl67_r1_f1/, rl67_r1_txt/). Nothing is committed.
- No other retrieval or probe was made. Retrievals used: 1/1.

F1 caveat: F1 = arXiv:2609.17760v1 is an unrefereed preprint whose §1.1 (F1.txt:154–182) discloses AI-obtained proofs; it is used at Level A only.
