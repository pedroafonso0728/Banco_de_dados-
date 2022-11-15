create database sprint3;
use sprint3;

create table aluno(
ra CHAR(8) PRIMARY KEY,
nome VARCHAR(45)
);

CREATE TABLE curso(
idCurso INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
coordenador VARCHAR(45)
);

CREATE TABLE matricula(
idMatricula INT AUTO_INCREMENT,
fkRa CHAR(8),
FOREIGN KEY (fkRa) REFERENCES aluno(ra),
fkCurso INT,
FOREIGN KEY (fkCurso) REFERENCES curso(idCurso),
nivel CHAR(2),
media DECIMAL(4,2),
PRIMARY KEY (idMatricula, fkRa, fkCurso)
);

alter table matricula add dtMatricula date;
INSERT INTO aluno VALUES 

('20220001', 'Vivian'), 
('20220002', 'Paulo'),
('20220003', 'Pedro');

INSERT INTO curso VALUES 

(NULL, 'Inglês', 'Fernanda'),
(NULL, 'Francês', 'Marise'),
(NULL, 'Japonês', 'Célia');

INSERT INTO matricula VALUES 

(NULL, '20220001', 1 , 'B1', 4, '2021-10-19'),
(NULL, '20220001', 1, 'B2', 7, '2022-10-19'),
(NULL, '20220001', 2, 'A3', 9, '2022-10-19'),
(NULL, '20220001', 2, 'M2', 8, '2022-10-19');

SELECT * FROM matricula;
SELECT a.*, c.*, m.* FROM aluno a JOIN matricula m ON a.ra = m.fkRa JOIN curso c ON c.idCurso = m.fkCurso; 
-- left tem que ser nos dois joins 
SELECT a.*, c.*, m.* FROM aluno a LEFT JOIN matricula m ON a.ra = m.fkRa LEFT JOIN curso c ON c.idCurso = m.fkCurso; 






