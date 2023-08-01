-- Apagar banco de dados (poder)
drop database dbLoterica;

-- Criando banco de dados
create database dbLoterica;

-- Acessar banco de dados
use dbLoterica;

-- Criar tabela
create table tbJogos(
    cod_jogo int,
    nome varchar(50),
    valor decimal(9,2),
    data_jogo date
);

-- Mostrar tabelas
show tables;

-- Mostrar campos das tabelas
desc tbJogos;

-- Cadastrando registros
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(1, 'Quina', 2.50, '2023/08/23');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(2, 'Mega-Sena', 5, '2023/09/14');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(3, 'Lotomania', 3, '2023/09/2');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(4, 'Lotofácil', 3, '2023/09/28');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(5, 'Dupla Sena', 2.50, '2023/09/29');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(6, 'Timemania', 3.50, '2023/08/30');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(7, 'Dia de Sorte', 2, '2023/08/2');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(8, 'Super Sete', 2.50, '2023/09/5');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(9, '+Milionária', 6, '2023/10/1');
insert into tbJogos(cod_jogo, nome, valor, data_jogo) values(10, 'Federal', 4.50, '2023/08/10');

-- Mostrar todos os registros da tabela
select * from tbJogos;

-- Atualizar registros da tabela
update tbJogos set nome = 'Loteca', valor = 3 where cod_jogo = 10;
update tbJogos set nome = 'Jogo do Bicho', valor = 10 where cod_jogo = 1;

-- Mostrar todos os registros da tabela
select * from tbJogos;

-- Excluir registros
delete from tbJogos where cod_jogo = 10;
delete from tbJogos where cod_jogo = 1;
delete from tbJogos where cod_jogo = 9;


-- Mostrar todos os registros da tabela
select * from tbJogos;