CREATE DATABASE T_Moda

USE T_Moda

BEGIN --Iniciar Tabelas

CREATE TABLE Marcas(
	IdMarca INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Cores(
	IdCor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(40) NOT NULL UNIQUE,
);

CREATE TABLE Tamanhos(
	IdTamanho INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(5) NOT NULL UNIQUE
);

CREATE TABLE Camisetas(
	IdCamiseta INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(30) NOT NULL,
	IdMarca INT FOREIGN KEY REFERENCES Marcas (IdMarca)
);

CREATE TABLE CoresCamisetas(
	IdCamiseta INT FOREIGN KEY REFERENCES Camisetas (IdCamiseta),
	IdCor INT FOREIGN KEY REFERENCES Cores (IdCor)
);

CREATE TABLE TamanhosCamisetas(
	IdCamiseta INT FOREIGN KEY REFERENCES Camisetas (IdCamiseta),
	IdTamanho INT FOREIGN KEY REFERENCES Tamanhos (IdTamanho)
);

END

BEGIN -- Inserir valores

INSERT INTO Cores VALUES ('Vermelho'), ('Azul'), ('Preto'), ('Branco')
INSERT INTO Tamanhos VALUES ('P'),('M'),('G'),('GG')
INSERT INTO Marcas VALUES ('Marca 1'), ('Marca 2'), ('Marca 3')
INSERT INTO Camisetas VALUES ('Camiseta 1',2), ('Camiseta 2',3), ('Camiseta 3',1),('Camiseta 4',2),('Camiseta 5',1)
INSERT INTO CoresCamisetas VALUES (1,2),(3,4)
INSERT INTO TamanhosCamisetas VALUES (1,2),(3,4)

END

BEGIN -- Updates e delete
UPDATE Camisetas SET IdMarca = 1 WHERE IdMarca = 2
UPDATE Camisetas SET IdMarca = 2 WHERE IdCamiseta = 2 or IdCamiseta = 3
UPDATE Camisetas SET IdMarca = 3 WHERE IdCamiseta = 5
UPDATE Camisetas SET PodeSerLavada = FLOOR(RAND()*(1-0+1))+0 WHERE IdCamiseta = 5;
UPDATE Tamanhos SET Medidas = '112' WHERE Nome = 'GG'


DELETE FROM Camisetas WHERE IdCamiseta = (SELECT MAX(IdCamiseta) FROM Camisetas);

END

BEGIN -- Selects

SELECT * FROM Camisetas
SELECT * FROM Marcas 
SELECT * FROM Cores
SELECT * FROM Tamanhos
SELECT * FROM Camisetas JOIN Marcas ON Camisetas.IdMarca = Marcas.IdMarca
SELECT C.IdCamiseta, C.Nome, Co.Nome AS Cor FROM CoresCamisetas AS CC JOIN  Camisetas AS C ON C.IdCamiseta =  CC.IdCamiseta  JOIN Cores AS Co ON CC.IdCor = Co.IdCor
SELECT C.IdCamiseta, C.Nome, T.Nome AS Tamanho FROM TamanhosCamisetas AS TC JOIN  Camisetas AS C ON C.IdCamiseta =  TC.IdCamiseta  JOIN Tamanhos AS T ON TC.IdTamanho = T.IdTamanho
SELECT C.IdCamiseta, C.Nome, Co.Nome AS Cor, T.Nome AS Tamanho FROM CoresCamisetas AS CC  JOIN  Camisetas AS C ON C.IdCamiseta =  CC.IdCamiseta  JOIN Cores AS Co ON CC.IdCor = Co.IdCor JOIN TamanhosCamisetas AS TC ON TC.IdCamiseta = C.IdCamiseta JOIN Tamanhos AS T ON T.IdTamanho = TC.IdTamanho

END

BEGIN -- Alter tables

ALTER TABLE Marcas ADD QntdLojas INT 
ALTER TABLE Marcas ADD DataCriação DATE
ALTER TABLE Camisetas ADD PodeSerLavada BIT
ALTER TABLE Tamanhos ADD Medidas VARCHAR(15)

END