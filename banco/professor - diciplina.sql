

use sprint2;


create table professor(
   idprofessor int primary key auto_increment,
   nome varchar(50),
   sobrenome varchar(30),
   especialidade1 varchar(40),
   especialidade2 varchar(40),
   fkDisciplina int,
   foreign key (fkDisciplina) references Disciplina(idDisc)
);

insert into professor(nome, sobrenome, especialidade1, especialidade2) values

('Caio', 'Santos', 'front and', 'java'),
('Vivian', 'Silva', 'cirurgia geral', 'pediatria'),
('Mayara', 'Souza', 'estilista', 'empresaria'),
('Pedro', 'Afonso', 'laboratorio', 'tosador'),
('Monica', 'Herrero', 'back and', 'Html'),
('Tiago', 'Bonatiele', 'psicologia social', 'tecnologia da informação');


create table Disciplina(
   idDisc int primary key auto_increment,
   nomeDisc varchar(45)
);

insert into Disciplina(nomeDisc) values 

('Algritmos'),
('Medicina'),
('Moda');

select * from Disciplina;
select * from professor;
select * from professor join Disciplina on fkDisciplina = idDisc;	
update professor set fkDisciplina = 1 where idprofessor = 1;
update professor set fkDisciplina = 2 where idprofessor = 2;
update professor set fkDisciplina  = 3 where idprofessor = 3;
select professor.nome, professor.sobrenome, Disciplina.nomeDisc from professor join Disciplina on fkDisciplina = idDisc;
select Disciplina.nomeDisc, professor.nome from professor join Disciplina on fkDisciplina = idDisc;
select professor.sobrenome, Disciplina.nomeDisc from professor join Disciplina on idprofessor = idDisc where idprofessor = 3; 
select professor.especialidade1, Disciplina.nomeDisc from professor join Disciplina on idprofessor = idDisc where idprofessor = 1 order by especialidade1 asc;  



use sprint2;

create table curso(
idcurso int primary key auto_increment,
nome varchar(50),
sigla char(3),
coordenador varchar(40),
tipo varchar(20),
constraint checkt check(tipo in('presencial', 'misto'))
);

insert into curso(nome, sigla, coordenador, tipo) values 

('Analise e desenvolvimento de sistemas', 'ADS', 'Tiago', 'misto'),
('Banco de dados', 'BD', 'Vivian', 'presencial');


create table aluno(
idaluno int primary key auto_increment,                                          
nome varchar(50),
sobrenome varchar(40),
idade int,
email varchar(70),
fkcurso int,
foreign key (fkcurso) references curso(idcurso)
);

insert into aluno(nome, sobrenome, idade, email) values

('Pedro','Afonso','22', 'pedro.marcato@sptech.school'),
('Mayara','Souza','21','mayara.souza@sptech.school'),
('Alice','Dornelas','18','alice.dornelas@sptech.school');

select * from aluno;
select * from curso;

-- modelagem lógica conforme a regra de negócio: 
-- • 1 curso tem 1 ou muitos alunos;
-- • 1 aluno tem apenas 1 curso;
update aluno set fkcurso = 1 where idaluno = 1;
update aluno set fkcurso = 2 where idaluno = 2;
update aluno set fkcurso = 3 where idaluno = 3;
select * from aluno join curso on fkcurso = idcurso;
select aluno.nome, curso.sigla from aluno join curso on fkcurso = idcurso where idaluno = 2;

-- Testando constrant 
insert into curso(nome, sigla, coordenador, tipo) values 

('Tecnologia da informação', 'TI', 'Monica', 'presencial');

-- Deu certo, eu acho (: coloquei um valor dferente de constrant e deu violação, depois coloquei o certo!












