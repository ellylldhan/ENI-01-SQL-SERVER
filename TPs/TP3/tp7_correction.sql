-- e – Prix journalier moyen de location par gamme
-- Gamme | Tarif moyen

-- nb articles par gammes 
select codeGam,
       count(codeGam) as 'total articles'
from articles
group by codeGam


-- prix total des articles d'une gamme
select gt.codeGam           cg,
       --count(gt.codeGam) as 'total articles',
       (DATEDIFF(day, f.dateCrea, ISNULL(f.datePaye, GETDATE())) * t.prixJour) /
       count(gt.codeGam) as 'Prix Moyen Journalier'
from tarifs t
         join grilletarifs gt on t.codeTarif = gt.codeTarif
         join articles a on a.codegam = gt.codeGam and a.codeCate = gt.codeCate
         join lignesfic lf on lf.refart = a.refart
         join fiches f on f.noFic = lf.noFic
group by gt.codeGam,
         a.codeGam t.prixJour


/***
 * CORRECTION
 * C'est le prix journalier moyen, pas le coût 
 * journalier moyen (ex. CA / total articles d'une gamme)
 */
SELECT g.libelle,
       AVG(t.prixJour)
FROM Gammes g -- pour avoir le libellé de la gamme, pas juste le code gamme
         JOIN GrilleTarifs gt ON gt.codeGam = g.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
GROUP BY g.codeGame,
         g.libelle;


-- f – Liste des articles qui ont été loués au moins trois fois
-- Référence | Désignation | Nombre de locations
-- 1. detecter tables dont on a besoin
-- 2. Dans un group by, c'est bien de toujours utiliser la PK
SELECT a.refart,
       COUNT(*) Total
FROM lignesfic lf
         JOIN articles a ON a.refart = lf.refart
GROUP BY a.refart
HAVING count(*) > 2;


-- g – Détail de la fiche n°1002 avec le total.
-- Fiche N° | NOM Prénom du client | Référence | Désignation | Départ | Retour
/** 
 * Solution 1 : FUSION DE REQUETE avec UNION
 * Faut qu'il y ait le meme nom de colonne dans les 2 requetes
 * Si pas assez, ajoutes des colonnes avec NULL
 */
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

SELECT null,
       null,
       null,
       null,
       null,
       null,
       null,
       null,
       SUM(DATEDIFF(day, lf.depart, lf.retour) * t.prixJour)                    as Montant,
       SUM(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as Montant2
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002
ORDER by montant;


/** 
 * Solution 2 : Sous-requete
 */
-- Ci dessous, permet de considerer une requete comme une table,
-- ici nommée `tmp` pour future référence
(SELECT f.noFic,
        SUM(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as Montant2
 FROM Clients c
          JOIN Fiches f ON c.noCli = f.noCli
          JOIN LignesFic lf ON lf.noFic = f.noFic
          JOIN Articles a ON a.refart = lf.refart
          JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
          JOIN Tarifs t ON t.codeTarif = gt.codeTarif
 WHERE f.noFic = 1002
 GROUP BY f.noFic)
as tmp


-- Requête entière : (a recopier)
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
WHERE f.noFic = 1002;


/** 
 * Solution 3
 *
 */

-- subreq
(SELECT sum(DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour) as Montant2
 FROM Clients c
          JOIN Fiches f ON c.noCli = f.noCli
          JOIN LignesFic lf ON lf.noFic = f.noFic
          JOIN Articles a ON a.refart = lf.refart
          JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
          JOIN Tarifs t ON t.codeTarif = gt.codeTarif
 WHERE f.noFic = 1002)


-- actual thing
SELECT f.noFic,
       c.nom,
       c.prenom,
       a.refart,
       a.designation,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) * t.prixJour                    as Montant,
       DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) * t.prixJour as Montant2 (
                SELECT
                    sum(DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour) as Montant2
                FROM
                    Clients c
                    JOIN Fiches f ON c.noCli = f.noCli
                    JOIN LignesFic lf ON lf.noFic = f.noFic
                    JOIN Articles a ON a.refart = lf.refart
                    JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
                    JOIN Tarifs t ON t.codeTarif = gt.codeTarif
                WHERE
                    f.noFic = 1002
            )
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.noFic = 1002;

/* En resumé, option 1 est bien si on veut un resultat brut mais pas gerable pour recup les data par une appli
 * Option 2 et 3 ok. Option 2 plus élégante, plus optimale.
 */

-- h – Grille des tarifs.
-- Catégorie | Gamme | nom du tarif | Prix à la journée
SELECT c.libelle  as 'Catégorie',
       g.libelle  as 'Gamme',
       t.libelle  as 'Nom du tarif',
       t.prixJour as 'Prix à la journée'
FROM GrilleTarifs gt
         JOIN Gammes g ON g.codeGam = gt.codeGam
         JOIN Categories c ON c.codeCate = gt.codeCate
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif;


-- i – Liste des locations de la catégorie SURF.
-- Nombre de locations | Référence Article | Désignation
/*
référence désignation                           nombre de locations
--------- ------------------------------------- -------------------
S01       Décathlon Apparition                  6
S02       Décathlon Apparition                  6
S03       Décathlon Apparition                  6

(3 ligne(s) affectée(s))
*/

/**
 * CORRECTION
 */
-- 2 requetes parce qu'il faut 1 aggregation + 1 req normale pour le detail
-- or on ne peut pas avoir les 2 dans une seule requete

-- Requete 1, feat. Distinct pour eviter les doublons
SELECT distinct a.refart,
                a.designation
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
WHERE a.codeCate like 'surf'

-- requete 2 : count
select count(*)
from lignesfic lf
         join articles a on a.refart = lf.refart
where a.codeCate like 'surf'

-- UNION --- A VERIFIER, OUTPUT MAUVAIS 

SELECT distinct a.refart,
                a.designation
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
WHERE a.codeCate like 'surf'

UNION

select 'Nb Location :',           -- doit avoir meme nb de colonnes
       convert(varchar, count(*)) -- doit etre du meme type que col fusionnée, d'ou convert
from lignesfic lf
         join articles a on a.refart = lf.refart
where a.codeCate like 'surf'


-- j – Calcul du nombre moyen d’article loué par fiche de location.
-- Nombre moyen d’articles loués par fiche
/*
nombre d'articles loués en moyenne par fiche
--------------------------------------------
2.375000
*/

-- Premiere etape:
SELECT lf.noFic,
       COUNT(*) -- nb enregistrements par fiche
FROM LignesFic lf
GROUP BY lf.noFic

-- il faudrait faire l'avg du resultat ci-dessus
-- pour ce faire, il faut en faire une sous-requete
SELECT
    -- AVG(total) <- Pas bon, reourne un int
    -- Note AVG: retourne moy dans meme type que input (ici int<-int)
    AVG(CONVERT(decimal, total)) as Moyenne
FROM (
         SELECT lf.noFic,
                COUNT(*) as total -- nb enregistrements par fiche
         FROM LignesFic lf
         GROUP BY lf.noFic
     ) tableTotal


-- k – Calcul du nombre de fiches de location établies pour les catégories de location Ski alpin, Surf et Patinette.
-- Ski Alpin | Surf | Patinette
/*
catégorie        nombre de location
---------------- ------------------
Patinette        1
Ski alpin        2
Surf             6

(3 ligne(s) affectée(s))
*/

select c.libelle,
       count(*) total
from LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Categories c on c.codeCate = gt.codeCate
WHERE c.libelle IN ('Ski alpin', 'Surf', 'Patinette')
GROUP BY c.codeCate,
         c.libelle


-- l – Calcul du montant moyen des fiches de location.
-- Montant moyen d’une fiche de location
/*
montant moyen d'une fiche de location
---------------------------------------
146.25

(1 ligne(s) affectée(s))
*/
-- liste location: lignesfic
-- nb jour : ?
-- tarif art : tarifs
-- montant par fiche de location obtenu par GROUP BY sur lf.nofic

-- Etape 1: nb de jour
SELECT lf.nofic,
       lf.depart,
       lf.retour,
       t.prixJour,
       DATEDIFF(day, lf.depart, lf.retour) + 1
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY lf.noFic

-- Prix pour chaque location
SELECT lf.nofic,
       lf.depart,
       lf.retour,
       t.prixJour,
       (DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY lf.noFic

-- Calcul montant moy
SELECT lf.nofic,
       SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
FROM LignesFic lf
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY lf.noFic

-- Combinaison: résultat final
Select AVG(total) 'montant moyen d''une fiche de location'
FROM (
         SELECT lf.nofic,
                SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
         FROM LignesFic lf
                  JOIN Articles a ON a.refart = lf.refart
                  JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
                  JOIN Tarifs t ON gt.codeTarif = t.codeTarif
         GROUP BY lf.noFic) total