SELECT numero_cde, numero_cli
  FROM COMMANDES
  WHERE DATEPART(mm, date_cde)=6
    AND DATEDIFF(year, GETDATE(), date_cde)<3;