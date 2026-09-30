# RL2 — background research and durable literature intelligence

## Mission

Build a deep, source-grounded map of the existing research landscape around the Hadwiger Conjecture and leave it in a form that future research sessions can query directly from the repository.

The practical standard is:

> A later worker should not need to repeat ordinary literature discovery merely to recover a known theorem, standard definition, major variant, historical milestone, known open case, standard proof technique, or the provenance of a commonly cited claim.

This is a background-research session, not a new proof attempt.

## Scope

Research broadly enough to establish a dependable working picture of:

- the standard formulations and equivalent/closely related formulations used in the literature;
- foundational definitions and terminology;
- historical origin and major milestones;
- proved cases and the exact scope/conditions of those results;
- known reductions, equivalences, strengthenings, weakenings, variants, and nearby conjectures;
- major proof techniques and structural ideas that recur in the literature;
- important counterexamples to stronger variants or tempting false generalizations;
- known computational or finite results, with exact scope and provenance;
- currently open cases and the best-supported description of the frontier;
- major surveys, monographs, papers, preprints, and other primary references;
- terminology/notation aliases that would otherwise cause duplicate searching;
- unresolved ambiguities or source conflicts that future sessions should know about.

Do not turn this into a speculative proof roadmap. Organize what is known; do not choose the project's future proof strategy.

## Source standard

Search widely, but promote only source-grounded records.

Prefer in this order when available:

1. original peer-reviewed papers or authoritative originals;
2. author-hosted manuscripts / arXiv versions of those papers;
3. respected surveys, monographs, or handbook chapters;
4. authoritative databases or institutional pages for bibliographic metadata;
5. secondary expositions only for orientation or where primary material is genuinely unavailable.

For every material claim, retain enough bibliographic metadata that a future worker can identify and recover the source without repeating discovery.

Do not treat search snippets, unsourced summaries, or model memory as evidence.

Where a primary source cannot be checked directly, mark that fact explicitly.

## Required research behaviour

- Deduplicate sources and concepts aggressively.
- Record aliases, spelling variants, theorem-number variants, and terminology changes.
- Separate what a source actually proves from how later literature describes it.
- Preserve exact hypotheses and scope; do not flatten conditional or special-case results into global statements.
- Record publication year and, where relevant, the distinction between preprint and final publication.
- Note retractions, corrections, superseding papers, or conflicting attributions.
- Record unsuccessful search avenues when they would prevent future workers from wasting time on the same ambiguity.
- Use stable IDs for sources, results, topics, variants, and open cases.
- Cross-link records by those IDs rather than by prose-only references.
- Keep quotations minimal; prefer precise paraphrase plus provenance.
- Distinguish historical attribution from current mathematical status.
- Do not promote any project-originated theorem during RL2.

## Required durable outputs

RL2 should build a self-contained background corpus in scratch during research and promote it at closeout.

The promoted corpus should include at least:

- `background/READ_ME_FIRST.md` — navigation and trust model;
- `background/LITERATURE_MAP.md` — human-readable synthesis of the field;
- `background/KNOWN_RESULTS.md` — sourced theorem/result landscape with exact scopes;
- `background/TECHNIQUES.md` — recurring methods and what they have been used to establish;
- `background/VARIANTS_AND_RELATED_PROBLEMS.md`;
- `background/OPEN_FRONTIER.md` — sourced current open status, with uncertainty clearly marked;
- `background/SEARCH_LOG.md` — material searches, dead ends, terminology discoveries, and unresolved provenance questions;
- `background/SOURCE_CATALOG.jsonl`;
- `background/RESULT_CATALOG.jsonl`;
- `background/TOPIC_CATALOG.jsonl`;
- `background/OPEN_CASE_CATALOG.jsonl`;
- `background/GLOSSARY.jsonl`.

The JSONL records must follow `RL2_RESEARCH_RECORD_SPEC.json`.

If additional structured files materially improve future retrieval, add them, but keep the required core stable.

## Retrieval design

The machine-readable files are intended for direct exact-path lookup and lightweight programmatic filtering in later sessions.

Design them so a future worker can answer questions such as:

- “What source established this result?”
- “What exactly is known in this case?”
- “What results use this technique?”
- “What aliases should I search for?”
- “Which statements are primary-source verified?”
- “Which open cases are genuinely open as of the RL2 research cutoff?”
- “Which source conflict or attribution issue is unresolved?”
- “What have we already searched for?”

without a new broad web search.

Human-readable synthesis and machine-readable records must agree. If they conflict, preserve the conflict and fix it before closeout.

## Freshness and cutoff

Record the research cutoff date in every top-level background file and in the machine-readable corpus metadata.

A future session may need to search for post-cutoff developments. The goal is to eliminate repeated discovery of pre-cutoff material, not to pretend literature never changes.

## RL2 closeout requirement

At `finish up`:

1. freeze the full background corpus under `sessions/RL2/background/`;
2. carry the same load-bearing background corpus into successor `authoritative/background/` so future sessions can use it directly;
3. preserve the RL2 source/result/topic/open-case IDs unchanged;
4. create the RL3 session brief separately from the background corpus;
5. if useful, build non-authoritative convenience indexes under `knowledge/`, but never make `knowledge/` the only copy of load-bearing research;
6. verify machine-readable files parse cleanly and cross-references resolve;
7. verify every material human-readable claim has source provenance represented in the structured corpus;
8. report unresolved source gaps rather than filling them from memory.

Do not start RL3 research during RL2 closeout.
