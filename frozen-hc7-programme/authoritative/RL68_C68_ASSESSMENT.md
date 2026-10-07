# RL68 C68 assessment

Status: CLOSED RL68 record.
Root: HC7 only.
Candidate C68 (=C65^7): every 7-connected graph with n>=8 and |E|>=4n-2 contains K7^- as a minor.

## 1. Base orders
n=8 is impossible because 30>C(8,2)=28. For n=9, 7-connectivity gives minimum degree at least 7, so the complement is a matching. The edge bound leaves at most two missing edges; deleting one endpoint from each missing edge leaves a K7. Hence no C68 counterexample has n<=9. PROVED ANALYTIC.

## 2. Contraction edge count
For an edge uv put c(uv)=|N(u) intersect N(v)|. After contracting uv and simplifying,
|E(G/uv)|=|E(G)|-1-c(uv).
Thus c(uv)<=3 preserves the threshold:
|E(G/uv)|>=4n-6=4(n-1)-2.
PROVED ANALYTIC.

## 3. Seven-connectivity contraction criterion
For 7-connected G of order n>=10, G/uv is 7-connected iff no 7-vertex separator of G contains both u and v.

If G/uv has a separator X of size at most six, X must contain the contracted vertex w; otherwise X would separate G. Replacing w by u,v gives a separator of G of size at most seven, hence exactly seven. Conversely a 7-separator containing u,v becomes a 6-separator after contracting uv. PROVED ANALYTIC.

## 4. R68 — minimum-counterexample obstruction
If C68 is false, choose a minimum-order counterexample G. Then n>=10, and every edge uv with c(uv)<=3 lies in a 7-separator. Otherwise G/uv is 7-connected, retains the density threshold, and remains K7^- -minor-free by transitivity of minors, yielding a smaller counterexample. PROVED ANALYTIC.

## 5. Relaxed edge-tight stress test Q10
Let Q10=K10-E(P8), where P8 uses eight vertices. Then |E|=45-7=38=4*10-2. Q10 is 7-connected: after deleting at most six vertices at least four remain; disconnection would require the complement path to contain all cross-edges of a nontrivial complete bipartite cut, forcing K1,3 or K2,2, neither contained in a path. Every Q10 edge has at least four common neighbours because each endpoint has at most two non-neighbours. Q10 contains K7^- as a subgraph: take the two vertices outside P8 and path vertices 1,3,5,7,8; only 7-8 is missing. Thus connectivity+density alone cannot force a low-codegree edge. PROVED ANALYTIC at the relaxed scope; not a C68 falsifier.

## 6. Precision
C68 remains OPEN / CANDIDATE / NOT ESTABLISHED, not falsified.

The safe-edge statement
"every 7-connected K7^- -minor-free graph with n>=10 and |E|>=4n-2 has an edge uv with c(uv)<=3 contained in no 7-separator"
implies C68 by the preceding minimum-order argument. Conversely C68 makes its K7^- -minor-free antecedent empty. Hence the safe-edge statement is equivalent to C68, not a strictly weaker dependency. RL68 records a changed proof mechanism and necessary counterexample structure, not a narrowing of the HC7 obligation.

The FL-068 drift rule remains binding. A continuation must stop if the safe-contraction mechanism turns into an adaptation of the held F1 separation/rooted-minor architecture.

## 7. Frontier
U1-U8 stay certified. U9 stays CONDITIONAL on C68 and F1 Thm 1.6 at Level A. S1 is not assumed; S2 is Level C and unused. Mader K6/K7 extremal functions are not consumed. The two-apex family continues to rule out a K7 density route.

F1=arXiv:2609.17760v1 enters only through inherited B65^7/F1 Thm 1.6 statement context. It is unrefereed and discloses AI-obtained proofs; no proof is consumed here.
