--Liste des clients (nom, prénom, adresse, code postal, ville) ayant au moins une fiche de location en cours.
SELECT nom,
       prenom,
       adresse,
       cpo,
       ville
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
WHERE f.etat = 'EC'


--Détail de la fiche de location de M. Dupond Jean de Paris 
-- (avec la désignation des articles loués, la date de départ et de retour).
SELECT a.designation,
       lf.depart,
       lf.retour
FROM Clients c
         JOIN Fiches f ON c.noCli = f.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
         JOIN Articles a ON a.refart = lf.refart
WHERE c.prenom = 'Jean'
  AND c.nom = 'Dupond'
  AND c.ville = 'Paris'


--Liste de tous les articles (référence, désignation et libellé de la catégorie)
-- dont le libellé de la catégorie contient ski.
SELECT a.refart,
       a.designation,
       c.libelle
FROM Articles a
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Categories c ON c.codeCate = gt.codeCate
WHERE c.libelle LIKE '%ski%'


--Calcul du montant de chaque fiche soldée et du montant total des fiches.
SELECT CONVERT(varchar, f.noFic),
       SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
FROM Fiches f
         JOIN LignesFic lf ON f.noFic = lf.noFic
         JOIN Articles a ON lf.refart = a.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE f.etat = 'SO'
GROUP BY f.noFic

UNION

SELECT 'Total',
       SUM(total)
FROM (SELECT f.noFic,
             SUM((DATEDIFF(day, lf.depart, lf.retour) + 1) * t.prixJour) total
      FROM Fiches f
               JOIN LignesFic lf ON f.noFic = lf.noFic
               JOIN Articles a ON lf.refart = a.refart
               JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
               JOIN Tarifs t ON t.codeTarif = gt.codeTarif
      WHERE f.etat = 'SO'
      GROUP BY f.noFic) tableTmp


--5. Calcul du nombre d’articles actuellement en cours de location.
SELECT count(*)
FROM LignesFic lf
WHERE lf.retour IS NULL


--6. Calcul du nombre d’articles loués, par client.
SELECT c.nom,
       count(*)
FROM Clients c
         JOIN Fiches f ON f.noCli = c.noCli
         JOIN LignesFic lf ON lf.noFic = f.noFic
GROUP BY c.noCli,
         c.nom


--7. Liste des clients qui ont effectué (ou sont en train d’effectuer) plus de 200€ de location.
SELECT c.noCli,
       c.nom,
       SUM((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour)
FROM Clients c
         JOIN Fiches f ON f.noCli = c.noCli
         JOIN LignesFic lf ON f.noFic = lf.noFic
         JOIN Articles a ON lf.refart = a.refart
         JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
         JOIN Tarifs t ON t.codeTarif = gt.codeTarif
GROUP BY c.noCli,
         c.nom
HAVING SUM((DATEDIFF(day, lf.depart, ISNULL(lf.retour, GETDATE())) + 1) * t.prixJour) > 200


--Liste de tous les articles (loués au moins une fois) 
-- et le nombre de fois où ils ont été loués, triés du plus loué au moins loué.
SELECT a.designation,
       count(*) total
FROM LignesFic lf
         JOIN Articles a ON lf.refart = a.refart
GROUP By a.refart,
         a.designation
ORDER BY total DESC
