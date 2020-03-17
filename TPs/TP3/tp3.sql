/*** 
 *   Rappel :
 *   FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
 */

-- a – Liste des clients (toutes les informations) dont le nom commence par un « D ».
SELECT *
FROM Clients
WHERE Nom LIKE 'D%';


-- b – Nom et prénom de tous les clients.
SELECT Nom,
       Prenom
FROM Clients;


-- c – Liste des fiches (n°, état) pour les clients (nom, prénom) qui habitent en Loire Atlantique (44)
SELECT Fiches.noFic as 'No. Fiche',
       Fiches.etat  as 'Etat',
       Clients.cpo
FROM Fiches,
     Clients
WHERE Clients.noCli = Fiches.noCli
  and Clients.cpo like '44%';



-- d – Détail de la fiche n°1002
-- e – Prix journalier moyen de location par gamme.
-- f – Liste des articles qui ont été loués au moins trois fois.
-- g – Détail de la fiche n°1002 avec le total
-- h – Grille des tarifs
-- i – Liste des locations de la catégorie SURF
-- j – Calcul du nombre moyen d’article loué par fiche de location.
-- k – Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette
-- l – Calcul du montant moyen des fiches de location
