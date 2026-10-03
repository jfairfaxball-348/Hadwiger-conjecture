# RL29 incoming authority freeze

RL29 began from immutable default-branch commit:

    ad222da6f4747d019af4ea0be7897920e5a5b355

That commit is the exact complete incoming repository/authoritative generation for RL29.

This frozen session stores the incoming entrypoint, sole RL29 brief/state, and the canonical proof/failure records used at startup. Every other incoming authoritative file is recoverable exactly from authoritative/ at BASE_HEAD above; the commit SHA is immutable provenance and no conversation state is required.

The RL29 work checkpoint is frozen separately under sessions/RL29/checkpoint/.
