
SELECT ville, COUNT(*) 'Nbre Clients'
  FROM CLIENTS WITH (TABLOCK HOLDLOCK)
  GROUP BY ville;