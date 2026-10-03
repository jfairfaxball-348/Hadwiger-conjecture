# RL2 background corpus

Research cutoff: 2026-09-30. Session: RL2. Status: PROMOTED BACKGROUND — frozen RL2 and inherited successor corpus.

This corpus records external literature. It contains no project-originated theorem, certificate, proof attempt, or selected proof strategy. The separate [RL3 brief](../RL3_TOP_DOWN_ROADMAP_BRIEF.md) records the user's requested RL3 roadmap mandate, now installed as the successor brief.

Start with [LITERATURE_MAP.md](LITERATURE_MAP.md), then [OPEN_FRONTIER.md](OPEN_FRONTIER.md). Use [KNOWN_RESULTS.md](KNOWN_RESULTS.md) for statements and exact scopes, [TECHNIQUES.md](TECHNIQUES.md) for methods, and [VARIANTS_AND_RELATED_PROBLEMS.md](VARIANTS_AND_RELATED_PROBLEMS.md) before translating a result between conjectures. [SEARCH_LOG.md](SEARCH_LOG.md) records searches, failures, and freshness gaps.

The five JSONL catalogs are the retrieval layer. Stable IDs are SRC-####, RES-####, TOP-####, OPEN-#### and TERM-####. Every referenced ID resolves within this corpus. Every record carries the cutoff date; open cases also have an explicit as-of date. An exact copy of the incoming schema is [RECORD_SPEC.json](verification/RECORD_SPEC.json), carried inside the corpus for portability. Additional fields retain exact checked locations, verification basis and literature origin.

Trust labels must be read together:

- `checked_primary` means the source text at the recorded location was inspected for the stated result and hypotheses. It does not mean RL2 independently proved it or reran its computation.
- `checked_authoritative_secondary` means the cited survey was inspected. An original cited by it can still be `not_directly_checked`.
- `primary_source_verified` on a result refers to its own theorem/statement source. A later paper's historical attribution is not direct checking of the original.
- `proved` in RESULT_CATALOG means an inherited literature theorem. Checked preprints retain their preprint identity; their full proofs have not been independently certified here.
- `uncertain` and `source_gap` must not be consumed as theorems.

There are 31 sources, 31 results, 14 topics, 8 open/source-gap records and 30 glossary terms. Thirteen primary sources and two authoritative surveys were directly inspected at the stated locations. The remaining sources retain explicit access/provenance limits. See [SOURCE_CHECKS.md](SOURCE_CHECKS.md).

RES-0015/SRC-0014 is a reported September 2026 improvement whose manuscript could not be retrieved. It is quarantined. RES-0010 is the directly checked uniform baseline, not a claim about the world's current record. OPEN-0005 also retains a dedicated fractional-frontier freshness gap. This is a substantive working corpus, not proof that every pre-cutoff publication was found.

Useful exact retrieval:

```bash
rg '"result_id":"RES-0012"' RESULT_CATALOG.jsonl
rg 'primary_source_verified":true' RESULT_CATALOG.jsonl
rg 'not_directly_checked|uncertain|source_gap' *_CATALOG.jsonl
python3 -I verification/verify_corpus.py
```

The verifier checks packaging, records, IDs and provenance consistency. It does not verify graph-theoretic proofs. [../VERIFICATION_REPORT.md](../VERIFICATION_REPORT.md) records the separate scope review.

The complete corpus is frozen under `sessions/RL2/background/` and carried identically to `authoritative/background/`, with IDs preserved. The RL3 brief is separate. RL3 research has not started. RL2 is CLOSED/FROZEN. This background is inherited by the sole incoming RL3. Corpus BASE_HEAD is provenance; a later worker must pin its own live HEAD at the normal start gate.
