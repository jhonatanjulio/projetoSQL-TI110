drop database dbLojaABC;

create database dbLojaABC;

use dbLojaABC;

create table tbFuncionarios(
    cod_func int not null auto_increment,
    nome varchar(100),
    email varchar(100),
    cpf char(14) unique,
    d_nasc date,
    endereco varchar(100),
    cep char(9),
    numero char(10),
    bairro varchar(100),
    estado char(2),
    cidade varchar(100),

    primary key(cod_func)
);

-- insert into tbFuncionarios(nome,email,cpf,d_nasc,endereco,cep,numero,bairro,estado,cidade) values ();

-- Busca por código
-- select * tbFuncionarios where cod_func = 1;

-- Busca por nome
-- select nome from tbFuncionarios where nome like '%ho%';

-- Alterar funcionário
-- update tbFuncionarios set nome = @nome, email = @email, cpf = @cpf, d_nasc = @d_nasc, endereco = @endereco, cep = @cep, numero = @numero, bairro = @bairro, estado = @estado, cidade = @cidade where cod_func = @codFunc;

-- Excluir funcionário
-- delete from tbFuncionarios where cod_func = @codFunc;

create table tbUsuarios(
    cod_usu int not null auto_increment,
    usuario varchar(30) not null,
    senha varchar(10) not null,
    cod_func int not null,

    primary key(cod_usu),
    foreign key(cod_func) references tbFuncionarios(cod_func)
);

-- insert into tbUsuarios(usuario, senha, cod_func) values ('admin', 'admin', 1);

-- select cod_func from tbFuncionarios where nome = @nome;

-- select func.nome from tbFuncionarios as func inner join tbUsuarios as usu on usu.cod_func = func.cod_func;

-- select * from tbUsuarios where usuario = 'admin' and senha = 'admin';

-- select * from tbUsuarios where usuario = @usuario and senha = @senha;

-- select nome from tbFuncionarios order by nome asc;

-- select usu.usuario, usu.senha, func.cod_func from tb_Funcionarios as func inner join tb_Usuarios as usu on func.cod_func = usu.cod_func where func.nome = @nome;

-- INSERT INTO `tbfuncionarios` (`cod_func`, `nome`, `email`, `cpf`, `d_Nasc`, `endereco`, `cep`, `numero`, `bairro`, `estado`, `cidade`) VALUES (1, 'Jhonatan Julio', 'jhonatan@gmail.com', '192.824.982-09', '2023-10-05', 'Rua João Batista Franco', '04842-230', '384', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (2, 'Rafaela Alves', 'rafaela.alves@senacsp.edu.br', '294.526.186-29', '2023-10-05', 'Rua João Batista Franco', '04842-230', '362', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (3, 'Vitor Teixeira', 'vitor.teixeira@senacsp.edu.br', '420.124.529-67', '2023-10-05', 'Rua João Batista Franco', '04842-230', '323', 'Parque Grajaú', 'SP', 'São Paulo'),
-- (4, 'Julio Machado', 'julio.machado@gmail.com', '342.512.509-79', '2023-10-05', 'Rua João Batista Franco', '04842-230', '462', 'Parque Grajaú', 'SP', 'São Paulo');

-- select cod_usu+1 from tbUsuarios order by cod_usu desc;

-- Alterar funcionário
-- update tbUsuarios set usuario = @usuario, senha = @senha where cod_usu = @cod_usu;
