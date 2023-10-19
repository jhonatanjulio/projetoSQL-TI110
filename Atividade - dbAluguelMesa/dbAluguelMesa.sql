drop database dbAluguelMesa

create database dbAluguelMesa;
use dbAluguelMesa;

create table tbMesa (
    idMesa int not null auto_increment,
    qtdCad int not null,
    status varchar(15) not null default 'DISPONIVEL', -- INDISPONIVEL
    primary key(idMesa)
);

create table tbAluguel (
    idAlug int not null auto_increment,
    cliente varchar(20) not null,
    status varchar(15) not null default 'EM ANDAMENTO', -- quando a reserva terminar alterar para CONCLUIDO
    idMesa int not null,

    primary key(idAlug),
    foreign key(idMesa) references tbMesa(idMesa)
);
