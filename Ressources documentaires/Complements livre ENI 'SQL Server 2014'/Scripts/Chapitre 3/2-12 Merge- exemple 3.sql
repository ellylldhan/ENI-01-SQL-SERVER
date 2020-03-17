
MERGE CLIENTS as cli
USING SyntheseClients as bilan
ON cli.numero=bilan.numero_cli
WHEN MATCHED THEN
   UPDATE SET ca=bilan.ca;