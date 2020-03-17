
CREATE TABLE STOCKS (
  REFERENCE_ART nvarchar(16) not null,
  DEPOT char(2) not null,
  QTE_STK int,
  STOCK_MINI int DEFAULT 0,
  STOCK_MAXI int,
  CONSTRAINT pk_stocks primary key (reference_art, depot),
  CONSTRAINT fk_stocks_articles FOREIGN KEY (reference_art) REFERENCES ARTICLES(reference_art)
);
go

INSERT INTO STOCKS (REFERENCE_ART, DEPOT, QTE_STK)
  SELECT REFERENCE_ART,'P2',0 FROM ARTICLES;