module

public import Hadwiger.Main

/-!
# The solution

Comparator compares the declarations named in `comparator.json`, as they are in this module,
with their counterparts in `Challenge.lean`. They are declared and proved in
`Hadwiger/Main.lean`, which this module imports, with the definitions in `Hadwiger/Defs/`:

* `Hadwiger.exists_indepNum_le_two_and_connectedMatchingNumber_lt` (Theorem 1.1). Its proof
  is the upstream formalisation under `OAI/`, carried over by `Hadwiger/UpstreamBridge.lean`;
* `Hadwiger.exists_hadwigerNumber_lt_fractionalChromaticNumber` (Corollary 1.2);
* `Hadwiger.exists_hadwigerNumber_lt_chromaticNumber`;
* `Hadwiger.not_hadwigerConjecture`;
* `Hadwiger.not_fractionalHadwigerConjecture`.

`NOTICE`, the README and `formalization.yaml` say who proved what.
-/
