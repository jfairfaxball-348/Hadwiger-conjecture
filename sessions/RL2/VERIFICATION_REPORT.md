# RL2 verification and remaining limits

Research cutoff: 2026-09-30. Status: FROZEN RL2 — source/scope verification, not mathematical proof certification.

The local corpus validator passed on 2026-09-30:

```bash
python3 -I background/verification/verify_corpus.py
```

It checks required files and schema fields, parseable JSONL, unique stable IDs, all structured and embedded ID references, enum values, source inspection classifications, HTTP(S) URLs, explicit cutoffs, record counts, source support, agreement of the human theorem table with structured statements/scopes, and guards against promoting the root conjecture or unretrieved September lead. The copied record specification is byte-identical to the pinned incoming specification.

Validated counts: 31 sources; 31 results; 14 topics; 8 open/source-gap records; 30 glossary terms. Direct inspection: 13 primary sources and 2 authoritative surveys. Sixteen original/metadata leads are not directly checked. Project-originated mathematical claims: zero.

Manual source/scope review focused on errors analogous to the Collatz record:

| Probe | Retained scope / outcome |
|---|---|
| t versus color-bound indexing | TERM-0008 preserves t=s+1; t=6 result and t=7 frontier are distinct. |
| “K_t-free” ambiguity | TERM-0026 distinguishes subgraph exclusion from minor exclusion; RES-0013 uses the stated subgraph condition. |
| Constants and quantifiers in linear transfer | RES-0011, RES-0012 preserve absolute C, C^2t, integer parameter range and unbounded t. No sharp transfer claimed. |
| Connectivity extraction versus exact coloring | RES-0014 keeps d=e/v, k>=t>=3 and the size bound; no claim chi(H)=chi(G). |
| Necessary dichotomy versus contradiction | RES-0030 retains both OR alternatives; neither is excluded. |
| Ordinary versus odd witness | RES-0016, RES-0017 only reject odd strengthening; ordinary remains open. |
| Fractional versus integral conclusion | RES-0019, RES-0020 retain factor two and rational weights; no rounding theorem supplied. |
| List / subdivision substitution | RES-0023–RES-0025 record false strengthenings. |
| Finite verification versus universal coverage | RES-0026's 633 configurations require unavoidability; no graph census or general-Hadwiger certificate claimed. |
| Minimal counterexample reduction | RES-0028 is scoped at fixed t; general chromatic minor-monotonicity is not assumed. |
| Publication/version identity | SRC-0011 distinguishes v1/v2 exponent and authors; SRC-0012 distinguishes preprint/online/issue dates. |
| Freshness quarantine | RES-0015 remains uncertain and OPEN-0008 a source gap; OPEN-0005 retains its dedicated freshness gap. |
| Collatz verdict scope | Review distinguishes a failed bridge family from falsity of the conjecture or demotion of valid local theorems. |
| RL3 project scope | Separate roadmap mandate; no chosen proof attack, new theorem or RL3 research started. |

The mechanical checks do not validate mathematical proofs or certify the completeness of the literature search. Manual review checked source statements and consumption boundaries; it is not an independent full-proof audit.

Unresolved items are already status-bearing records, not hidden dependencies: September Lin manuscript access; dedicated current fractional-frontier check; historical originals not retrieved; Hadwiger/Duchet–Meyniel page endpoints; Gonthier report date; and final-publication status of checked recent preprints. A later route must resolve any of these that it consumes.

One packaging defect (a trailing blank JSONL line) was detected and corrected before validation passed. It changed no mathematical record.

The checkpoint was saved on work/rl2-background-20260930 at acc46fbe8175f35f8e7de39b74f1af59b81e47a4. Readback verified all 24 checkpoint blobs and confirmed the default branch and incoming authority unchanged. This report preserves that source/scope review; RL2_CLOSEOUT_VERIFICATION.md records the separate promotion checks.
