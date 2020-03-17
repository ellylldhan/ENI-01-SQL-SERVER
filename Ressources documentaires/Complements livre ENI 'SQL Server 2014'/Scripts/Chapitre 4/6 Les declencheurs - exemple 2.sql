
CREATE TRIGGER ins_cde_date ON COMMANDES
AFTER INSERT AS
BEGIN
	SET NOCOUNT ON
	DECLARE @numero AS int
	DECLARE cInserted CURSOR FOR
		SELECT numero_cde FROM inserted;
	OPEN cInserted;
	FETCH cInserted INTO @numero;
	WHILE (@@FETCH_STATUS=0) BEGIN
		UPDATE COMMANDES SET date_cde=GETDATE() WHERE numero_cde=@numero;
		FETCH cInserted INTO @numero;
	END;
	CLOSE cInserted;
	DEALLOCATE cInserted;
END;