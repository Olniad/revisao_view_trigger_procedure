-- numero do pedidos e o nome do produto solicitado
create view vw_pedidos as 
select pedido.numero as 'Numero do pedido', produto.nome as 'Nome do produto'
from pedido right join produto on pedido.numero = produto.codigo_fk;

select * from vw_pedidos;

-- trigger 
create table  log_cliente(
idlog int not null primary key auto_increment,
nome varchar(30) not null,
codigo int not null,
data datetime not null,
codigofk int(11),
foreign key (codigofk) references clientes(codigo)
)engine=innodb;

insert into clientes(codigo,nome,endereco,telefone,status,limite) values (null,"danilo","endereco",31518484,"ativo",100.2);
select * from log_cliente;
-- drop table log_cliente;


-- procedure 
delimiter $$
create procedure prbaixaestoque (codigo int,entrada decimal (10,2))
begin 
update produto
set produto.quantidade = quantidade - entrada 
where produto.codigo = codigo;
end 
$$
call prbaixaestoque(1,3);

-- procedimento para tozlizar o valor do pedido

create table produto_pedido(

)engine=innodb;
delimiter $$

create procedure pr_totalizapedido(
in npedido int,
out ntotal decimal(10,2)
)
begin 
	select sum(pp.quantidade * pp.preco) into ntotal
	from produto pp join pedido
	on pp.numero_fk = pedido.numero;
end
$$


call pr_totalizapedido(1,@ntotal);

drop procedure pr_totalizapedido;

