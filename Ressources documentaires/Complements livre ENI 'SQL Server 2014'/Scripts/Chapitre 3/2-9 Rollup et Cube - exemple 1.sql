
SELECT depot, libelle_cat , designation_art ,sum(qte_stk) as total
  FROM STOCKS stk
  INNER JOIN ARTICLES art
  ON stk.reference_art=art.reference_art
  INNER JOIN CATEGORIES cat
  ON cat.code_cat=art.code_cat
  WHERE depot IN ('N','P1')
  GROUP BY depot, libelle_cat , designation_art;