--1.
SELECT nom,
       prenom,
       ville
FROM clients;

--2.
SELECT *
FROM clients
ORDER BY ville,
         nom;

--3.
SELECT titre,
       annee
FROM dvd
ORDER BY titre


-- 4. Liste des réalisateurs classés du plus âgé au plus jeune (*)
SELECT *
FROM realisateurs
ORDER BY Annee_naissance ASC


-- 5. Liste des clients de Loire-Atlantique (*)
SELECT *
FROM clients
WHERE Code_postal like '44%'


-- 6. Liste des clientes dont le prénom commence par « a » (*)
SELECT *
FROM clients
WHERE Titre IN ('Mme', 'Mlle')
  AND prenom LIKE 'a%'


-- 7. Liste des clients nés pendant les années 70 (*)
SELECT *
FROM clients
where Date_naissance between '1970' and '1979'


-- 8. Liste des réalisateurs anglais et américains (*)
SELECT *
FROM realisateurs
WHERE pays in ('USA', 'ANGLETERRE')


-- 9. Liste des réalisateurs américains nés au 19ème siècle 
-- dont le nom contient un « a » (*)
SELECT *
FROM realisateurs
WHERE pays = 'USA'
  AND Annee_naissance between '1800' and '1899'
  AND nom LIKE '%a%';


-- 10. Liste des DVD de moins de deux heures
SELECT *
FROM dvd
WHERE duree < 120;

-- REQUETES AVEC CALCUL STAT
-- 1. Nombre de clients par titre
SELECT titre,
       count(titre) 'Nb de clients'
FROM clients
GROUP BY titre;

-- 2. Nombre de DVD par genre de film
SELECT gf.Signification,
       count(dvd.Code_Genre) Nb_dvd
FROM dvd
         join genres_film gf on dvd.code_genre = gf.code_genre
GROUP BY dvd.Code_genre,
         gf.Signification


-- 3. Nombre de réalisateurs par pays du plus grand nombre au plus petit
SELECT pays,
       count(pays) total_real
FROM realisateurs
GROUP BY Pays
ORDER BY total_real DESC


-- 4. Nombre de DVD concernant des films des années 70 par genre
SELECT gf.Signification,
       count(dvd.code_genre) Nb_Dvd
FROM dvd
         join genres_film gf on dvd.code_genre = gf.code_genre
WHERE annee LIKE '197%'
GROUP BY dvd.Code_genre,
         gf.Signification


-- 5. Durée moyenne des films par genre
SELECT code_genre,
       avg(duree) moy_duree
FROM dvd
GROUP BY Code_genre

-- 6. Durée maximum des films des années 80 par genre
SELECT Code_genre,
       MAX(duree)
FROM dvd
WHERE annee LIKE '198%'
GROUP BY Code_genre


-- 7. Nombre de clients par mois de naissance
SELECT DATENAME(month, Date_naissance) 'mois naissance',
       count(*)                        'Nombre de clients'
FROM clients
GROUP BY DATENAME(month, Date_naissance)


-- REQUETES MULTITABLE
-- 1. Liste des DVD avec leur titre et la signification de leur genre 
SELECT d.titre          Titre,
       gf.Signification Genre
FROM dvd d
         JOIN genres_film gf ON gf.Code_genre = d.Code_genre;


-- 2. Liste des DVD avec leur titre, le nom, le prénom et la nationalité du réal
--    et la signification du genre 
SELECT d.titre          Titre,
       r.nom            Nom,
       r.prenom         Prenom,
       r.Pays           Nationalite,
       gf.Signification Genre
FROM dvd d
         JOIN realisateurs r ON r.Code_realisateur = d.Code_realisateur
         JOIN genres_film gf ON gf.Code_genre = d.Code_genre;


-- 3. Liste des clients avec leur nom et prénom ayant loué des DVD en Juin 2006 
SELECT DISTINCT c.nom    Nom,
                c.prenom Prenom
FROM clients c
         JOIN factures f ON f.code_client = c.Code_client
WHERE MONTH(f.Date_facture) = 6
  AND YEAR(f.Date_facture) = 2006


-- 4. Liste des DVD loués avec leur titre et leur durée, l’identité du client 
--    (concaténation des champs Titre, Nom, Prenom) et du réalisateur (idem) 
SELECT d.titre                                    Titre,
       d.Duree                                    Duree,
       CONCAT(c.Titre, ' ', c.Nom, ' ', c.Prenom) Client,
       CONCAT(r.Nom, ' ', r.Prenom)               'Real'
FROM dvd d
         JOIN locations l ON l.Num_dvd = d.Num_dvd
         JOIN factures f ON f.Num_facture = l.Num_facture
         JOIN Clients c ON c.Code_client = f.Code_client
         JOIN realisateurs r ON r.Code_realisateur = d.Code_realisateur
WHERE
    --l.Num_facture in ( select Num_facture from factures)
    d.Num_dvd in (select Num_dvd from locations)

/*  Note : Tous les dvd ont été loués ???   */

/** 
 * CORRECTION
 */
SELECT d.titre,
       d.duree,
       c.titre + ' ' + c.nom + ' ' + c.prenom,
       r.nom + ' ' + r.prenom
FROM clients c
         join factures f on f.code_client = c.code_client
         join locations l on l.Num_facture = f.Num_facture
         join dvd d on d.num_dvd = l.Num_dvd
         join realisateurs r on r.Code_realisateur = d.Code_realisateur


-- 5. Liste des clients ayant loué des DVD de réalisateurs allemands pendant le 
--    mois de Juin 2006 
SELECT DISTINCT CONCAT(c.Nom, ' ', c.Prenom) Client
FROM clients c
         JOIN factures f ON f.code_client = c.Code_client
         JOIN locations l ON L.Num_facture = f.Num_facture
         JOIN dvd d ON d.Num_dvd = l.Num_dvd
         JOIN realisateurs r ON r.Code_realisateur = d.Code_realisateur
WHERE MONTH(f.Date_facture) = 6
  AND YEAR(f.Date_facture) = 2006
  AND r.Pays = 'ALLEMAGNE'


-- 6. Titres des DVD d’aventure loués par des clients de sexe masculin nés dans les années 60
SELECT DISTINCT d.titre Titre
FROM dvd d
         JOIN locations l ON l.Num_dvd = d.Num_dvd
         JOIN factures f ON f.Num_facture = l.Num_facture
         JOIN clients c ON c.Code_client = f.Code_client
WHERE c.Titre = 'M.'
  AND YEAR(c.Date_naissance) BETWEEN 1960 AND 1969
  AND d.Code_genre = 'AV'


-- 7. Nombre de DVD loués par client pour connaître le nom du meilleur 
--    => pour chaque client, on veut savoir le film qu'il/elle a loué le plus souvent ???

/*** C'EST FAUX... :( ***/
SELECT c.Code_client,
       d.titre
FROM dvd d
         JOIN locations l ON l.Num_dvd = d.Num_dvd
         JOIN factures f ON f.Num_facture = l.Num_facture
         JOIN clients c ON c.Code_client = f.Code_client
GROUP BY d.titre,
         c.Code_client
ORDER BY c.Code_client,
         d.titre

/***
 * CORRECTION : Meilleur CLIENT !!
 */
SELECT TOP 1 -- affiche que premier enregitrement (exclu SQL SERVER)
             c.prenom,
             COUNT(*) total
FROM clients c
         JOIN factures f ON f.code_client = c.Code_client
         JOIN locations l ON l.Num_facture = f.Num_facture
GROUP BY c.Code_client,
         c.prenom
ORDER BY total DESC


-- 8. Après vous être ajouté à la table Clients, retrouvez votre code en recherchant le ou les 
--    clients n’ayant effectué aucune location  
DELETE
FROM clients
WHERE nom = 'LIZOT'
  and prenom = 'Renaud';
INSERT INTO clients (Code_client, Titre, Prenom, Nom, Adresse_rue, Code_postal, Ville, Num_telephone, Date_naissance,
                     Enfants)
VALUES ('LIZ001', 'M.', 'Renaud', 'LIZOT', 'Rue du boulevard', '35000', 'Rennes', '0', '16/07/1980', 1);

SELECT *
FROM clients c
WHERE c.Code_client not in (select code_client from factures)

-- v2: meilleure optimisation car une seule requete
SELECT *
FROM clients c
         left join factures f on c.code_client = f.Code_client
where f.Num_facture is null


-- REQUETES ANALYSES CROISEES
-- 1. Nombre de DVD par pays et par genre
SELECT r.pays,
       gf.Signification,
       count(d.titre) as total
FROM dvd d
         JOIN realisateurs r ON d.Code_realisateur = r.Code_realisateur
         JOIN genres_film gf ON gf.Code_genre = d.Code_genre
GROUP BY r.Pays,
         gf.Signification
ORDER BY r.pays,
         gf.Signification


/* correction */
select r.pays,
       gf.Signification,
       count(*)
from realisateurs r
         join dvd d on d.code_realisateur = r.code_realisateur
         join genres_film gf on gf.code_genre = d.Code_genre
group by r.pays,
         gf.Code_genre,
         gf.Signification

-- 2. Nombre de clients par titre et par département (extraction sur le Code_postal)
select c.titre,
       substring(c.code_postal, 1, 2) dept,
       count(*)                       nb
from clients c
group by c.titre,
         substring(c.code_postal, 1, 2)


-- 3. Durée moyenne des films par pays et par genre
select d.code_genre,
       r.pays,
       avg(d.duree)
from dvd d
         join realisateurs r on r.code_realisateur = d.Code_realisateur
group by d.code_genre,
         r.pays


-- PART 5 : REQUETE ACTION
-- 1. Creer table loire atlantique  SELECT INTO FROM
select c.titre, c.nom, c.prenom, datediff(year, c.Date_naissance, getdate()) age
INTO maTable
from clients c
where c.Code_postal like '44%'

-- 2. suppression avec restriction
select *
from maTable

-- pour tester avant executer
begin tran test
    delete from maTable where age > 55
    select * from maTable

-- rollback -- pour annuler transaction
commit

--- MEttre table a jour
UPDATE maTable
SET prenom = 'Pierre'
WHERE...