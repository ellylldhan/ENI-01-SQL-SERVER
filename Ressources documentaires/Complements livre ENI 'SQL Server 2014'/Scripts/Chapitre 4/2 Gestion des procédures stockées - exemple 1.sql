
CREATE PROCEDURE supp_cli(@nocli int) AS
BEGIN
	IF NOT EXISTS (SELECT * FROM CLIENTS WHERE numero=@nocli)
	BEGIN
		PRINT 'Client inexistant';
		RETURN;
	END;
	IF EXISTS(SELECT * FROM COMMANDES WHERE numero_cli=@nocli)
	BEGIN
		PRINT 'Ce client possède des commmandes';
		RETURN;
	END;
	DELETE FROM CLIENTS WHERE numero=@nocli;
END;