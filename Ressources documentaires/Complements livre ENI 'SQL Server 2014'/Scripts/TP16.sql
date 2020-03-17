CREATE FUNCTION fTera(@idMachine int) RETURNS numeric(5,1) AS
BEGIN 
  DECLARE @capacite numeric(5,1)
  SELECT @capacite=convert(numeric(5,1),disque)/1024 
	FROM Machines 
	WHERE id=@idMachine;
  RETURN @capacite;
END;