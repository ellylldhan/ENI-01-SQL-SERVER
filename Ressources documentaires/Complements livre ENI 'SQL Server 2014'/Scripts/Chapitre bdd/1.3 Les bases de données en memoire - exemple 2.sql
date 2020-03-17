
CREATE TABLE Journal(
  id int identity (1,1) CONSTRAINT pk_journal PRIMARY KEY NONCLUSTERED,
  le datetime,
  detail nvarchar(500)
  ) WITH (MEMORY_OPTIMIZED=ON);
