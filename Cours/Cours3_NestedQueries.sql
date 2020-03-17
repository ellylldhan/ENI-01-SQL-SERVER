-- Cours 3
-- Ordre d'execution : FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY
 
-- Les REQUETES IMBRIQUEES
-- Requete dans WHERE : Requete Imbriquée (Nested Request)
Select 
	*
FROM
	Employes
WHERE 
	salaire > ( Select AVG(salaire) from employes );


-- Ex. 2
SELECT 
	Salaire,
	( SELECT AVG(Salaire) FROM Employes )
FROM
	Employes;

-- Ex. 3: Obtenir liste des salaries
-- 1. liste des services ou ya des salaries
select CodeServices From Employes;


-- 2. Elimination avec NOT IN mais avec code services codes en dur
SELECT * FROM Employes WHERE CodeServices NOT IN ('DIRGE', 'INFOR', 'RESHU');


-- 2b. la meme mais avec sodeServices en mou
SELECT 
	* 
FROM 
	Employes 
WHERE 
	CodeServices NOT IN (select distinct CodeServices From Employes);


-- Les REQUETES CORRELLEES
-- Qd requete1 est referencee � l'interieur de requete2 (qui elle-meme est dans requete1)
-- s'executent autant de fois qu'il y a de resultat
-- donc temps d'execution long

-- Ex. liste des employes qui ont un salaire sup au salaire moy de leur propre service
SELECT 
	* 
FROM 
	Employes em
WHERE 
	Salaire > (
		SELECT AVG(em2.Salaire) 
		FROM Employes em2 
		WHERE em2.CodeService = em.CodeService ); 