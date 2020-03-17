CREATE TRIGGER ins_cde_taux ON COMMANDES
AFTER INSERT AS
BEGIN
	SET NOCOUNT ON
	DECLARE @numero_cde int
	DECLARE @numero_cli int
	DECLARE @nombre_commandes int
	DECLARE cInserted CURSOR FOR
		SELECT numero_cde,numero_cli FROM inserted;
	OPEN cInserted;
	FETCH cInserted INTO @numero_cde, @numero_cli;
	WHILE (@@FETCH_STATUS=0) BEGIN
		SELECT @nombre_commandes=COUNT(*)
			FROM COMMANDES
			WHERE numero_cli=@numero_cli;
		IF (@nombre_commandes>10 )
			UPDATE COMMANDES SET taux_remise=5 WHERE numero_cde=@numero_cde;
		FETCH cInserted INTO @numero_cde, @numero_cli;
	END;
	CLOSE cInserted;
	DEALLOCATE cInserted;
END;