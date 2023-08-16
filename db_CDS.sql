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
insert into tbCategorias(nome_cat) values ('MPB');
insert into tbCategorias(nome_cat) values ('Trilha Sonora');
insert into tbCategorias(nome_cat) values ('Rock Internacional');
insert into tbCategorias(nome_cat) values ('Rock Nacional');

-- TABELA: ESTADOS
insert into tbEstados(sigla_est, nome_est) values ('SP', 'São Paulo');
insert into tbEstados(sigla_est, nome_est) values ('MG', 'Minas Gerais');
insert into tbEstados(sigla_est, nome_est) values ('RJ', 'Rio de Janeiro');
insert into tbEstados(sigla_est, nome_est) values ('ES', 'Espírito Santo');

-- TABELA: CIDADES
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'São Paulo');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Sorocaba');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Jundiaí');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Americana');
insert into tbCidades(sigla_est, nome_cid) values ('SP', 'Araraquara');
insert into tbCidades(sigla_est, nome_cid) values ('MG', 'Ouro Preto');
insert into tbCidades(sigla_est, nome_cid) values ('ES', 'Cachoeira do Itapemirim');

-- TABELA: CLIENTES
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1, 'José Nogueira', 'RUA A', 1500, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1, 'Ângelo Pereira', 'RUA B', 2000, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1, 'Além Mar Paranhos', 'RUA C', 1500, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1, 'Catarina Souza', 'RUA D', 832, 'F');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (1, 'Vagner Costa', 'RUA E', 950, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (2, 'Antenor da Costa', 'RUA F', 1582, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (2, 'Maria Amélia de Souza', 'RUA G', 1152, 'F');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (2, 'Paulo Roberto Silva', 'RUA H', 3250, 'M');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (3, 'Fátima Souza', 'RUA I', 1632, 'F');
insert into tbClientes(cod_cid, nome_cli, end_cli, renda_cli, sexo_cli) values (3, 'Joel da Rocha', 'RUA J', 2000, 'M');

-- TABELA: CONJUGE
insert into tbCojunge(cod_cli, nome_conj, renda_conj, sexo_conj) values (1, 'Carla Nogueira', 2500, 'F');
insert into tbCojunge(cod_cli, nome_conj, renda_conj, sexo_conj) values (2, 'Emilia Pereira', 5500, 'F');
insert into tbCojunge(cod_cli, nome_conj, renda_conj, sexo_conj) values (6, 'Altiva da Costa', 3000, 'F');
insert into tbCojunge(cod_cli, nome_conj, renda_conj, sexo_conj) values (7, 'Carlos de Souza', 3250, 'M');

-- TABELA: FUNCIONARIOS
insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values ('Vânia Gabriela Pereira', 'RUA A', 2500, 'F');
insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values ('Norberto Pereira da Silva', 'RUA B', 300, 'M');
insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values ('Olavo Linhares', 'RUA C', 580, 'M');
insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values ('Paula da Silva', 'RUA D', 3000, 'F');
insert into tbFuncionarios(nome_func, end_func, sal_func, sexo_func) values ('Rolando Rocha', 'RUA E', 2000, 'M');

-- TABELA: DEPENDENTES
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (1, 'Ana Pereira', 'F');
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (1, 'Roberto Pereira', 'M');
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (1, 'Celso Pereira', 'M');
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (3, 'Brisa Linhares', 'F');
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (3, 'Mari Sol Linhares', 'F');
insert into tbDependentes(cod_func, nome_dep, sexo_dep) values (4, 'Sonia da Silva', 'F');

-- TABELA: TITULOS
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 1, 'Tribalistas', 30, 1500);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 2, 'Tropicália', 50, 500);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 1, 'Aquele Abraço', 50, 600);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 2, 'Refazenda', 60, 1000);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 3, 'Totalmente Demais', 50, 2000);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 3, 'Travessia', 55, 500);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (1, 2, 'Courage', 30, 200);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (4, 3, 'Legião Urbana', 20, 100);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (3, 2, 'The Beatles', 30, 300);
insert into tbTitulos(cod_cat, cod_grav, nome_cd, val_cd, qtd_estq) values (4, 1, 'Rita Lee', 30, 500);

-- TABELA: PEDIDOS
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (4, 2, '02/05/02', 1500);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (3, 4, '02/05/02', 50);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (1, 4, '02/06/02', 100);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (1, 2, '02/02/03', 200);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (5, 5, '02/03/03', 300);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (4, 4, '02/03/03', 100);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (8, 2, '02/03/03', 50);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (2, 2, '02/03/03', 50);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (7, 1, '02/03/03', 2000);
insert into tbPedidos(cod_cli, cod_func, data_ped, val_ped) values (5, 5, '02/03/03', 3000);

-- TABELA: TITULOS_ARTISTA
insert into tbTitulosArtista(cod_tit, cod_art) values (1, 1);
insert into tbTitulosArtista(cod_tit, cod_art) values (2, 2);
insert into tbTitulosArtista(cod_tit, cod_art) values (3, 2);
insert into tbTitulosArtista(cod_tit, cod_art) values (4, 2);
insert into tbTitulosArtista(cod_tit, cod_art) values (5, 3);
insert into tbTitulosArtista(cod_tit, cod_art) values (6, 4);
insert into tbTitulosArtista(cod_tit, cod_art) values (7, 4);
insert into tbTitulosArtista(cod_tit, cod_art) values (8, 5);
insert into tbTitulosArtista(cod_tit, cod_art) values (9, 6);
insert into tbTitulosArtista(cod_tit, cod_art) values (10, 7);

-- TABELA: TITULOS_PEDIDO
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (1, 1, 2, 30);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (1, 2, 3, 20);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (2, 1, 1, 50);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (2, 2, 3, 30);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (3, 1, 5, 40);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (4, 2, 3, 20);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (5, 1, 2, 25);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (6, 2, 3, 30);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (6, 3, 1, 35);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (7, 4, 2, 55);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (8, 1, 4, 60);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (9, 2, 3, 15);
insert into tbTitulosPedido(num_ped, cod_tit, qtd_cd, val_cd) values (10, 7, 2, 15);


-- buscas
select * from tbArtista order by cod_art;
select * from tbGravadoras order by cod_grav;
select * from tbCategorias order by cod_cat;
select * from tbEstados order by sigla_est desc;
select * from tbCidades order by sigla_est desc;
select * from tbClientes order by cod_cli;
select cod_cli, nome_conj, renda_conj, sexo_conj from tbCojunge order by sexo_conj;
select * from tbFuncionarios order by cod_func;
select * from tbDependentes order by cod_dep;
select * from tbTitulos order by cod_tit;
select * from tbPedidos order by num_ped;
select * from tbTitulosArtista order by cod_tit;
select * from tbTitulosPedido order by num_ped;