CREATE DATABASE T_DPS

USE T_DPS

BEGIN -- Criar tabelas

CREATE TABLE Departamentos (
	IdDepartamento INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Habilidades(
	IdHabilidade INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Funcionarios(
	IdFuncionario INT PRIMARY KEY IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	IdDepartamento INT FOREIGN KEY REFERENCES Departamentos (IdDepartamento),
	Salario MONEY
);

CREATE TABLE HabilidadesFuncionarios (
	IdFuncionario INT FOREIGN KEY REFERENCES Funcionarios (IdFuncionario),
	IdHabilidade INT FOREIGN KEY REFERENCES Habilidades (IdHabilidade)
);

END

BEGIN -- Inserir dados

INSERT INTO Habilidades VALUES('Empatia'), ('Liderança'),('Comunicativo')
INSERT INTO Departamentos VALUES ('RH'), ('Administrativo')
INSERT INTO Funcionarios VALUES ('Gabriel',1,2500),('SeiNão',1,2500),('NãoSei',1,2500),('Jean',1,4500),('Victor',2,5500)
INSERT INTO HabilidadesFuncionarios VALUES (1,2),(5,1),(3,3)

END

BEGIN -- Alterar Salarios 

UPDATE Funcionarios SET Salario *= 2 WHERE IdFuncionario = 1 
UPDATE Funcionarios SET Salario /=5  WHERE Nome = 'Victor'
END

BEGIN -- Selects
SELECT * FROM Funcionarios
SELECT * FROM Habilidades
SELECT * FROM Departamentos
SELECT Funcionarios.Nome, Funcionarios.Salario, Departamentos.Nome AS Departamento FROM Funcionarios JOIN Departamentos ON Funcionarios.IdDepartamento = Departamentos.IdDepartamento;

END

BEGIN -- Extras

ALTER TABLE Funcionarios ADD Funcao VARCHAR(100)
ALTER TABLE Habilidades ADD Descricao VARCHAR(100)
SELECT * FROM Funcionarios JOIN HabilidadesFuncionarios ON Funcionarios.IdFuncionario = HabilidadesFuncionarios.IdFuncionario JOIN Habilidades ON Habilidades.IdHabilidade = HabilidadesFuncionarios.IdHabilidade  

END

