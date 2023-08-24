drop database dbMercadoSA;

create database dbMercadoSA;

use dbMercadoSA;

create table tbFuncionarios(
    cod_func int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    cpf char(14) not null unique,
    salario decimal(9,2) default 0 check(salario >= 0),
    sexo char(1) default 'F' check(sexo in('F', 'M')),

    primary key(cod_func)
);

create table tbClientes(
    cod_cli int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    tel_cel char(10),

    primary key(cod_cli)
);

create table tbFornecedores(
    cod_forn int not null auto_increment,
    nome varchar(100) not null,
    email varchar(100),
    cnpj char(18) not null unique,

    primary key(cod_forn)
);

create table tbUsuarios(
    cod_user int not null auto_increment,
    nome varchar(50) not null,
    senha varchar(20) not null,
    cod_func int not null,

    primary key(cod_user),
    foreign key(cod_func) references tbFuncionarios(cod_func)
);

create table tbProdutos(
    cod_prod int not null auto_increment,
    descricao varchar(100),
    data_entrada date,
    hora_entrada time,
    qtd decimal(9,2),
    valor_unit decimal(9,2),

    cod_forn int not null,

    primary key(cod_prod),
    foreign key(cod_forn) references tbFornecedores(cod_forn)
);

create table tbVendas(
    cod_venda int not null auto_increment,
    cod_user int not null,
    cod_cli int not null,
    cod_prod int not null,
    data_venda date,
    quantidade decimal(9,2),
    valor_total decimal(9,2),

    primary key(cod_venda),
    foreign key(cod_user) references tbUsuarios(cod_user),
    foreign key(cod_cli) references tbClientes(cod_cli),
    foreign key(cod_prod) references tbProdutos(cod_prod)
);

desc tbFuncionarios;
desc tbClientes;
desc tbFornecedores;
desc tbUsuarios;
desc tbProdutos;
desc tbVendas;

-- inserir registros na tabela

insert into tbFuncionarios(nome, email, cpf, salario, sexo) values ('Erick "Aspas" Santos', "aspas@contato.com", '255.144.585-95', 50000, 'M');

insert into tbClientes(nome, email, tel_cel) values ('Jhonatan Julio', 'jhonatanjgm2004@gmail.com', '99314-5945');
insert into tbClientes(nome, email, tel_cel) values ('Jeferson Jesus', 'jajinho11@gmail.com', '99494-6150');

insert into tbFornecedores(nome, email, cnpj) values ('LOUD', 'sac@loud.com', '88.485.555.0058/16');
insert into tbFornecedores(nome, email, cnpj) values ('CHAMPIONS', 'sac@champions.com', '58.462.875.0001/14');

insert into tbUsuarios(nome, senha, cod_func) values('erick.santos','123456', 1);

insert into tbProdutos(descricao, data_entrada, hora_entrada, qtd, valor_unit, cod_forn) values ('Banana Prata', '2023/05/18', '16:53:25', 10, 3.50, 1);
insert into tbProdutos(descricao, data_entrada, hora_entrada, qtd, valor_unit, cod_forn) values ('Banana Nanica', '2023/05/18', '16:54:25', 30, 1.50, 1);
insert into tbProdutos(descricao, data_entrada, hora_entrada, qtd, valor_unit, cod_forn) values ('Morango', '2023/08/10', '16:55:00', 10, 5.35, 2);
insert into tbProdutos(descricao, data_entrada, hora_entrada, qtd, valor_unit, cod_forn) values ('Bicicleta', '2023/07/5', '16:57:00', 80, 800, 2);

insert into tbVendas(cod_user, cod_cli, cod_prod, data_venda, quantidade, valor_total) values (1, 1, 4, '2023/08/10', 1, 800);
insert into tbVendas(cod_user, cod_cli, cod_prod, data_venda, quantidade, valor_total) values (1, 2, 1, '2023/08/10', 5, 10);

select * from tbFuncionarios;
select * from tbClientes;
select * from tbFornecedores;
select * from tbUsuarios;
select * from tbProdutos;
select * from tbVendas;


select
    usuario.nome as 'Nome do Usuário',
    usuario.senha as 'Senha do Usuário',
    func.nome 'Nome do Funcionário',
    func.email 'E-mail do Funcionário'
from tbUsuarios as usuario
inner join tbFuncionarios as func
on usuario.cod_func = func.cod_func;

select
    prod.descricao as 'Produto',
    forn.nome as 'Fornecedor',
    forn.cnpj as 'CNPJ do Fornecedor'
from tbProdutos as prod
inner join tbFornecedores as forn
on prod.cod_forn = forn.cod_forn;

select
    cli.nome as 'Nome do Cliente',
    cli.email as 'Nome do E-mail',
    cli.tel_cel as 'Telefone do Cliente',
    vend.data_venda as 'Data da Venda',
    vend.valor_total as 'Valor Total'
from tbVendas as vend
inner join tbClientes as cli
on vend.cod_cli = cli.cod_cli;

select
    cli.nome as 'Nome do Cliente',
    cli.email as 'E-mail do Cliente',
    prod.descricao as 'Produto Vendido',
    vend.data_venda as 'Data da Venda',
    vend.valor_total as 'Valor Total'
from tbVendas as vend
inner join tbClientes as cli
on vend.cod_cli = cli.cod_cli
inner join tbProdutos as prod
on prod.cod_prod = vend.cod_prod;

select
    cli.nome as 'Nome do Cliente',
    cli.email as 'E-mail do Cliente',
    prod.descricao as 'Produto Vendido',
    vend.data_venda as 'Data da Venda',
    vend.valor_total as 'Valor Total'
from tbVendas as vend
inner join tbClientes as cli
on vend.cod_cli = cli.cod_cli
inner join tbProdutos as prod
on prod.cod_prod = vend.cod_prod
where prod.descricao like '%b%'

select distinct 
    usu.nome as 'Nome do Usuário',
    func.nome as 'Nome do Funcionário',
    vend.data_venda as 'Data da Venda',
    vend.quantidade as 'Qtde da Venda',
    vend.valor_total as 'Valor Total'
from tbUsuarios as usu
inner join tbFuncionarios as func
on usu.cod_func = func.cod_func
inner join tbVendas as vend
on vend.cod_user = usu.cod_user;

select
    cli.nome as 'Cliente',
    vend.data_venda 'Data da Venda',
    prod.descricao 'Produto',
    forn.nome 'Fornecedor'
from tbClientes as cli
inner join tbVendas as vend
on cli.cod_cli = vend.cod_cli
inner join tbProdutos as prod
on prod.cod_prod = vend.cod_prod
inner join tbFornecedores as forn
on forn.cod_forn = prod.cod_forn;

select
    func.nome as 'Nome do Funcionário',
    usu.nome as 'Usuário',
    vend.data_venda as 'Data da Venda',
    vend.valor_total as 'Valor Total',
    prod.descricao as 'Prod. Vendido',
    prod.data_entrada as 'Data de Entrada Prod.',
    forn.nome as 'Fornecedor',
    forn.cnpj as 'CNPJ do Fornecedor'
from tbFuncionarios as func
inner join tbUsuarios as usu
on func.cod_func = usu.cod_func
inner join tbVendas as vend
on usu.cod_user = vend.cod_user
inner join tbProdutos as prod
on vend.cod_prod = prod.cod_prod
inner join tbFornecedores as forn
on prod.cod_forn = forn.cod_forn;