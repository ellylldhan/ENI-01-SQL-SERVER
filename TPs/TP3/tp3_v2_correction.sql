/*** CORRECTION !!!
 *   Rappel :
 *   FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
 */

-- a – Liste des clients (toutes les informations) dont le nom commence par un « D ».
SELECT *
FROM Clients c
WHERE c.nom LIKE 'D%';


-- b – Nom et prénom de tous les clients.
SELECT c.nom,
       c.prenom
FROM Clients c;


-- c – Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
-- Soluce avec INNER JOIN
-- N° Fiches État Nom Client Prénom Client
SELECT noFic          AS 'No. Fiche',
       etat           AS 'Etat',
       Clients.nom    AS 'Nom',
       Clients.prenom AS 'Prénom',
       Clients.noCli  AS 'Client'
FROM Fiches
         INNER JOIN
     Clients
     ON
         Fiches.nocli = Clients.nocli
WHERE Clients.cpo like '44%';

--- CORRECTION
SELECT f.noFic  AS 'No. Fiche',
       f.etat   AS 'Etat',
       c.nom    AS 'Nom',
       c.prenom AS 'Prénom',
       c.noCli  AS 'Client'
FROM Clients c
         JOIN Fiches f ON f.noCli = c.noCli
WHERE cpo LIKE '44%';


-- d – Détail de la fiche n°1002
/* => Fiche N°, Nom, Prénom, Référence, 
      Désignation, Départ, Retour, Prix/Jour, Montant    */
SELECT Fiches.noFic                                                        AS 'Fiche N°',
       Clients.nom                                                         AS 'Nom',
       Clients.prenom                                                      AS 'Prénom',
       LignesFic.refart                                                    AS 'Référence',
       Articles.designation                                                AS 'Désignation',
       LignesFic.depart                                                    AS 'Depart',
       LignesFic.retour                                                    AS 'Retour',
       Tarifs.prixJour                                                     AS 'Prix/Jour',
       DATEDIFF(day, LignesFic.depart, LignesFic.retour) * Tarifs.prixJour AS 'Montant'
FROM Clients,
     Fiches,
     LignesFic,
     Tarifs,
     Articles
WHERE Fiches.noFic = '1002'
GROUP BY Clients.nom, Clients.prenom

SELECT Fiches.noFic                                                        AS 'Fiche N°',
       Clients.nom                                                         AS 'Nom',
       Clients.prenom                                                      AS 'Prénom',
       LignesFic.refart                                                    AS 'Référence',
       Articles.designation                                                AS 'Désignation',
       LignesFic.depart                                                    AS 'Depart',
       LignesFic.retour                                                    AS 'Retour',
       Tarifs.prixJour                                                     AS 'Prix/Jour',
       DATEDIFF(day, LignesFic.depart, LignesFic.retour) * Tarifs.prixJour AS 'Montant'
FROM Clients c,
     LignesFic,
     Tarifs,
     Articles
         JOIN fiches f on f.noCli = c.nocli and f.nofic = '1002'
GROUP BY Clients.nom, Clients.prenom


-- CORRECTION : Moulti Join !
SELECT f.noFic                                                             AS 'Fiche N°',
       c.nom                                                               AS 'Nom',
       c.prenom                                                            AS 'Prénom',
       lf.refart                                                           AS 'Référence',
       a.designation                                                       AS 'Désignation',
       lf.depart                                                           AS 'Depart',
       lf.retour                                                           AS 'Retour',
       t.prixJour                                                          AS 'Prix/Jour',
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour AS 'Montant'
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = '1002';


-- e – Prix journalier moyen de location par gamme.
-- Gamme, Tarif moyen
SELECT gt.codeTarif,
       avg(t.prixjour) as 'Tarif Moyen'
FROM GrilleTarifs gt,
     Tarifs t
WHERE t.codeTarif = gt.codeTarif
GROUP BY gt.codeTarif



-- f – Liste des articles qui ont été loués au moins trois fois.
-- g – Détail de la fiche n°1002 avec le total
-- h – Grille des tarifs
-- i – Liste des locations de la catégorie SURF
-- j – Calcul du nombre moyen d’article loué par fiche de location.
-- k – Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette
-- l – Calcul du montant moyen des fiches de location
