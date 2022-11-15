

-- Questão 1

CREATE DATABASE pet;

USE pet;

CREATE TABLE pet(
idpet INT PRIMARY KEY AUTO_INCREMENT,
animal VARCHAR(45),
nome VARCHAR(45),
raça VARCHAR(30),
datanasc DATE, 
fkcliente INT,
 FOREIGN KEY (fkcliente) REFERENCES cliente(idcliente))
AUTO_INCREMENT = 101

CREATE TABLE cliente(
idcliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
sobrenome VARCHAR(45),
telefone_fixo CHAR(10),
telefone_celular CHAR(11),
endereço VARCHAR(70) 
);

INSERT INTO pet(animal, nome, raça, datanasc, fkcliente) VALUES 

('Cachorro','Rex', 'Doberman', '2017-08-22', 1),
('Gato', 'Pedro', 'Siamês', '2020-05-10', 2),
('Cachorro', 'Boby', 'Buldog', '2010-11-03', 3);

INSERT INTO cliente(nome, sobrenome, telefone_fixo, telefone_celular, endereço) VALUES 

('Pedro', 'Marcato', '1147484544', '11989545870', 'Rua travessa cachoeira benfica'),
('Mayara', 'Souza', '1156499087', '11989997652', 'Rua morro das pedras'),
('Alice', 'Marcato', '1177869556', '11946813210', 'Rua Afonso lobo');

SELECT * FROM pet;
SELECT * FROM cliente;
SELECT * FROM pet join cliente on fkcliente = idcliente;
ALTER TABLE cliente MODIFY nome VARCHAR(50);
SELECT * FROM pet WHERE idpet IN (101, 103);
SELECT nome, datanasc FROM pet;
SELECT * FROM pet ORDER BY nome ASC;
SELECT * FROM cliente ORDER BY endereço DESC;
SELECT * FROM pet WHERE nome LIKE 'B%';
SELECT * FROM cliente WHERE idcliente IN (1,3);
UPDATE cliente SET telefone_fixo = 1190354627 WHERE idcliente = 2;
SELECT * FROM cliente;
SELECT pet.*, cliente.* FROM pet JOIN cliente ON fkcliente = idcliente;
SELECT * FROM pet JOIN cliente ON fkcliente = idcliente WHERE idpet = 103;
SELECT * FROM pet WHERE idpet = 103;
SELECT * FROM pet;
DROP TABLE pet;
DROP TABLE cliente;

