ALTER TABLE ARTICLES
  ADD prixttc as (prixht_art*1.196) PERSISTED;
  
go
ALTER TABLE Articles DROP COLUMN  prixttc;