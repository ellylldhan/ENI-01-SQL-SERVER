
DELETE FROM H
  FROM HISTO_FAC H, COMMANDES C
  WHERE H.numero_cde=c.numero_cde
   AND C.numero_cli=1;