
DECLARE @AJOUT table(
	numero int,
	date_facture datetime,
	commande int,
	montantht smallmoney,
	etat_fac char(2));
INSERT INTO HISTO_FAC(date_fac, numero_cde, montantht, etat_fac)
  OUTPUT inserted.* INTO @AJOUT
  VALUES (getdate(), 1377, 234.67,'EC');

SELECT numero FROM @AJOUT;