-- Criar banco de dados   

  create database sprint1; 

  -- Selecionar banco de dados  


  
  use sprint1;

  create table atleta(  

  
idAtleta int primary key,  
nome varchar(40),  
modalidade varchar(40),  
qtdmedalhas int  
);

  insert into atleta values  

(1, 'Pedro', 'futebol',10),  
(2, 'Joâo', 'golf',20),  
(3, 'Rodrigo', 'basquete',14),  
(4, 'Gabriel', 'volei',37),  
(5, 'Maria', 'pinbolin', 44),  
(6, 'Paulo', 'futmesa', 23),  
(7, 'Vinicios', 'futebol', 13);  

select * from atleta;  
select qtdmedalhas from atleta;  
select * from atleta where modalidade='futebol';  
select * from atleta order by modalidade; 
select * from atleta order by qtdmedalhas desc; 
select * from atleta where nome like '%o%';
select * from atleta where nome like 'P%'; 
select * from atleta where nome like '%O'; 
select * from atleta where nome like '%R_'; 

  
drop table atleta; 


use sprint1; 

  create table musica( 

  
idmusica int primary key, 
titulo varchar(40), 
artista varchar(40), 
genero varchar(40) 
); 

  
insert into musica values 

(1, 'Eu tenho você', 'Isadora pompeo','gospel'), 
(2, 'Seja forte', 'Isadora pompeo','gospel'), 
(3, 'Nós', 'Anavitoria','Mpb'), 
(4, 'Singular', 'AnaVitoria','mpb'), 
(5, 'Paradise', 'codplay','pop'), 
(6, 'The nigths', 'Avicii', 'pop'), 
(7, 'Yellow', 'codplay','pop'); 

select * from musica; 
select titulo, artista from musica; 
select * from musica where genero='pop'; 
select * from musica where artista='codplay'; 
select * from musica order by titulo; 
select * from musica order by artista desc; 
select * from musica where titulo like 's%'; 
select * from musica where artista like '%O'; 
select * from musica where genero like '_O%'; 
select * from musica where titulo like '%o_';

drop table musica; 

   

use sprint1;

create table filme(
idfilme int primary key,
titulo varchar(50),
genero varchar(40),
diretor varchar(40)
);

insert into filme values

(1, 'Homem aranha', 'Açâo', 'Sam Raimi'),
(2, 'Doutor estranho', 'Terror', 'Sam Raimi'),
(3, 'Liga da justiça', 'Aventura', 'Zack Snyder'),
(4, 'Invocaçâo do mal', 'Terror', 'james Wan'),
(5, 'Annabelle', 'Terror', 'James Wan'),
(6, 'Gente grande', 'Comedia', 'Dennis Dugan'),
(7, 'Johnny', 'comedia', 'peter Howitt');

select * from filme;
select titulo, diretor from filme;
select * from filme where genero='terror';
select * from filme where diretor='Sam Raimi';
select * from filme order by titulo;
select * from filme order by diretor desc;
select * from filme where titulo like 'a%';
select * from filme where diretor like '%_i';
select * from filme where genero like '_O%';
select * from filme where titulo like '%H_';

drop table filme;

 
 
 use sprint1;
 
 create table professor(
 idprofessor int primary key,
 nome varchar(50),
 especialidade varchar(40),
 dtnasc date
 );
 
 insert into professor value
 
 (1, 'Vivian','Banco de dados', '1983-10-13'),
 (2, 'vivian','Analise de sistemas de computação', '1983-10-13'),
 (3, 'Monica', 'TI', '1975-06-22'),
 (4, 'Caio', 'Aloritimos','1996-04-14'),
 (5, 'brandão', 'Gestâo de negocios', '1980-11-15'),
 (6, 'Eduardo','Arquitetura computacional', '1984-07-28');
 
 select * from professor;
 select especialidade from professor;
 select * from professor where especialidade= 'banco de dados';
 select * from professor order by nome;
 select * from professor order by dtnasc desc;
 select * from professor where nome like 'V%';
 select * from professor where nome like '%_O';
 select * from professor where nome like '_I%';
 select * from professor where nome like '%A_';
 
 drop table professor;
 
 
 use sprint1;
 
 create table cursos(
 idcurso int primary key,
 nome varchar(50),
 sigla char(3),
 coordenador varchar(40) 
 );
 
 insert into cursos value
 
 (1, 'Analise de desenvolvimento de sistemas', 'ADS', 'Tiago1'),
 (2, 'Sistema da informaçâo', 'SI', 'Leonardo'),
 (3, 'Ciência da computação', 'CCO', 'Pedro');
 
 select * from cursos;
 select coordenador from cursos;
 select * from cursos where sigla='CCO';
 select * from cursos order by nome;
 select * from cursos order by coordenador desc;
 select * from cursos where nome like 'A%';
 select * from cursos where nome like '%_O';
 select * from cursos where nome like '_I%';
 select * from cursos where nome like '%A_';
 
 drop table cursos; 
 
 
 
use sprint1;

create table revista(
idrevista int primary key auto_increment,
nome varchar(40),
categoria varchar(30) constraint chkacategoria check ( categoria in ( 'fofoca', 'jornalismo', 'noticias', 'peido'))  

);

insert into revista values

(null, 'Veja', 'peido'), 
(null, 'Isto é', null),
(null, 'Folha de são Paulo', null),
(null,'UOL', null);

select * from revista;

insert into revista values

(null, 'panico', 'fofoca'), 
(null, 'futibolistico', 'jornalismo'),
(null, 'blogueiras', 'noticias');
select * from revista;
describe table revista;
alter table revista modify categoria varchar(40);
describe revista;
alter table revista add column periodicidade varchar(15);
select * from revista;
alter table revista drop column periodicidade;














-- select * from revista;
-- update revista set categoria = 'fofoca' where idrevista=1;
-- update revista set categoria = 'fofoca' where idrevista=2; 
-- update revista set categoria = 'jornalismo' where idrevista=3; 
-- update revista set categoria = 'noticias' where idrevista=4;
-- select * from revista;

insert into revista values

(null, 'panico', 'fofoca'), 
(null, 'futibolistico', 'jornalismo'),
(null, 'blogueiras', 'noticias');

select * from revista;

describe revista;
alter table revista modify categoria varchar(40);
describe revista;
alter table revista add column periodicidade varchar(15); 
select * from revista;
alter table revista drop column periodicidade;	
select * from revista;

drop table revista;







