-- Jhonatan Julio Gonçalves Machado
drop database dbLivraria;
-- dbLivraria
create database dbLivraria;
use dbLivraria;

-- Entidades não relacionadas:
-- tbGenero
-- tbCliente
-- tbAutor

create table tbGenero(
    id_genero int not null auto_increment,
    descricao varchar(100) not null unique,
    primary key(id_genero)
);

create table tbCliente(
    id_cliente int not null auto_increment,
    nome varchar(100) not null,
    telefone varchar(45) not null unique,

    primary key(id_cliente)
);

create table tbAutor(
    id_autor int not null auto_increment,
    nome varchar(100) not null unique,
    email varchar(100) not null,

    primary key(id_autor)
);

-- Entidades relacionadas:
-- tbLivro
-- tbEscreve
-- tbVenda
-- tbItensDaVenda

create table tbLivro(
    id_livro int not null auto_increment,
    titulo varchar(100) not null,
    preco float(24) not null default 0 check(preco >= 0),
    estoque int not null default 0 check(estoque >= 0),

    id_genero int not null,
    primary key(id_livro),
    foreign key(id_genero) references tbGenero(id_genero)
);

create table tbEscreve(
    id_livro int not null,
    id_autor int not null,

    foreign key(id_livro) references tbLivro(id_livro),
    foreign key(id_autor) references tbAutor(id_autor)
);

create table tbVenda(
    id_venda int not null auto_increment,
    data_venda date not null,
    total float(24) not null default 0 check(total >= 0),

    id_cliente int not null,
    primary key(id_venda),
    foreign key(id_cliente) references tbCliente(id_cliente)
);

create table tbItensDaVenda(
    id_venda int not null,
    id_livro int not null,
    qtd int not null default 0 check(qtd >= 0),
    subtotal varchar(45) not null,

    foreign key(id_venda) references tbVenda(id_venda),
    foreign key(id_livro) references tbLivro(id_livro)
);

desc tbGenero;
desc tbCliente;
desc tbAutor;

desc tbLivro;
desc tbEscreve;
desc tbVenda;
desc tbItensDaVenda;

-- Dez inserts, cinco updates e cinco deletes em cada tabela:

-- tbGenero:

-- insert
insert into tbGenero(descricao) values ('Terror');
insert into tbGenero(descricao) values ('Fantasia');
insert into tbGenero(descricao) values ('Suspense');
insert into tbGenero(descricao) values ('Mistério');
insert into tbGenero(descricao) values ('Romance');
insert into tbGenero(descricao) values ('Ficção');
insert into tbGenero(descricao) values ('Aventura');
insert into tbGenero(descricao) values ('Não Ficção');
insert into tbGenero(descricao) values ('Histórico');
insert into tbGenero(descricao) values ('Poesia');

-- update
update tbGenero set descricao = 'Autoajuda' where id_genero = 6;
update tbGenero set descricao = 'Biografia' where id_genero = 7;
update tbGenero set descricao = 'HQs' where id_genero = 8;
update tbGenero set descricao = 'Distopia' where id_genero = 9;
update tbGenero set descricao = 'Folclore' where id_genero = 10;

-- delete
delete from tbGenero where id_genero = 6;
delete from tbGenero where id_genero = 7;
delete from tbGenero where id_genero = 3;
delete from tbGenero where id_genero = 8;
delete from tbGenero where id_genero = 10;

-- tbCliente

-- insert
insert into tbCliente(nome, telefone) values ('Sophia Rodriguez', '(11) 98765-4321');
insert into tbCliente(nome, telefone) values ('Liam Anderson', '(21) 8765-4321');
insert into tbCliente(nome, telefone) values ('Isabella Carvalho', '(31) 7654-3210');
insert into tbCliente(nome, telefone) values ('Noah Martins', '(41) 6543-2109');
insert into tbCliente(nome, telefone) values ('Olivia Silva', '(51) 5432-1098');
insert into tbCliente(nome, telefone) values ('Aiden Souza', '(61) 4321-0987');
insert into tbCliente(nome, telefone) values ('Emma Ferreira', '(71) 3210-9876');
insert into tbCliente(nome, telefone) values ('Ethan Santos', '(81) 2109-8765');
insert into tbCliente(nome, telefone) values ('Ava Costa', '(91) 1098-7654');
insert into tbCliente(nome, telefone) values ('Jackson Oliveira', '(10) 9876-5432');

-- update
update tbCliente set nome = 'Lucas Pereira', telefone = '(12) 8765-4321' where id_cliente = 6;
update tbCliente set nome = 'Mariana Santos', telefone = '(22) 7654-3210' where id_cliente = 7;
update tbCliente set nome = 'Enzo Costa', telefone = '(32) 6543-2109' where id_cliente = 8;
update tbCliente set nome = 'Beatriz Almeida', telefone = '(42) 5432-1098' where id_cliente = 9;
update tbCliente set nome = 'Pedro Oliveira', telefone = '(52) 4321-0987' where id_cliente = 10;

-- delete
delete from tbCliente where id_cliente = 6;
delete from tbCliente where id_cliente = 7;
delete from tbCliente where id_cliente = 8;
delete from tbCliente where id_cliente = 9;
delete from tbCliente where id_cliente = 10;

-- tbAutor

-- insert
insert into tbAutor(nome, email) values ('J.K. Rowling', 'jkrowling.author@gmail.com');
insert into tbAutor(nome, email) values ('Stephen King', 'stephenking.writer@hotmail.com');
insert into tbAutor(nome, email) values ('Agatha Christie', 'agathachristie.books@yahoo.com');
insert into tbAutor(nome, email) values ('Gabriel García Márquez', 'gabogarcia.writer@gmail.com');
insert into tbAutor(nome, email) values ('Jane Austen', 'janeausten.books@gmail.com');
insert into tbAutor(nome, email) values ('George Orwell', 'georgeorwell.writer@yahoo.com');
insert into tbAutor(nome, email) values ('Harper Lee', 'harperlee.author@hotmail.com');
insert into tbAutor(nome, email) values ('Toni Morrison', 'tonimorrison.books@gmail.com');
insert into tbAutor(nome, email) values ('Leo Tolstoy', 'leotolstoy.writer@yahoo.com');
insert into tbAutor(nome, email) values ('J.R.R. Tolkien', 'jrrtolkien.author@gmail.com');

-- update
update tbAutor set nome = 'Mark Twain', email = 'marktwain.writer@hotmail.com' where id_autor = 6;
update tbAutor set nome = 'Virginia Woolf', email = 'virginiawoolf.author@gmail.com' where id_autor = 7;
update tbAutor set nome = 'Ernest Hemingway', email = 'ehemingway.writer@yahoo.com' where id_autor = 8;
update tbAutor set nome = 'Maya Angelou', email = 'mayaangelou.books@gmail.com' where id_autor = 9;
update tbAutor set nome = 'F. Scott Fitzgerald', email = 'fscottfitzgerald.author@hotmail.com' where id_autor = 10;

-- delete
delete from tbAutor where id_autor = 6;
delete from tbAutor where id_autor = 7;
delete from tbAutor where id_autor = 8;
delete from tbAutor where id_autor = 9;
delete from tbAutor where id_autor = 10;

-- tbLivro

-- insert
insert into tbLivro(titulo, preco, estoque, id_genero) values ('O Iluminado', 35.05, 100, 1);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Assassinato no Expresso do Oriente', 37.33, 100, 4);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Cem Anos de Solidão', 44.99, 100, 2);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Orgulho e Preconceito', 59.82, 100, 5);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Harry Potter e a Pedra Filosofal', 209.90, 100, 2);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('1984', 9.25, 100, 9);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('O Sol é para Todos', 47.99, 100, 5);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Amada', 77.90, 100, 5);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('Guerra e Paz', 50.00, 100, 5);
insert into tbLivro(titulo, preco, estoque, id_genero) values ('O Senhor dos Anéis', 129.99, 100, 2);

-- update
update tbLivro set titulo = 'As Aventuras de Huckleberry Finn', preco = 19.90, id_genero = 2 where id_livro = 6;
update tbLivro set titulo = 'Mrs. Dalloway', preco = 20.99, id_genero = 5 where id_livro = 7;
update tbLivro set titulo = 'O Velho e o Mar', preco = 14.00, id_genero = 5 where id_livro = 8;
update tbLivro set titulo = 'Eu Sei Por Que o Pássaro Canta na Gaiola', preco = 24.90, id_genero = 5 where id_livro = 9;
update tbLivro set titulo = 'O Grande Gatsby', preco = 20.99, id_genero = 5 where id_livro = 10;

-- delete
delete from tbLivro where id_livro = 6;
delete from tbLivro where id_livro = 7;
delete from tbLivro where id_livro = 8;
delete from tbLivro where id_livro = 9;
delete from tbLivro where id_livro = 10;

-- tbEscreve

-- insert
insert into tbEscreve(id_livro, id_autor) values (5, 1);
insert into tbEscreve(id_livro, id_autor) values (1, 2);
insert into tbEscreve(id_livro, id_autor) values (2, 3);
insert into tbEscreve(id_livro, id_autor) values (3, 4);
insert into tbEscreve(id_livro, id_autor) values (4, 5);
insert into tbEscreve(id_livro, id_autor) values (2, 2);
insert into tbEscreve(id_livro, id_autor) values (1, 1);
insert into tbEscreve(id_livro, id_autor) values (2, 4);
insert into tbEscreve(id_livro, id_autor) values (1, 3);
insert into tbEscreve(id_livro, id_autor) values (5, 2);

-- update
update tbEscreve set id_livro = 1, id_autor = 4 where id_livro = 2 and id_autor = 2;
update tbEscreve set id_livro = 5, id_autor = 3 where id_livro = 1 and id_autor = 1;
update tbEscreve set id_livro = 5, id_autor = 5 where id_livro = 2 and id_autor = 4;
update tbEscreve set id_livro = 4, id_autor = 4 where id_livro = 1 and id_autor = 3;
update tbEscreve set id_livro = 4, id_autor = 3 where id_livro = 5 and id_autor = 2;

-- delete
delete from tbEscreve where id_livro = 1 and id_autor = 4;
delete from tbEscreve where id_livro = 5 and id_autor = 3;
delete from tbEscreve where id_livro = 5 and id_autor = 5;
delete from tbEscreve where id_livro = 4 and id_autor = 4;
delete from tbEscreve where id_livro = 4 and id_autor = 3;

-- tbVenda

-- insert
insert into tbVenda(data_venda, total, id_cliente) values ('2023/01/10', 120.50, 1);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/03/25', 75.80, 5);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/05/08', 210.25, 2);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/07/17', 150.00, 4);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/09/03', 92.30, 3);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/10/21', 180.75, 1);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/11/13', 45.60, 5);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/01/06', 300.20, 4);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/04/29', 65.90, 2);
insert into tbVenda(data_venda, total, id_cliente) values ('2023/12/12', 135.40, 3);

-- update
update tbVenda set data_venda = '2023/02/15' where id_venda = 6;
update tbVenda set data_venda = '2023/04/07' where id_venda = 7;
update tbVenda set data_venda = '2023/06/19' where id_venda = 8;
update tbVenda set data_venda = '2023/08/28' where id_venda = 9;
update tbVenda set data_venda = '2023/11/04' where id_venda = 10;

-- delete
delete from tbVenda where id_venda = 6;
delete from tbVenda where id_venda = 7;
delete from tbVenda where id_venda = 8;
delete from tbVenda where id_venda = 9;
delete from tbVenda where id_venda = 10;

-- tbItensDaVenda

-- insert 
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (1, 5, 2, 'R$419,80');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (2, 4, 5, 'R$299,10');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (3, 3, 50, 'R$2.249,50');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (4, 5, 3, 'R$629,70');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (5, 1, 1, 'R$35,05');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (1, 5, 6, 'R$1.259,4');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (2, 4, 9, 'R$538,38');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (3, 3, 1, 'R$44,99');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (4, 5, 25, 'R$1.049,5');
insert into tbItensDaVenda(id_venda, id_livro, qtd, subtotal) values (5, 1, 3, 'R$105,15');

-- update
update tbItensDaVenda set subtotal = 'R$155,60' where subtotal = 'R$1.259,4';
update tbItensDaVenda set subtotal = 'R$82,45' where subtotal = 'R$538,38';
update tbItensDaVenda set subtotal = 'R$220,90' where subtotal = 'R$44,99';
update tbItensDaVenda set subtotal = 'R$135,75' where subtotal = 'R$1.049,5';
update tbItensDaVenda set subtotal = 'R$75,30' where subtotal = 'R$105,15';

-- delete
delete from tbItensDaVenda where subtotal = 'R$155,60';
delete from tbItensDaVenda where subtotal = 'R$82,45';
delete from tbItensDaVenda where subtotal = 'R$220,90';
delete from tbItensDaVenda where subtotal = 'R$135,75';
delete from tbItensDaVenda where subtotal = 'R$75,30';

-- Selects:


-- tbGenero

-- Mostrar tudo e por order by:
select * from tbGenero order by id_genero;

-- tbCliente

-- Mostrar tudo:
select * from tbCliente order by id_cliente;

-- Pesquisa por código:
select * from tbCliente where id_cliente = 3;

-- tbAutor

-- Mostrar tudo:
select * from tbAutor order by id_autor;

-- Utilizando alias e criando coluna virtual:
select nome as 'Nome do Autor', email as 'E-mail do Autor', 'SIM' as 'Existe estoque do autor?' from tbAutor;

-- tbLivro

-- Mostrar tudo:
select * from tbLivro order by id_livro;

-- Usando distinct:
select distinct estoque from tbLivro;

-- tbEscreve

-- Mostrar tudo:
select * from tbEscreve order by id_autor;

-- Usando o operador in:
select * from tbEscreve where id_livro in(2,1,5);

-- tbVenda
-- tbItensDaVenda