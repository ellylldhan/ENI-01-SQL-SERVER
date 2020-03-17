
SELECT *
  FROM COMMANDES
  WHERE numero_cli=(SELECT numero
	FROM CLIENTS
	WHERE nom LIKE 'Kornu'
  );