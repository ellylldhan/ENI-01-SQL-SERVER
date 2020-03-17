
SELECT TOP(10) cli.nom, cli.prenom, cde.numero_cde,
                SUM(lig.qte_cde) AS NBRE_ARTICLES
  FROM CLIENTS cli INNER JOIN COMMANDES cde
    ON cli.numero=cde.numero_cli
    INNER JOIN LIGNES_CDE lig
    ON cde.numero_cde=lig.numero_cde
GROUP BY cli.nom, cli.prenom, cde.numero_cde
FOR XML AUTO;