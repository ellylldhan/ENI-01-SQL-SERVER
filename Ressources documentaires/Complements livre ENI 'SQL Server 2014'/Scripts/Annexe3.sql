USE GESCOM
GO
CREATE TABLE ARTICLES(
	REFERENCE_ART nvarchar(16) NOT NULL,
	DESIGNATION_ART nvarchar(200) NULL,
	PRIXHT_ART decimal(10, 2) NULL,
	CODE_CAT int NULL,
	prixttc  AS (prixht_art*(1.196)) PERSISTED,
 CONSTRAINT pk_articles PRIMARY KEY (REFERENCE_ART),
 CONSTRAINT uq_des_prix UNIQUE NONCLUSTERED (
	DESIGNATION_ART ASC,
	PRIXHT_ART ASC)
);
GO
CREATE TABLE CATEGORIES(
	code_cat int IDENTITY(100,1) NOT NULL,
	libelle_cat nvarchar(200) NULL,
 CONSTRAINT pk_categories PRIMARY KEY(code_cat)
);
GO
CREATE TABLE CLIENTS(
	numero int NOT NULL,
	nom nvarchar(30) NOT NULL CONSTRAINT df_nom  DEFAULT ('anonyme'),
	prenom nvarchar(30) NOT NULL,
	adresse nvarchar(80) NULL,
	codepostal char(5) NULL,
	ville nvarchar(30) NULL,
	telephone char(14) NOT NULL,
	CODEREP char(2) NOT NULL,
	ca numeric(10, 2) NULL,
	gps geography NULL,
 CONSTRAINT pk_clients PRIMARY KEY (numero)
) ;
GO
CREATE TABLE COMMANDES(
	numero_cde int IDENTITY(1,1) NOT NULL,
	date_cde date NULL,
	taux_remise numeric(2, 0) NULL,
	numero_cli int NULL,
	etat_cde char(2) NULL,
 CONSTRAINT PK_COMMANDES PRIMARY KEY (numero_cde)
);
GO
GO
CREATE TABLE HISTO_FAC(
	numero_fac int IDENTITY(1000,1) NOT NULL,
	date_fac datetime NULL,
	numero_cde int NULL,
	montantht smallmoney NULL,
	etat_fac char(2) NULL,
	CONSTRAINT pk_histo_fac PRIMARY KEY (numero_fac)
);
GO
CREATE TABLE LIGNES_CDE(
	numero_cde int NOT NULL,
	numero_lig int NOT NULL,
	reference_art nvarchar(16) NOT NULL,
	qte_cde int NULL DEFAULT ((1)),
	CONSTRAINT PK_LIGNES_CDE PRIMARY KEY(numero_cde,numero_lig)
);
GO
CREATE TABLE STOCKS(
	REFERENCE_ART nvarchar(16) NOT NULL,
	DEPOT char(2) NOT NULL,
	QTE_STK int NULL,
	STOCK_MINI int NULL DEFAULT ((0)),
	STOCK_MAXI int NULL,
	CONSTRAINT pk_stocks PRIMARY KEY(REFERENCE_ART,DEPOT)
);
GO
ALTER TABLE ARTICLES  ADD  CONSTRAINT fk_articles_categories FOREIGN KEY(CODE_CAT)
REFERENCES CATEGORIES (code_cat)
ON UPDATE CASCADE;
GO
ALTER TABLE ARTICLES CHECK CONSTRAINT fk_articles_categories;
GO
ALTER TABLE COMMANDES ADD  CONSTRAINT fk_commandes_clients FOREIGN KEY(numero_cli)
REFERENCES CLIENTS(numero);
GO
ALTER TABLE HISTO_FAC ADD  CONSTRAINT FK_HISTO_FAC_COMMANDES FOREIGN KEY(numero_cde)
REFERENCES COMMANDES (numero_cde);
GO
ALTER TABLE LIGNES_CDE ADD  CONSTRAINT FK_LIGNES_CDE_ARTICLES FOREIGN KEY(reference_art)
REFERENCES ARTICLES (REFERENCE_ART);
GO
ALTER TABLE LIGNES_CDE ADD  CONSTRAINT FK_LIGNES_CDE_COMMANDES FOREIGN KEY(numero_cde)
REFERENCES COMMANDES (numero_cde);
GO
ALTER TABLE STOCKS ADD  CONSTRAINT fk_stocks_articles FOREIGN KEY(REFERENCE_ART)
REFERENCES ARTICLES (REFERENCE_ART);
GO
ALTER TABLE ARTICLES ADD  CONSTRAINT ck_articles_prixht CHECK  (prixht_art>=0);
GO
ALTER TABLE CLIENTS ADD  CONSTRAINT ck_clients_codepostal CHECK  
  ((CONVERT(int,codepostal)>=(1000) AND CONVERT(int,codepostal)<=(95999)));
GO
