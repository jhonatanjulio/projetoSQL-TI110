-- Jhonatan Julio Gonçalves Machado
-- drop database dbAcademia;

-- Criando database 
create database dbAcademia;

-- Mostrar databases
show databases;

-- Acessando dbAcademia
use dbAcademia;

-- Criando tabelas
create table tbAluno(
    matricula int,
    data_matricula date,
    nome varchar(45),
    endereco varchar(45),
    telefone varchar(45),
    nascimento date,
    altura float,
    peso float,
    id_turma int
);

create table tbInstrutor(
    rg int,
    nome varchar(45),
    nascimento date,
    titulacao varchar(45),
    telefone varchar(45)
);

create table tbRegistro(
    id_aluno int,
    id_turma int,
    ausencia int,
    id_registro int
);

create table tbTurma(
    id int,
    qtde_alunos int,
    horario_aula datetime,
    duracao_aula datetime,
    data_inicio date,
    data_fim date,
    atividade int,
    id_instrutor int,
    id_monitor int
);

create table tbAtividade(
    id int,
    atividade varchar(45)
);

create table tbMonitor(
    id_aluno int
);

-- Mostrar as tabelas
show tables;

-- Mostrar os atributos das tabelas
desc tbAluno;
desc tbInstrutor;
desc tbRegistro;
desc tbAtividade;
desc tbMonitor;