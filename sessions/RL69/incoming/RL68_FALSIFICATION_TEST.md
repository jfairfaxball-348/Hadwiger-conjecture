# RL68 falsification test — C68

Status: CLOSED RL68 record.
Root: HC7 only.
Candidate: every 7-connected finite simple graph with n >= 8 and |E| >= 4n - 2 contains K7^- as a minor.
Method: analytic only. External retrievals 0. Mathematical computation 0. Census 0.

## (a) Two adjacent apices over a 5-connected plane triangulation
If T is the triangulation and x,y are adjacent universal vertices, RL65 P4 gives |T|>=12, hence n>=14. The graph is 7-connected: deleting at most six vertices either leaves an apex universal, or deletes one apex and at most five vertices from the 6-connected one-apex graph. It has |E|=5n-15>=4n-1>4n-2. RL65's elementary construction gives a K5^- model in T; {x},{y} extend it to K7^-. Verdict: consistent with C68.

## (b) K_{2 x t}, t>=5
This is K_{2t} minus a perfect matching. It has n=2t, connectivity 2t-2, and |E|=2t(t-1)>=8t-2=4n-2 for t>=5. For t>=6, both vertices of one part plus one vertex from five other parts induce K7^-. For t=5, with parts A={a1,a2}, B={b1,b2}, C={c1,c2}, D={d1,d2}, E={e1,e2}, the bags {a1,b1}, {a2,c1}, {b2,d1}, {c2}, {d2}, {e1}, {e2} are disjoint and connected and every pair is adjacent except {e1},{e2}. Verdict: consistent with C68.

## (c) C_n^4, n>=10
It is 8-regular, so |E|=4n. It is 8-connected: disconnection after deletion would require at least two deleted cyclic gaps of length at least four, hence at least eight deleted vertices. With cycle vertices v0,...,v_{n-1}, take singleton bags v0,...,v5 and the connected bag {v6,...,v_{n-1}}. The large bag is adjacent to all six singletons; among the singletons only v0v5 is absent. This is a K7^- model. Verdict: consistent with C68.

## (d) K5 Cartesian-product K5
It has 25 vertices, degree 8 and 100 edges, so 100>=98. It is 8-connected: for nonadjacent (1,1),(2,2), use the two length-two paths through (1,2),(2,1), three paths through the other columns, and three through the other rows; for adjacent vertices use the direct edge, three same-row two-edge paths and four paths through the other rows. Menger applies. Five singleton bags in one row plus the entirety of a second and third row as two connected bags form a K7 model. Verdict: consistent with C68.

## (e) Below threshold
K_{2,2,2,2,1} is 7-connected but has 32<34 edges. A 7-regular 7-connected graph has 3.5n edges. These are outside C68 and do not test sharpness.

## Outcome
No named family falsifies C68. Classification: PROVED ANALYTIC falsification-test record. C68 remains CANDIDATE / NOT ESTABLISHED.
