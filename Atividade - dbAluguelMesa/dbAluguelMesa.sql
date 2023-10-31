drop database dbAluguelMesa;

create database dbAluguelMesa;
use dbAluguelMesa;

create table tbGarcom (
    idGarcom int not null auto_increment,
    nome varchar(20) not null,
    email varchar(50) not null,
    cpf char(14) not null,
    dataEntrada date not null,
    status varchar(15) not null,

    primary key(idGarcom)
);

create table tbMesa (
    idMesa int not null auto_increment,
    qtdCad int not null,
    dataEntrada date not null,
    status varchar(15) not null default 'DISPONIVEL', -- INDISPONIVEL
    primary key(idMesa)
);

create table tbAluguel (
    idAlug int not null auto_increment,
    cliente varchar(20) not null,
    dataAluguel date not null,
    status varchar(15) not null default 'EM ANDAMENTO', -- quando a reserva terminar alterar para CONCLUIDO
    idMesa int not null,
    

    primary key(idAlug),
    foreign key(idMesa) references tbMesa(idMesa)
);


-- Ações da Janela Cadastrar Mesas:

-- Cadastro das mesas:
-- insert into tbMesa(qtdCad, status, dataEntrada) values (@qtdCad, @status, @dataEntrada);

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


-- Ações da Janela Alugar Mesas:


-- Pesquisar todos os dados pelo código da mesa (para pesquisa alugadas):
-- select alu.cliente, alu.idMesa, mesa.status, alu.dataAluguel from tbAluguel as alu inner join tbMesa as mesa on alu.idMesa = mesa.idMesa where alu.idAlug = @idAlug;

-- Pesquisar todos os dados pelo código da mesa (para pesquisa de mesas):
-- select idMesa, status from tbMesa where idMesa = @idMesa;

-- Pesquisar mesas disponíveis:
-- select idMesa, qtdCad from tbMesa where status = 'DISPONIVEL';

-- Pesquisar mesas alugadas:
-- select cliente, idMesa, status from tbAluguel;

-- Cadastrar mesas alugadas:
-- insert into tbAluguel(cliente, idMesa) values (@cliente, @idMesa);

-- Alterar o status da mesa alugada:
-- update tbMesa set status = @status where = idMesa = @idMesa;

-- Liberar mesas alugadas:
-- update tbAluguel set status = 'CONCLUIDO' where idMesa = @idMesa;

-- update tbMesa set status = 'DISPONIVEL' where idMesa = @idMesa;