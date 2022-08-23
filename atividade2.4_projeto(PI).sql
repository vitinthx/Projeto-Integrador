create database petshop;


use petshop;

create table cliente(
id int not null primary key, 

nome varchar(100) not null, 

cpf varchar(14) not null , 

rg varchar(10) not null, 

telefone varchar(14) not null, 

email varchar(100) not null, 

endereco varchar(100) not null)
; 

select*from cliente;

alter table cliente
add column rg varchar(15) not null;

create table funcionarios(
id INT NOT NULL PRIMARY KEY, 

nome varchar(100) not null,  

cpf varchar(14) not null ,  

rg varchar(10) not null)
; 

alter table funcionarios
drop column rg;

alter table funcionarios
add column rg varchar(15) not null;

create table ficha_pet(
id int not null primary key,
numeracao int not null)
;

create table cliente_ficha(
ID INT NOT NULL PRIMARY KEY, 

CLIENTE_ID INT,

FICHA_ID INT,

AGENDAMENTO_ID INT)
;

create table veterinarios(
id INT NOT NULL PRIMARY KEY, 

nome varchar(100) not null,  

cpf varchar(14) not null ,  

rg varchar(10) not null)
; 

alter table veterinarios
drop column rg;

alter table veterinarios
add column rg varchar(15) not null;


create table agendamento(
id INT NOT NULL PRIMARY KEY, 

DATA DATE , 

horario TIME)
;


alter table cliente_ficha
add column AGENDAMENTO_ID int
;

alter table cliente_ficha
add foreign key(CLIENTE_ID)
references cliente(id)
;


alter table agendamento
add column funcionario_id int ;

alter table agendamento
add column veterinario_id int ;


alter table agendamento
add foreign key (funcionario_id)
references funcionarios(id);

alter table agendamento
add foreign key (veterinario_id)
references veterinarios(id);


/*###################################################################*/

/*############# POVOAMENTO DE TABELAS ########*/

use petshop;


select*from cliente;

select*from funcionarios;




insert into cliente (id,nome,cpf,rg,telefone,email,endereco)
values
('1','Luzineide Auzier Jales','345.230.766-26','37.470.015-1','(37) 2243-6688','luzineide.jales@geradornv.com.br','Rua Bernardino Rocha'),
('2','Tânia Zava de Carvalho','244.594.652-21','17.387.845-3','(97) 3038-3614','tania.carvalho@geradornv.com.br','Rua Valença'),
('3','Adolfo Eger Reis','383.708.647-08','21.167.387-0','(28) 2158-7859','adolfo.reis@geradornv.com.br','Rua Murici'),
('4','Silvia Marins Camelo','608.396.572-18','11.861.773-4','(93) 3776-7596','silvia.camelo@geradornv.com.br','Rua Natan Pereira'),
('5','Pedro Henrique Bernardes Farinha','259.131.774-79','35.921.538-5','(82) 2959-5551','pedro.farinha@geradornv.com.br','Quadra Q')
;

insert into funcionarios (id,nome,cpf,rg)
values
('1','Emmanuel Maia Laporte','200.883.721-11','27.637.337-6'),
('2','Rita Rios Morais','013.299.662-60','20.554.393-5'),
('3','Everaldo de Sá Bastida','780.456.273-01','43.891.589-6'),
('4','Jessica Eger Thomaz','545.092.714-25','38.570.664-9'),
('5','Elimar Knupp Mesquita','664.098.714-73','27.523.796-5')
;


select*from veterinarios;

insert into veterinarios (id,nome,cpf,rg)
values
('1','Silvio Consendey Rocha','693.683.634-80','15.049.236-4'),
('2','Kevin Werneck Linhares','768.643.602-02','48.066.312-9'),
('3','Nilo Paulo Marques','544.938.851-90','24.767.415-1')
;


select*from ficha_pet;

insert into ficha_pet(id,numeracao)
values
('1','001'),
('2','002'),
('3','003');

select*from agendamento;

alter table agendamento
add column datac date;

insert into agendamento (id,datac,horario,funcionario_id,veterinario_id)
values
('1','2019-05-02','16:30','1','2'),
('2','2019-07-27','14:30','4','2'),
('3','2019-05-18','14:00','2','1');


select*from cliente_ficha;

insert into cliente_ficha (id,cliente_id,ficha_id,agendamento_id)
values
('1','2','3','3'),
('2','1','2','2'),
('3','3','1','1');


/*########################################################*/



create user 'funcionario'@'localhost' identified by 'funcionario';

create user 'gerente'@'localhost' identified by 'gerente';

create user 'cliente'@'localhost' identified by 'cliente';

/*#################################################################*/


create role 'administrador';
grant all privileges on *.* to'administrador';


create role 'func';
grant insert, select, update, delete on *.* to 'func';



create role 'clientes';
grant insert 



/*############################################*/


