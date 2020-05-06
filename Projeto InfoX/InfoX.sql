- Criando dbinfoX
create database dbinfox;
use dbinfox;
create table tbusuarios(
induer int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
describe tbusuarios;
insert into tbusuarios(induer,usuario,fone,login,senha)
values(1,'Grazian Gomes','9999-9999','graziangomes','12345678');
select * from tbusuarios;
insert into tbusuarios(induer,usuario,fone,login,senha)
values(2,'Vinicius Santos','9999-9999','Viniciussantos','12345678');
insert into tbusuarios(induer,usuario,fone,login,senha)
values(3,'Carlos','9999-9999','calors1','12345678');
update tbusuarios set fone='8888-8888' where induer=2;
delete from tbusuarios where induer=2;
select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Carlos pereira','rua saomatheus','9999-9999','carlos@gmail.com');
select * from tbclientes;