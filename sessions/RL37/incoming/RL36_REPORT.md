# RL36 named-blocker endpoint-overlap report

Date: 2026-10-04 Europe/Madrid.
Status: CLOSED/FROZEN on promotion.
Scope: exactly the retained RL31/RL32/RL33/RL34/RL35 full C_7 cyclic degree-seven m=3, A=S fixed-choice setup and the one bounded endpoint-overlap assessment authorized by the RL36 brief.

## Result RL36-P01 — named-blocker endpoint-support localization

Retain RL35-P01 and all fixed data

    C=C_{K-1}, T=T_i*, Q=Q_i*, P=P_{K-1},
    g=g_{K-1}, a=a_{K-1}, w=w_{K-1}, h,

with

    I=V(P)\(C union {w}).

If the RL31 obstruction profile is all-SAT, RL36 stops exactly as required.

If EQ holds, h=g, RL36 records the exact RL35 EQ profile and stops. No changed EQ mechanism is introduced.

Only in NEQ retain g<h, that g misses C but is covered by I, and that h misses C union I=T-{w} while being covered in T only through w in the exact weak RL34 sense.

The retained premises do not determine whether the two already named distinct cyclic nonedges g,h are vertex-disjoint or share one endpoint, so the exact surviving NEQ classification is as follows.

### DISJOINT

If g and h are vertex-disjoint, the ordered disjoint blocker profile survives. No further conclusion follows from the authorized mechanism.

### OVERLAP

Suppose g and h share their unique common endpoint x, and let y be the other endpoint of g.

Because x is an endpoint of h and h misses C union I,

    N_H(x) intersect I = empty.

Because g is covered by I and x has no I-neighbor, the internal repair of g must occur through y:

    N_H(y) intersect I != empty.

Thus endpoint overlap forces the I-supported endpoint of g to be its nonshared endpoint. No particular supporting vertex of I is forced.

Compare x only with the already fixed endpoint a of g.

#### OVERLAP-A: x=a

Then y is the internally supported endpoint of g. Since a=x is an endpoint of h and h misses T-{w}=C union I, a has no T-neighbor outside w. Together with the retained fixed edge aw,

    N_H(a) intersect T = {w}.

Moreover a is definitely a w-adjacent endpoint of h. The other endpoint of h still has T-neighborhood contained in {w} and may or may not be adjacent to w. No contradiction follows.

#### OVERLAP-NONA: x!=a

Since g has exactly two endpoints, a=y. Therefore the forced internally supported endpoint is a:

    N_H(a) intersect I != empty.

Together with the retained edge aw, a has both w and at least one internal vertex of P as T-neighbors. The shared endpoint x satisfies

    N_H(x) intersect (T-{w}) = empty,
    N_H(x) intersect T subset {w}.

The retained premises do not determine whether xw is an edge or whether the other endpoint of h supplies the required w-contact. No contradiction follows.

### Strongest retained conclusion

M3-NAMED-BLOCKER-OVERLAP is CERTIFIED at this exact fixed-choice scope only as the branchwise endpoint-support localization above:

- the disjoint ordered blocker profile survives;
- overlap forces the internal support of g onto its nonshared endpoint;
- in overlap with x=a, N_H(a) intersect T={w} and a is a certified w-contact endpoint of h;
- in overlap with x!=a, a is internally supported and also adjacent to w;
- neither overlap identity is eliminated, and neither yields a contradiction.

Classification: proved scoped analytic mathematics plus bounded stopping conclusion, same-worker review only. No formal proof checker, independent external certification, source upgrade, novelty claim, finite certificate, broad census, or mathematical numerical computation.

## Target and obligation accounting

M3-NAMED-BLOCKER-OVERLAP is CERTIFIED at exactly the retained fixed-choice scope as the endpoint-support localization above.

M3-CORE remains NOT CERTIFIED. The m=3, A=S configuration remains open. No named inherited universal mathematical obligation is genuinely reduced. The full sharp Hadwiger conjecture remains open.

Correction/demotion: NONE.

Preserve RL35-P01/FL-038, RL34-P01/FL-037, RL33-P01/FL-036, RL32-P01/FL-035, RL31-P01/FL-034, the RL30 audit and FL-033, all valid RL20-RL29 restricted results, and earlier source/certificate limits exactly. The RL21-RL29 m=2 chain remains suspended.

## New frontier

Endpoint overlap localizes which endpoint supplies the already-known internal repair, but the inherited arbitrary witness choice supplies no minimality relation linking that repair to the fixed leaf w. A changed retry must introduce such a relation rather than replay cyclic order or inspect another cyclic nonedge.

New mathematical source retrieval: 0.
Mathematical numerical computation: 0.
Broad census: 0.
Programme ACTIVE.
