CREATE DATABASE PESSOA;

USE PESSOA;

-- Questão 2

CREATE TABLE pessoa(
idPessoa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
dtnasc DATE,
profissao VARCHAR(45)
);

CREATE TABLE gasto(
idGasto INT AUTO_INCREMENT,
dataGasto DATE,
valor DECIMAL(10,2),
descricao VARCHAR(50),
fkPessoa INT,              
FOREIGN KEY (fkPessoa) REFERENCES pessoa(idPessoa),
PRIMARY KEY (idGasto, fkPessoa)
);

drop table gasto, pessoa;
INSERT pessoa(nome,dtnasc,profissao) VALUES

('Pedro Afonso', '2000-07-28','Analista de Sistemas'),
('Sonia', '1975-06-07','Enfermeira'),
('Paulo', '1995-12-14','Professor');

INSERT INTO gasto(dataGasto, valor, descricao, fkPessoa) VALUES

('2021-03-13','300.00','luz', 1),
('2021-04-03','120.00','água', 2),
('2022-04-09','75.00','gás', 3),
('2022-05-04','335.00','Mercado', 2),
('2022-05-28','77.00','pizza', 1);

SELECT * FROM pessoa;
SELECT * FROM gasto;
SELECT * FROM pessoa WHERE profissao = 'Professor';
SELECT * FROM pessoa join gasto ON fkPessoa = idPessoa;
SELECT * FROM pessoa JOIN gasto ON fkPessoa = idPessoa WHERE idGasto IN (1,3);
UPDATE gasto SET dataGasto = '2021-09-10' WHERE idGasto = 2;
UPDATE pessoa SET profissao = 'Coordenadora' WHERE idPessoa = 3;
DELETE FROM pessoa WHERE idPessoa = 2;
DELETE FROM gasto WHERE idGasto = 5;