# Changes to the upstream files under `OAI/`

`OAI/` holds 288 files of `openai/math` at commit
`fd4aeeb2ee4fc729c18d98444fed42fd0529eeeb` (Apache-2.0); see `NOTICE`. This file lists every
change made to them in this repository, as section 4(b) of the licence requires.

## State at the commit that added them (2026-10-08)

**None.** The files are byte for byte the upstream blobs: each was written from upstream's
git object and its `git hash-object` was compared with the blob hash in upstream's tree.

Built here unchanged, with Lean `v4.34.1` and Mathlib `d13f23b` (upstream's own pins): 288
modules, no error, no warning. `#print axioms` on
`OAI.HadwigerCounterexample.exists_counterexamples` and on
`OAI.HadwigerCounterexample.not_hadwiger_conjecture` gives `propext`, `Classical.choice`,
`Quot.sound` and nothing else.

To check again: for a file `OAI/X.lean`, `git hash-object OAI/X.lean` at that commit equals
the blob of `lean/OAI/X.lean` in `git ls-tree -r fd4aeeb` of `openai/math`.
