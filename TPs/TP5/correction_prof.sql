--Liste de tous les articles et le nombre de fois où ils ont été loués,
-- triés du plus loué à ceux qui n’ont jamais été loués.
SELECT a.refart,
       a.designation,
       COUNT(lf.noFic) total
FROM LignesFic lf
         RIGHT JOIN Articles a ON a.refart = lf.refart
GROUP BY a.refart,
         a.designation
ORDER BY total


--2. Liste des clients qui ne possèdent aucune fiche de location.
SELECT c.nom,
       c.prenom
FROM CLIENTS c
         LEFT JOIN Fiches f ON f.noCli = c.noCli
WHERE noFic IS NULL


--2. Liste des clients qui ne possèdent aucune fiche de location.
SELECT *
FROM Clients c
WHERE c.noCli NOT IN (SELECT noCli FROM FICHES)


--Liste des fiches (noFic, nom, refart, designation) qui
-- possèdent des articles en cours de location depuis au moins 5 jours.
CREATE VIEW Clients_Articles AS
SElECT c.noCli,
       c.nom,
       c.prenom,
       c.adresse,
       c.ville,
       c.cpo,
       f.noFic,
       f.dateCrea,
       f.datePaye,
       f.etat,
       lf.refart,
       lf.depart,
       lf.retour,
       a.designation,
       a.codeGam,
       a.codeCate
FROM Clients c
         JOIN FICHES f ON c.noCli = f.noCli
         JOIN LignesFic lf ON f.noFic = lf.noFic
         JOIN Articles a ON a.refart = lf.refart

SELECT noFic,
       refart,
       nom,
       designation
FROM Clients_Articles
WHERE retour IS NULL
  AND depart < GETDATE() - 5


--Liste des clients fidèles (plus de 450€ de chiffre d’affaire au cours
--des 12 derniers mois) qui sont des skieurs alpins 
--(la catégorie ski alpin représente plus de 60% du montant total de l’ensemble de leurs locations).
SELECT tout.noCli,
       tout.nom,
       tout.total,
       sa.totalSA
FROM (SELECT c.noCli,
             c.nom,
             SUM((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) total
      FROM Clients c
               JOIN FICHES f ON c.noCli = f.noCli
               JOIN LignesFic lf ON f.noFic = lf.noFic
               JOIN Articles a ON a.refart = lf.refart
               JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
               JOIN Tarifs t ON gt.codeTarif = t.codeTarif
      WHERE f.dateCrea > DATEADD(month, -12, GETDATE())
      GROUP BY c.noCli,
               c.nom) Tout
         JOIN

     (SELECT c.noCli,
             c.nom,
             SUM((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) totalSA
      FROM Clients c
               JOIN FICHES f ON c.noCli = f.noCli
               JOIN LignesFic lf ON f.noFic = lf.noFic
               JOIN Articles a ON a.refart = lf.refart
               JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
               JOIN Tarifs t ON gt.codeTarif = t.codeTarif
      WHERE f.dateCrea > DATEADD(month, -12, GETDATE())
        AND gt.codeCate = 'SA'
      GROUP BY c.noCli,
               c.nom) sa ON tout.noCli = sa.noCli
WHERE sa.totalSA > (tout.total * 0.60)
  AND tout.total > 450


--Liste des clients fidèles (plus de 450€ de chiffre d’affaire au cours 
--des 12 derniers mois) qui sont des skieurs alpins 
--(la catégorie ski alpin représente plus de 60% du montant total de l’ensemble de leurs locations).
SELECT c.noCli,
       c.nom,
       c.prenom,
       SUM(CONVERT(decimal,
               ((DATEDIFF(DAY, LignesFic.depart, ISNULL(LignesFic.retour, GETDATE()) + 1)) * Tarifs.prixJour)))
           AS CA_CLIENT_FIDELE
FROM Clients c
         INNER JOIN Fiches ON c.noCli = Fiches.noCli
         INNER JOIN LignesFic ON Fiches.noFic = LignesFic.noFic
         INNER JOIN Articles ON LignesFic.refart = Articles.refart
         INNER JOIN GrilleTarifs
                    ON Articles.codeCate = GrilleTarifs.codeCate AND Articles.codeGam = GrilleTarifs.codeGam
         INNER JOIN Tarifs ON GrilleTarifs.codeTarif = Tarifs.codeTarif
WHERE Fiches.dateCrea > DATEADD(MONTH, -12, GETDATE())
GROUP BY c.noCli,
         c.nom,
         c.prenom
HAVING SUM(CONVERT(decimal,
            DATEDIFF(DAY, LignesFic.depart, ISNULL(LignesFic.retour, GETDATE()) + 1) * Tarifs.prixJour)) > 450
   AND (
           SELECT SUM(CONVERT(decimal,
                       DATEDIFF(DAY, LignesFic.depart, ISNULL(LignesFic.retour, GETDATE()) + 1) * Tarifs.prixJour))
           FROM Clients
                    INNER JOIN Fiches ON Clients.noCli = Fiches.noCli
                    INNER JOIN LignesFic ON Fiches.noFic = LignesFic.noFic
                    INNER JOIN Articles ON LignesFic.refart = Articles.refart
                    INNER JOIN GrilleTarifs
                               ON Articles.codeCate = GrilleTarifs.codeCate AND Articles.codeGam = GrilleTarifs.codeGam
                    INNER JOIN Categories ON GrilleTarifs.codeCate = Categories.codeCate
                    INNER JOIN Tarifs ON GrilleTarifs.codeTarif = Tarifs.codeTarif
           WHERE Categories.codeCate = 'SA'
             AND Clients.noCli = c.noCli
       ) > (60 * SUM(
        CONVERT(decimal, DATEDIFF(DAY, LignesFic.depart, ISNULL(LignesFic.retour, GETDATE()) + 1) * Tarifs.prixJour))) /
           100

