# RL63 incoming snapshot

BASE_HEAD: ad6eff15af85627a318cf8052f3eff2d08f86433
BASE_TREE: c2ddff8809c2c479da0c1d3d93974722c46385c2
AUTHORITATIVE_TREE: 70d8f6797b120a47f477edc08bd8147d7036da44

Incoming authority was read at the pinned predecessor before any audit work. Start-gate checks:
- live main (git ls-remote) matched the user's expected predecessor ad6eff15af85627a318cf8052f3eff2d08f86433;
- sessions/RL63 did not exist;
- RL63 was the unique incoming numbered session;
- authoritative/START_HERE.md named RL63 and the global-audit brief;
- no unresolved integrity failure blocked the audit.

The entire incoming authoritative tree (22 files) is frozen byte-identically under sessions/RL63/incoming/. Per-file sha256 was recorded before the audit and re-checked at freeze: authoritative_sha256.txt.
