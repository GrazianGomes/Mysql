show databases;
use agenda;
create table tbcontatos(
	id int primary key,
    nome varchar(50) not null,
    fone varchar(15) not null,
    email varchar(50)not null
);
show tables;
describe tbcontatos;

/*********** CRUD **********/
-- create 
insert into tbcontatos(id,nome,fone,email)
values (1,'Jokes','1111-1111','MecTrab@outlook.com');

-- read 
select * from tbcontatos;

-- update
update tbcontatos set fone='94281-4438' where id = 1;

-- delete
delete from tbcontatos where id = 1;
