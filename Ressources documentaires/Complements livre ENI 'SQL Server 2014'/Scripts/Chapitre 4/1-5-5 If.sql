
DECLARE @nocli int=153689;
IF exists(SELECT * FROM CLIENTS WHERE numero=@nocli) 
  BEGIN
	DELETE FROM COMMANDES WHERE numero_cli=@nocli;
	DELETE FROM CLIENTS WHERE numero=@nocli;
	PRINT 'Suppression OK';
  END
ELSE
  PRINT 'Pas de client pour ce numéro';