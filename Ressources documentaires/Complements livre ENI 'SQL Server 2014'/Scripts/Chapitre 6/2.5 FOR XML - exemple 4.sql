
SELECT TOP(10) numero, nom, 
  (SELECT numero_cde
     FROM COMMANDES cde
	 WHERE cde.numero_cli=cli.numero
	 FOR XML PATH('commande'), TYPE) 
  FROM CLIENTS cli
 FOR XML PATH('client'),TYPE;