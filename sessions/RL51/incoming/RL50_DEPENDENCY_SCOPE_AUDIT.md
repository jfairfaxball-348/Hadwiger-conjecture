# RL50 load-bearing dependency and scope audit

Status: completed mandatory audit.

## RL41 boundary selection

RL41-P01 is a counterpattern only to the boundary-level universal candidate using the individual C7 vertex-cover conditions and union A_1 union A_2 union A_3=S. It is not a graph counterexample and does not establish full critical realizability.

RL41-P02 remains a conditional sufficiency theorem. If the required distinct roots and common independent three-set exist, the recorded branch sets give an S-rooted K6 in H and then a K7 minor in G at the retained full-C7 critical scope. RL41-P01 shows only that its antecedent is not forced by the boundary axioms.

## RL42 resource interface

RL42-P01 uses a three-singleton exterior model to show compatibility with the original resource definition, pairwise joining edges, maximum-family condition, and minimum-total-size tie-breaker. It does not consume or establish A2, chi(H)=6, proper-minor criticality, or full critical realizability.

## RL43 quotient/star interfaces

RL43-P01 correctly separates quotient/star coloring information from extension through arbitrary resource interiors and residual components. Proper-minor colorability is applied to a proper minor and is never used as an uncontraction theorem. The symbolic H^dagger is explicitly recorded as failing A2.

## RL44-RL45 A2 consequences

RL44 works from an actual inherited full-H six-coloring. The recoloring-at-u_4 contradiction uses A2 only after proving the modified coloring would be proper on all H.

RL45's whole-component {2,6} swap is a standard Kempe exchange on the actual H. If u_3 were outside the u_4 component, the resulting proper H-coloring would use only five colors on S, contradicting A2. Hence the common-component necessity is valid at its fixed-coloring scope.

## RL46 symbolic component obstruction

RL46-P01 is only an interface model proving that attachment membership and resource maximality alone do not separate u_3 and u_4 bichromatically. It is never promoted to A2 or full criticality.

## RL47 pivotal-edge saturation

RL47-P01 is conditional on an exterior edge e=xy in the common {2,6}-component such that K-e separates u_3 and u_4. Under that antecedent, the one-side swap is proper on H-e and leaves e as the sole defect. A2 then forces both endpoints to see every alternative color.

The audit found no proof that such a pivotal separating edge must exist in every retained K. Therefore RL47 does not cover the bridgeless/non-pivotal case. The report does not claim otherwise, so no correction is required.

## RL48 pairwise Kempe coupling

From the RL47 sole-defect coloring, RL48 extends to G-e by coloring v with color 6, absent from the target S partition. If x,y were in different {alpha,beta}-components, a Kempe swap on one component would make their colors different and restoring e would give a six-coloring of G, contradicting chi(G)=7. This inference is non-circular and uses full criticality only at the stated point.

The conclusion inherits the unproved pivotal-edge antecedent and is not a universal statement about every common {2,6}-component.

## RL49 second-order stability

RL49 fixes exactly auxiliary pair {1,3}. A first-stage 1<->3 component swap preserves the defect color alpha at x,y. If a subsequent {alpha,delta} component split occurred, a second Kempe exchange would repair e and contradict chi(G)=7. Thus the second-order stability statement is valid under the RL48 domain.

The symbolic witness only establishes insufficiency at the stated interface. It is not A2, chi(G)=7, proper-minor critical, or full-critical realizable.

## Universal obligation accounting

The sequence strengthens necessary conditions inside one fixed candidate configuration and later one conditional pivotal-edge subcase. It does not prove:
- universality or representativeness of the RL41 triple;
- existence of a pivotal separating edge;
- exclusion of the fixed triple from all full critical realizations;
- M3-RL41-A2-U4-CONFLICT-RECOLOR;
- M3-RL41-A2-26-COMPONENT-SEPARATION;
- either pivotal-edge repair obligation;
- M3-CORE.

Correction/demotion: NONE.
