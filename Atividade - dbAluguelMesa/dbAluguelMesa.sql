-- drop database dbAluguelMesa

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


-- Ações da Janela Cadastrar Mesas:

-- Cadastro das mesas:
-- insert into tbMesa(qtdCad, status) values (@qtdCad, @status);

-- Pesquisar mesas disponíveis:
-- select idMesa, qtdCad from tbMesa where status = 'DISPONIVEL';

-- Pesquisar mesas indisponíveis:
-- select idMesa, qtdCad from tbMesa where status = 'INDISPONIVEL';

-- Pesquisar todos os dados pelo código da mesa:
-- select * from tbMesa where idMesa = @idMesa;

-- Pesquisar o próximo código possível para registrar na tabela de mesas:
-- select idMesa+1 from tbMesa order by idMesa desc;

-- Alterar mesa:
-- update tbMesa set qtdCad = @qtdCad where idMesa = @idMesa;

-- Deletar mesa:
-- delete from tbMesa where idMesa = @idMesa;


-- Ações da Janela Cadastrar Mesas:

-- Pesquisar mesas disponíveis:
-- select idMesa, qtdCad from tbMesa where status = 'DISPONIVEL';

-- Pesquisar mesas alugadas:
-- select cliente, idMesa, status from tbAluguel;