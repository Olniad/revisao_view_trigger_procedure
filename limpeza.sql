create database ex01_revisao;
use ex01_revisao;

create table clientes(
codigo int not null primary key auto_increment,
nome varchar(80) not null,
endereco varchar(150) not null,
telefone char(20) not null,
status varchar(10) not null,
limite double(5,2) not null
)engine=innodb;

create table pedido(
numero int not null primary key auto_increment,
data date not null,
quantidade int not null
)engine=innodb;

create table produto(
codigo int not null primary key auto_increment,
nome varchar(80) not null,
categoria varchar(40) not null,
preco double(5,2) not null,
quantidade int not null,
numero_fk int not null,
codigo_fk int not null,
foreign key(numero_fk) references pedido(numero),
foreign key(codigo_fk) references clientes(codigo)
)engine=innodb;


insert into clientes(codigo,nome,endereco,telefone,status,limite) 
values(null,"Danilo","rua dos santos 202","319949487","bom", 500),
(null,"Jayron","rua dos santos 202","319949487","ruim",500),
(null,"Luisa","rua dos santos 202","319949487","medio",500);
select * from clientes;
insert into pedido(numero,data,quantidade) values (null,20220704,5),
(null,20230704,5),
(null,2024704,5);
select * from pedido;
insert into produto(codigo,nome,categoria,preco,quantidade,numero_fk,codigo_fk) values(null,"itambe","leite",7.30,100,1,1),
(null,"itambe","leite",7.30,100,2,2),
(null,"itambe","leite",7.30,100,3,3);
select * from produto;

-- Clientes que fizeram pedidos + o nome do produto
select clientes.nome as 'Clientes que fizeram pedido', produto.nome as 'Nome do produto'
from clientes inner join produto on clientes.codigo = produto.codigo_fk;

-- numero do pedidos e o nome do produto solicitado
select pedido.numero as 'Numero do pedido', produto.nome as 'Nome do produto'
from pedido right join produto on pedido.numero = produto.codigo_fk;

/* create table clientes_ped(
codigo int not null primary key auto_increment,
numero_fk int not null,
codigo_fk int not null,
foreign key (numero_fk) references pedido(numero),
foreign key (codigo_fk) references clientes(codigo)
)engine=innodb;

insert into clientes_ped(codigo,numero_fk,codigo_fk) values (null,1,1),
(null,2,2),
(null,3,3); */

-- clientes que fizeram pedidos mais codigo do produto solicitado
select clientes.nome as 'Clientes que fizeram pedido', produto.codigo as 'Codigo do produto'
from clientes left join produto on clientes.codigo = produto.codigo_fk;
