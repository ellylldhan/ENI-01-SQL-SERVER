
DECLARE @TTC float;
DECLARE @TxTVA float;
DECLARE @X int;

SELECT @TxTVA=19.6;
SELECT @TTC=(PRIXHT_ART*(1+(@TxTVA/100)))
  FROM ARTICLES
  WHERE REFERENCE_ART='SOU16';

SELECT @X=COUNT(*)
  FROM ARTICLES;
IF (@X%2)=0 PRINT 'X est pair'
ELSE PRINT 'X est impair';