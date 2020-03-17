
SELECT TOP(10) numero, 
  (SELECT numero_cde
     FROM COMMANDES cde
	 WHERE cde.numero_cli=cli.numero
	 FOR XML AUTO, TYPE) 
  FROM CLIENTS cli
 FOR XML AUTO,TYPE;
