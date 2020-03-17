ALTER TABLE ARTICLES
  ADD CONSTRAINT ck_articles_prixht
  CHECK (prixht_art>=0);
