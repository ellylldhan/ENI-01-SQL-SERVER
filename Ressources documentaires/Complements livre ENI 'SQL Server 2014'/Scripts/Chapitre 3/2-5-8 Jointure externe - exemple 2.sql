
SELECT Client=cli.numero, nom, cde.numero_cde
  FROM CLIENTS cli ,COMMANDES cde
  WHERE cli.numero *= cde.numero_cli;