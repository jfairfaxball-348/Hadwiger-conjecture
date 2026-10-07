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

### The fidelity re-read and the review sheet

- Every note in `blueprint/FIDELITY.md` was re-read against the paper's TeX source
  (Sections 1, 2.1 and 3.3) and against the Mathlib source at the pinned commit. The
  Mathlib definitions quoted in the notes (`indepNum`, `IsNIndepSet`, `IsIndepSet`,
  `chromaticNumber`, `Colorable`, `Coloring`, `Subgraph.IsMatching`, `Connected`,
  `induce`) are as the notes say.
- **This re-read is not the review.** It was done by a worker, not by the user, and the
  worker is not independent of the one who wrote the notes. No note was marked reviewed.
- Result: `blueprint/M0_REVIEW_SHEET.md`, 19 items (11 definitions, 8 stated results),
  each with the paper's sentence, the Lean text, what is machine-checked, the doubts, and
  an empty sign-off line; and 7 questions that need a decision.
- No definition was found to disagree with the paper.
- Found on the way, and recorded on the sheet:
  - `FIDELITY.md` cited a section of Diestel's book from memory. Not checked; now flagged
    as unchecked in the note.
  - `FIDELITY.md` had no note for S-1.a, S-1.b, S-1.c, S-2.3 or T-NOT-HC. Their differences
    in form were only in Lean doc comments, which `AGENTS.md` allows. Notes were added,
    unreviewed, so that the sheet and the notes cover the same items.
  - Two sentences of the paper have no Lean statement: the second half of equation (2.3),
    `χ(G) ≥ ⌈m/2⌉`, and the last clause of Corollary 1.2, that `χ_f(G) ≤ h(G)` is false
    (blueprint S-1.d). Neither is used later. Both are put to the user as questions.
  - Nothing in Lean shows that `Hole` can hold. A hand example is on the sheet. It is an
    example worked on paper, not a proof.
- `FIDELITY.md` was updated to say which former "to prove at M0" items are now proved, with
  their blueprint IDs. Each note ends "Review: not reviewed".

### Mistake made and corrected in this session

`blueprint/MILESTONES.md` was first given a line count for the sanity files (761) that had
been written before it was measured. `wc -l` gives 809. Corrected before the commit.

### Push and CI

- The user's instruction for this session allows pushing the working branch without
  asking. `m0-statement-layer` was pushed at `7598686`. The push waited several minutes on
  Git Credential Manager (a sign-in window on the user's machine) and then completed.
- CI: workflow "Lean", run `37602381451`, on `7598686`: **passed** in 2 minutes 27 seconds.
- Nothing was merged into `main`.

### Tooling note

A shell heredoc containing an apostrophe failed to parse in this environment ("unexpected
EOF while looking for matching quote"), even with a quoted delimiter. This is the same
family of problem as the lost backslashes recorded in the reorganisation entry. Put
scripts in a file with the editor tools and run the file.

### Not done, and why

- The review itself: it is the user's, by instruction.
- M1: not started, by instruction.
- No sanity lemma for `HoleData`, `Hole` or `positionGraph`: the M0 list has none, and the
  task named the three other definitions. Put to the user as question Q4.
- Transitivity of `IsMinor`, and the equivalence of the branch-set definition with a
  definition by contractions: not attempted. Mathlib has no contraction of simple graphs.

### The user's answers to the seven questions (later the same day)

The checkpoint report put the sheet's seven questions to the user. The answer, verbatim:

```text
q1 - accept, q2 - check it, q3 - accept, q4 - yes, q5 - state it, q6 - state it, q7 - that's fine.
```

What was done with each:

- **Q1 (branch-set definition of minor): accept.** Recorded in F-MINOR.
- **Q2 (the Diestel citation): check it.** Checked against the author's free preview of the
  book, Chapter 1, fetched from the author's site, which describes it as the sixth edition
  (2025). Section 1.7 is "Contraction and minors" (pages 19 to 21 of the chapter). After
  defining minors through a subgraph with connected branch sets, the book restates the
  notion as a map from a subset of `V(Y)` onto `V(X)` with connected fibres and an edge
  between the fibres of the ends of each edge of `X`. That is `MinorModel` clause for
  clause; the book's "connected" (its Section 1.4) means non-empty with connected induced
  subgraph, as Mathlib's does. The deletion-and-contraction characterisation is Corollary
  1.7.2 there, for finite graphs. The tables of contents of the first and second editions
  also have 1.7 "Contraction and minors". So the citation stands, and F-MINOR now says what
  was checked and in which edition. What was checked is the text of the book; the
  equivalence with contractions is still not formalised.
  - A web search summary attributed the deletion-and-contraction statement to
    "Proposition 1.7.1". In the edition checked, 1.7.1 is the partial-order statement and
    the characterisation is 1.7.2. Statement numbers differ between editions; the note
    cites the edition. Lesson: a search summary is not the source.
- **Q3 (dropping finiteness in `HoleData`): accept.** Recorded in F-HOLE.
- **Q4 (a non-vacuity lemma for `Hole`): yes.** Entered in the blueprint as
  S-M3.hole-nonvacuous, `NOT_STATED`, and in the M3 task list. **Not proved in this
  session.** The question as put said the lemma "would belong to M3", and the session's
  instruction was to start nothing beyond M0. Reading "yes" as "yes, at M3" is the worker's
  interpretation; the user has been told so.
- **Q5 (second half of equation (2.3)): state it.** Added
  `HoleData.le_two_mul_chromaticNumber_positionGraph`:
  `∃ k : ℕ, (D.positionGraph o).chromaticNumber = k ∧ m ≤ 2 * k`. `Hadwiger/HoleRelation.lean`
  now imports `Hadwiger/ChromaticBounds.lean` for S-1.a.
- **Q6 (the fractional weakening is false): state it.** Added the definition
  `FractionalHadwigerConjecture` and the theorem `not_fractionalHadwigerConjecture`, with
  blueprint entry D-1.fHC, fidelity note F-FHC and sheet item R-20. The definition is new
  and unreviewed.
- **Q7 (notes added for five statements): "that's fine".** Read as accepting that the notes
  were added. Not read as the sign-off of those items. This reading is the worker's.

A decision taken by the worker, for the user to overrule: the two theorems of Q5 and Q6
were given complete proof bodies instead of `sorry`, because each follows in a few lines
from results already stated. They rest on `sorry`s (the first half of S-2.3 and S-1.a;
Corollary 1.2), so they are `PROVED_MODULO`, not proved. No `sorry` was added or removed:
still 10. The alternative, a `sorry` each and two more ledger rows, was not taken. The
`sorry`s of M1 and M3 are untouched.

**Not done: no fidelity note was marked reviewed.** The user's answer decides the seven
questions. It does not say that the items of the sheet are accepted, and the instruction
for this session was that the worker must not mark a note reviewed. The user is being
asked.

### Push and CI, second round

- The second push also waited on Git Credential Manager, for about twenty minutes, and
  then completed. Remote and local were both `7723329` afterwards.
- CI on `7723329` (run `37604790371`) was still running when this entry was written. Its
  result is not recorded here.

### The sign-off

After the seven questions were carried out, the user was asked two things through a
prompt with fixed options. Questions and answers, verbatim:

```text
How should the sign-off of the 20 review-sheet items be recorded in FIDELITY.md?
  -> Accept all 20 items

Q4, the lemma showing that the hole relation is not vacuous: when should it be proved?
  -> At M3, as recorded
```

The first option's description, as shown to the user: every fidelity note gets the line
"Reviewed by John Fairfax-Ball, 2026-10-07" (name taken from the git configuration), and M0
is then complete.

Done on that instruction:

- `blueprint/FIDELITY.md`: all 19 notes now end "Reviewed by John Fairfax-Ball, 2026-10-07"
  with their sheet item numbers; together they cover the 20 items. The header says how the
  sign-off came about and what it covers: the notes and the Lean text as they stood at the
  commit that records it, and nothing later.
- `blueprint/M0_REVIEW_SHEET.md`: the 20 sign-off lines are filled in, and the question and
  answer are quoted.
- `blueprint/MILESTONES.md`: M0 is complete; the single next task is M1.
- The hole non-vacuity lemma stays where it was put: blueprint S-M3.hole-nonvacuous,
  `NOT_STATED`, for M3. The worker's reading of the answer to Q4 was confirmed.

What the sign-off is and is not. It is the user's acceptance of the notes after reading a
sheet prepared by a worker. The sheet lists every doubt the worker found; it cannot list
doubts the worker did not find. The sanity lemmas are machine-checked; the fidelity
arguments are not.

M1 was not started.

### Push and CI, final state of the session

Written after the fact, in a commit of its own; the CI result of this last commit is
therefore not recorded here.

| Commit | What | On the remote | CI |
|---|---|---|---|
| `7598686` | sanity lemmas and their blueprint section | yes | passed, run `37602381451` |
| `69c8d66` | review sheet, fidelity notes | yes | no run of its own (never a pushed head) |
| `7723329` | blueprint wording fix | yes | passed, run `37604790371` |
| `ee76bde` | the user's decisions carried out | yes | no run of its own (never a pushed head) |
| `1e3367f` | the sign-off recorded; M0 complete | yes | passed, run `37605970094` |

`main` was not touched: it is still `e482512`, equal to `origin/main`. The user has been
asked whether to merge and had not answered when this was written.

**A trap met twice: committing while a push is waiting for a sign-in.** Each push waited
ten to twenty minutes on Git Credential Manager. Twice a commit was made during that wait.
When the push went through, git sent the branch as it stood at that moment, including the
new commit, but printed the older commit in its summary (for example `7723329..ee76bde`
when the remote received `1e3367f`) and set the local remote-tracking ref to that older
commit. So the printed summary and `git status` both understated what was on the remote.
Nothing was wrong on the remote. How it was noticed: `git ls-remote` disagreed with the
push output, and the list of CI runs had no run for the commit the output named.

Rules that follow:

- After a push, check `git ls-remote --heads origin <branch>` against `git rev-parse HEAD`.
  Do not rely on the push summary or on `git status`.
- Run `git fetch origin` afterwards to correct the tracking ref.
- Better: do not commit while a push is waiting.
- Match a CI run to a commit by its hash (`gh run list --json headSha,...`), not by its
  title.

### Why every push asked the user to sign in, and the fix

The user wrote, verbatim:

```text
I can't keep manually authorising each push/commit or merge or whatever. Can I not set global permission - you are on 'bypass permission' mode and the github account should be authorised?
```

Diagnosis (read-only; no secret was displayed):

- The window was not Claude's permission mode, which cannot affect it. It was Git
  Credential Manager (2.7.3, the only credential helper configured, in the system git
  configuration).
- GCM holds two GitHub accounts on this machine, `jball348-svg` and `jfairfaxball-348`.
  The remote URL named neither, so GCM had to ask which to use on every push. That is the
  ten-to-twenty-minute wait recorded above: the push sat until the user chose.
- Test, with `GCM_INTERACTIVE=never` so that nothing could open a window: asking git for
  the github.com credential without a username failed with "Cannot prompt because user
  interactivity has been disabled"; with `username=jfairfaxball-348` it succeeded at once.
- `gh` is signed in as `jball348-svg`, which is not the account that owns the repository.
  `gh` can read the repository and its CI runs; pushes go through git and GCM, not `gh`.

Fix, on the user's approval (question and answer below): the account is now named in the
remote URL of this checkout,

```text
https://jfairfaxball-348@github.com/jfairfaxball-348/Hadwiger-conjecture.git
```

It names the account and holds no secret. It lives in `.git/config`, so it is **not** in
the repository: a fresh clone on this machine needs the same one-line
`git remote set-url`. The next push (`46ab21e`) completed in seconds with interaction
disabled.

The user also asked for a setting that covers every repository. That is a user-wide git
setting about which identity signs in everywhere, with a side effect on any repository
that must push as the other account, so it was left to the user: the command was given to
them and not run. It was tested without being applied (a one-off `-c` override returned the
credential silently).

To avoid opening a window on the user's machine by accident, pushes from a worker session
can be run with `GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0`: if git would need to ask, it
fails at once instead.

### Standing rule changed: pushes no longer need asking

The user was asked two questions through a prompt with options. Questions and answers,
verbatim:

```text
Set this repository to always use the GitHub account jfairfaxball-348, so pushes stop opening the account-picker window?
  -> yes, set it - but I would rather a global permission for all repo's/projects/sessions in claude code

AGENTS.md says to ask before every push and before every merge into main. What standing rule do you want recorded there instead?
  -> Push freely; merge M0 now
```

The second option's description, as shown to the user: "I push working branches without
asking. Merges into main are still asked one at a time, and this one (m0-statement-layer)
is approved now."

Done on that instruction:

- `AGENTS.md`, "Unit of work": working branches may be pushed without asking; never
  force-push; `main` is pushed only to publish an approved merge; each merge into `main`
  is still asked for, one at a time. This is a change to the rules, made in its own commit
  with this entry, as `AGENTS.md` requires. It changes no status.
- The merge of `m0-statement-layer` into `main` is approved, this once. It is to be a
  fast-forward to the commit that contains this entry, after CI has passed on that commit.
  This entry was written before the merge. **If `main` contains this commit, the merge was
  done**; `git log main` is the record.

What was not changed: every other rule. In particular axioms and `native_decide`, changes
to the root or to the pinned paper, changes to the mathematical content of a statement, and
installing anything other than the Lean toolchain still need the user's approval.

---

## 2026-10-07 — M1 session (Corollary 1.2 from Theorem 1.1 and Proposition 3.5)

Branch `m1-corollary-1-2`, started from main `4b022e4`.

### The instruction

The user's first message was "Continue the Lean formalisation in this repository. AGENTS.md
is binding; read it first." The rest arrived in line-sized pieces while the start gate was
being run. It is reproduced line for line as received; blank lines between its parts are
not recoverable and none have been added.

```text
START GATE
1. Pin HEAD. You should be on main, and main should equal origin/main. Expected: 4b022e4
(M0 complete and merged, 2026-10-07). If main does not equal origin/main, or HEAD is
something else, stop and tell me before doing anything else.
2. Read START_HERE.md, AGENTS.md, blueprint/BLUEPRINT.md, blueprint/SORRY_AXIOM_LEDGER.md,
blueprint/MILESTONES.md, blueprint/FIDELITY.md, blueprint/PAPER_ISSUES.md and the last
session entry of docs/SESSION_LOG.md (the M0 session).
3. Run lake build, python scripts/check_ledger.py and python scripts/axiom_audit.py.
Expected: 10 sorry, 152 blueprint entries. If any of them fails, repair that first and
do nothing else.
TASK: milestone M1, "Corollary 1.2 from Theorem 1.1 and Proposition 3.5", as described in
blueprint/MILESTONES.md.
* Create a working branch m1-corollary-1-2 from main.
* Remove these five sorries with real proofs, without changing any statement:
* S-1.a  Hadwiger.card_le_indepNum_mul_of_colorable
* S-1.b  Hadwiger.card_le_indepNum_mul_fractionalChromaticNumber
* S-1.c  Hadwiger.fractionalChromaticNumber_le_of_colorable
* P-3.5, second assertion  Hadwiger.hadwigerNumber_lt_of_indepNum_le_two
* C-1.2  Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber
* Helpers already exist in Hadwiger/Sanity/FractionalColoring.lean
(FractionalColoring.card_le_mul_total, exists_fractionalColoring_of_family,
fractionalChromaticNumber_le_total, le_fractionalChromaticNumber). Either import that
file where needed or move the helpers to a non-sanity file; decide, record the choice in
the session log, and do not ask me.
* Do not touch the other five sorries: Theorem 1.1, the first assertion of Proposition 3.5
(M2), the two open parts of Lemma 2.2 and the first half of S-2.3 (M3). Do not start M2,
M3 or anything else.
* Expected end state, to check against the audit: 5 sorry. S-1.a, S-1.b, S-1.c DONE.
C-1.2 PROVED_MODULO (resting on Theorem 1.1 and the first assertion of Proposition 3.5).
P-3.5 still STATED, because its first assertion is still sorry. If the audit shows
anything else, find out why before going on.
* If a statement turns out to be false or unprovable as stated, that is a result. Stop,
record exactly what failed in docs/SESSION_LOG.md, and tell me. Do not weaken or adjust
the statement without my say-so.
* The statement layer was signed off on 2026-10-07 as it stood then. If you need a new
definition, or need to change a signed-off statement, write its fidelity note, leave it
unreviewed, and put it to me at the end.
* Keep the blueprint and the ledger in step with the Lean in the same commit. A result
counts only when the axiom audit shows it.
WORKING RULES
* Work inline; at most two subagents at a time, only for independent, well-scoped tasks.
* Commit early and often on the working branch. Push it without asking (standing rule in
AGENTS.md). Run pushes with GCM_INTERACTIVE=never GIT_TERMINAL_PROMPT=0; if a push fails
because it would need a sign-in, stop and tell me instead of opening a window. After
each push, check git ls-remote against HEAD.
* Ask me before merging into main.
* Do not ask me things one at a time. Carry on with everything that does not depend on my
answer, and put all open questions, including the merge, in one prompt at the end.
* Do not consult the upstream openai/math Lean code for this paper.
* End with the checkpoint report that AGENTS.md asks for, and the single next task.
```

### Start gate

- On `main`, working tree clean. `HEAD` = `main` = `origin/main` = `4b022e4`, and
  `git ls-remote --heads origin main` (run with interaction disabled) gave the same hash.
- Read: `START_HERE.md`, `AGENTS.md`, the blueprint in full, the ledger, the milestones,
  the fidelity notes, the paper issues, and the M0 entry of this log.
- `lake build` passed. `check_ledger.py`: 10 `sorry`, 10 rows, OK. `axiom_audit.py`: 152
  entries, 86 declarations, OK. Both as expected.
- `paper/paper.pdf` sha256 matches the pin in `docs/PROVENANCE.md`.
- Before writing proofs, the paper's own text for the five items was read again in the
  local TeX (`sections/01-introduction.tex`, and Proposition 3.5 with its proof in
  `sections/03-distributions.tex`).

### Decision: the helper lemmas are imported, not moved

`Hadwiger/ChromaticBounds.lean` now imports `Hadwiger/Sanity/FractionalColoring.lean`.
Nothing was moved. The user left the choice to the worker. Reasons:

1. No declaration moves. So no `DONE` sanity row, no fidelity note and no file described
   by the M0 sign-off is altered, and the Lean diff of M1 is proof bodies, comments and
   import lines only.
2. The lemmas M1 needs cannot be separated cleanly from the sanity checks.
   `le_fractionalChromaticNumber` needs `range_total_nonempty`, which is itself a lemma of
   the M0 list. A move would either take M0-list lemmas out of `Sanity/` or leave a split
   with no principle behind it.
3. M2 will meet the same question for `Sanity/Minor.lean` and
   `Sanity/ConnectedMatching.lean` (for example `hasCliqueMinor_hadwigerNumber` and
   `exists_isConnectedMatching_of_family`). Importing is one rule that covers all three.
4. The cost, stated plainly: the import closure of the paper's results, and in the end of
   the final theorem, contains files named `Sanity`. The name understates what they are:
   they hold the general lemmas about the definitions as well as the checks. This is
   cosmetic. The kernel checks a proof wherever it lives, and the audit goes by declaration
   name, not by file.
5. Checked: `Hadwiger/Sanity/FractionalColoring.lean` declares theorems only. It has no
   instance, attribute, notation or `simp` lemma, so importing it cannot change how a
   statement elaborates.

Alternative not taken: move the general lemmas to a new non-sanity file, or rename the
folder. Either can be done later as an infrastructure commit without changing a declaration
name or a status. The user may overrule this choice.

### What was proved, and how

Statuses are in the blueprint; this is how the proofs go. Each follows the paper.

- **S-1.a** `card_le_indepNum_mul_of_colorable`. Take a colouring `C` with colours in
  `Fin k`. `|V|` is the sum over colours of the sizes of the colour classes
  (`Finset.card_eq_sum_card_fiberwise`); each class is independent
  (`Coloring.not_adj_of_mem_colorClass`), hence has at most `α(G)` vertices
  (`IsIndepSet.card_le_indepNum`).
- **S-1.b** `card_le_indepNum_mul_fractionalChromaticNumber`. For every fractional
  colouring `w`, `|V| ≤ α(G) · total w` by `FractionalColoring.card_le_mul_total` with
  `k = α(G)`. If `α(G) > 0`, divide and use `le_fractionalChromaticNumber`. If `α(G) = 0`
  the right-hand side is `0` and the bound for any one `w` gives `|V| ≤ 0`. The case
  `α(G) = 0` occurs only for the graph with no vertices; the statement covers that graph,
  so the proof must. Attainment of the infimum (`exists_fractionalColoring_total_eq`) is
  **not** used, in agreement with the fidelity note F-CHIF.
- **S-1.c** `fractionalChromaticNumber_le_of_colorable`. Weight `1` on each of the `k`
  colour classes (`exists_fractionalColoring_of_family`); every vertex lies in exactly one
  class; the total is `k`. A colour class may be empty; the empty set is independent and
  its weight still counts towards the total, which is why the bound is `k`.
- **P-3.5, second assertion** `hadwigerNumber_lt_of_indepNum_le_two`. `k` is the chromatic
  number, finite because `V` is. First inequality: the first assertion with `100·cm < m`,
  by linear arithmetic over `ℝ`. Second: linear arithmetic from `m ≥ 5`. Third: S-1.a with
  `α(G) ≤ 2`. `Nonempty V`, needed by the first assertion, comes from `5 ≤ |V|`. **The
  first assertion is still `sorry`**, so this is `PROVED_MODULO`.
- **C-1.2** `exists_hadwigerNumber_lt_fractionalChromaticNumber`. Theorem 1.1 at
  `max N 5` gives `m ≥ N`, `m ≥ 5` and `G`. The second assertion of P-3.5 gives `k` and the
  first two inequalities. S-1.b with `α(G) ≤ 2` and `χ_f ≥ 0` gives `m/2 ≤ χ_f`. S-1.c
  gives `χ_f ≤ k`. **Theorem 1.1 and the first assertion of P-3.5 are still `sorry`**, so
  this is `PROVED_MODULO`.

No statement was found false or unprovable. No definition, statement or named declaration
was added. No paper issue was found; the three sentences of Section 1, the proof of
Corollary 1.2 and the "final assertion" of Proposition 3.5 are correct as written. That is
five elementary items. It says nothing about the rest of the paper.

### Check that no statement changed

The instruction was to change no statement. Two checks:

- The diff of `Hadwiger/` against `main` adds and removes no line beginning `theorem`,
  `lemma`, `def`, `structure`, `instance`, `abbrev` or `axiom`.
- The fully elaborated statements were compared by machine. A file of `#check @name`
  commands under `set_option pp.all true`, for every theorem and definition of
  `ChromaticBounds.lean`, `MatchingMinor.lean` and `Main.lean` and the two statements of
  equation (2.3) (14 in all), was run at `main` (by stashing the changes and rebuilding)
  and again on the working tree. The two outputs are byte-identical. `pp.all` prints every
  implicit argument, instance and universe level, so this also rules out a change of
  meaning brought in by the new import lines.

The check file lived under the ignored `.lake/audit/`; it is not a repository script.

### What the audit shows

After the change: `check_ledger.py`: 5 `sorry`, 5 rows. `axiom_audit.py`: 152 entries
(`DONE` 26, `PROVED_MODULO` 4, `STATED` 4, `DEFINED` 11, `MATHLIB` 2, `NOT_STATED` 105), 86
declarations. Before: `DONE` 23, `PROVED_MODULO` 3, `STATED` 8.

This is the end state the instruction expected: S-1.a, S-1.b, S-1.c `DONE`; C-1.2
`PROVED_MODULO`; P-3.5 still `STATED`. `#print axioms` on the three `DONE` results shows
`propext`, `Classical.choice`, `Quot.sound` and nothing else.

The five `sorry`s left: Theorem 1.1; the first assertion of Proposition 3.5; the two open
parts of Lemma 2.2; the first half of equation (2.3). None was touched.

### Attempts that failed, and a self-correction

- Nothing failed mathematically, and each of the five proofs compiled as first written.
  That is unusual enough to say why: the hard step, the counting bound, was done at M0.
- Self-correction: the first version added `open Finset SimpleGraph` to
  `Hadwiger/ChromaticBounds.lean`, above the three statements. An `open` changes the
  context in which the signed-off statements are elaborated. It was removed and the names
  inside the proofs were written out in full, before the comparison above was run. The
  comparison would have shown no difference either way; removing the line makes that
  visible in the diff without running anything.

### Records brought into step

- Blueprint: S-1.a, S-1.b, S-1.c to `DONE`; C-1.2 to `PROVED_MODULO`; the text of P-3.5
  says which half is open; a stale remark in S-M0.chif-support corrected; a note on the
  import added to the sanity section.
- Ledger: five rows removed; the two new `PROVED_MODULO` declarations listed.
- `blueprint/FIDELITY.md`: the signed notes said "still `sorry`" of things now proved.
  The signed text was left as it is. A line "Status update after the sign-off" was added
  under each of the five notes concerned, and the header says what such lines are.
- `blueprint/M0_REVIEW_SHEET.md` was **not** edited. It is the signed record of M0, and its
  remarks about what is `sorry` describe that day.
- `START_HERE.md`, `README.md`: "nothing of the paper is proved" replaced by what is now
  true. Doc comments in the Lean files that said "still `sorry`" of proved things corrected.
  This includes one comment in `Hadwiger/HoleRelation.lean`; no statement or `sorry` of
  that file was touched.
- `blueprint/MILESTONES.md`: the next task is M2; the state and measured size of M1.

### Lean notes

- `have hne : Nonempty V := …` in a tactic block is found by instance resolution in the
  rest of the block; no `haveI` is needed.
- `div_le_iff₀' : 0 < c → (a / c ≤ b ↔ a ≤ c * b)` is the form with the factor on the left.
- A membership `v ∈ C.colorClass c` is `C v = c` by definition, so
  `(Finset.mem_filter.mp (Finset.mem_coe.mp hv)).2` is accepted for it.
- `ENat.ne_top_iff_exists` with `chromaticNumber_ne_top_iff_exists` exhibits `χ(G)` as a
  natural number without `.toNat`.

### Tooling notes

- The backslash problem again: in a quoted shell heredoc, `\\|` reached Python as `\|`.
  Python warned ("invalid escape sequence") and produced the intended text, so nothing was
  wrong, but it was luck. Write edits with the editor tools.
- A `cd` inside one shell command changed the working directory of later commands. Start
  each command with an absolute `cd`.

### Not done, and why

- M2 and M3: not started, by instruction.
- Upstream's Lean code for this paper was not consulted. No comparison of statements with
  upstream was made in this session, so `docs/PROVENANCE.md` is unchanged.
- No subagent was used.
- Possible later infrastructure change, not made here: the audit still checks blueprint
  against build and not the reverse (noted at M0). M1 added no declaration, so nothing new
  is unlisted.

