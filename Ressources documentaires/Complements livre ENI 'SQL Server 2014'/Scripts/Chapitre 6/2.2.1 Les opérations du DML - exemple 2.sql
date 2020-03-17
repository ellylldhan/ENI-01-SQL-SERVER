
INSERT INTO CATALOGUES(numero,page)
  SELECT 2, informations
    FROM (SELECT *
          FROM OPENROWSET(BULK 'c:\test\formatxml.xml', SINGLE_BLOB) AS informations)
    AS fichierXML(informations);