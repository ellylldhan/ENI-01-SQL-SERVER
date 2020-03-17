/**
 * Jour 4 - 2019-10-10
 */

-- 1. Liste de tous les articles et le nombre de fois où ils ont été loués, 
--    triés du plus loué à ceux qui n’ont jamais été loués
/*
refart designation                        nbloc
------ ---------------------------------- -------
A04    Salomon 24X+Z12                    6
P01    Décathlon Allegre junior 150       6
...
F20    Fischer RCS Classic GOLD           0
A21    Salomon 3V RACE JR+L10             0

(30 ligne(s) affectée(s))
*/

SELECT a.refart,
       a.designation,
       count(lf.depart) total
FROM articles a
         LEFT JOIN lignesfic lf ON lf.refart = a.refart
GROUP BY a.refart,
         a.designation
ORDER BY total DESC

/***
 * CORRECTION : ??? autre methode; LEFT JOIN overkill ???
 */
-- voir corrigé


-- 2. Liste des clients qui ne possèdent aucune fiche de location.
/*
nom         prenom    ville
----------- --------- ------------------------
Ernest      Etienne   Saint Étienne
de France   Cécile    Charlesville-Mézières

(2 ligne(s) affectée(s))
*/

SELECT nom,
       prenom,
       ville
FROM clients c
WHERE c.nocli not in
      (SELECT nocli FROM fiches)


-- 3. Liste des fiches (noFic, nom, refart, designation) qui possèdent 
--    des articles en cours de location depuis au moins 5 jours.
/*
noFic    nom        refart designation
-------- ---------- ------ ------------------------------
1002     Desmoulin  S03    Décathlon Apparition
1004     Ferdinand  P01    Décathlon Allegre junior 150
1005     Dupond     F10    Fischer Sporty Crown

(3 ligne(s) affectée(s))
*/

SELECT lf.noFic,
       c.nom,
       a.refart,
       a.designation
FROM clients c
         JOIN fiches f ON c.noCli = f.noCli
         JOIN lignesfic lf ON f.noFic = lf.noFic
         JOIN Articles a ON lf.refart = a.refart
WHERE (datediff(day, lf.depart, getdate())) >= 5
  and lf.retour IS null
GROUP BY lf.noFic,
         c.nom,
         a.refart,
         a.designation;

/***
 * CORRECTION : Intro des VIEW pour eviter les repetitions
 */

CREATE VIEW Clients_Articles AS
SELECT c.nom,
       c.prenom,
       c.noCli,
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
         JOIN fiches f ON c.noCli = f.noCli
         JOIN lignesfic lf ON f.noFic = lf.noFic
         JOIN Articles a ON lf.refart = a.refart;


SELECT noFic,
       refart,
       nom,
       designation
FROM Clients_Articles
WHERE retour IS NULL
  AND depart < GETDATE() - 5


-- 4. Prix facturé par jour en moyenne pour la location d’une paire de skis.
/*
ca        nbjours     prix moyen location
--------- ----------- ---------------------
4730.00   113         41.858407

(1 ligne(s) affectée(s))
*/

SELECT SUM
           (
                   datediff(day, lf.depart, isnull(lf.retour, getdate())) * t.prixJour
           ) AS ca,
       SUM
           (
               datediff(day, lf.depart, isnull(lf.retour, getdate()))
           ) AS nbJours,
       SUM
           (
                   datediff(day, lf.depart, isnull(lf.retour, getdate())) * t.prixJour
           ) / SUM
           (
               datediff(day, lf.depart, isnull(lf.retour, getdate()))
           ) AS Moy
FROM Articles a
         JOIN LignesFic lf ON lf.refart = a.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Categories cat ON cat.codeCate = gt.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
         JOIN Fiches f ON f.noFic = lf.noFic
WHERE cat.libelle LIKE '%ski%'
  and f.datePaye IS NOT NULL
GROUP BY a.refart


-- 5. Liste des articles n’ayant été loués (éventuellement plusieurs fois) qu’à une
-- seule personne.
/*
refart 
------ -----------
F04    1
F61    1

(2 ligne(s) affectée(s))
*/

-- 6. Liste des clients fidèles (plus de 450€ de chiffre d’affaire au cours des 12 
-- derniers mois) qui sont des skieurs alpins (la catégorie ski alpin représente
-- plus de 60% du montant total de l’ensemble de leurs locations).

/*** 
 * CORRECTION
 */

-- Etape 1: CA Total
SELECT c.noCli,
       c.nom,
       sum((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) totalSA
FROM Clients c
         JOIN Fiches f ON f.noCli = c.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.dateCrea > DATEADD(month, -12, GETDATE())
GROUP BY c.noCli,
         c.nom


-- Etape 2: Union
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


/*************
 *  Soluce2  *
 *************/
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

