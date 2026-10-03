# FL-032 — induced-vertex minimality does not decide fixed-edge list essentiality

Origin: RL29 at BASE_HEAD ad222da6f4747d019af4ea0be7897920e5a5b355.
Classification: method barrier / recovery lesson.
Scope: the same retained V(P)=T_2 conditional scope with the fixed A, K, x, z and xz from RL28.

Expectation tested: whether the already fixed inclusion-minimal induced non-A-list-colorable obstruction K decides A-list-colorability of K-xz.

Actual observation: it does not. Inclusion-minimality gives A-list colorings of every proper induced vertex deletion K-u, but K-xz has the same vertex set and differs by one edge deletion. No retained premise certifies either an A-list coloring or non-A-list-colorability of K-xz.

Incidence check: xa in E(G) excludes c(a) from A(x), while az notin E(G) does not force c(a) into A(z), because another external neighbor of z may carry color c(a).

First missing dependency: a direct fixed-edge essentiality input for xz under the already fixed lists A, namely either one proper A-list coloring of K-xz or a proof that none exists.

Effect: no phi is fixed; phi(x)=phi(z) is not reached; no internal-degree restriction at x is produced; FL-030/FL-031 remain open; saturation is not excluded; no named obligation is reduced.

Surviving frontier: RL28-P01/P02 and FL-031, RL27-P01/P02 and FL-030, RL26/FL-029, RL25/FL-028, RL24/FL-027, RL23/FL-026, RL22-P01/FL-025, RL21-P01/P02/FL-024, and RL20 NONE/FL-023 retain their exact scopes.

Lesson: an obstruction chosen minimally by induced vertex set must not be treated as edge-minimal. Likewise, absence of one external edge does not by itself place that external vertex's c-color into a fixed list.

Retry condition: do not retry by choosing another K, z, edge, quotient coloring, or list system. After the mandatory RL30 audit, if this frontier survives, a changed mechanism may use exactly one A-list coloring of K-x and test directly whether its color on z can extend to x in K-xz, with no second coloring.

Programme: ACTIVE.
