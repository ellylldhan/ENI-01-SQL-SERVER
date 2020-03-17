
INSERT INTO CATALOGUES(numero,page)
  SELECT 3, informations
    FROM (SELECT *
          FROM OPENROWSET(BULK 'c:\test\formatxml.xml', SINGLE_BLOB) AS informations)
    AS fichierXML(informations);