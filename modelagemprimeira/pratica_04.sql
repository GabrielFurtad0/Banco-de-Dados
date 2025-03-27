create database sprint2; -- cria a database

use sprint2; -- ativa a database

create table professor(
idProfessor int not null primary key auto_increment,
nome varchar(50),
sobrenome varchar(30),
especialidade1 varchar(40),
especialidade2 varchar(40)
); -- cria a tabela professor

insert into professor (nome, sobrenome, especialidade1, especialidade2)
values ('Carlos', 'Silva', 'Matemática', 'Física'),
('Ana', 'Oliveira', 'Química', 'Biologia'),
('João', 'Santos', 'História', 'Geografia'),
('Maria', 'Costa', 'Português', 'Literatura'),
('Paulo', 'Fernandes', 'Educação Física', 'Saúde'),
('Clara', 'Mendes', 'Informática', 'Robótica'),
('Renato', 'Barbosa', 'Filosofia', 'Sociologia'),
('Juliana', 'Almeida', 'Arte', 'Design'),
('Pedro', 'Lima', 'Economia', 'Administração'),
('Fernanda', 'Gomes', 'Engenharia', 'Arquitetura'); -- inserindo os dados na tabela professor

create table disciplina(
idDisc int not null primary key auto_increment,
nomeDisc varchar(45)
); -- criando a tabela disciplina

insert into disciplina (nomeDisc)
values ('Física'),
('Geografia'),
('Arte'),
('Robótica'),
('Sociologia'),
('Administração'),
('Economia'); -- inserindo dados na tabela disciplina

/* 
alter table professor add column fk_disciplina int;
alter table professor add constraint fk_professor_disciplina foreign key (fk_disciplina) references disciplina(idDisc);

alter table professor drop column fk_disciplina;
alter table professor drop constraint fk_professor_disciplina;

update professor
set fk_disciplina = null
where idProfessor = 1;

update professor
set fk_disciplina = null
where idProfessor = 2;

update professor
set fk_disciplina = null
where idProfessor = 2;

update professor
set fk_disciplina = null
where idProfessor = 1;
*/

alter table disciplina add column fk_professor int; -- adicionando a coluna fk_professor a tabela disciplina para poder adicionar a foreign key
alter table disciplina add constraint fk_disciplina_professor foreign key (fk_professor) references professor(idProfessor); -- colocando a foreign key e ligando-a

update disciplina
set fk_professor = 1
where idDisc = 1; -- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 2
where idDisc = 2;-- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 4
where idDisc = 3;-- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 6
where idDisc = 4;-- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 7
where idDisc = 5;-- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 9
where idDisc = 6;-- atualizando a tabela disciplina com o professor da respectiva disciplina

update disciplina
set fk_professor = 9
where idDisc = 7;-- atualizando a tabela disciplina com o professor da respectiva disciplina

select * from disciplina; -- checando se todas os dados foram realmente inseridos


select nome as nome_professor, sobrenome sobrenome_professor, especialidade1, especialidade2, nomeDisc as nome_disciplina
from disciplina as disc
inner join professor on professor.idProfessor = fk_professor; -- Exibir os professores e suas respectivas disciplinas

select nomedisc as nome_disciplina, nome as nome_professor
from disciplina
inner join professor on professor.idProfessor = fk_professor; -- Exibir apenas o nome da disciplina e o nome do respectivo professor;

select nome as nome_professor, sobrenome sobrenome_professor, especialidade1, especialidade2, nomeDisc as nome_disciplina
from disciplina 
inner join professor on professor.idProfessor = fk_professor
where sobrenome = 'Silva'; -- Exibir os dados dos professores, suas respectivas disciplinas de um determinado sobrenome;

select especialidade1, nomedisc as nome_disciplina 
from disciplina
inner join professor on professor.idProfessor = fk_professor
order by especialidade1 asc; -- Exibir apenas a especialidade1 e o nome da disciplina, de um determinado professor, ordenado de forma crescente pela especialidade1;

create table curso(
idCurso int not null primary key auto_increment,
nome varchar (40),
sigla varchar (3)
); -- criando a tabela curso

insert into curso (nome, sigla)
values ('Economia', 'ECO'),
('Ciencia da computação', 'CCO'),
('Medicina', 'MED'),
('Letras', 'LET'),
('Educação Física', 'EDF'); -- inserindo dados na tabela curso
select * from curso; -- verificando a tabela

truncate curso; -- limpando os dados da tabela curso

alter table curso add column fk_professor int; -- adicionando uma coluna para servir de foreign key
alter table curso add constraint fk_professor_curso foreign key (fk_professor) references professor(idProfessor); -- setando a foreign key

update curso
set fk_professor = 9
where idCurso = 1; -- atualizando a tabela curso com o professor do respectivo curso

update curso 
set fk_professor = 6
where idCurso = 2;-- atualizando a tabela curso com o professor do respectivo curso

update curso 
set fk_professor = 2
where idCurso = 3;-- atualizando a tabela curso com o professor do respectivo curso

update curso 
set fk_professor = 4
where idCurso = 4;-- atualizando a tabela curso com o professor do respectivo curso

update curso 
set fk_professor = 5
where idCurso = 5;-- atualizando a tabela curso com o professor do respectivo curso

select * 
from curso
inner join professor on professor.idProfessor = fk_professor; -- fazendo um join básico entre as duas tabelas

alter table curso rename column nome to nomeCurso; -- renomeando a coluna nome da tabela curso para funcionar o próximo join

select nome as nome_professor , nomeCurso as nome_curso
from curso
inner join professor on professor.idprofessor = fk_professor
where nome like '%a%'; -- criando um inner join com where

alter table curso add constraint chk_nomeCurso check (nomeCurso like('%a%')); -- criando uma constraint com check



create database Pet;

use Pet;

create table pet(
idPet int not null primary key auto_increment,
tipo varchar(40),
nome varchar(40),
raça varchar(40),
dtNascimento date
)auto_increment = 101; -- criando a tabela pet

insert into pet (tipo, nome, raça, dtNascimento)
values('Cachorro', 'Bolt', 'Golden Retriever', '2021-01-15'),
('Gato', 'Mia', 'Persa', '2019-07-22'),
('Pássaro', 'Pipoca', 'Canário', '2022-03-18'),
('Cachorro', 'Max', 'Labrador', '2020-11-10'),
('Gato', 'Luna', 'Siamês', '2021-05-05'),
('Coelho', 'Bunny', 'Lionhead', '2023-02-27'),
('Peixe', 'Nemo', 'Palhaço', '2022-06-30'),
('Cachorro', 'Rex', 'Pastor Alemão', '2018-09-12'); -- inserindo dados na tabela pet

create table cliente(
idCliente int not null primary key auto_increment,
nome varchar(40),
tel_fixo int,
tel_celular int,
endereço varchar(50)
); -- criando a tabela cliente

insert into cliente(nome, tel_fixo, tel_celular, endereço)
values ('Gabriel Oliveira', '1123456789', '11987654321', 'Rua das Flores, 123'),
('Maria Oliveira', '1139876543', '11954321678', 'Avenida Brasil, 456'),
('João Silva', '1143219876', '11965432109', 'Rua do Sol, 789'),
('Ana Silva', '1156784321', '11987651234', 'Praça das Árvores, 101'),
('Paulo Lima', '1165432987', '11932106543', 'Alameda das Palmeiras, 202'),
('Carla Souza', '1176543890', '11921087654', 'Rua Bela Vista, 303'),
('Rafael Oliveira', '+551187654302', '+551198761234', 'Avenida Central, 404'),
('Fernanda Oliveira', '+551198765432', '+551196543987', 'Rua da Harmonia, 505'); -- inserindo dados na tabela cliente

alter table cliente modify column tel_fixo varchar(15); -- mudando o tipo de dado da coluna tel_fixo
alter table cliente modify column tel_celular varchar(15); -- mudando o tipo de dado da coluna tel_celular

select * from pet; -- verificando a tabela pet
select * from cliente;-- verificando a tabela cliente

alter table pet add column fk_cliente int; -- adicionando uma coluna a tabela pet para criar a foreign key
alter table pet add constraint fk_pet_cliente foreign key (fk_cliente) references cliente(idCliente); -- criando a foreign key

update pet 
set fk_cliente = 1
where idPet = 101; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 2
where idPet = 102; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 3
where idPet = 103; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 4
where idPet = 104; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 5
where idPet = 105; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 6
where idPet = 106; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 7
where idPet = 107; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 

update pet 
set fk_cliente = 7
where idPet = 108; -- atualizando a coluna fk_cliente referenciando o idpet para cada cliente e seu respectivo idpet 


alter table cliente rename column nome to nomeCliente; -- renomeando a coluna nome para nomeCliente para não haver complicações na hora do join
alter table cliente modify column nomeCliente varchar(100); -- alterando o tamanho da coluna do nome do cliente

select * from pet where tipo = 'Gato'; -- exibindo os dados de todos os pets que são do tipo: gato

alter table pet rename column nome to nomePet; -- renomeando a coluna nome para nomePet para não haver complicações na hora do join
select nomePet, dtNascimento from pet; -- Exibir apenas os nomes e as datas de nascimento dos pets

select * from pet order by nomePet asc; -- Exibir os dados dos pets ordenados em ordem crescente pelo nome

select * from cliente order by endereço desc; -- Exibir os dados dos clientes ordenados em ordem decrescente pelo bairro

select * from pet where nomePet like 'm%'; -- Exibir os dados dos pets cujo nome comece com uma determinada letra.

select * from cliente where nomeCliente like '%Oliveira'; -- Exibir os dados dos clientes que têm o mesmo sobrenome.

update cliente 
set tel_fixo = '+5511976455335'
where idCliente = 2; -- Alterar o telefone de um determinado cliente.

select * from cliente; -- Exibir os dados dos clientes para verificar se alterou.

select nomePet as nome_pet, nomeCliente as nome_cliente
from pet
inner join cliente on cliente.idCliente = fk_cliente; -- Exibir os dados dos pets e dos seus respectivos donos.

select * 
from pet
inner join cliente on cliente.idCliente = fk_cliente
where nomeCliente = 'Rafael Oliveira'; -- Exibir os dados dos pets e dos seus respectivos donos, mas somente de um determinado cliente.

delete from pet 
where idPet = 108; -- deletando um pet

select * from pet; -- Exibir os dados dos pets para verificar se excluiu.

alter table pet drop constraint fk_pet_cliente;-- excluindo as tabelas
drop table pet;-- excluindo as tabelas
drop table cliente;-- excluindo as tabelas

use sprint2; -- reativando a database sprint2

create table pessoa(
idPessoa int not null primary key auto_increment,
nomePessoa varchar (40),
dtNascimento date,
profissão varchar(40)
); -- criando a tabela pessoa

insert into pessoa (nomePessoa, dtNascimento, profissão)
values('Gabriel Santos', '1990-05-15', 'Engenheiro'),
('Maria Oliveira', '1985-03-22', 'Médica'),
('João Silva', '1992-07-10', 'Professor'),
('Ana Costa', '1995-01-05', 'Advogada'),
('Beatriz Rocha', '1999-08-20', 'Enfermeira'); -- inserindo dados na tabela pessoa

create table gasto(
idGasto int not null primary key auto_increment,
data date,
valor int,
descrição varchar (50)
); -- criando a tabela gasto

insert into gasto (data, valor, descrição)
values ('2025-03-01', 150, 'Compra de materiais de escritório'),
('2025-03-03', 75, 'Almoço em equipe'),
('2025-03-05', 200, 'Manutenção de computadores'),
('2025-03-07', 50, 'Café e lanches'),
('2025-03-10', 500, 'Compra de cadeiras'),
('2025-03-12', 120, 'Conta de energia elétrica'),
('2025-03-15', 300, 'Assinatura de software'),
('2025-03-18', 80, 'Material de limpeza'),
('2025-03-20', 450, 'Reparos na infraestrutura'),
('2025-03-25', 250, 'Treinamento de funcionários'); -- inserindo dados na tabela gasto

/*
alter table pessoa add column fk_gasto int;
alter table pessoa add constraint fk_gasto_pessoa foreign key (fk_gasto) references pessoa(idPessoa);

alter table pessoa drop constraint fk_gasto_pessoa;
alter table pessoa drop column fk_gasto;
*/

alter table gasto add column fk_pessoa int;-- adicionando a coluna para ser utilizada como foreign key
alter table gasto add constraint fk_pessoa_gasto foreign key (fk_pessoa) references pessoa(idPessoa); -- criando a foreign key

update gasto
set fk_pessoa = 1
where idGasto = 1; -- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 1
where idGasto = 2;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 2
where idGasto = 3;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 2
where idGasto = 4;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 3
where idGasto = 5;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 3
where idGasto = 6;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 4
where idGasto = 7;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 4
where idGasto = 8;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 5
where idGasto = 9;-- adicionando o dado à fk_pessoa referente ao gasto

update gasto
set fk_pessoa = 5
where idGasto = 10;-- adicionando o dado à fk_pessoa referente ao gasto

select * from pessoa; -- exibando os dados para checar a integridade dos dados
select * from gastos; -- exibindo os dados para checar a integridade dos dados

select * from gasto where descrição like '%compra%'; -- exibindo os dados da tabela com o filtro de compras

select * 
from gasto
inner join pessoa on pessoa.idPessoa = fk_pessoa; -- Exibindo os dados das pessoas e dos seus gastos correspondentes

select *
from gasto 
inner join pessoa on pessoa.idPessoa = fk_pessoa
where nomePessoa = 'Gabriel Santos'; -- Exibindo os dados de uma determinada pessoa e dos seus gastos correspondentes

update gasto
set valor = 999
where idGasto = 3; -- atualizando valores ja existents na tabela

update gasto
set valor = 500
where idGasto = 7; -- atualizando valores ja existentes na tabela

delete from gasto 
where idGasto = 1; -- excluindo um registro da tabela

select * from gasto; -- checando pra ver se funcionou

