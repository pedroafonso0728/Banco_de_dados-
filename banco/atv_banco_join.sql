use sprint2;

create table atleta(
idatleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdmedalha int,
fkpais int,
Foreign key (fkpais) references pais (idpais)
);

drop table atleta;
drop table pais; 

create table pais(
idpais int primary key auto_increment,
nome varchar(40),
capital varchar(30) 
); 

insert into pais(nome, capital) values 

('Brasil', 'Brasilia'),
('França', 'Paris'),
('Alemanha', 'Berlim'),
('Canada', 'Ottawa');

insert into atleta(nome, modalidade, qtdmedalha) values 

('Pedro', 'futebol', '55'),
('Mayara', 'futebol', '100'),
('Antonio', 'basquete', '38'),
('Maria', 'natacao', '29'),
('Sonia', 'volei', '47');

update atleta set fkpais = 1 where idatleta = 1;
update atleta set fkpais = 1 where idatleta = 2;
update atleta set fkpais = 5 where idatleta = 3;
update atleta set fkpais = 2 where idatleta = 4;
update atleta set fkpais = 3 where idatleta = 5;
select * from atleta join pais on fkpais = idpais;
select atleta.nome, pais.nome from atleta join pais on fkpais = idpais;
select atleta.nome, pais.nome, capital from atleta join pais on fkpais = idpais;




create table musica(
idmusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40), 
genero varchar(40),
fkalbum int,
foreign key (fkalbum) references album (idalbum)
);

create table album(
idalbum int primary key auto_increment,
nome varchar(40),
tipo varchar (30),
dtLancamento date,
constraint checktipo check (tipo in('digital', 'fisico')) 
);


insert into album(nome, tipo, dtlancamento) values 

('Cleopatra', 'digital', '2016-08-13'),
('Parachutes', 'fisico', '2000-11-28'),
('Por toda terra', 'digital', '2017-03-06');

insert into musica(titulo, artista, genero) values 

('Nós', 'Anavitoria','Mpb'), 
('tempo', 'Maria Gadu','mpb'), 
('Paradise', 'codplay','pop');

select * from musica;
select * from album;
update musica set fkalbum = 1 where idmusica = 2;
update musica set fkalbum = 2 where idmusica = 3;
update musica set fkalbum = 3 where idmusica = 1;
select titulo, nome from musica join album on fkalbum = fkalbum;
select titulo, nome from musica join album on fkalbum = 1; 
select titulo, nome, tipo from musica join album on fkalbum = fkalbum;
 

