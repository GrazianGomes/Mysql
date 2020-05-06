create database dblojinha;
use dblojinha;

create table tbclientes(
	idcli int primary key auto_increment,
    nome varchar(50) not null,
    cpf varchar(11) not null,
    fone varchar (15),
    estado varchar(2),
    cidade varchar(30),
    endereco varchar(60)not null,
    numero varchar(10) not null
);
alter table tbclientes modify column estado varchar(2) not null;
alter table tbclientes modify column cidade varchar(30) not null;

describe tbclientes;

insert into tbclientes(nome,cpf,fone,estado,cidade,endereco,numero) value('Pedro','36727215512',11945587714,'SP','São Paulo','Rua Nova letra',655);
insert into tbclientes(nome,cpf,fone,estado,cidade,endereco,numero) value('Vinicius souza','55769699910',55987657777,'SP','São Paulo','Rua pedro',90);
insert into tbclientes(nome,cpf,fone,estado,cidade,endereco,numero) value('Carlos','12547832644',21912656666,'RJ','Rio de Janeiro','Rua ventura',125);
insert into tbclientes(nome,cpf,fone,estado,cidade,endereco,numero) value('João','45795314577',11977842522,'SP','São Paulo','Rua  Lucas santos',777);

select * from tbclientes;

create table tbprodutos(
	idpro int primary key auto_increment,
    produto varchar(30)not null,
    marca varchar(15),
    cor varchar(10),
    valor decimal (10,2),
    quantidade int not null
);

alter table tbprodutos modify column valor decimal(10,2) not null; -- Alterando tipos da tb
alter table tbprodutos modify column cor varchar (15);
describe tbprodutos;

insert into tbprodutos(produto, marca,cor,valor,quantidade) value('Camiseta', 'Nike','Preta',130.00,50);
insert into tbprodutos(produto, marca,cor,valor,quantidade) value('Calça','Adidas','Branca',90.00,50);
insert into tbprodutos(produto, marca,cor,valor,quantidade) value('Polo ','Puma','Preta',50.00,50);
insert into tbprodutos(produto, marca,cor,valor,quantidade) value('Tênis ','Nike','Preto',1000.00,50);
insert into tbprodutos(produto, marca,cor,valor,quantidade) value('Relógio','Rolex','Ouro',530.00,50);

select *from tbprodutos;


/*
		Os blocos de códigos abaixo cria um relacinamento (N:N)
        entre tbclientes e tbprodutos.
*/

create table tbpedido(
	idpedido int primary key auto_increment,
    dataped timestamp default current_timestamp,
    idcli int not null,
    idpro int not null,
    /* 
    Para criar as chaves estrangeiras usar foreign key
	*/ 
	foreign key(idcli) references tbclientes (idcli),
	foreign key(idpro) references tbprodutos (idpro)
);
show tables;


insert into tbpedido (idcli,idpro) values (4,1);
insert into tbpedido (idcli,idpro) values (2,1);
insert into tbpedido (idcli,idpro) values (4,4);
insert into tbpedido (idcli,idpro) values (1,4);
insert into tbpedido (idcli,idpro) values (6,1);
insert into tbpedido (idcli,idpro) values (6,4);
insert into tbpedido (idcli,idpro) values (4,5);
insert into tbpedido (idcli,idpro) values (7,4);
insert into tbpedido (idcli,idpro) values (7,3);

select *from tbpedido; -- Vendo os pedidos.


select *from tbpedido
inner join tbclientes
on tbpedido.idcli = tbclientes.idcli
inner join tbprodutos
on tbpedido.idpro = tbprodutos.idpro;

select
P.idpedido as 'Número do Pedido',
dataped as 'Data',
C.nome as Cliente,
E.produto as Compra,marca,quantidade,valor as Preço
from tbpedido as P
inner join tbclientes as C
on (P.idcli = C.idcli)
inner join tbprodutos as E
on (P.idpro = E.idpro);

select sum(valor) as Total from tbprodutos;