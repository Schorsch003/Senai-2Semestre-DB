CREATE DATABASE T_Livros

USE T_Livros

CREATE TABLE Generos(
	IdGenero INT PRIMARY KEY IDENTITY,
	Descricao VARCHAR(200) NOT NULL
);


CREATE TABLE Autores (
	IdAutor INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) NOT NULL,
	Ativo BIT,
	DataNascimento DATE NOT NULL 
);

CREATE TABLE Livros(
	IdLivro INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(200) NOT NULL,
	IdAutor INT FOREIGN KEY REFERENCES Autores(IdAutor),
	IdGenero INT FOREIGN KEY REFERENCES Generos(IdGenero)
)

ALTER TABLE Autores ADD Email VARCHAR(200) NOT NULL



INSERT INTO Generos VALUES ('Ação'), ('Aventura'), ('Romance')
INSERT INTO Autores VALUES ('João',1,'01-01-1602','joao@teste.com')
INSERT INTO Autores VALUES ('Jean',1,'07-03-90', 'jean@teste.com'), ('Gabriel',1,'20-03-2003','gabriel@teste.com'),('Victor',0,'24-03-2000','victor@teste.com')

SELECT * FROM Generos
SELECT * FROM Autores
SELECT * FROM Livros

INSERT INTO Livros VALUES ('Sei lá',3,1,'Eu não sei oq eu tô fazendo','01-01-0001',0)
INSERT INTO Livros VALUES ('Isso aí',5,2,'Não contrarie oq tá lá', '02-02-0002',1)
INSERT INTO Livros VALUES ('Isso aí',5,2,'Não contrarie oq tá lá', '02-02-0002',1)
INSERT INTO Autores VALUES('Miguel de Cervantes', 0,'29-07-1547', 'miguelcervantes@teste.com')
INSERT INTO Livros VALUES ('Dom Quixote',6,2, 'Um clássico', '05-05-1605',1)

SELECT Livros.IdLivro, Livros.Nome, Autores.Nome AS Autor FROM Livros JOIN Autores ON Livros.IdAutor = Autores.IdAutor

SELECT Livros.IdLivro, Livros.Nome, Generos.Descricao AS Genero FROM Livros JOIN Generos ON Livros.IdGenero = Generos.IdGenero

SELECT L.IdLivro, L.Nome, G.Descricao, L.Sinopse, FORMAT(L.DataLancamento, 'dd/MM/yyyy') AS DataLancamento,
A.Nome AS Autor, FORMAT(A.DataNascimento, 'dd/MM/yyyy') AS DataNascimento, A.Ativo 
FROM Livros AS L INNER JOIN Autores AS A ON L.IdAutor = A.IdAutor INNER JOIN Generos AS G ON L.IdGenero = G.IdGenero

DELETE FROM Livros WHERE IdLivro = (SELECT MAX(Livros.IdLivro) FROM Livros)

UPDATE Livros SET Nome= UPPER(Nome)

UPDATE Livros SET Nome = LOWER(Nome)

ALTER TABLE Livros ADD Sinopse VARCHAR(300)
ALTER TABLE Livros ADD DataLancamento DATE
ALTER TABLE Livros ADD Veiculado BIT