-- apagar banco de dados
drop database dbManicure;

-- criar o banco de dados
create database dbManicure;

-- acessando o banco de dados
use dbManicure;

-- visualizando banco de dados
show databases;

-- criar tabelas no banco de dados
create table tbProdutos(
    id_prod int,
    descricao varchar(100),
    qtde decimal(9,2),
    data_entrada date,
    valor_unit decimal(9,2)
);

-- visualizando as tabelas
show tables;

-- visualizando a estrutura da tabela
desc tbProdutos;

-- inserindo registros nas tabelas
insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(1, 'Alicate de unha', 10, '2023/08/01', 5.50);

insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(2, 'Algodão', 100, '2024/07/1', 2.53);

insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(3, 'Esmalte', 25, '2023/08/01', 15.00);

insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(4, 'Acetona', 35, '2023/07/30', 3.50);

insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(5, 'Unha postiça', 50, '2023/07/25', 9.99);
    
insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(6, 'Unha', 50, '2023/07/25', 9.99);

insert into tbProdutos(id_prod, descricao, qtde, data_entrada, valor_unit)
    values(7, 'postiça', 50, '2023/07/25', 9.99);

-- visualizar todos os registros inseridos na tabela
select * from tbProdutos;

-- alterando registros das tabelas
update tbProdutos set descricao = 'Palito de unha', valor_unit = 1.35 where id_prod = 6;
update tbProdutos set descricao = 'Máscara de proteção', valor_unit = 2.23 where id_prod = 7;

-- visualizar todos os registros inseridos na tabela
select * from tbProdutos;

-- apagar registros das tabelas
delete from tbProdutos where id_prod = 7;

-- visualizar todos os registros da tabela
select * from tbProdutos;
