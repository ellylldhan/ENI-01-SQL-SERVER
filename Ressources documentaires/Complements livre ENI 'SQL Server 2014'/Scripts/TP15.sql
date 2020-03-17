CREATE FUNCTION fNombrePlaces(@idFormation int) RETURNS int AS
BEGIN
  DECLARE @nombrePlaces int;
  SELECT @nombrePlaces=s.nombrePlaces
    FROM Formations f
	INNER JOIN Salles s ON f.salle=s.id
	WHERE f.id=@idFormation;

  RETURN @nombrePlaces;
END;
GO



-- Test de la fonction
Select dbo.fNombrePlaces(2);