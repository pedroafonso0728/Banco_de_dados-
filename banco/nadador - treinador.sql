
-- Questão 4

CREATE DATABASE treinador;

USE Treinador;

CREATE TABLE nadador(
idNadador INT,
nome VARCHAR(45),
estado VARCHAR(70),
dataNasc DATE,
fktreinador INT,
FOREIGN KEY (fktreinador) REFERENCES treinador(idtreinador)
) AUTO_INCREMENT = 100;

CREATE TABLE treinador(
idtreinador INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
telefone VARCHAR(11),
email VARCHAR(70),
fktreinadorExp INT,
FOREIGN KEY (fktreinadorExp) REFERENCES treinador(idtreinador)
)AUTO_INCREMENT = 10;

DROP TABLE nadador, treinador;


INSERT INTO nadador(nome, estado, datanasc, fktreinador) VALUES 

('Pedro', 'São Paulo', '2000-07-28', 10),
('Math', 'Rio de janeiro', '2001-05-31',11),
('Daniel', 'São Paulo', '2002-07-05', 12),
('Barbara', 'Babia', '2004-01-10',13),
('Ryan', 'São Paulo', '1988-07-03',14),
('Sonia', 'Minas gerais', '1997-02-09', 15),
('Simone', 'Paraná', '2000-12-09', 10),
('Clara', 'Goiás', '2003-08-13', 11),
('Gomes', 'Mato grosso', '2008-10-22', 12),
('Eduardo', 'Santa catarina', '2000-11-02' ,13),
('Guilherme', 'Pará', '2001-01-01' ,14),
('Selma', 'São paulo', '1994-09-10' ,15);


INSERT INTO treinador(nome, telefone, email, fktreinadorExp) VALUES 

('Felipe', '11989545870', 'pedro.dornelas@gmail.com', NULL),
('Maria', '11945444741', 'maria.fatima@gmail.com', NULL),
('Matheus', '11995087434', 'matheus.ribeiro@gmail.com', NULL),
('Vinicios', '11937610922', 'vinicios.garcia@gmail.com', NULL),
('Antonio', '11966765432', 'antonio.carlos@gmail.com', NULL),
('Vera', '11923478654', 'vera.lucia@gmail.com', NULL);


UPDATE treinador SET fktreinadorExp = 10 WHERE idtreinador = 11;
UPDATE treinador SET fktreinadorExp = 10 WHERE idtreinador = 13;
UPDATE treinador SET fktreinadorExp = 12 WHERE idtreinador = 14;
UPDATE treinador SET fktreinadorExp = 12 WHERE idtreinador = 15;
SELECT * FROM treinador;
SELECT * FROM nadador;

-- g) Exibir os dados dos treinadores e os dados de seus respectivos nadadores.
SELECT * FROM treinador JOIN nadador ON fktreinador = idtreinador;

-- h) Exibir os dados de um determinado treinador (informar o nome do treinador na 
-- consulta) e os dados de seus respectivos nadadores.
SELECT* FROM treinador JOIN nadador ON fktreinador = idtreinador WHERE treinador.nome = 'Maria'; 

-- i) Exibir os dados dos treinadores e os dados dos respectivos treinadores 
-- orientadores.
SELECT * FROM treinador AS exp JOIN treinador AS nov ON exp.fktreinadorExp = nov.idtreinador;

-- j) Exibir os dados dos treinadores e os dados dos respectivos treinadores
-- orientadores, porém somente de um determinado treinador orientador (informar o 
-- nome do treinador na consulta).
SELECT * FROM treinador AS exp JOIN treinador AS nov ON nov.fktreinadorExp = exp.idtreinador WHERE exp.nome = 'Felipe';

-- l) Exibir os dados dos treinadores, os dados dos respectivos nadadores e os dados 
-- dos respectivos treinadores orientadores.
SELECT * FROM treinador AS exp 
JOIN
 treinador AS nov ON nov.fktreinadorExp = exp.idtreinador
 JOIN
 nadador AS nad ON nad.fktreinador = nov.idtreinador;
 
-- m) Exibir os dados de um treinador (informar o seu nome na consulta), os dados dos 
-- respectivos nadadores e os dados do seu treinador orientador. 
SELECT * FROM treinador AS exp 
JOIN
treinador AS nov ON nov.fktreinadorExp = exp.idtreinador
JOIN
nadador AS nad ON nad.fktreinador = nov.idtreinador WHERE nov.nome = 'Vera';














