# Speed Recap 3 - Exemples


## En Vrac 3 - Exemples
### nb articles par gammes
<pre>
select 
	codeGam, 
	count(codeGam) as 'total articles'
from articles 
group by codeGam
</pre>

### JOINTURE
<pre>
SELECT
	a.refart,
	COUNT(*) Total
FROM
	lignesfic lf 
	JOIN articles a ON a.refart = lf.refart
GROUP BY
	a.refart
HAVING 
	count(*) > 2;
</pre>

### UNION : fusion de requete
<pre>
SELECT
	f.noFic, 
	c.nom, c.prenom, 
	a.refart, a.designation,
	lf.depart, lf.retour,
	t.prixJour,
	DATEDIFF(day,lf.depart,lf.retour) * t.prixJour as Montant,
	DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour as Montant2
FROM
	Clients c
	JOIN Fiches f ON c.noCli = f.noCli
	JOIN LignesFic lf ON lf.noFic = f.noFic
	JOIN Articles a ON a.refart = lf.refart
	JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
	JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE
	f.noFic = 1002

UNION

SELECT
	null, null, null, null, null, null, null, null,
	SUM(DATEDIFF(day,lf.depart,lf.retour) * t.prixJour) as Montant,
	SUM(DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour) as Montant2
FROM
	Clients c
	JOIN Fiches f ON c.noCli = f.noCli
	JOIN LignesFic lf ON lf.noFic = f.noFic
	JOIN Articles a ON a.refart = lf.refart
	JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
	JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE
	f.noFic = 1002
ORDER by 
	montant;
</pre>
Bien si on veut un resultat brut mais pas gerable pour recup les data par une appli

### Jointure de sous-requête
<pre>
SELECT
	f.noFic,
	c.nom, c.prenom,
	a.refart, a.designation,
	lf.depart, lf.retour,
	t.prixJour,
	DATEDIFF(day,lf.depart,lf.retour) * t.prixJour as Montant,
	DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour as Montant2,
	tmp.le_montant
FROM
	Clients c
	JOIN Fiches f ON c.noCli = f.noCli
	JOIN LignesFic lf ON lf.noFic = f.noFic
	JOIN Articles a ON a.refart = lf.refart
	JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
	JOIN Tarifs t ON t.codeTarif = gt.codeTarif
	JOIN (
		SELECT
			f.noFic le_numero_de_fiche,
			SUM(DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour) as le_montant
		FROM
			Clients c
			JOIN Fiches f ON c.noCli = f.noCli
			JOIN LignesFic lf ON lf.noFic = f.noFic
			JOIN Articles a ON a.refart = lf.refart
			JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
			JOIN Tarifs t ON t.codeTarif = gt.codeTarif
		WHERE
			f.noFic = 1002
		GROUP BY 
			f.noFic) tmp ON f.noFic = tmp.le_numero_de_fiche
WHERE
	f.noFic = 1002;
</pre>
Meme resultat, requete mieux optimisée

### Sous-requete, sans jointure
<pre>
SELECT
	f.noFic,
	c.nom, c.prenom,
	a.refart, a.designation,
	lf.depart, lf.retour,
	t.prixJour,
	DATEDIFF(day,lf.depart,lf.retour) * t.prixJour as Montant,
	DATEDIFF(day,lf.depart,ISNULL(lf.retour,GETDATE())) * t.prixJour as Montant2
	(
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
FROM
	Clients c
	JOIN Fiches f ON c.noCli = f.noCli
	JOIN LignesFic lf ON lf.noFic = f.noFic
	JOIN Articles a ON a.refart = lf.refart
	JOIN GrilleTarifs gt ON gt.codeGam = a.codeGam AND gt.codeCate = a.codeCate
	JOIN Tarifs t ON t.codeTarif = gt.codeTarif
WHERE
	f.noFic = 1002;
</pre>

### Table Temporaire / Imbriquée (?) + CONVERT
<pre>
SELECT
  AVG(CONVERT(decimal, total)) as Moyenne
FROM
  (
    SELECT 
      lf.noFic, 
      COUNT(*) as total -- nb enregistrements par fiche
    FROM 
      LignesFic lf 
    GROUP BY 
      lf.noFic
  ) <b>tableTotal</b>
</pre>

**Note**: 
- AVG(total) <- Pas bon, reourne un int 
- AVG: retourne moy dans meme type que input (ici int<-int)

### Table imbriquée 2
<pre>
Select 
	AVG(total) 'montant moyen d''une fiche de location'
FROM
(
SELECT 
	lf.nofic,
	SUM((DATEDIFF(day, lf.depart, lf.retour)+1) * t.prixJour) total
FROM
	LignesFic lf
	JOIN Articles a ON a.refart = lf.refart
	JOIN GrilleTarifs gt ON gt.codeCate = a.codeCate AND gt.codeGam = a.codeGam
	JOIN Tarifs t ON gt.codeTarif = t.codeTarif
GROUP BY
	lf.noFic ) total
</pre










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



