
SELECT depot, libelle_cat , designation_art ,
  NTILE(4) OVER (PARTITION BY depot, libelle_cat ORDER BY libelle_cat) as ensemble
  FROM STOCKS stk
  INNER JOIN ARTICLES art
  ON stk.reference_art=art.reference_art
  INNER JOIN CATEGORIES cat
  ON cat.code_cat=art.code_cat
  WHERE depot IN('N','P1');