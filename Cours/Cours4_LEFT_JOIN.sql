CREATE TABLE Pilotes
(
    Id     int primary key identity,
    Nom    varchar(30),
    Prenom varchar(30)
);

CREATE TABLE Bagnoles
(
    Id         int primary key identity,
    Nom        varchar(30),
    Conducteur int references pilotes (id)
);

-- Recuperer qui conduit des voitures 
-- afficher personne qui sont lie a une voiture
-- = on affiche que les relations existantes
select b.nom,
       p.prenom
from bagnoles b
         join pilotes p on p.id = b.conducteur

-- afficher toutes les voitures, meme celles qui n'ont pas de pilotes

-- LEFT JOIN : afficher tous les elements � gauches
-- ex. bagnoles left join pilotes p on p.id = b.conducteur : la table bagnoles est a gauche

/*
Possibilit�s : [ LEFT | RIGHT | FULL ] JOIN

**Notes**: CROSS JOIN existe aussi mais c'est equivalent � `SELECT * from tbl1, tbl2` 
*/

/* TABLE TEMPORAIRE
**Notes**: inserer des data dans une table temporaire `SELECT INTO #tbl1`
select nom, prenom into #TableTemp from Clients
select * from #TableTemp


Duree de vie table temp: disparait � la d�connection
```
*/

