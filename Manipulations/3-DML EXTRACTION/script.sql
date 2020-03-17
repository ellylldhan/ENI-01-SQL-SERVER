--QUELQUES FONCTIONS
SELECT GETDATE();
SELECT DATEPART(month, GETDATE());
SELECT MONTH(GETDATE());
SELECT YEAR(GETDATE());
SELECT GETDATE() + 3;
SELECT DATEADD(week, 2, GETDATE());
SELECT DATEDIFF(DAY, GETDATE(), '24/12/2019');
SELECT CONVERT(varchar, GETDATE(), 103);


--FROM => WHERE => GROUP BY => HAVING => SELECT => ORDER BY
SELECT * FROM Employes
SELECT * FROM Services
SELECT * FROM Conges
SELECT nom, prenom FROM Employes


--Projection
SELECT
       UPPER(nom)                                            NOM_DE_FAMILLE,
       prenom                                                'prenom de famille',
       ISNULL(CONVERT(varchar, DateNaissance, 103), 'NR') as 'date de naissance',
       Salaire,
        Augmentation = Salaire * 1.1
FROM Employes


--Restrictions
SELECT *
FROM Employes
WHERE (
        CodeService = 'INFOR'
        OR
        CodeService = 'DIRGE'
        OR
        CodeService IN ('INFOR', 'DIRGE')
    )
  AND nom LIKE '%v%'


--Liste des fonctions d'agregation
SELECT COUNT(DateNaissance),
       COUNT(*),
       SUM(Salaire),
       AVG(Salaire),
       MAX(Salaire),
       MIN(Salaire)
FROM Employes


--FROM => WHERE => GROUP BY => HAVING => SELECT => ORDER BY
--REGROUPEMENT -> Si je regroupe je veux des infos de groupe
SELECT
    CodeService,
    Count(*)
FROM
    Employes
GROUP BY
    CodeService


--Supprimer les doublons
SELECT DISTINCT
    CodeService
FROM
    Employes


--Restriction sur le regroupement
SELECT
    CodeService,
    Count(*) as total
FROM
    Employes
GROUP BY
    CodeService
HAVING
    Count(*) > 1


--JOINTURE
SELECT
    e.Nom,
    s.Libelle titre
FROM
    Employes e
JOIN Services s ON e.CodeService = s.CodeService
ORDER BY
    e.Nom ASC,
    titre DESC

