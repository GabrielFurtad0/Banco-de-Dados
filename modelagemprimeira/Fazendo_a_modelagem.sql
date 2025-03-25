create database loja;

use loja;


create table produto(
ID int not null primary key auto_increment,
Descrição varchar(100),
Preço_unitario int
);

insert into produto(Descrição, Preço_unitario)
values ('Coca-Cola', 3.5),
       ('Guraraná', 3),
       ('milho de pipoca', 10);

create table cliente(
id int not null primary key auto_increment,
nome varchar(50)
);

 insert into cliente(nome)
 values ('Sptech'),
        ('Itau'),
        ('Elera');


create table pedido(
id int not null auto_increment primary key,
dt_compra date,
dt_entrega date,
fkCliente int not null,
constraint fk_cliente_pedido foreign key (fkCliente) references cliente(id)
);

insert into pedido(fkcliente, dt_compra, dt_entrega)
values (1, '2025-03-01', '2025-03-02'),
       (2, '2025-03-01', '2025-03-05'),
       (3, '2025-03-02', '2025-03-02'),
       (1, '2025-03-02', '2025-03-10');
       

create table item_pedido(
FKpedido int not null,
contador int not null,
preco_unitario decimal (10,2),
qtd_produto decimal (10,3), 
FKproduto int,
primary key (fkpedido, contador),
unique uk_item_pedido(FKpedido, contador),
constraint fk_produto_itens_pedido foreign key (FKproduto) references produto(ID),
constraint fk_pedido_itens_pedido foreign key (FKpedido) references pedido(id)
);
-- precisa do contador pois caso eu queira fazer 2 pedidos com o mesmo fkpedido não será possivel visto que a PK não se repete

insert into item_pedido(fkpedido, contador, fkproduto, 
          qtd_produto, preco_unitario)
values (1, 1, 2, 2, 4.5),
       (1, 2, 3, 0.5, 0.5);
 insert into item_pedido(fkpedido, contador, fkproduto, 
          qtd_produto, preco_unitario)      
values (2, 1, 1, 2, 4.5),
	   (1, 3, 3, 0.5, 0.5);

select fkpedido, fkproduto, descrição,
		qtd_produto*ipe.preco_unitario as valor_total_item
from item_pedido as ipe
inner join produto as pro on pro.id = ipe.fkproduto; -- ipe = item_pedido | pro = produto

select nome as nome_cliente, fkpedido, fkproduto, descrição as descrição_produto,
		qtd_produto*ipe.preco_unitario as valor_total_item
from item_pedido as ipe
inner join produto as pro on pro.id = ipe.fkproduto
inner join pedido as ped on ped.id = ipe.FKpedido
inner join cliente as cli on cli.id = ped.fkcliente