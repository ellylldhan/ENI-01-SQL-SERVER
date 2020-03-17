# Speed Recap 1
## En Vrac 1
### Auto incrementation : IDENTITY
<pre>
CREATE TABLE Employes
(
	CodeEmp int PRIMARY KEY <b>IDENTITY</b>,   -- auto incrementation
	...
</pre>


### DEFAULT + GETDATE()
<pre>
CREATE TABLE Employes
(
	DateEmbauche datetime NOT NULL <b>DEFAULT GETDATE()</b>,
	...
</pre>

### DROP TABLE, IF EXISTS, FK, PK Composite, NUMERIC type
<pre>
DROP TABLE IF EXISTS Conges;
CREATE TABLE Conges
(
	CodeEmp int <b>REFERENCES Employes(CodeEmp)</b>,
	Annee <b>numeric(4,0)</b>,
	NbJoursAcquis numeric(2,0),
	<b>CONSTRAINT PK_Conges PRIMARY KEY(CodeEmp, Annee)</b> <i>-- 1 pk avec 2 elements</i>
);
</pre>
* `col type REFERENCES other_table(other_PK)` : definition de FK
* `numeric(total_chiffre,précision)` : ex. numeric(4,2) est 4 chiffres significatifs et 2 décimales
* `CONSTRAINT PK_table PRIMARY KEY(col1, col2)` : PK composite à 2 éléments, en contrainte de table.


## FK en contrainte de table
<pre>
CREATE TABLE Employes (
    ...
    CONSTRAINT FK_CongesMens_Conges 
	FOREIGN KEY(CodeEmp, Annee) 
	REFERENCES Conges(CodeEmp,Annee)
);
</pre>

### Les FONCTIONS de DATE
<pre>
SELECT GETDATE();
SELECT DATEPART(month, GETDATE());  <i>-- isole une partie de la date, ici le mois</i>
SELECT MONTH(GETDATE());
SELECT YEAR(GETDATE());
SELECT GETDATE()+3;
SELECT DATEADD(week, 2, GETDATE());
SELECT DATEDIFF(DAY, GETDATE(),'24/12/2019'); <i>-- datediff(unit, start, end)</i>
SELECT CONVERT(varchar, GETDATE(), 103);
</pre>


### ORDRE D'EXECUTION : from > where > group by > having > select > order by
<blockquote class='warning'>
<b>
FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
</b>
</blockquote>

### Alias, titre col, ISNULL(), CONVERT(), UPPER()
<b> + operation sur colonne (rare) </b>
<pre>
SELECT 
    UPPER(nom) NOM_DE_FAMILLE,  <i>-- alias</i>
    prenom 'prenom d''usage',   <i>-- titre colonne v1</i>
  <i>/* ISNULL(dateNaissance, 'NR') : fonctionne pas, doit etre du meme type */</i>
    ISNULL(CONVERT(varchar,dateNaissance,103), 'NR'),
    Salaire,
    Augmentation = Salaire * 1.1  <i>-- titre colonne v2</i>
FROM Employes;
</pre>

**Note**: Pas besoin de `AS` pour la definition d'alias.

### Restriction, col IN ('re', 'no'), LIKE

<pre>
SELECT * FROM Employes
WHERE
    (   
        CodeService = 'INFOR'
        OR CodeService = 'DIRGE'
        OR CodeService in ('INFOR', 'DIRGE') 
    ) AND nom LIKE 'H%'
</pre>

***Note**: L'indentation est faussée pour les besoins de l'impression.*

### LES FONCTIONS D'AGGREGATION DISPONIBLES

<pre>
SELECT COUNT(*) FROM Employes;    <i>-- compte tout ce qui n'est PAS NULL</i>

SELECT 
	COUNT(dateNaissance),
	COUNT(*),
	SUM(Salaire),
	AVG(Salaire),
	MAX(Salaire),
	MIN(Salaire)
FROM 
	Employes;
</pre>

### REGROUPEMENT
<pre>
SELECT CodeService, COUNT(*)
FROM   Employes
GROUP BY 
    CodeService;


=> Output:
  code  | count
  ------+------
  INFOR | 3
  DIRGE | 5
 
</pre>

**Note REGROUPEMENT**:  si je regroupe, je veux des infos de groupe.

### DISTINCT : Supprimer des DOUBLONS d'un résultat (SQL SERVER)
* Je veux afficher que les code service 
* <font color='red'>Mauvaise pratique</font> : ne jamais utiliser de GROUP BY, mais uniquement du **DISTINCT**
* Car le GROUP BY est lourd a processed pour le moteur

<pre>
SELECT 	<b>DISTINCT</b> CodeService   <i>-- syntaxe originale</i>
FROM 	Employes;
</pre>

### HAVING : RESTRICTION sur REGROUPEMENT
<pre>
SELECT
	CodeService,
	COUNT(*)
FROM 
	Employes
GROUP BY 
	CodeService
HAVING 
	COUNT(*) > 1;
</pre>
**Note**:  HAVING ne connait pas les COUNT du SELECT parce que celui-ci ne sera connu qu'à la fin de la transaction (voir ordre).

<div style="border:2px solid red;padding:5px 5px;color:red;width:65%;font-weight:bold;border-radius:15px;">
Ordre d'exécution:
<b>FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY</b>
</div>


### JOINTURE
<pre>
SELECT
	e.Nom, 
	s.Libelle titre
FROM
	Employes e
	JOIN Services s ON e.CodeService = s.CodeService
ORDER BY
	e.Nom ASC, titre DESC;
</pre>
=> Affiche nom (qui figure dans une table), et titre correspondant (qui figure dans une autre) le tout grace leur point commun, CodeService 

### ( WHERE ... GROUP BY ) vs. ( GROUP BY ... HAVING )
<div style="border:2px solid red;padding:5px 5px;color:red;width:65%;font-weight:bold;border-radius:15px;">
Ordre d'exécution:
<b>FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY</b>
</div>

Différence entre `WHERE ... GROUP BY` et `GROUP BY ... HAVING` :
- `where` fait des restrictions sur le résultat général 
- `having`fait des restrictions sur des infos de regroupement, des aggregations.

### Equivalent SHOW DATABASE (MySQL) en SQL SERVER
<pre>
SELECT name, database_id, create_date FROM sys.databases;
</pre>
=> noms des bdd présentes et leur date de création.

### Equivalent de DESC (alias DESCRIBE en MySQL) en SQL SERVER
<pre>
exec sp_columns maTable
</pre>
C'est bien une requête SQL... Pour voir le schéma d'une table.




<link href="https://fonts.googleapis.com/css?family=Ubuntu+Mono&display=swap" rel="stylesheet">

<style>
* {
    font-size: 12px;
    font-family: 'Ubuntu';
    line-height: 1.3em;
}

th {
    font-weight: normal;
    background: none
}

blockquote.note {
    border-left: thick solid green;
    color: black;
}

blockquote.important {
    border-left: thick solid orange;
    color: black;
}

blockquote.warning {
    border-left: thick solid red;
    color: black;
}

pre { 
    font-family: "Ubuntu Mono", "Lucida Console", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, serif;
    border: solid 1px; 
    border-radius: .7em;
    padding: 5px 10px 10px;
    width: 66%;
    margin-top: 0;
    font-size: 1.1em;
}

h2 {
    font-size: 1.2em;
    font-weight: normal;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    line-height: 1em;
    margin-top: 2em;
    margin-bottom: 0;
}

hr {
    -webkit-box-shadow: 2px 2px 3px #ccc;
    -moz-box-shadow: 2px 2px 3px #ccc;
    padding: 0;
    padding-bottom: .3em;
    text-shadow: 2px 2px 3px #ccc;
    text-align: left;
    margin-top: .1em;
    margin-bottom: .1em;
    border-bottom-style: ridge;
    border-bottom-color: black;
    border-bottom-width: .1em;
    box-shadow: 2px 2px 3px #ccc;
}

h3 {
    line-height: 2em;
    margin-top: 1.2em;
    margin-bottom: 1.2em;
    border-bottom-style:dashed;
    border-bottom-width: .09em;
    font-size: 1.1em;
    color: #acac1a;
}

h1 {
    margin-bottom: 1px;
}

.comment {
    font-style: italic;
    color: green;
    font-size: 1.1em;
    font-family: "Ubuntu Mono", "Lucida Console", "Liberation Mono", "DejaVu Sans Mono", "Bitstream Vera Sans Mono", "Courier New", monospace, sans-serif;
}

.italic {
    font-style: italic;
    font-size: inherit;
}

.bold {
    font-weight: bold;
    font-size: inherit;
}

</style>




