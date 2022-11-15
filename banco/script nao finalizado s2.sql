CREATE DATABASE GODsprint2;

USE GODsprint2;

CREATE TABLE empresa(
idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
cnpj VARCHAR(30),
data_cadastro DATE,
nome_fantasia VARCHAR(60),
representante VARCHAR(45),
fkMatriz INT,
FOREIGN KEY (fkMatriz) REFERENCES empresa(idEmpresa)
);


CREATE TABLE usuario(
idFunc INT AUTO_INCREMENT,
nome VARCHAR(80),
setor VARCHAR(45),
login VARCHAR(100),
senha VARCHAR(10),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(iKEmpresa),
PRIMARY KEY (idFunc, fkEmpresa)
);


CREATE TABLE endereco(
idEndereco INT PRIMARY KEY AUTO_INCREMENT,
logradouro VARCHAR(70),
estado VARCHAR(60),
cidade VARCHAR(60),
sigla VARCHAR(2),
bairro VARCHAR(70), 
numero VARCHAR(20),
complemento VARCHAR(40),
cep CHAR(8),
fkVinicola INT,
FOREIGN KEY (fkVinicola) REFERENCES vinicola(idVinicola)
);


CREATE TABLE vinicola(
idVinicola INT AUTO_INCREMENT,
nome VARCHAR(60),
fkEmpresa INT,
fkEndereco INT,
FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
PRIMARY KEY (idVinicola, fkempresa)
);


CREATE TABLE armazem(
idArmazen INT AUTO_INCREMENT,
nome VARCHAR(45),
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
fkVinicola INT,
FOREIGN KEY (fkVinicola) REFERENCES vinicola(idVinicola),
PRIMARY KEY (idArmazem, fkEmpresa, fkVinicola)
);


CREATE TABLE sensor(
idSensor INT AUTO_INCREMENT,
nome_sensor VARCHAR(60),
local_sensor VARCHAR(60),
temperatura_max FLOAT,
temperatura_min FLOAT,
umidade_max FLOAT,
umidade_min FLOAT,
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
fkVinicola INT,
FOREIGN KEY (fkVinicola) REFERENCES vinicola(idVinicola),
fkArmazen INT,
FOREIGN KEY (fkAemazem) REFERENCES armazem(idArmazem),
PRIMARY KEY (idSensor, fkEmpresa, fkVinicola, fkArmazem)
);


CREATE TABLE dados_sensor(
idDados_sensor INT AUTO_INCREMENT,
temperatura FLOAT,
umidade FLOAT,
dataTime DATETIME,
fkEmpresa INT,
FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
fkVinicola INT,
FOREIGN KEY (fkVinicola) REFERENCES vinicola(idVinicola),
fkArmazem INT,
FOREIGN KEY (fkArmazem) REFERENCES armazem(idArmazem),
fkSensor INT,
FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor),
PRIMARY KEY (idDados_sensor, fkEmpresa, fkVinicola, fkArmazem, fkSensor)
);

 INSERT INTO empresa(nome_empresa, cnpj, data_cadastro, nome_fantasia, representante, email, senha, fkMatriz) VALUES

('Chadon brasil','77.637.658/0001-55','2022-08-12', '', '', 'chadon.brasil@gmail.com', 'chadonBR@', ''),
('Wine','47.877.611/0001-05','2022-08-12', '', '', 'wine.vinhos@gmail.com', 'wine552', ''),
('Adegavinhos','58.997.155/0001-99','2005-10-10', '', '', 'adega.vinhos@gmail.com', 'adegavinhos123@', ''),
('Vinhedo','03.987.156/0003-10','2012-08-07', '', '', 'vinhedo.wine@gmail.com', 'vinhedo_37', ''),
('Anjos_roxo','88.017.100/0001-01','2015-11-03', '', '', 'anjos.roxo@gmail.com', 'anjosroxo.51', ''),
('Vinhado','09.088.900/0006-08','2011-08-09', '', '', '', 'vinhado.vinhos@gmail.com', 'vinhado666'),
('Vinicolas enzo','01.002.100/0031-01','2015-06-03', '', '', 'enzo.vinhos@gmail.com', 'enzovinhos@', ''),
('Central vinho','69.008.980/0011-01','2015-12-01', '', '', 'central.vinho@gmail.com', 'centralwine135', ''),
('Tintos','55.994.022/0001-08','2000-05-19', '', '', '', 'vinho.tontos@gmail.com', 'tintos_766'),
('Bom vinho', '77.668.005/0009-06', '2001-07-10', '', '', 'bom.vinho@gmail.com', 'vinhobom.777', '');
 
 INSERT funcionario(nome_func, setor_func, login_func, senha_func, fkEmpresa) VALUES
 
('Maria Eduarda Bernardino Ettinger','Financeiro','maria.ettinger@godwine.com','1222000', ''),
('Vinicios Garcia Fagundes','Administrativo','vinicios.garcia@godwine.com','1222001', ''),
('Matheus Martins','Marketing','matheus.martins@godwine.com','1222002', ''),
('Pedro Afonso','Contavel','pedro.afonso@godwine.com','1222003', ''),
('Gabriel Vilas Boas','Gerente','gabriel.vilas@godwine.com','1222004', ''),
('Alexandra Zangrando','Recursos Humanos','alexandra.bernardino@godwine.com','1222005', ''),
('Wagner Oliveira','Suporte Tecnico','wagner.oliveira@godwine.com','1222006', ''),
('Elisa Ribas','Agricultura','elisa.ribas@godwine.com','1222007', ''),
('Felipe de Sousa','Abastecimento','felipe.sousa@godwine.com','1222008', ''),
('Eduardo Damacedo','Pecuária','eduardo.damacedo2godwine.com','1222009', '');
 
 INSERT INTO endereco(logradouro, estado, cidade, sigla, bairro, numero, complemento, cep, fkVinicola) VALUES
 
('Travessa cachoeira benfica', 'São Paulo', 'São Paulo', 'SP', 'Jardim Rodolfo Pirane', '150', '', '08311-380', ''),
('Alameda cruz', 'São Paulo', 'Guararea', 'SP', 'Cunha souza', '301', '', '03447-001', ''),
('Rua do Afonso', 'São Paulo', 'Osasco', 'SP', 'Jururu', '1004', '', '0777-520', ''),
('Travessa do chico', 'São Paulo', 'Santo André', 'SP', 'Vila mariana', '500', '', '08400-100', ''),
('Rua chico chavier', 'São Paulo', 'São José dos campos', 'SP', 'Afonso lazaro', '2500', '', '01222-031', ''),
('Avenida dos bandeirantes', 'São Paulo', 'São Bernardo do campo', 'SP', 'Morro das pedras', '501', '', '01222-762', ''),
('Rua tarsizo Amaral', 'Santa Catarina', 'Florianópolis', 'SC', 'campo nobre', '10', '', '03501-033', ''),
('Travessa liberato', 'Minas Gerais', 'Belo horizonte', 'MG', '', '69', 'bairro do queijo', '07515-400', ''),
('Rua do trigo', 'Rio de janeiro', 'Niterói', 'RJ', 'Bairro roxo', '1033', '', '31771-305', ''),
('Avenida Souza', 'Rio de janeiro', 'Volta redonda', 'RJ', 'Central leste', '369', '', '08531-300', '');

 INSERT INTO vinicula(nome_vinicola, tipo_vinho, ano_vinho, fkEmpresa) VALUES

('Malbec', 'tinto','2000', ''),
('Evino', 'tinto', '1999', ''),
('Vinicola sete', 'tinto', '2005', ''),
('Casal garcia', 'branco', '2013', ''),
('Concha y toro', 'branco', '1991', ''),
('Chileno branco', 'branco', '2009', ''),
('Nordeste branco', 'branco', '2003', ''),
('Garibaldi', 'rose', '1997', ''),
('Casal perinni', 'rose', '1950', ''),
('East rose', 'rose', '1955', '');

 INSERT INTO armazem(tipo_vinho, fkEmpresa, fkVinicola) VALUES 

('Vinho gelado', '', ''),
('Frio', '', ''),
('Temp adega', '', ''),
('Fresco', '', '');

 INSERT INTO sensor(nome_sensor, local_sensor, temperatura_max, temperatura_min, umidade_max, umidade_min, fkEmpresa, fkVinicola, fkArmazem) VALUES

('DHT11', '', '7°C', '3°C', '80%', '60%', '', '', ''),
('DHT11', '', '13°C', '7°C', '80%', '60%', '', '', ''),
('DHT11', '', '16°C', '13°C', '80%', '60%', '', '', ''),
('DHT11', '', '20°C', '16°C', '80%', '60%', '', '', '');

 INSERT INTO dados_sensor(temperatura, umidade, dataTime, fkEmpresa, fkVinicola, fkArmazem, fkSensor) VALUES

('6', '60%', '2022-08-15 10:22:55', ''),
('7', '65%', '2022-10-15 10:04:55', ''),
('8', '66%', '2022-01-23 10:49:55', ''),
('9', '70%', '2022-04-04 10:22:55', ''),
('10', '73%', '2022-12-07 10:19:55', ''),
('11', '75%', '2022-06-30 10:47:55', ''),
('12', '80%', '2022-11-02 10:01:55', '');

 

 
 
 