create database if not exists sprint2;

use sprint2;

create table cliente(
id  int not null auto_increment,
nome   varchar(100),
primary key(id));

create table produto(
id int not null auto_increment,
nome   varchar(100),
preco_unitario  decimal(10,2),
primary key(id));

create table pedido(
id   int not null auto_increment,
data_pedido   date,
fkcliente     int,
primary key(id),
foreign key (fkcliente) references cliente(id)) auto_increment=1000;

create table pedido_item(
fkpedido    int not null,
fkproduto   int not null,
quantidade  decimal(10,3),
valor_unitario  decimal(10,2),
primary key(fkpedido, fkproduto),
foreign key(fkpedido) references pedido(id),
foreign key(fkproduto) references produto(id));


INSERT INTO cliente (nome) VALUES
		('Empresa ABC LTDA'),
		('Companhia XYZ S.A.'),
		('Serviços de Tecnologia EFG Ltda.'),
		('Comércio de Alimentos GHI Ltda.'),
		('Transportadora JKL S.A.'),
		('Consultoria MNO LTDA'),
		('Fabricação de Produtos PQR S.A.'),
		('Agropecuária STU LTDA'),
		('Indústria de Cosméticos VWX S.A.'),
		('Construtora YZ Ltda.');
        
INSERT INTO produto (nome, preco_unitario) VALUES
	('Tênis de Skate', 129.99),
	('Camiseta Estampada', 49.99),
	('Boné de Marca', 39.99),
	('Celular Gamer', 999.99),
	('Fone de Ouvido Bluetooth', 79.99),
	('Mochila Escolar com Estampa', 69.99),
	('Skate Completo', 149.99),
	('Calça Jeans Rasgada', 79.99),
	('Sneakers de Marca', 89.99),
	('Pulseira Inteligente', 59.99);     
  
INSERT INTO pedido (data_pedido, fkcliente) VALUES
	('2024-04-01', 1),
	('2024-04-02', 2),
	('2024-04-03', 3),
	('2024-04-04', 4),
	('2024-04-05', 5),
	('2024-04-06', 6);    

INSERT INTO pedido_item (fkpedido, fkproduto, quantidade, valor_unitario) VALUES
		(1000, 1, 2, 129.99), 
		(1000, 2, 1, 49.99),  
		(1001, 4, 1, 999.99), 
		(1001, 5, 1, 79.99),  
		(1002, 7, 1, 149.99),
		(1002, 8, 1, 79.99),
		(1003, 9, 1, 89.99),
		(1003, 10, 1, 59.99),
		(1004, 2, 2, 49.99),
		(1004, 6, 1, 69.99),
		(1005, 1, 1, 129.99),
		(1005, 4, 1, 999.99);


-- --------------------------------------------------------------------------------------------------------------------------------------------------------

select * from pedido_item;

select *
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
order by pi.fkpedido;

select pro.nome, fkpedido
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
order by pi.fkpedido;

select distinct pro.nome -- distinct tira as repetições
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id; 

select distinct * -- distinct tira as repetições
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
order by pi.fkpedido; 

select * 
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
left join pedido pe on pe.id = pi.fkpedido
order by pi.fkpedido; 

select * 
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
left join pedido pe on pe.id = pi.fkpedido
order by 1; 

select distinct pro.nome, fkpedido, cli.nome
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
left join pedido pe on pe.id = pi.fkpedido
left join cliente cli on cli.id = pe.fkcliente
order by 1; 

select * 
from produto pro
left join pedido_item pi on pi.fkproduto = pro.id
left join pedido pe on pe.id = pi.fkpedido
left join cliente on cliente.id = pe.fkcliente
order by 1; 

select distinct cli.nome as cliente, pe.id as pedido
from cliente cli
left join pedido pe on pe.fkcliente = cli.id
order by pedido; 


select nome
from cliente
union 
select nome
from produto;
select nome
from cliente
union 
select nome
from produto
union 
select preco_unitario
from produto;

select nome
from cliente
union 
select nome
from produto;
select nome
from cliente
union 
select nome, preco_unitario
from produto; -- não funcionara pois a quantidade de colunas de um select é diferente da qtd do outro

select nome
from cliente
inner join pedido pe on pe.fkcliente = cliente.id
order by pedido;

select distinct cli.nome as cliente, pe.id as pedido
from cliente cli
left join pedido pe on pe.fkcliente = cli.id
order by pe.id  = null; 

-- pegando os clientes sem vendas e os produtos sem venda

select nome 
from cliente cli
left join pedido ped on ped.fkcliente = cli.id
where ped.id is null
union
select nome
from produto prod 
left join pedido_item pi on pi.fkproduto = prod.id
where pi.fkproduto is null;

-- com right

select nome 
from pedido ped 
right join cliente cli on  cli.id = ped.fkcliente 
where ped.id is null
union
select nome
from pedido_item pi  
right join produto prod on prod.id = pi.fkproduto
where pi.fkproduto is null;


-- ---------------------------------------------------------------------------------
-- Desafio magazine luizão


-- criando a tabela empresa
create table empresa(
id int primary key auto_increment,
nome varchar(45),
cnpj varchar(45),
situacao varchar(1),
fkempresa int,
constraint chk_situacao check (situacao in('A' or 'I')),
constraint fk_empresa_empresa foreign key (fkempresa) references empresa(id)
);

alter table empresa drop constraint chk_situacao;
alter table empresa add constraint chk_situacao check (situacao in('A', 'I'));

-- inserindo dados na tabela empresa
insert into empresa (nome, cnpj, situacao, fkempresa)
values ('Magazine Luizão', '12345678901', 'A', '1');

select * from empresa;

-- adicionando a pk composta

alter table pedido drop constraint pedido_ibfk_1;

alter table pedido add column fkEmpresa int;
alter table pedido add constraint fk_empresa_pedido foreign key (fkEmpresa) references empresa(id);

select * from pedido;

update pedido
set fkempresa = 1
where id between 1000 and 1005;

select * from pedido;

alter table pedido modify id int not null;

alter table pedido_item drop constraint pedido_item_ibfk_1;

alter table pedido modify id int not null;

alter table pedido drop primary key;

alter table pedido add primary key (id, fkEmpresa);

select * from pedido;

-- arrumando a pk de pedido_item 

alter table pedido_item drop primary key;

alter table pedido_item add column sequencia int;

alter table pedido_item add primary key(fkPedido, fkProduto, sequencia);

select * from pedido_item;

alter table pedido_item modify column sequencia int null;

update pedido_item
set sequencia = 1
where fkpedido = 1000 and fkproduto  = 1;

alter table pedido_item rename fkPedido;


alter table pedido_item drop constraint pedido_item_ibfk_2;



















CREATE TABLE `pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date DEFAULT NULL,
  `fkcliente` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fkcliente` (`fkcliente`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`fkcliente`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pedido_item` (
  `fkpedido` int NOT NULL,
  `fkproduto` int NOT NULL,
  `quantidade` decimal(10,3) DEFAULT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`fkpedido`,`fkproduto`),
  KEY `fkproduto` (`fkproduto`),
  CONSTRAINT `pedido_item_ibfk_1` FOREIGN KEY (`fkpedido`) REFERENCES `pedido` (`id`),
  CONSTRAINT `pedido_item_ibfk_2` FOREIGN KEY (`fkproduto`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

