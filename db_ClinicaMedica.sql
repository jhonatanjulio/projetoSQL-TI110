-- Jhonatan Julio Gonçalves Machado
drop database dbClinicaMedica;

-- Criando database
create database dbClinicaMedica;

-- Mostrar databases
show databases;

-- Acessar database
use dbClinicaMedica;

-- Criando tabelas/entidades
create table tbConsulta(
    id_consulta int,
    dt_consulta datetime,
    medico_idmedico int,
    paciente_idpaciente int,
    receitaMedica_idReceitaMedica int
);

create table tbMedico(
    id_medico int,
    nm_medico VARCHAR(45),
    telefone_medico VARCHAR(9)
);

create table tbPaciente(
    id_paciente int,
    nm_paciente VARCHAR(45),
    telefone_paciente VARCHAR(9),
    convenio VARCHAR(45)
);

create table tbReceitaMedica(
    id_receitaMedica int,
    descricao VARCHAR(500)
);

-- Mostrar tabelas
show tables;

-- Mostrar os atributos das tabelas
desc tbConsulta;
desc tbMedico;
desc tbPaciente;
desc tbReceitaMedica;