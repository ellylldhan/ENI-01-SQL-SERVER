-- 1. Liste des clients (nom, prénom, adresse, code postal, ville) ayant au moins une fiche de location en cours.
/*
nom                            prénom                         adresse                                                                                                                  code postal ville
------------------------------ ------------------------------ ------------------------------------------------------------------------------------------------------------------------ ----------- --------------------------------------------------------------------------------
Albert                         Anatole                        Rue des accaciAS                                                                                                         61000       Amiens
Bernard                        Barnabé                        Rue du bar                                                                                                               01000       Bourg en Bresse
Desmoulin                      Daniel                         Rue descendante                                                                                                          21000       Dijon
Dupond                         Camille                        Rue Crébillon                                                                                                            44000       Nantes
Ferdinand                      François                       Rue de la convention                                                                                                     44100       Nantes

(5 ligne(s) affectée(s))
*/

-- Methode JOIN 
SELECT c.nom,
       c.prenom,
       c.adresse,
       c.cpo,
       c.ville
FROM clients c
         JOIN Fiches f ON f.noCli = c.noCli
GROUP BY c.nom, c.prenom, c.adresse, c.cpo, c.ville;

-- Methode IN et REQUETE IMBRIQUEE
SELECT c.nom,
       c.prenom,
       c.adresse,
       c.cpo,
       c.ville
FROM clients c
WHERE c.nocli IN (SELECT f.noCli FROM fiches f);


/**
 * CORRECTION : Faux car pAS bien lu la consigne !
 */
SELECT c.nom,
       c.prenom,
       c.adresse,
       c.cpo,
       c.ville
FROM clients c
         JOIN fiches f ON c.noCli = f.noCli
WHERE f.etat = 'EC'


-- 2. Détail de la fiche de location de M. Dupond Jean de Paris 
-- (avec la désignation des articles loués, la date de départ et de retour).
/*
n° fiche     designation            départ        retour
------------ ---------------------- ------------- ------------
1006         Décathlon Apparition   08/11/2016    09/11/2016
1006         Décathlon Apparition   08/11/2016    09/11/2016
1006         Décathlon Apparition   08/11/2016    09/11/2016

(3 ligne(s) affectée(s))
*/
SELECT c.nom         'Nom',
       c.prenom      'Prénom',
       c.ville       'Ville',
       a.designation 'Designation',
       lf.depart     'Depart',
       lf.retour     'Retour'
FROM Clients c
         JOIN Fiches f ON f.noCli = c.nocli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
WHERE c.nom like 'Dupond'
  and c.prenom like 'Jean'
  and c.ville like 'Paris'


/** 
 * CORRECTION : Ok
 */


-- 3. Liste de tous les articles (référence, désignation et libellé de la catégorie)
-- dont le libellé de la catégorie contient ski.
SELECT a.refart      'Ref.',
       a.designation 'Des.',
       c.libelle     'Lib.'
FROM Articles a
         JOIN Categories c ON c.codeCate = a.codeCate
WHERE c.libelle like '%ski%'


/** 
 * CORRECTION : ajout JOIN grilletarifs
 * => Faut suivre les liens entre les tables AS per diagramme,
 *    ca marche sans, mais c'est pAS conseillé
 */
SELECT a.refart      'Ref.',
       a.designation 'Des.',
       c.libelle     'Lib.'
FROM Articles a
         JOIN Categories c ON c.codeCate = a.codeCate
         JOIN grilletarifs gt ON gt.codeCate = a.codeCate and gt.codeGam = gt.codeGam
WHERE c.libelle like '%ski%'


-- 4. Calcul du montant de chaque fiche soldée et du montant total des fiches.
-- Montant total des fiches
/*
n° de fiche                             total fiche                             total
--------------------------------------- --------------------------------------- ---------------------------------------
1001                                    180.00                                  7050.00
1003                                    120.00                                  7050.00
...
9933                                    1170.00                                 7050.00
9934                                    285.00                                  7050.00

(18 ligne(s) affectée(s))
*/
-- Etape 1 : total des fiches (?!)
SELECT SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total_des_fiches
FROM Fiches f
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif


-- Montant chaque fiche soldee
SELECT f.noFic,
       SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total_par_fiche
FROM Fiches f
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.etat like 'SO'
GROUP BY f.noFic


-- combinaison
SELECT f.noFic                                                     AS 'No. Fiche',
       SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) AS 'total fiche',
       (SELECT SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour)
        FROM Fiches f
                 JOIN LignesFic lf ON lf.noFic = f.noFic
                 JOIN Articles a ON a.refart = lf.refart
                 JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
                 JOIN Tarifs t ON t.codeTarif = gt.codeTarif
        WHERE f.etat = 'SO')                                       AS 'total'
FROM Fiches f
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.etat like 'SO'
GROUP BY f.noFic


/**
 * CORRECTION : table temp + union
 */
SELECT 'Total',
       sum(total)
FROM (
         SELECT f.noFic,
                sum((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
         FROM Fiches f
                  JOIN LignesFic lf ON lf.noFic = f.noFic
                  JOIN Articles a ON a.refart = lf.refart
                  JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
                  JOIN Tarifs t ON t.codeTarif = gt.codeTarif
         WHERE f.etat = 'SO'
         GROUP BY f.noFic) tabletmp
UNION
SELECT CONVERT(varchar, f.noFic),
       sum((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
FROM Fiches f
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.etat = 'SO'
GROUP BY f.noFic


-- union: regles
-- 1. req ont meme nbr colonnes
-- 2. col doivent etre du meme type

-- 5. Calcul du nombre d’articles actuellement en cours de location.
/*
nombre d'articles en cours de location
--------------------------------------
7

(1 ligne(s) affectée(s))
*/
SELECT count(*) 'nombre d''articles en cours de location'
FROM lignesfic lf
WHERE lf.retour IS NULL

/**
 * CORRECTION : ok
 */


-- 6. Calcul du nombre d’articles loués, par client.
/* 
nom        prenom         nombre de location effectuées
---------- -------------- -----------------------------
Albert     Anatole        6
Bernard    Barnabé        1
...
Huppert    Isabelle       3
Deneuve    Catherine      3

(33 ligne(s) affectée(s))
*/

/****** Faux ******/

SELECT c.nom,
       c.prenom,
       (SELECT count(*)
        FROM lignesfic lf2
        WHERE lf2.noFic = lf.noFic
        GROUP BY lf2.noFic) 'nombre de location effectuées'
FROM clients c
         JOIN fiches f ON f.noCli = c.noCli
         JOIN lignesfic lf ON lf.noFic = f.noFic
GROUP BY c.nom, c.prenom, lf.nofic
ORDER BY c.nom, c.prenom

/**
 * CORRECTION : Me suis complique la vie, un count(*) suffisait
 * => voir si le GROUP BY influence si ON prend c.nocli
 */
SELECT c.nom,
       c.prenom,
       count(*)
FROM clients c
         JOIN fiches f ON f.noCli = c.noCli
         JOIN lignesfic lf ON lf.noFic = f.noFic
GROUP BY c.noCli,
         c.nom,
         c.prenom


-- 7. Liste des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location.
/*
nom                            prenom                         total
------------------------------ ------------------------------ ---------------------------------------
Albert                         Anatole                        500.00
Desmoulin                      Daniel                         200.00
...
Huppert                        Isabelle                       1170.00
Deneuve                        Catherine                      285.00
*/
SELECT c.nom,
       c.prenom,
       (DATEDIFF(day, f.dateCrea, ISNULL(f.datePaye, GETDATE())) * t.prixJour) AS total
FROM clients c
         JOIN fiches f ON f.noCli = c.nocli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE (DATEDIFF(day, f.dateCrea, ISNULL(f.datePaye, GETDATE())) * t.prixJour) > 200
GROUP BY c.nom, c.prenom, t.prixjour, f.datecrea, f.datepaye
ORDER BY c.nom, c.prenom

-- v2
SELECT c.nom,
       c.prenom,
       (DATEDIFF(day, f.dateCrea, ISNULL(f.datePaye, GETDATE())) * t.prixJour) AS total
FROM clients c
         JOIN fiches f ON f.noCli = c.nocli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
GROUP BY c.nom, c.prenom, t.prixjour, f.datecrea, f.datepaye
HAVING (DATEDIFF(day, f.dateCrea, ISNULL(f.datePaye, GETDATE())) * t.prixJour) > 200
ORDER BY c.nom, c.prenom

/**
 * CORRECTION : j'ai des doublons
 */
SELECT c.nom,
       c.prenom,
       sum((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) AS total
FROM clients c
         JOIN fiches f ON f.noCli = c.nocli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
GROUP BY c.nom,
         c.prenom
having sum((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) > 200


-- 8. Liste de tous les articles (loués au moins une fois) et le nombre de fois où ils ont été loués, 
-- triés du plus loué au moins loué.
/*
refart designation                                                                      nbloc
------ -------------------------------------------------------------------------------- -----------
A04    Salomon 24X+Z12                                                                  6
P01    Décathlon Allegre junior 150                                                     6
...
F04    Fischer Cruiser                                                                  1
F61    Fischer RCS CARBOLITE Skating                                                    1

(27 ligne(s) affectée(s))
*/
SELECT lf.refart,
       a.designation,
       count(lf.refart) AS total_loc
FROM articles a
         JOIN lignesfic lf ON lf.refart = a.refart
WHERE lf.depart IS NOT NULL
GROUP BY lf.refart, a.designation
ORDER BY total_loc DESC


/**
 * CORRECTION : ok
 */
SELECT a.designation,
       count(*) total
FROM lignesfic lf
         JOIN articles a ON lf.refart = a.refart
GROUP BY a.refart,
         a.designation
ORDER BY total desc






