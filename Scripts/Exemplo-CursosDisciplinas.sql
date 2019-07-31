-- Criar um banco de dados 
CREATE DATABASE T_PSales;

-- Colocar o BD em uso
USE T_PSales;

-- DDL - Data Definition Language

-- Criar a tabela de Cursos

CREATE TABLE Cursos
(
	-- Tipo de dados, pk, fk
	IdCurso		INT PRIMARY KEY IDENTITY
	,Nome		VARCHAR(200) NOT NULL UNIQUE
);

-- Criar tabela de Disciplinas

CREATE TABLE Disciplinas(
	IdDisciplina INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(250) NOT NULL 
	,IdCurso INT FOREIGN KEY REFERENCES Cursos (IdCurso)
);

-- Criar tabela de Alunos

CREATE TABLE Alunos(
	IdAluno INT PRIMARY KEY IDENTITY
	,Nome VARCHAR(200) NOT NULL UNIQUE
);

-- Criar a tabela intermediária de Alunos e Cursos (VINCULAR)

CREATE TABLE CursosAlunos(
	IdCurso	INT FOREIGN KEY REFERENCES Cursos (IdCurso)
	,IdAluno INT FOREIGN KEY REFERENCES Alunos (IdAluno)
);

-- Inserir os registros
-- Inserir algo e algum lugar
-- Insert into nome_tabela (colunas)
INSERT INTO Cursos (Nome) VALUES ('Técnico em Dev. Sistemas');

INSERT INTO Cursos VALUES ('Técnico em Redes');

INSERT INTO Cursos VALUES ('Curso A')
						  ,('Curso B')
						  ,('Curso C')

SELECT IdCurso , Nome FROM Cursos;

SELECT Nome FROM Cursos;

SELECT * FROM Cursos ;

SELECT * FROM Cursos WHERE IdCurso = 1;

-- Técnico em Desenvolvimento de Sistemas

UPDATE Cursos SET Nome = 'Técnico em Desenvolvimento de Sistemas' WHERE IdCurso = 1;

INSERT INTO Disciplinas (Nome,IdCurso) VALUES ('HTML',  1	);

SELECT * FROM Disciplinas;

DELETE FROM Cursos WHERE IdCurso = 5;