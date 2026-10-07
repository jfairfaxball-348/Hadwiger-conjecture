import Hadwiger.Defs.Minor
import Hadwiger.Defs.ConnectedMatching
import Hadwiger.Defs.FractionalColoring
import Hadwiger.ChromaticBounds
import Hadwiger.MatchingMinor
import Hadwiger.HoleRelation
import Hadwiger.Main
import Hadwiger.Sanity.Minor
import Hadwiger.Sanity.ConnectedMatching
import Hadwiger.Sanity.FractionalColoring

/-!
# Lean 4 formalisation of "A counterexample to Hadwiger's conjecture"

Root module. The single source of truth for what is stated and what is proved is
`blueprint/BLUEPRINT.md`; every `sorry` is listed in `blueprint/SORRY_AXIOM_LEDGER.md`.
-/
