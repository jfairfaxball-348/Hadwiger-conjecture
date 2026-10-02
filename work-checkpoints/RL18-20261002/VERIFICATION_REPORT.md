# RL18 work verification report

Date: 2026-10-02 Europe/Madrid.
Status: **bounded checkpoint verification; RL18 OPEN / NOT PROMOTED.**

BASE_HEAD was pinned as c6e9ada33dd8107471e20c04afb775cdbc38ddd9 and matched the user-supplied expected predecessor. RL18 was confirmed as the unique incoming session: authoritative/START_HERE.md names RL18 and its sole brief, sessions/RL18/START_HERE.md was absent, and no pre-existing rl18 work branch was found before checkpoint creation.

The required current authority was read at the blob identities recorded in INCOMING_SNAPSHOT.json. No active integrity failure was found. The live default-branch HEAD was rechecked immediately before creating the isolated work branch and still matched BASE_HEAD. The default branch has not been mutated by this checkpoint.

Same-worker analytic verification of RL18-P01 checked:

1. y!=x because y is a vertex of G-x, hence x∈T_y and T_y is nonempty.
2. In the connected branch, T_y satisfies nonempty/connected/exterior and is strictly smaller than T; minimum-cardinality therefore forbids resource validity. The resource definition leaves only cyclic coverage as the failed condition.
3. S-completeness of T upgrades a T_y coverage defect pq to N_H(p)∩T=N_H(q)∩T={y}.
4. Properness of d gives d(p),d(q) outside {gamma,alpha}; T_y contains x, so the defect also gives xp,xq absent.
5. In the disconnected branch, connectedness of H[T] implies every component of H[T-y] has a y-neighbor, and component maximality gives no cross-component T_y edges, hence N_H(K)∩(T\K)={y}.
6. The fixed gamma/alpha component data supplies no implication contradicting either certificate or restoring resource validity.

No formal prover, independent reviewer, numerical search, graph census, new source query, or new source open was used.

No named mathematical obligation is reduced. RL16-P01 and every inherited result/source limit remain unchanged; FL-021 is prepared but unpromoted.
