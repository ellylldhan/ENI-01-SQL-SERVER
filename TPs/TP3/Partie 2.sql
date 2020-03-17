--– Liste des clients (toutes les informations) dont le nom commence par un « D ».
SELECT *
FROM Clients c
WHERE c.nom LIKE 'D%'


--– Nom et prénom de tous les clients.
SELECT c.nom,
       c.prenom
FROM Clients c


--– Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44).
SELECT f.noFic,
       f.etat,
       c.nom,
       c.prenom
FROM Clients c
         INNER JOIN Fiches f ON f.noCli = c.noCli
WHERE cpo LIKE '44%'


--– Détail de la fiche n°1002.
SELECT f.noFic,
       c.nom,
       c.prenom,
       a.refart,
       a.designation,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) * t.prixJour                    as Montant,
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour as Montant2
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002


--– Prix journalier moyen de location par gamme.
SELECT g.libelle,
       AVG(t.prixJour)
FROM Gammes g
         JOIN GrilleTarifs gt ON gt.codeGam = g.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
GROUP BY g.codeGam,
         g.libelle


--f – Liste des articles qui ont été loués au moins trois fois.
SELECT a.refart,
       a.designation,
       count(*) nbLocation
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
GROUP BY a.refart,
         a.designation
HAVING count(*) > 2


-- g – Détail de la fiche n°1002 avec le total.
SELECT f.noFic,
       c.nom,
       c.prenom,
       a.refart,
       a.designation,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) * t.prixJour                    as Montant,
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour as Montant2
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002

UNION

SELECT NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       NULL,
       SUM(DATEDIFF(day, lf.depart, lf.retour) * t.prixJour)                    as Montant,
       SUM(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as Montant2
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002
ORDER BY Montant2


-- OPTION 2
SELECT f.noFic,
       c.nom,
       c.prenom,
       a.refart,
       a.designation,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) * t.prixJour                    as Montant,
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour as Montant2,
       tmp.le_montant
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
         JOIN (
    SELECT f.noFic                                                                     le_numero_de_fiche,
           SUM(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as le_montant
    FROM Clients c
             JOIN Fiches f ON c.noCli = f.noCli
             JOIN LignesFic lf ON lf.noFic = f.noFic
             JOIN Articles a ON a.refart = lf.refart
             JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
             JOIN Tarifs t ON t.codeTarif = gt.codeTarif
    WHERE f.noFic = 1002
    GROUP BY f.noFic) tmp ON f.noFic = tmp.le_numero_de_fiche
WHERE f.noFic = 1002


-- OPTION 3
SELECT f.noFic,
       c.nom,
       c.prenom,
       a.refart,
       a.designation,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) * t.prixJour                    as Montant,
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour as Montant2,
       (
           SELECT SUM(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as le_montant
           FROM Clients c
                    JOIN Fiches f ON c.noCli = f.noCli
                    JOIN LignesFic lf ON lf.noFic = f.noFic
                    JOIN Articles a ON a.refart = lf.refart
                    JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
                    JOIN Tarifs t ON t.codeTarif = gt.codeTarif
           WHERE f.noFic = 1002)                                           as option3
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002






