/***
 *   # ENI - SQL SERVER
 *   ## Cours Jour 2 - 2019-10-08
 *   ### Les SELECT
 */

-- Quelques fonctions propres à SQL Server
-- docu sur site Microsoft officiel
SELECT GETDATE();
SELECT DATEPART(month, GETDATE());
SELECT MONTH(GETDATE());
SELECT YEAR(GETDATE());
SELECT GETDATE()+3;
SELECT DATEADD(week, 2, GETDATE());
SELECT DATEDIFF(DAY, GETDATE(),'24/12/2019');
SELECT CONVERT(varchar, GETDATE(), 103);


-- ORDRE:
-- from > where > group by > having > select > order by

SELECT *
FROM Employes;

SELECT 
    UPPER(nom) NOM_DE_FAMILLE,  -- alias
    prenom 'prenom d''usage',   -- titre colonne v1
    /*
    ISNULL(dateNaissance, 'NR')  -- fonctionne pas, doit etre du meme type
    */
    ISNULL(CONVERT(varchar,dateNaissance,103), 'NR'),
    Salaire,
    Augmentation = Salaire * 1.1  -- titre colonne v2
FROM Employes;


-- RESTRICTIONS
SELECT 
	*
FROM 
	Employes
WHERE
(   CodeService = 'INFOR'
OR  CodeService = 'DIRGE'
OR  CodeService in ('INFOR', 'DIRGE') 
)
AND nom LIKE 'H%'


-- Ecriture indentée du prof
SELECT 
    *
FROM 
    Employes
WHERE
    (
        CodeService = 'INFOR'
        OR  
        CodeService = 'DIRGE'
        OR  
        CodeService in ('INFOR', 'DIRGE')
    )
    AND 
    nom LIKE 'H%'


-- AGGREGATION
SELECT COUNT(*) FROM Employes;    -- nombre de records
/* Note: compte tout ce qui n'est PAS NULL */

SELECT 
	COUNT(dateNaissance),
	COUNT(*),
	SUM(Salaire),
	AVG(Salaire),
	MAX(Salaire),
	MIN(Salaire)
FROM 
	Employes;


-- REGROUPEMENT
SELECT
	CodeService,
	COUNT(*)
FROM 
	Employes
GROUP BY 
	CodeService;

/* Output:
------+------
code  | count
------+------
INFOR | 3
DIRGE | 5
------+------
*/

/* Note REGROUPEMENT:  si je regroupe, je veux des infos de groupe */



-- SUPPRIMER DES DOUBLONS D'UN RESULTAT
SELECT * FROM Employes; 


/*** 
 * Je veux afficher que les code service 
 * Mauvaise pratique : ne jamais utiliser de group by, mais uniquement du DISTINCT
 * Car le group by est lourd a processed pour le moteur
 */
SELECT 
	DISTINCT CodeService
FROM
	Employes;



-- RESTRICTION sur REGROUPEMENT : HAVING
SELECT
	CodeService,
	COUNT(*)
FROM 
	Employes
GROUP BY 
	CodeService
HAVING  -- NE CONNAIT PAS LES count DU SELECT PARCE QUE NE CONNAIT SELECT QU'A LA FIN (voir ordre)
	COUNT(*) > 1;


----- break


--JOINTURE

SELECT
	e.Nom,
	s.Libelle titre
FROM
	Employes e
	JOIN Services s ON e.CodeService = s.CodeService
ORDER BY
	e.Nom ASC,
	titre DESC;


-- => Affiche nom (qui figure dans une table), et titre correspondant (qui figure dans une autre)
--    le tout grace leur point commun, CodeService 








