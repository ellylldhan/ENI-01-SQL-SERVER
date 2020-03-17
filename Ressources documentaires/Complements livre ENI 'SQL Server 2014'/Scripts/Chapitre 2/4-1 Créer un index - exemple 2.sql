
CREATE INDEX I_LIGNES_REFART
  ON LIGNES_CDE(reference_art)
  INCLUDE (numero_cde);