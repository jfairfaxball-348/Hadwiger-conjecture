import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Defs.FractionalColoring
import Hadwiger.ChromaticBounds
import Hadwiger.MatchingMinor
import Hadwiger.HoleRelation
import Hadwiger.Defs.Law
import Hadwiger.Defs.RelEntropy
import Hadwiger.Defs.HoleRel
import Hadwiger.Supersaturation
import Hadwiger.EntropyAndCuts
import Hadwiger.RandomSample
import Hadwiger.UpstreamBridge
import Hadwiger.Main
import Hadwiger.Sanity.Minor
import Hadwiger.Sanity.ConnectedMatching
import Hadwiger.Sanity.FractionalColoring
import Hadwiger.Sanity.HoleRelation
import Hadwiger.Sanity.Law
import Hadwiger.Sanity.RelEntropy
import Hadwiger.Sanity.Supersaturation
import Hadwiger.Sanity.RandomSample

/-!
# Lean 4 formalisation of "A counterexample to Hadwiger's conjecture"

Root module. What is stated and what is proved is recorded in `blueprint/BLUEPRINT.md`; there
is no `sorry` (`blueprint/SORRY_AXIOM_LEDGER.md`). The proof of Theorem 1.1 comes from the
upstream formalisation under `OAI/`; see `NOTICE` and `START_HERE.md`.
-/
