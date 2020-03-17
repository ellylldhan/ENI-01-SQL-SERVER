
DECLARE @numero int;
SELECT @numero=1;
RAISERROR ('Erreur Grave sur le client %d!!',21,1,@numero)
	WITH LOG;
