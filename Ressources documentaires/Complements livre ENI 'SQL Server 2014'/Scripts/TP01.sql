CREATE DATABASE GestSalles 
ON PRIMARY (
 name=GestSalles_ppal,
 filename='c:\donnees\gestsalles_ppal.mdf ',
 size=20Mb,
 maxsize=50Mb,
 filegrowth=5Mb
)LOG ON(
 name=GestSalles_log,
 filename='c:\donnees\gestsalles_log.ldf ',
 size=5Mb,
 maxsize=20Mb,
 filegrowth=2Mb
);