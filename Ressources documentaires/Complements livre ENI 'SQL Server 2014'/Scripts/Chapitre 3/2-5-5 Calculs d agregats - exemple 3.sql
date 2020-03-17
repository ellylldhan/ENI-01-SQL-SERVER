
SELECT Département =SUBSTRING(codepostal,1,2)
	FROM CLIENTS
	GROUP BY SUBSTRING(codepostal,1,2)
	HAVING COUNT(*)>=2;