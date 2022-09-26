

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

INSERT INTO pessoa(nome,dtnasc,profissao) VALUES
('Maria Eduarda', '2003-11-28','Analista de Sistemas'),
('Alexandra', '1972-02-03','Enfermeira'),
('Francis', '1985-11-21','Professora');

INSERT INTO gasto(dataGasto,valor,descricao,fkPessoa) VALUES
('2022-09-24','250.00','Passeio no Hopi Hari',1),
('2022-08-09','120.00','Calça na Renner',2),
('2022-03-10','75.00','Pet Shop',3),
('2021-06-15','224.00','Mercado',2),
('2022-01-03','25.00','Mc Donalts',1);


SELECT * FROM pessoa;
SELECT * FROM gasto;
SELECT * FROM pessoa WHERE profissao = 'Professora';
SELECT * FROM pessoa join gasto ON fkPessoa = idPessoa;
SELECT * FROM pessoa JOIN gasto ON fkPessoa = idPessoa WHERE idGasto IN (1,3);
UPDATE gasto SET dataGasto = '2022-09-10' WHERE idGasto =2;
UPDATE pessoa SET profissao = 'Coordenadora' WHERE idPessoa = 3;
DELETE FROM pessoa WHERE idPessoa = 2;
DELETE FROM gasto WHERE idGasto = 5;