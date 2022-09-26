

-- Questão 1

create database pet;

use pet;

create table pet(
idpet int primary key auto_increment,
animal varchar(45),
nome varchar(45),
raça varchar(30),
datanasc date, 
fkcliente int,
 foreign key (fkcliente) references cliente(idcliente))
auto_increment = 101;

create table cliente(
idcliente int primary key auto_increment,
nome varchar(45),
sobrenome varchar(45),
telefone_fixo char(10),
telefone_celular char(11),
endereço varchar(70) 
);

insert into pet(animal, nome, raça, datanasc, fkcliente) values 

('Cachorro','Rex', 'Doberman', '2017-08-22', 1),
('Gato', 'Pedro', 'Siamês', '2020-05-10', 2),
('Cachorro', 'Boby', 'Buldog', '2010-11-03', 3);

insert into cliente(nome, sobrenome, telefone_fixo, telefone_celular, endereço) values 

('Pedro', 'Marcato', '1147484544', '11989545870', 'Rua travessa cachoeira benfica'),
('Mayara', 'Souza', '1156499087', '11989997652', 'Rua morro das pedras'),
('Alice', 'Marcato', '1177869556', '11946813210', 'Rua Afonso lobo');

select * from pet;
select * from cliente;
select * from pet join cliente on fkcliente = idcliente;
alter table cliente modify column nome varchar(50);
select * from pet where idpet in (101, 103);
select nome, datanasc from pet;
select * from pet order by nome asc;
select * from cliente order by endereço desc;
select * from pet where nome like 'B%';
select * from cliente where idcliente in (1,3);
update cliente set telefone_fixo = 1190354627 where idcliente = 2;
select * from cliente;
select pet.*, cliente.* from pet join cliente on fkcliente = idcliente;
select * from pet join cliente on fkcliente = idcliente where idpet = 103;
delete from pet where idpet = 103;
select * from pet;
drop table pet;
drop table cliente;

