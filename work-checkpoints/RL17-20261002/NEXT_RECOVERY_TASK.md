# Prepared recovery after RL17-U01

Status: **PREPARED ONLY / NOT STARTED.**
RL17 remains OPEN / NOT PROMOTED.

## Why the mechanism must change

RL17's strict-shrink exchange required the fixed witness y to be outside T
before selecting z. The current structure does not prove y∉T, and the
alternative y∈T is not contradicted by endpoint privacy, resource
minimality, S-completeness, or the gamma/alpha component partition.

Retrying the same z-exchange without a new membership input would repeat
FL-020.

## One bounded changed task

Retain the same full C_7 domain, m=1 minimum-cardinality S-complete resource
T, fixed leaf x, private endpoint a, fixed coloring d, failed-anchor branch,
and the same witness y. Work **only in the conditional subcase y∈T**.

Assess one **inside-T witness-essentiality gate**. Put T_y=T-{y}. Because T
is minimum-cardinality, determine exactly what can be forced from deletion
of y:

1. if T_y is nonempty and connected, it cannot be a resource, so identify
   the resulting cyclic coverage defect; or
2. if T_y is disconnected, record the exact cut/attachment obstruction.

Then test only whether the same fixed gamma/alpha locked-component data
eliminates one of those two alternatives or yields a genuinely changed
resource argument. Stop at the first missing implication. Do not return to
the RL17 z-exchange unless y∉T is independently obtained.

Use no beta palette or b, no changed leaf/coloring, no witness splicing, no
RL14 insertion swap, no quotient lift, no numerical search and no new source
query by default.

This is a candidate recovery mechanism only; no contradiction, essentiality
classification strong enough for progress, or new resource is claimed.
