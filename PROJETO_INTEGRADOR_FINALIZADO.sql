select*from mysql.user;

flush privileges;


/*CRIANDO USUARIOS E ROLES ( SEGURANÇA E PERMISSÕES DO BANCO DE DADOS )*/


/*###########################################################*/

create role 'admin';
grant all privileges on petshop.* to 'admin';

create user 'gerente'@'localhost' identified by 'gerente'; 
/*###########################################################*/

create role 'default_user';
grant insert, update on petshop.*  to 'default_user';

create user 'cliente'@'localhost' identified by 'cliente';
/*###########################################################*/

create role 'funcionarios';
grant insert, update, select, create on petshop.* to 'funcionarios';

create user 'funcionario'@'localhost' identified by 'funcionario';
/*###########################################################################################*/


-----------------------------------------------------------------------------------------------

/*############################################################################################*/

/*ATRIBUIÇÃO DE PAPEIS*/

grant 'admin' to 'gerente'@'localhost';
flush privileges
;

grant 'default_user' to 'cliente'@'localhost';
flush privileges
;

grant 'funcionarios' to 'funcionario'@'localhost';
flush privileges
;

/*##########################################################################################*/

------------------------------------------------------------------------------------------------

/*##########################################################################################*/


create view pesquisa_fichas as select cliente_id, ficha_id, agendamento_id from cliente_ficha;

select * from pesquisa_fichas;

create view pesquisa_agenda as select id, horario, datac from agendamento;

select * from pesquisa_agenda;

/*##########################################################################################*/

--------------------------------------------------------------------------------------

/* CRIANDO UMA PROCEDURE*/

DELIMITER //
create procedure exibe_cliente(codigo int)
begin

declare idCliente int;
declare nomeCliente varchar(100);
declare cpfCliente varchar(14);
declare telefoneCliente varchar(14);

select id, nome, cpf, telefone into idCliente, nomeCliente, cpfCliente, telefoneCliente from 
cliente where id=codigo;

select nomeCliente;

END //
DELIMITER ;


call exibe_cliente(1);

/*#################################################################################*/


-------------------------------------------------------------------------------------


/* CRIANDO INDICE ( INDEX ) */

/*criar indice*/
create index index_ficha on ficha_pet(numeracao);

create index index_func on funcionarios(nome);


/*pesquisa de indice*/
show index from ficha_pet;

show index from funcionarios;


/*excluir indice*/

drop index index_func on funcionarios;

/*##############################################################*/


