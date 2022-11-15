create database sprint3;
use sprint3;

create table pessoa(
idPessoa int primary key auto_increment,
nome varchar(45),
salario decimal(10,2)
);

create table endereco(
idEndereco int primary key auto_increment,
logradouro varchar(45),
cep char(9),
bairro varchar(45)
);

create table moradia(
fkPessoa int,
foreign key (fkPessoa) references pessoa(idPessoa),
fkEndereco int,
foreign key (fkEndereco) references endereco(idEndereco),
numero int,
complemento varchar(45),
primary key (fkPessoa, fkEndereco)
);

insert into pessoa values 

(null, 'Marcelo', 5.49),
(null, 'Vivian', 4.39),
(null, 'Paulo', 3.79),
(null, 'Rafa', 4.75);

insert into endereco values 

(null, 'Rua Hadook Lobo', '01414-011', 'Cerqueira César'),
(null, 'Av. Pompeia', '05050-000', 'Pompéia'),
(null, 'Rua da ponte', '02675-000', 'Ponte');

insert into moradia values 

(1, 1, 595, '11 Andar'),
(2, 1, 595, '6 Andar'),
(3, 2, 498, 'Casa 5');

select * from pessoa p join moradia m on p.idPessoa = m.fkPessoa join endereco e on e.idEndereco = m.fkendereco;

select * from pessoa p left join moradia m on p.idPessoa = m.fkPessoa left join endereco e on e.idEndereco = m.fkEndereco
where m.fkEndereco is null; 

select * from pessoa p 
right join moradia m on p.idPessoa = m.fkPessoa 
right join endereco e on e.idEndereco = fkEndereco 
where m.fkPessoa is null;

-- super join 
select p.nome, e.bairro from pessoa p 
right join moradia m on p.idPessoa = m.fkPessoa 
right join endereco e on e.idEndereco = fkEndereco 
where m.fkPessoa is null
union
select p.nome, e.bairro from pessoa p 
left join moradia m on p.idPessoa = m.fkPessoa 
left join endereco e on e.idEndereco = m.fkEndereco 
where m.fkEndereco is null; 

-- Funções matematicas 

-- COUNT
select count(*) from pessoa;
select count(salario) from pessoa;

insert into pessoa values 
(null, 'Silvio', null);

-- SUM (SOMA)
select sum(salario) from pessoa;
select * from pessoa;

-- AVG (MEDIA)
select avg(salario) from pessoa;

-- ARREDONDAMENTO NÚMEROS
select round(avg(salario), 2) as media from pessoa;

-- TRUNCATE (IGNORA O ARREDONDAMENTO)
select truncate(avg(salario), 2) from pessoa;

-- MIM E MAX 
select min(salario), max(salario) from pessoa;

-- DISTINCT
insert into pessoa values 
(null, 'Paulo', null);

select nome from pessoa;
select distinct nome from pessoa;
-- Número das pessoas, ignorando as replicas
select count(distinct nome) from pessoa; 

-- GROUP BY
select e.bairro, avg(p.salario)
from pessoa p 
join moradia m on p.idPessoa = m.fkPessoa
join endereco e on e.idEndereco = m.fkEndereco
group by e.bairro;

select * from pessoa limit 5; 
select * from pessoa limit 5, 1;

-- EXEMPLO NO SQL SERVER (NÃO EXISTE O COMANDO LIMIT POR LÁ) 
-- SELECT TOP(5) * FROM PESSOA

select 
p.nome, p.salario
from pessoa p 
where p.salario = (select min(salario) from pessoa)
or p.salario = (select max(salario) from pessoa);






