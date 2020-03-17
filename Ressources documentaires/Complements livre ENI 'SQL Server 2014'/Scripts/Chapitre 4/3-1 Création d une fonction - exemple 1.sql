
CREATE FUNCTION nbre_cde(@nocli int) RETURNS int AS
BEGIN
	DECLARE @nbre int;
	SELECT @nbre=COUNT(*)
	  FROM COMMANDES
	  WHERE numero_cli=@nocli;
	RETURN @nbre;
END;
