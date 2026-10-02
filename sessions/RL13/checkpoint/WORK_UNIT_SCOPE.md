# RL13 bounded work-unit scope

Date: 2026-10-02 Europe/Madrid. RL13 OPEN; checkpoint work NOT PROMOTED.

BASE_HEAD: 23a2dfa3fff5b8bbd11cd986f4418dfc5b3a54b1
Root tree: 2da5fc8f126fcc81aa6a102aff3b70c1513f8cb8
Incoming authoritative tree: 4a477bf49f47be34f743e7700863ac0472d8776c (140 blobs).
Expected predecessor matched live main exactly at startup and again immediately before checkpointing. RL13 is the unique incoming session; no pre-existing RL13 work branch or sessions/RL13 entry was found. The sole brief is authoritative/RL13_CRITICAL_CONNECTED_RESOURCE_BRIEF.md.

Root target remains full sharp Hadwiger: h(G) >= chi(G) for every finite simple graph. This work unit is only the bounded full-critical C_7 connected-resource gate and is not a replacement root.

Exact domain: G is finite simple, chi(G)=7, every proper minor is 6-colorable; v has degree seven; H=G-v; S=N(v)={u_0,...,u_6}; the only nonedges in H[S] are e_i=u_i u_(i+1) modulo seven. A resource is a nonempty connected T subset V(H)\S meeting at least one endpoint of every e_i. A partial family is pairwise vertex-disjoint and every two members have an actual joining edge. Choose a maximum-cardinality family capped at five, and among maximizers minimize total size. This unit treats only m=0,1,2,3,4.

ONE mechanism only: star-boundary five-color compression. For the selected family T_1,...,T_m let U be its union and A=N_H(U) intersect S. Use one actual original-G star-minor coloring to recolor H[S union U] with only five colors on S whenever A is a proper subset of S. Then use full A2 colorfulness to force one residual component whose fixed-boundary coloring extension fails, and maximality to classify that component as either a coverage defect or a compatibility defect.

Stop condition reached: A=S. The one-star permutation lift cannot produce a five-color boundary pattern on all S because every actual star coloring has exactly one repeated cyclic pair on S, while any five-color proper coloring of H[S] has two repeated disjoint cyclic pairs. No independent implication supplied A proper subset S. No quotient-coloring lift through arbitrary connected interiors is used.

Mathematical numerical computation: ZERO.
New source queries: ZERO.
New source opens: ZERO.
No graph/coloring/path census, sampling, source replay, MK2/SP_6/all-two-edge replay, or separator catalogue was performed.
