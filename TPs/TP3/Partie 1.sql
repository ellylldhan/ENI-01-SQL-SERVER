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