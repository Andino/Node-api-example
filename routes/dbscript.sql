
create table grupo(
	codigo	char(10) not null,
	nombre varchar(100) not null,
	ubicacion_poligono coordenada[], 
	constraint pk_gurpo primary key (codigo));

create table informacion_taxonomica(
	codigo	char(20) not null,
	especie varchar(100) ,
	nombre_cientifico varchar(100) not null,
	familia varchar(100),
	division varchar(100),
	constraint pk_informacion_taxonomica primary key (codigo));


create table arbol(
	codigo	char(20) not null,
	codigo_grupo char(10),
	codigo_informacion_taxonomica char(5) not null,
	nombre_comun varchar(100),
	dap numeric(5,2),
	ubicacion coordenada,
	comentario varchar(100),
	constraint pk_arbol primary key (codigo),
	constraint fk_arbol_grupo foreign key (codigo_grupo) references grupo(codigo) on delete cascade on update cascade,
	constraint fk_arbol_informacion_taxonomica foreign key (codigo_informacion_taxonomica ) references informacion_taxonomica(codigo) on delete cascade on update cascade);

create table usuario(
	carnet	char(20) not null,
	usuario varchar(30) not null ,
	nombre varchar(25) not null,
	apellido varchar(25) not null,
	correo email not null,
	contrasenna varchar(20) not null,
	constraint pk_usuario primary key (carnet));

create table movimiento(
	id serial not null,
	carnet_usuario char(20) not null,
	movimiento varchar(100) not null,
	fecha date,
	hora time,
	constraint pk_movimiento primary key (id),
	constraint fk_movimiento_usuario foreign key (carnet_usuario) 
	references usuario(carnet) on delete restrict on update cascade deferrable);


CREATE TABLE pertenece_grupo(
	codigo_macro_grupo char(10) not null,
	codigo_sub_grupo char (10) not null,
	constraint pk_pertenece_grupo primary key (codigo_macro_grupo,codigo_sub_grupo),
	constraint fk_macro_grupo foreign key (codigo_macro_grupo) references grupo(codigo) on delete cascade on update cascade,
constraint fk_sub_grupo foreign key (codigo_sub_grupo) references grupo(codigo) on delete cascade on update cascade);