
SELECT *
  FROM CLIENTS
  WHERE ville LIKE 'Nantes%'
INTERSECT
SELECT *
  FROM CLIENTS
  WHERE codepostal BETWEEN 44000 and 44999;