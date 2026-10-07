# L2 — Near-K7 minors forced by chromatic number 7, and adjacent colouring results

Status: WORKING DRAFT (RL70 literature phase; NON-AUTHORITATIVE scratch notes; nothing here is promoted).
Compiled 2026-10-06. Every item is tagged VERIFIED-FROM-SOURCE (statement read in the source text
this session) or RECALLED/SECONDARY (from memory, or from another paper's citation of it).

Notation: K7^- = K7 minus one edge; K7^= = K7 minus two disjoint edges; K7^vee = K7 minus two
adjacent edges (written K7^< by Lafferty-Song and K7^vee by Norin-Totschnig / Dvorak-Norin-Rahman).
Calligraphic K_t^{-s} (Lafferty-Song) = the FAMILY of all graphs obtained from K_t by deleting s edges;
"no K_t^{-s} minor" means no H minor for EVERY H in the family. So K_7^{-2} = {K7^=, K7^vee}.

## 0. HEADLINE (first verified findings; details to be extended below)

1. Jakobsen 1971: every graph with neither a K7^vee minor nor a K7^= minor is 6-colourable
   (i.e. every 7-chromatic graph has K7^vee OR K7^= as a minor). Read only via secondary citations
   (Lafferty-Song 2022 Thm 1.4; Norin-Totschnig 2025 Thm 2; DNR 2026 intro). RECALLED/SECONDARY for
   the original; VERIFIED as the statement those three papers attribute to Jakobsen.
2. Norin-Totschnig, arXiv:2507.03244 (4 Jul 2025), Theorem 4: every graph with no K7^vee minor is
   6-colourable. VERIFIED-FROM-SOURCE.
3. Dvorak-Norin-Rahman, arXiv:2609.17760 (15 Sep 2026), Theorem 1.1: every K7^= -minor-free graph is
   6-colourable. VERIFIED-FROM-SOURCE.
   => As of Oct 2026 every 7-chromatic graph has BOTH a K7^vee minor AND a K7^= minor.
4. OPEN: every graph with no K7^- minor is 6-colourable (Norin-Totschnig Conjecture 21; stated open
   in Lafferty-Song 2022 and DNR 2026). Best known for K7^- -minor-free: 7-colourable (Jakobsen 1971).
5. OPEN: K7-minor-free => 7-colourable. Best known: 8-colourable (Albar-Goncalves 2018; computer-free
   proof Rolek-Song 2017).

(Sections below are filled in as sources are verified.)
