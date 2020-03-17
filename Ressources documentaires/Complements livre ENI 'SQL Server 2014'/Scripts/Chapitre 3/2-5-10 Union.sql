
SELECT origine='Stock',convert(char(6), depot) as "Commande/dépot",
       reference_art, qte_stk
   FROM STOCKS
UNION
SELECT 'Commande', convert(char(6), cde.numero_cde), 
       reference_art, qte_cde
  FROM LIGNES_CDE lig INNER JOIN COMMANDES cde
  ON lig.numero_cde=cde.numero_cde
ORDER BY reference_art, origine;