module

public import Hadwiger.Defs.Minor
public import Hadwiger.Defs.ConnectedMatching
public import Hadwiger.Defs.FractionalColoring
public import Hadwiger.ChromaticBounds
public import Hadwiger.MatchingMinor
public import Hadwiger.HoleRelation
public import Hadwiger.Defs.Law
public import Hadwiger.Defs.RelEntropy
public import Hadwiger.Defs.HoleRel
public import Hadwiger.Supersaturation
public import Hadwiger.EntropyAndCuts
public import Hadwiger.RandomSample
public import Hadwiger.UpstreamBridge
public import Hadwiger.Main
public import Hadwiger.Sanity.Minor
public import Hadwiger.Sanity.ConnectedMatching
public import Hadwiger.Sanity.FractionalColoring
public import Hadwiger.Sanity.HoleRelation
public import Hadwiger.Sanity.Law
public import Hadwiger.Sanity.RelEntropy
public import Hadwiger.Sanity.Supersaturation
public import Hadwiger.Sanity.RandomSample

@[expose] public section

/-!
# Lean 4 formalisation of "A counterexample to Hadwiger's conjecture"

Root module. What is stated and what is proved is recorded in `blueprint/BLUEPRINT.md`; there
is no `sorry` (`blueprint/SORRY_AXIOM_LEDGER.md`). The proof of Theorem 1.1 comes from the
upstream formalisation under `OAI/`; see `NOTICE` and `START_HERE.md`.
-/
