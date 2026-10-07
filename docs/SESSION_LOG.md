# Session log

Notes made while working, newest session last. This is where failed attempts, surprises
and decisions go. It is a log, not authority: statuses live in the blueprint.

---

## 2026-10-07 — reorganisation session

Branch `lean-formalisation`, started from main `0d17783` (RL69 closeout).

### Step 0 (before any change)

- main was `0d17783`, equal to `origin/main`, as the instruction expected.
- `rl70-frontier-push` was local only, five commits ahead of main. Its one uncommitted
  change (three progress lines in `work/RL70/logs/census_B_n14_shard0of6.err`) was in
  `stash@{0}`, not in the working tree. The working tree, on main, held ten untracked
  `.exe`/`.pdb` build products under `work/RL70/scripts/census/`.
- Installed: git 2.54, elan 4.2.3, Lean and Lake 4.34.1 (also 4.32.0, 4.32.2), Python
  3.12, gh, curl, pdftotext. Nothing was installed.
- Paper, licence, and the search for an existing formalisation: `docs/PROVENANCE.md`.
- **Stop at Step 0.3.** A partial upstream formalisation exists. Reported to the user
  before any change. The user chose to proceed independently (`START_HERE.md`).

### Measuring what upstream had done

At the user's request the upstream Lean library was swept completely and its files for
this paper were compiled. Result: Proposition 3.5 and the conditional Corollary 1.2 chain
for `χ`, nothing else; about 1% of the total effort. Basis for that figure in
`blueprint/MILESTONES.md`.

**Mechanical failure met on the way, not a mathematical one.** The first compile attempt
ran in a deep temporary directory. Five Mathlib modules with long names could not be
written there (Windows long paths are disabled on this machine), so the three upstream
files that `import Mathlib` did not build, while the other seven did. Moving the scratch
project to a short path fixed it and all ten built. Lesson recorded in
`docs/LEAN_WORKFLOW.md`: keep the checkout at a short path.

### What was done

1. `rl70-frontier-push`: stash restored; log and `work/RL70/ABANDONED.md` committed
   (`7aec886`). Not pushed, not merged.
2. `lean-formalisation` created from main.
3. HC7 state frozen under `frozen-hc7-programme/` by `git mv`, unedited.
4. Lean project created; Mathlib checkout reused from the scratch build.
5. Statement layer written: definitions and target statements, 10 `sorry`.
6. Ledger, audit scripts, CI workflow.
7. `START_HERE.md`, `AGENTS.md`, `README.md`, `CONTRIBUTING.md`, `docs/`.
8. Blueprint, fidelity notes, paper issues, milestones.

### Lean notes

- At this Mathlib commit the `SimpleGraph` structure's fields are
  `symm : Std.Symm Adj` and `loopless : Std.Irrefl Adj`, so both need the anonymous
  constructor around the function (`⟨fun _ _ h => …⟩`). A bare function fails to elaborate.
- Mathlib's linter prefers `have` to `haveI` for a `Prop`-valued instance.
- `exact_mod_cast` carries `(h : ℝ) < (k : ℝ)` down to `ℕ` and up to `ℕ∞` in two steps
  without help.
- The Markdown table parser in `scripts/leanscan.py` splits cells on unescaped `|`. Write
  `\|` for a literal bar inside a table cell (for example `\|V\|`). An unescaped one
  shifted the columns and the audit reported an "unknown status"; the audit caught it.

### What was proved in this session

Only what is trivial, as instructed: `Hole.symm` (`DONE`); the final theorem and
`not_hadwigerConjecture` as glue from Corollary 1.2 (`PROVED_MODULO`, so still resting on
`sorry`).

### The full read of the paper

- The whole paper was read once, proofs included: Sections 1 to 3 before the reorganisation,
  Sections 4 to 14 and Appendix A during it. What was checked, and the six places where the
  argument could not be followed on one reading, are in `blueprint/PAPER_ISSUES.md`.
- The "Depends on" columns of the blueprint were seeded mechanically, from the
  cross-references inside each statement and its proof in the TeX source, then adjusted by
  hand: forward pointers that are not logical dependencies were removed, and dependencies
  on definitions and constructions were added. They have not been checked against the
  proofs line by line.
- Nothing in Sections 4 to 14 was verified. No error or gap was established.

### A mistake made and corrected in this session

Commit `b014739` recorded PI-001, "Theorem 1.1 has no proof of its own", and the blueprint
entry T-1.1 said the same. Both were written after reading only Sections 1 to 3. The paper
proves Theorem 1.1 in the last paragraph of Section 14.4. The mechanical cross-reference
scan surfaced a proof block naming `thm:main`, which exposed the error. T-1.1 was corrected
in `33af424`; PI-001 is kept in `PAPER_ISSUES.md` as withdrawn, with the reason. Lesson: do
not record what a paper lacks before reading all of it.

### Tooling notes

- Shell heredocs lose backslashes in this environment. It happened twice, to a Python
  script and to a blueprint append containing `\|`. Write such files with the editor
  tools, not with `cat <<EOF`.
- The audit script must be run after `lake build`; it compiles a generated file under
  `.lake/audit/` that imports `Hadwiger`.

### Not done, and why

- CI has not run: the branch is not pushed (the user is to be asked first).
- The fidelity notes are unreviewed; that is milestone M0.
- Lean Zulip was not searched directly for an existing formalisation (needs an account).
- Theorem 3.1, Proposition 3.4 and the construction of Sections 2.2 to 2.4 are not stated
  in Lean. Theorem 3.1 cannot be stated until the construction and the parameter
  structure exist (milestone M5).

### Push, first CI run, and merge (later the same day)

The user was asked whether to push and answered, verbatim:

```text
Yes do it all push commit merge etc. Lets get this show on the road. When done give me the prompt to start in a new session
```

- `lean-formalisation` (at `e906875`) and `rl70-frontier-push` (at `7aec886`) were pushed
  to `origin`. The push first waited on a GitHub sign-in: this machine had no stored git
  credentials, and the account the `gh` tool is signed into has read-only access to the
  repository. The user signed in with the owning account and the push completed.
- First CI run: workflow "Lean", run `37596760893`, on `e906875`. **Passed**: `lake build`,
  the ledger check and the axiom audit, in 2 minutes 49 seconds. So the "CI has not run"
  item above no longer holds. Two warnings, neither a failure: `actions/checkout@v4`
  targets a deprecated Node.js version, and `ubuntu-latest` changes image on 2026-10-19.
- `main` was then fast-forwarded to `lean-formalisation` and pushed. `rl70-frontier-push`
  was not merged, as intended.

This authorisation covered this push and this merge. The standing rule in `AGENTS.md`
(ask before pushing, and before merging into `main`) is unchanged for later sessions
unless the user says otherwise.

---

## 2026-10-07 — M0 session (statement layer reviewed)

Branch `m0-statement-layer`, started from main `e482512`.

### Start gate

- On `main`, working tree clean, `main` = `origin/main` = `e482512` (checked after
  `git fetch origin`).
- Read: `START_HERE.md`, `AGENTS.md`, the blueprint, the ledger, the milestones, the
  fidelity notes, the paper issues, and the reorganisation entry of this log.
- `lake build` passed. `check_ledger.py`: 10 `sorry`, 10 rows, OK. `axiom_audit.py`: 127
  entries, 30 declarations, OK.
- `paper/paper.pdf` sha256 matches the pin in `docs/PROVENANCE.md`.

### Sanity lemmas

Written in three new files under `Hadwiger/Sanity/` and entered in the blueprint under
"Sanity checks (not in the paper)", IDs `S-M0.*`. Statuses are in the blueprint.

- Every lemma in the M0 list of `blueprint/MILESTONES.md` was proved as listed. **None
  turned out to be false**, so no definition was changed and none needed changing.
- Further checks were added beyond the list, each with its reason in the blueprint:
  the `K_0`/`K_1` edge cases; `K_t` minor iff `t ≤ h(G)`; `h(G) = |V|` iff `G` is complete;
  an edge is a `K_2` minor; `h(G) < χ(G)` in `ℕ∞` iff `χ(G)` is a natural number above
  `h(G)`; and the infimum defining `χ_f` is attained.
- A one-off cross-check (run by hand, not a repository script) confirmed that all 53
  declarations in `Hadwiger/Sanity/` are named in the blueprint and that no `S-M0` row was
  dropped by the table parser. The audit script checks blueprint against build, not the
  reverse; a declaration left out of the blueprint would not be audited. Possible later
  infrastructure change, not made here: have the audit fail on an unlisted theorem.

Scope note. `FractionalColoring.card_le_mul_total` (if every independent set has at most
`k` vertices then `|V| ≤ k · total`) was needed for `χ_f(K_n) = n` and `χ_f(C_5) = 5/2`.
It is the counting step of the paper's proof of Corollary 1.2. M1 was **not** started: the
three `sorry`s of `Hadwiger/ChromaticBounds.lean` are untouched and S-1.a, S-1.b, S-1.c
are still `STATED`.

### Attempts that failed, and why

All were mechanical; none was mathematical.

- `SimpleGraph.top_adj` takes its two vertices explicitly at this Mathlib commit, so
  `top_adj.mp` is not a constant; write `(top_adj _ _).mp`.
- `first | exact ⟨1, by simp, 2, by simp, by decide⟩ | …` does **not** fall through to the
  next alternative when a nested `by simp` reduces its goal to `False`: the nested block
  reports "unsolved goals" as a logged error instead of failing the alternative. The file
  did not compile, so nothing was silently wrong, but the pattern is unusable. Give
  membership proofs as terms (`Or.inr rfl`, `rfl`) and write the cases out.
- `support_subgraphOfAdj` is `SimpleGraph.support_subgraphOfAdj`, not in the `Subgraph`
  namespace.
- `Nat.sSup_mem ⟨0, …⟩ h` could not infer the set from an `∃` goal; pass `(s := {k | …})`.
- `rcases ha with rfl | rfl` on `ha : a = i ∨ a = i + 2` substituted the bound variable `i`
  away; keep the equations and rewrite.
- In `∀ s, ¬ G.IsIndepSet (s : Set V) → f s = 0` the binder was elaborated as a `Set V`;
  annotate it `∀ s : Finset V`.

### Lean notes

- Renamed at this Mathlib commit (the old names still work but warn): `ENat.coe_ne_top` →
  `ENat.natCast_ne_top`; `Set.setOf_forall` → `Set.ofPred_forall`; `continuous_finset_sum`
  → `continuous_finsetSum`; `if_neg` is deprecated.
- `SimpleGraph.cycleGraph n` has a kernel-evaluable `DecidableRel` instance, so facts about
  `cycleGraph 4` and `cycleGraph 5` can be proved by `decide`. `pathGraph n` is `hasse`;
  use `pathGraph_adj` and `simp`.
- Useful and present: `induce_pair_connected_of_adj`, `induce_singleton_eq_top`,
  `Connected.map`, `induceHom`, `Subgraph.IsMatching.iSup`,
  `Subgraph.IsMatching.subgraphOfAdj`, `Subgraph.edgeSet_iSup`,
  `Subgraph.edgeSet_subgraphOfAdj`, `sum_degrees_eq_twice_card_edges`,
  `IsCompact.exists_isMinOn`.
- The `cover` field of `FractionalColoring` carries a classical decidability instance.
  Inside a proof that starts with `classical`, `Finset.sum_filter` rewrites it and the
  instances agree up to `rfl`. A lemma that takes `[DecidableEq V]` as a hypothesis has a
  different instance; `exists_fractionalColoring_of_family` handles that once, with `simp`.
- `exists_isConnectedMatching_of_family` builds a `Subgraph` matching from an indexed list
  of disjoint edges and computes its `edgeSet.ncard`. `blueprint/MILESTONES.md` names this
  as a gap for M2; it now exists.

