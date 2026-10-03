# RL28 incoming authority freeze

RL28 began from immutable default-branch commit:

    3a90dd79fc56e9238c10229c0a32e3602bc16924

That commit is the exact complete incoming repository/authoritative generation for RL28.

For connector portability, this frozen session stores the incoming entrypoint and sole brief directly, together with the RL28 incoming snapshot manifest. Every other incoming authoritative file is recovered exactly from `authoritative/` at BASE_HEAD above; the commit SHA is immutable provenance and no conversation state is required.

The RL28 checkpoint is frozen separately under `sessions/RL28/checkpoint/`.
