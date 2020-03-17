
CREATE TABLE catalogue(
id uniqueidentifier rowguidcol not null,
article nvarchar(16),
image_art varbinary(max) filestream,
CONSTRAINT pk_catalogue PRIMARY KEY(id)
);
