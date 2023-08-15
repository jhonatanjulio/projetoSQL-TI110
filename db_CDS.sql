drop database db_cds;

-- 1. Crie uma database com o nome DB_CDS
create database db_cds;

-- 2. Conectar-se a database DB_CDS
use db_cds;

-- 3. Crie as tabelas especificadas a seguir com as respectivas constraints:

-- TABELA: ARTISTAS
create table tbArtista(
    cod_art int not null auto_increment,
    nome_art varchar(100) not null unique,

    primary key(cod_art)
);


-- TABELA: GRAVADORAS
create table tbGravadoras(
    cod_grav int not null auto_increment,
    nome_grav varchar(50) not null unique,

    primary key(cod_grav)
);

-- TABELA: CATEGORIAS
create table tbCategorias(
    cod_cat int not null auto_increment,
    nome_cat varchar(50) not null unique,

    primary key(cod_cat)
);

-- TABELA: ESTADOS
create table tbEstados(
    sigla_est char(2) not null,
    nome_est varchar(50) not null unique,

    primary key(sigla_est)
);

-- TABELA: CIDADES
create table tbCidades(
    cod_cid int not null auto_increment,
    sigla_est char(2) not null,
    nome_cid varchar(50) not null,

    primary key(cod_cid),
    foreign key(sigla_est) references tbEstados(sigla_est)
);

-- TABELA: CLIENTES
create table tbClientes(
    cod_cli int not null auto_increment,
    cod_cid int not null,
    nome_cli varchar(50) not null,
    end_cli varchar(100) not null,
    renda_cli decimal(9,2) not null default 0 check(renda_cli >= 0),
    sexo_cli char(1) not null default 'F' check(sexo_cli in('F', 'M')),

    primary key(cod_cli),
    foreign key(cod_cid) references tbCidades(cod_cid)
);

-- TABELA: CONJUGE
create table tbCojunge(
    cod_conj int not null auto_increment,
    cod_cli int not null,
    nome_conj varchar(50) not null,
    renda_conj decimal(9,2) not null default 0 check(renda_conj >= 0),
    sexo_conj char(1) not null default 'F' check(sexo_conj in('F', 'M')),

    primary key(cod_conj),
    foreign key(cod_cli) references tbClientes(cod_cli)
);

-- TABELA: FUNCIONARIOS
create table tbFuncionarios(
    cod_func int not null auto_increment,
    nome_func varchar(50) not null,
    end_func varchar(100) not null,
    sal_func decimal(9,2) not null default 0 check(sal_func >= 0),
    sexo_func char(1) not null default 'F' check(sexo_func in('F', 'M')),

    primary key(cod_func)
);

-- TABELA: DEPENDENTES
create table tbDependentes(
    cod_dep int not null auto_increment,
    cod_func int not null,
    nome_dep varchar(100) not null,
    sexo_dep char(1) not null default 'F' check(sexo_dep in('F', 'M')),

    primary key(cod_dep),
    foreign key(cod_func) references tbFuncionarios(cod_func)
);

-- TABELA: TITULOS
create table tbTitulos(
    cod_tit int not null auto_increment,
    cod_cat int not null,
    cod_grav int not null,
    nome_cd varchar(50) not null unique,
    val_cd decimal(9,2) not null check(val_cd > 0),
    qtd_estq int not null check(qtd_estq >= 0),

    primary key(cod_tit),
    foreign key(cod_cat) references tbCategorias(cod_cat),
    foreign key(cod_grav) references tbGravadoras(cod_grav)
);

-- TABELA: PEDIDOS
create table tbPedidos(
    num_ped int not null auto_increment,
    cod_cli int not null,
    cod_func int not null,
    data_ped datetime not null,
    val_ped decimal(9,2) not null default 0 check(val_ped >= 0),

    primary key(num_ped),
    foreign key(cod_cli) references tbClientes(cod_cli),
    foreign key(cod_func) references tbFuncionarios(cod_func)
);

-- TABELA: TITULOS_PEDIDO
create table tbTitulosPedido(
    num_ped int not null,
    cod_tit int not null,
    qtd_cd int not null check(qtd_cd >= 1),
    val_cd decimal(9,2) not null check(val_cd > 0),

    foreign key(num_ped) references tbPedidos(num_ped),
    foreign key(cod_tit) references tbTitulos(cod_tit)
);

-- TABELA: TITULOS_ARTISTA
create table tbTitulosArtista(
    cod_tit int not null,
    cod_art int not null,

    foreign key(cod_tit) references tbTitulos(cod_tit),
    foreign key(cod_art) references tbArtista(cod_art)
);

show tables;
desc tbArtista;
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbCidades;
desc tbClientes;
desc tbCojunge;
desc tbFuncionarios;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosPedido;
desc tbTitulosArtista;

-- 4. Agora insira os seguintes dados nas respectivas tabelas:

-- TABELA: ARTISTAS
insert into tbArtista(nome_art) values('Marisa Monte');
insert into tbArtista(nome_art) values('Gilberto Gil');
insert into tbArtista(nome_art) values('Caetano Veloso');
insert into tbArtista(nome_art) values('Milton Nascimento');
insert into tbArtista(nome_art) values('Legião Urbana');
insert into tbArtista(nome_art) values('The Beatles');
insert into tbArtista(nome_art) values('Rita Lee');

-- TABELA: GRAVADORAS
insert into tbGravadoras(nome_grav) values('Polygram');
insert into tbGravadoras(nome_grav) values('Emi');
insert into tbGravadoras(nome_grav) values('Som Livre');
insert into tbGravadoras(nome_grav) values('Som Music');

-- TABELA: CATEGORIAS
insert into tbCategorias(nome_cat) values('MPB');
insert into tbCategorias(nome_cat) values('Trilha Sonora');
insert into tbCategorias(nome_cat) values('Rock Internacional');
insert into tbCategorias(nome_cat) values('Rock Nacional');

-- TABELA: ESTADOS
insert into tbEstados(sigla_est, nome_est) values('SP','São Paulo');
insert into tbEstados(sigla_est, nome_est) values('MG','Minas Gerais');
insert into tbEstados(sigla_est, nome_est) values('RJ','Rio de Janeiro');
insert into tbEstados(sigla_est, nome_est) values('ES','Espírito Santo');

-- TABELA: CIDADES
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'São Paulo');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Sorocaba');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Jundiaí');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Americana');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Araraquara');
insert into tbCidades(sigla_est, nome_cid) values ('MG', 'Ouro Preto');
insert into tbCidades(sigla_est, nome_cid) values ('ES', 'Cachoeira do Itapemirim');



select * from tbArtista order by cod_art;
select * from tbGravadoras order by cod_grav;
select * from tbCategorias order by cod_cat;
select * from tbEstados order by sigla_est desc;
select * from tbCidades order by sigla_est desc;