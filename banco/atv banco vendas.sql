create database venda;

use venda;

create table cliente(
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(70),
fkEndereco int,
foreign key (fkEndereco) references endereco(idEndereco),
fkCliente_indicado int,
foreign key (fkCliente_indicado) references cliente(idCliente)
);

create table endereco(
idEndereco int primary key auto_increment,
logradouro varchar(45),
bairro varchar(70),
numero int,
cep char(9)
);

create table venda(
idVenda int primary key auto_increment,
total_venda decimal(10,2),
data_venda date
);

create table produto(
idProduto int auto_increment,
nome varchar(45),
descricao varchar(45),
preco_produto decimal(10,2),
fkCliente int,
foreign key (fkCliente) references cliente(idCliente),
primary key (idProduto, fkCliente)
);

create table historico_vendas(
quantidade int,
desconto int,
fkProduto int,
foreign key (fkProduto) references produto(idProduto),
fkVenda int,
foreign key (fkVenda) references venda(idVenda),
fkCliente int,
foreign key (fkCliente) references cliente(idCliente),
primary key (fkProduto, fkVenda, fkCliente)
);

insert into cliente(nome, email, fkEndereco, fkCliente_indicado) values

('Pedro', 'pedro.marcato@sptech.school', 1, null),
('Daniel', 'daniel.teixeira@sptech.school',2,  1),
('Luan', 'luan.leite@sptech.school', 3, null),
('Matheus', 'matheus.ribeiro@sptech.school', 4, 3),
('Eduardo', 'eduardo.damaceno@sptech.school', 5, null),
('Gabriel', 'gabriel.kenji@sptech.school', 6, 1);

insert into endereco(logradouro, bairro, numero, cep) values

('Travessa cachoeira benfica', 'Jardim Rodolfo Pirane', '150', '08311-380'),
('Alameda cruz', 'Cunha souza', '301', '03447-001'),
('Rua do Afonso', 'Jururu', '1004', '0777-520'),
('Travessa do chico', 'Vila mariana', '500', '08400-100'),
('Rua chico chavier', 'Afonso lazaro', '2500', '01222-031'),
( 'Avenida dos bandeirantes', 'Morro das pedras', '501', '01222-762');

insert into venda(total_venda, data_venda) values

(3000, '2022-05-10'),
(250.00, '2022-05-12'),
(300.00, '2022-06-23'),
(30.00, '2022-06-20'),
(200.00, '2022-07-03'),
(1000.00, '2022-08-10');

insert into produto(nome, descricao, preco_produto, fkCliente) values

('Asus vivoBook', 'Notbook', '6000.00', 2),
('Logitech', 'Mouse', 500.00, 4),
('Lenovo', 'Mouse', 350.00, 1),
('Chamequinho', 'Folha de sulfite', 50.00, 6),
('abelha', 'mouse', 200.00, 3),
('HP', 'Impressora', '1000.00', 5);

insert into historico_vendas(quantidade, desconto, fkProduto, fkVenda, fkCliente) values

(2, 1500, 1, 1, 2),
(2, 250, 2, 2, 4),
(1, 50, 3, 3, 1),
(1, 20, 4, 4, 6),
(1, 0, 5, 5, 3),
(1, 0, 6, 6, 5);


-- Exibindo os dados das tabelas
select * from cliente;
select * from endereco;
select * from venda;
select * from produto;
select * from historico_vendas;

-- g) Exibir os dados dos clientes e os dados de suas respectivas vendas.
select * from cliente join historico_vendas on idCliente = fkCliente;

-- h) Exibir os dados de um determinado cliente (informar o nome do cliente na consulta) 
-- e os dados de suas respectivas vendas.
select * from cliente join historico_vendas on idCliente = fKCliente where idCliente = 1;

-- i) Exibir os dados dos clientes e de suas respectivas indicações de clientes.
select * from cliente as c left join cliente as i on c.idCliente = i.fkCliente_indicado; 

-- j) Exibir os dados dos clientes indicados e os dados dos respectivos clientes 
-- indicadores, porém somente de um determinado cliente indicador (informar o nome 
-- do cliente que indicou na consulta).
select * from cliente as c join cliente as i on c.idCliente = i.fkCliente_indicado where c.nome = 'Pedro';

-- l) Exibir os dados dos clientes, os dados dos respectivos clientes que indicaram, os 
-- dados das respectivas vendas e dos produtos.
select * from cliente as indicador 
join cliente as indicados on indicador.idCliente = indicados.fkCliente_indicado
join historico_vendas as h on indicador.idCliente = h.fkCliente
join produto as p on indicador.idCliente = p.idProduto;

-- m) Exibir apenas a data da venda, o nome do produto e a quantidade do produto 
-- numa determinada venda.
select v.data_venda, p.nome, h.quantidade from historico_vendas as h 
join venda as v on v.idVenda = h.fkVenda 
join produto as p on p.idProduto = h.fkProduto where idVenda = 6;

-- n) Exibir apenas o nome do produto, o valor do produto e a soma da quantidade de
-- produtos vendidos agrupados pelo nome do produto.
select p.nome, p.preco_produto, sum(quantidade) from historico_vendas as h 
join produto as p on p.idProduto = h.fkProduto group by p.nome;

-- o) Inserir dados de um novo cliente. Exibir os dados dos clientes, das respectivas
-- vendas, e os clientes que não realizaram nenhuma venda.
insert into endereco(logradouro, bairro, numero, cep) values
('Morro das pedras', 'Jardim Rodolfo Pirane', '200', '08311-380');
insert into cliente(nome, email, fkEndereco, fkCliente_indicado) values
('Sonia', 'sonia.marcato@sptech.school', 7, null);
select * from cliente left join historico_vendas on idCliente = fkCliente;

-- p) Exibir o valor mínimo e o valor máximo dos preços dos produtos;
select min(preco_produto), max(preco_produto) from produto;

-- q) Exibir a soma e a média dos preços dos produtos;
select sum(preco_produto), (preco_produto) from produto;  

-- r) Exibir a quantidade de preços acima da média entre todos os produtos;   
select count(preco_produto) as acima_media from produto where (select avg(preco_produto) from produto) < preco_produto;       

-- s) Exibir a soma dos preços distintos dos produtos;
select sum(preco_produto), count(distinct descricao) from produto; 
-- Professora, acredito que esse select não tenha dado certo.

-- t) Exibir a soma dos preços dos produtos agrupado por uma determinada venda;
select sum(preco_produto) from produto join venda on idProduto = idVenda group by idVenda = 3;
-- tbm acredito que não esteja correta.





