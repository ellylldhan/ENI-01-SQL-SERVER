/*** 
 *   Rappel :
 *   FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
 */


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
