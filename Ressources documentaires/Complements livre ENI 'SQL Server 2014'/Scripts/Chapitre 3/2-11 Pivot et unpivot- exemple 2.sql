
SELECT reference_art, [N] as "dépot1", [P1] as "dépot2", [P2] as "dépot3"
  FROM STOCKS
  PIVOT (sum(qte_stk) FOR depot in ([N],[P1],[P2])) as p;
