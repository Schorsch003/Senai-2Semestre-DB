CREATE DATABASE T_SSTop;

USE T_SStop;

CREATE TABLE EstilosMusicais(
	IdEstiloMusical INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) UNIQUE NOT NULL
);

INSERT INTO EstilosMusicais (Nome) VALUES ('Rock'), ('Pop');
INSERT INTO EstilosMusicais VALUES ('Rock n Roll'), ('Metal'), ('MPB')	
CREATE TABLE Artistas(
	IdArtista INT PRIMARY KEY IDENTITY,
	Nome  VARCHAR(100) NOT NULL UNIQUE,
	IdEstiloMusical INT FOREIGN KEY REFERENCES EstilosMusicais (IdEstiloMusical)
);



INSERT INTO Artistas VALUES ('AC/DC',1), ('Imagine Dragons',1),('KPOP',2),('Madonna',2);
INSERT INTO Artistas VALUES ('Legião Urbana',3),('Metallica',4);

UPDATE Artistas SET IdEstiloMusical = 5 WHERE IdArtista = 6;
UPDATE EstilosMusicais SET Nome = 'Pop' WHERE IdEstiloMusical = 2;

DELETE FROM Artistas WHERE IdEstiloMusical = 4;

--EXEC sp_rename 'EstilosMusicais.Estilo', 'Nome', 'COLUMN';

SELECT Artistas.IdArtista ,Artistas.Nome, EstilosMusicais.Nome AS NomeEstilo FROM EstilosMusicais JOIN Artistas ON EstilosMusicais.IdEstiloMusical = Artistas.IdEstiloMusical ORDER BY Artistas.IdArtista;
SELECT * FROM Artistas ORDER BY IdArtista;