# Prompt for the next session

Since 2026-10-08 the long session prompts are no longer used (`AGENTS.md`, "What was dropped").
Earlier versions of this file are in git history and **must not be pasted**: they describe a
plan that has been replaced.

To start a session, this is enough:

```text
Continue in this repository. AGENTS.md is binding; read it first, then START_HERE.md.
Check that main equals origin/main, run lake build, python scripts/check_ledger.py,
python scripts/axiom_audit.py and python scripts/check-lean-sources.py, and carry on with
what START_HERE.md says is next. Tell me when something needs me.
```
