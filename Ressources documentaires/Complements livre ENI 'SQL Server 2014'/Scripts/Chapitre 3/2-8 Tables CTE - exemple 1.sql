
WITH CLI44 AS(
  SELECT numero, nom, prenom
    FROM CLIENTS
	WHERE codepostal BETWEEN 44000 AND 44999
)
SELECT * FROM CLI44;