drop database dbAluguelMesa;

create database dbAluguelMesa;
use dbAluguelMesa;

create table tbGarcom (
    idGarcom int not null auto_increment,
    nome varchar(20) not null,
    email varchar(50) not null,
    cpf char(14) not null,
    dataEntrada date not null,
    status varchar(15) not null default 'ATIVO', -- INATIVO

    primary key(idGarcom)
);

create table tbMesa (
    idMesa int not null auto_increment,
    qtdCad int not null,
    dataEntrada date not null,
    status varchar(15) not null default 'DISPONIVEL', -- INDISPONIVEL
    primary key(idMesa)
);

create table tbUsuario(
    idUsu int not null auto_increment,
    usuario varchar(20) not null unique,
    senha varchar(20) not null,
    idGarcom int not null,

    primary key(idUsu),
    foreign key(idGarcom) references tbGarcom(idGarcom)
);

create table tbAluguel (
    idAlug int not null auto_increment,
    cliente varchar(20) not null,
    dataAluguel date not null,
    status varchar(15) not null default 'EM ANDAMENTO', -- quando a reserva terminar alterar para CONCLUIDO
    valorConta decimal(9,2) not null,
    gorjeta decimal(9,2) not null,
    total decimal(9,2) not null,
    idMesa int not null,
    idGarcom int not null,
    

    primary key(idAlug),
    foreign key(idMesa) references tbMesa(idMesa),
    foreign key(idGarcom) references tbGarcom(idGarcom)
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
-- insert into tbAluguel(cliente, dataAluguel, idMesa, idGarcom) values (@cliente, @dataAluguel, @idMesa, @idGarcom);

-- Alterar o status da mesa alugada:
-- update tbMesa set status = @status where = idMesa = @idMesa;

-- Liberar mesas alugadas:
-- update tbAluguel set status = 'CONCLUIDO', valorConta = @valorConta, gorjeta = @gorjeta, total = @total where idAlug = @id;

-- update tbMesa set status = 'DISPONIVEL' where idMesa = @idMesa;


-- Ações da Janela Cadastrar Funcionários:

-- Cadastrar funcionários:
-- insert into tbGarcom(nome, email, cpf, dataEntrada, status) values (@nome, @email, @cpf, @dataEntrada, @status);

-- Pesquisar funcionários ativos:
-- select idGarcom, nome, status from tbGarcom where status = "ATIVO";

-- Pesquisar todos os dados pelo código do funcionário:
-- select * from tbGarcom where idGarcom = @idGarcom;

-- Alterar funcionário:
-- update tbGarcom set nome = @nome, email = @email, cpf = @cpf, dataEntrada = @dataEntrada, status = @status where idGarcom = @idGarcom;

-- Desativar funcionário:
-- update tbGarcom set status = "INATIVO" where idGarcom = @idGarcom;


-- Ações Janela Cadastrar Usuários:

-- Pesquisar todos Funcionários Disponíveis:
-- select func.nome from tbGarcom as func left join tbUsuario as usu on usu.idGarcom = func.idGarcom where usu.idGarcom is null AND func.status = "ATIVO";

-- Pesquisar codigo do funcionario pelo nome:
-- select idGarcom from tbGarcom where nome = @nome;

-- Cadastrar Usuário:
-- insert into tbUsuario(usuario, senha, idGarcom) values (@usuario, @senha, @idGarcom);

-- Pesquisar usuários por nome:
-- select usuario from tbUsuario where usuario like '@nome';

-- Pesquisar todos os dados do registro pelo nome:
-- select * from tbUsuario where usuario = @nome;

-- Pesquisar nome do funcionario pelo id:
-- select nome from tbGarcom where idGarcom = @idGarcom;

-- Alterar Usuário:
-- update tbUsuario set usuario = @usuario, senha = @senha where idGarcom = @idGarcom;

-- Deletar Usuário:
-- delete from tbUsuario where usuario = @usuario;


-- Ações Janela de Autenticação:

-- Pesquisar todos os registros que batem com o nome e senha inseridos:
-- select * from tbUsuario where usuario = @usuario and senha = @senha;

-- Ações Janela Histórico de Reservas:

-- Pesquisar todos os garçons da tabela de Garçom:
-- select nome from tbGarcom;

-- Pesquisar o código do garçom selecionado:
-- select idGarcom from tbGarcom where nome = @nome;

-- Pesquisar as reservas com todos os filtros ativados (nome, garçom e data):
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.cliente like '%@nome%' AND alu.dataAluguel = @dataAluguel AND alu.idGarcom = @idGarcom;

-- Pesquisar as reservas com os filtros: nome + garçom:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.cliente like '%@nome%' AND alu.idGarcom = @idGarcom;

-- Pesquisar as reservas com os filtros: garçom + data:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.dataAluguel = @dataAluguel AND alu.idGarcom = @idGarcom;

-- Pesquisar as reservas com os filtros: nome + data:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.cliente like '%@nome%' AND alu.dataAluguel = @dataAluguel;

-- Pesquisar as reservas pelo nome:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.cliente like '%@nome%';

-- Pesquisar as reservas pelo garçom:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.idGarcom = @idGarcom;

-- Pesquisar as reservas pela data:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom where alu.dataAluguel = @dataAluguel;

-- Pesquisar todas as reservas:
-- select alu.cliente, alu.dataAluguel, alu.valorConta, alu.gorjeta, alu.total, garc.nome, alu.status from tbAluguel as alu inner join tbGarcom as garc on alu.idGarcom = garc.idGarcom;
