ALTER DATABASE GESCOM
MODIFY FILE (
  name=gescom_data,
  size= 20MB);

ALTER DATABASE GESCOM
ADD FILE (
  name=gescom_data2,
  filename='C:\Program Files\Microsoft SQL Server\MSSQL12.LIVRE\MSSQL\DATA\gescom_data2.ndf',
  size=20MB);