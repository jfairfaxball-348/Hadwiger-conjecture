> **RL13 CLOSED/FROZEN — retained completed work record.** The exact original checkpoint text follows. Its OPEN/NOT PROMOTED, prepared-only, old next-operation and finish wording is historical; RL13_SESSION_STATE_AND_RL14_KICKOFF.md and RL14_LEAF_DELETION_COLORING_BRIEF.md govern the current state. Mathematical scopes and source limits are unchanged. Plain checkpoint filenames below refer to the frozen originals in ../sessions/RL13/checkpoint/. No RL14 work has begun.

# RL13-U02 verification and preservation

Date: 2026-10-02 Europe/Madrid. RL13 OPEN / NOT PROMOTED.

## Incoming identity

Live main matched 23a2dfa3fff5b8bbd11cd986f4418dfc5b3a54b1 and the named
work branch matched bf6a4ad12bde1d20216b65dd9df51ea09930878e.
The latter has parent b481d3a33df0ba191c54f4fef1c8fd8faaf71534, whose
parent is the pinned main. Its root tree is
dc2f9fd0d78503abf35e792019b406f6837254dc. The authority subtree is
4a477bf49f47be34f743e7700863ac0472d8776c, identical to main.

Every original main root entry is unchanged in the incoming work tree.
All ten checkpoint file identities match the pinned tree, and every
checkpoint-body hash matches the incoming CHECKPOINT_MANIFEST.json.
The required authority blob identities in INCOMING_SNAPSHOT.json match
the fresh exact-ref reads. The verified incoming start gate was reused
under CONNECTOR_WORKFLOW's resume fast path; load-bearing A2/star scopes
and the checkpoint were inspected for this continuation. No history or
source audit was restarted. START_HERE and the sole RL13 brief are
unchanged; their NOT STARTED text describes the authoritative incoming
generation, while the isolated work remains OPEN. No RL14 is begun.

## Same-worker analytic audit of RL13-P02

1. With m=1, every individual resource is a competing maximum family.
   The tie-breaker therefore gives global minimum resource cardinality.
2. |T|=1 and full S attachment contradict A2; |T|>=2 makes deletion of
   a spanning-tree leaf connected and nonempty. No leaf case is omitted.
3. Noncoverage after that deletion and full S attachment give BOTH unique
   endpoint-neighbor identities, not merely one coverage witness.
4. Witness edges for different leaves are disjoint. The resulting at-most-
   three-leaf observation leaves size and path length unbounded.
5. A disjoint cyclic edge selects one of the seven actual original-G
   stars. Its proper-minor coloring pulls back only over a nonadjacent S
   pair; A2 gives the exact S equality partition. No arbitrary prescribed
   source coloring is assumed to exist.
6. The new recoloring changes only a. Its edges to S are safe because the
   unique other beta root is the nonneighbor b; its edges to T are safe
   because the sole such neighbor x is adjacent to b. All T-T and other
   edges retain their actual source colors.
7. The residual lists include every fixed-boundary neighbor. Combining
   component extensions is legal because different residual components
   have no edges. Thus some component is inextendible, even when no
   number/size bound on components is available.
8. The original coloring could violate the new boundary only at a.
   Swapping whole affected two-color components inside one residual C
   repairs that conflict. Equation (4) lists every possible new boundary
   conflict: b or T_beta against swapped alpha vertices, T_alpha against
   swapped beta vertices. Other root colors are outside the palette.
9. No C-T edge implies the anchor is b, yielding a path internally in C.
   An actual C-T edge plus resource coverage would contradict maximality,
   so that branch instead has an explicit missing cyclic demand.
10. These are necessary obstructions. They are not a sufficient criterion
    for list uncolorability, nor a full-domain realization/countermodel,
    nor an augmentation proof. Components and colorings from different
    leaves are never combined. No contracted-resource coloring is lifted.

The argument was reviewed symbolically, with separate S-S, S-T, T-T,
residual-interior and residual-boundary edge checks. This is same-worker
review, not an independent agent review, external certification, or formal
proof checking. No mathematical computation or experiment was run.

## Falsification and scope checks

- A proposed failure of (1) must violate minimum resource cardinality,
  leaf-deletion connectedness, or the S-complete assumption.
- A proposed invalid psi must give an actual monochromatic edge incident
  with a; the two possible endpoint classes were checked above.
- Compatible extensions on every residual component would explicitly
  contradict A2. An inextendible C with no anchor in (4) would be colored
  by the specified component swaps, also a contradiction.
- A resource C with an actual C-T edge would give an admissible family
  of size two. A path through S does not satisfy this edge requirement.
- All leaf/private-edge/disjoint-star/actual-coloring choices and both
  endpoint orientations are covered by one symbolic argument. The
  m=2,3,4 S-complete cases are not claimed to be covered.
- Exactly one continuation mechanism was assessed. The extra G-x minor
  occurs only in the PREPARED next task and is not consumed in RL13-P02.
- Mathematical numerical computation, new source queries and new source
  opens are all zero. Hashing/JSON/tree checks are packaging checks only.
- The m=1, A=S boundary subcase is reduced. No named inherited universal
  mathematical obligation, m=1 augmentation, or root conclusion is closed.

## Checkpoint preservation and publication contract

The original CRITICAL_CONNECTED_RESOURCE_REPORT.md is byte-identical to
blob 4c31339633f7cdd6d591194a8d461a7c82229b9a. The previous proof-state
ledger and FL-015 appendix are retained byte-for-byte as prefixes with
explicit U02 events appended. INCOMING_SNAPSHOT.json,
SOURCE_QUESTION_AND_LIMITS.md, VERIFICATION_REPORT.md and WORK_UNIT_SCOPE.md
remain unchanged records of the first unit. The current RESUME_STATE,
NEXT_RECOVERY_TASK and manifest direct readers to U02.

The intended candidate adds exactly three files and modifies exactly five
files, all under work-checkpoints/RL13-20261002/. It changes no main,
authoritative, docs, frozen session, inherited certificate, or source file.
The complete thirteen-file checkpoint is hashed in CHECKPOINT_MANIFEST.json
(which excludes its own hash). Remote publication requires a final main
and work-branch comparison, one non-forced work-ref advance, and readback
of the commit, root/checkpoint trees and all changed/new file blobs. Until
that readback succeeds, no publication success is claimed by this file.

Local staging initially added a trailing newline to imported text; exact
Git-blob checks detected and corrected it before candidate construction.
One local patch attempt was rejected for duplicate operations on a path;
it was reapplied as an ordinary update. Neither event changed the remote
repository or any mathematical statement.

RL13 remains OPEN / NOT PROMOTED. Programme ACTIVE.
