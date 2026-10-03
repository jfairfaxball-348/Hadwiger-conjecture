# RL35 leaf-critical blocker cyclic-order report

Date: 2026-10-03 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31/RL32/RL33/RL34 full C_7 cyclic degree-seven m=3, A=S fixed-choice setup and the one bounded cyclic-order/interface assessment authorized by the RL35 brief.

## Result RL35-P01 — ordered final-leaf blocker localization

Retain RL34-P01, RL33-P01, RL32-P01 and RL31-P01 and all fixed choices.

If the RL31 obstruction profile is all-SAT, RL35 stops exactly as required.

Otherwise retain
    C=C_{K-1}, T=T_i*, Q=Q_i*, P=P_{K-1},
    g=g_{K-1}, a=a_{K-1}, w=w_{K-1},
and h as the least cyclic nonedge missed by T-{w}. Put
    I=V(P)\(C union {w}).
RL34 gives T-{w}=C union I.

For a vertex set X, let M(X) be the cyclic nonedges whose two endpoints both have no neighbor in X. The final RL33 choice gives g=min M(C), while RL34 gives h=min M(C union I). Since C is a subset of C union I,
    M(C union I) is a subset of M(C).
Hence g<=h. Moreover every cyclic nonedge e<h that misses C is not in M(C union I), so at least one endpoint of e has a neighbor in I. Thus h is exactly the earliest cyclic miss of C not repaired by the internal part I of the final path.

### EQ: h=g

RL34 fixes aw and proves N_H(a) intersect T={w}. If b is the other endpoint of g, then N_H(b) intersect T is a subset of {w}. The resource condition adds no adjacency requirement for b because aw already covers g in T. The least-miss rules for C and C union I do not decide whether bw is present. The first-passing statement compares the actual closure stages C=C_{K-1} and C_K=T; it does not turn T-{w}=C union I into an earlier closure stage.

Therefore no stronger endpoint-contact statement is certified. EQ gives no contradiction with first-passing cyclic coverage. The earliest C-miss survives the internal final-path vertices and is covered only when w is included.

### NEQ: h!=g

RL34 gives g<h, g misses C, and g is covered by C union I, so some endpoint of g has a neighbor in I. More generally, every C-miss preceding h is repaired by I. The blocker h itself misses C union I and is the first C-miss whose repair is deferred to w. In T, h is covered only through w in the exact weak RL34 sense.

This is compatible with first-passing because that property compares C and T, not arbitrary intermediate subsets.

### Strongest retained conclusion

- EQ: g=h is the first leaf-dependent miss; the fixed endpoint a has unique T-neighbor w, while the other endpoint's contact with w is not determined by the inherited premises.
- NEQ: every C-miss before h is repaired internally, including g, and h is the first C-miss whose coverage waits for w.

Neither RL34 profile is eliminated by the prescribed audit.

Classification: proved scoped analytic mathematics for the order-localization statement, with a bounded proof-mechanism stopping conclusion for non-elimination. Same-worker review only. No formal proof checker, independent external certification, source upgrade, novelty claim, finite certificate, broad census, or mathematical numerical computation.

## Target and obligation accounting

M3-LEAF-BLOCKER-ORDER is CERTIFIED at exactly the retained fixed-choice scope as the order-localization statement above.

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open. No named inherited universal mathematical obligation is genuinely reduced. The full sharp Hadwiger conjecture remains open.

Correction/demotion: NONE.

Preserve RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all valid RL20-RL29 restricted results, and earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## New frontier

Cyclic order localizes the obstruction but does not close it. The selected bounded successor uses only the already named pair g,h in NEQ and tests their endpoint overlap in the C_7 interface. EQ is recorded and stopped rather than supplied with an invented substitute mechanism.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
Broad census: 0.
Programme ACTIVE.
