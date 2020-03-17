
DECLARE @choix int;
DECLARE @nom char(30), @prenom char(30);
SELECT @choix=20;
SELECT @nom=nom, @prenom=prenom
  FROM CLIENTS
  WHERE numero=@choix

SELECT @nom, @prenom
