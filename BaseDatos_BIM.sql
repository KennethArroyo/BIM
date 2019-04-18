use BIM

-- select * from Libro
-- insert into Libro(clasificacion,titulo,estado,comentario,cantidad_copias,fisico,digital,dir_Portada,dir_PDF,habilitado,asignatura_ID)
-- as ()
--Tabla Usuario
--pk: id asignado automáticamente, cada vez que se crea un nuevo usuario
--identificación, correo: llaves únicas  
create table Usuario(
id int primary key identity(1,1),
tipo int not null,
identificacion nvarchar(15) unique not null,
nombre nvarchar(20) not null,
apellidos nvarchar(22) not null,
lugar_residencia nvarchar(30),
telefono nvarchar(9),
correo nvarchar(50) not null unique,
contrasena nvarchar(64) not null,
ref_trab_est nvarchar(30),
habilitado int not null,
cod_verificacion nvarchar(10)
)

CREATE TABLE Usuario_bit(
id int,
tipo int,
identificacion nvarchar(15),
nombre nvarchar(20),
apellidos nvarchar(22),
lugar_residencia nvarchar(30),
telefono nvarchar(9),
correo nvarchar(50),
contrasena nvarchar(64),
ref_trab_est nvarchar(30),
habilitado int,
cod_verificacion nvarchar(10),
accion         nvarchar(1),
fec_accion     date,
usu_accion     nvarchar(20)
)

----Tabla Asignatura
----pk: id asignado automáticamente, cada vez que se crea una nueva asignatura
----nombre: llave única
CREATE TABLE Asignatura(
asignatura_id int primary key identity(1,1),
nombre nvarchar(50) NOT NULL UNIQUE
)

----Tabla Actividades
----pk: id asignado automáticamente, cada vez que se crea una nueva actividad
----direccion en servidor
CREATE TABLE Actividad(
id int primary key identity(1,1),
direccion nvarchar(200),
nombre nvarchar(20)
)

----Tabla Libro
----pk: id asignado automáticamente, cada vez que se crea un nuevo libro
----clasificacion: llave única
----asignatura_ID: llave foránea asociada a la tabla Asignatura
CREATE TABLE Libro(
libro_id int primary key identity(1,1),
clasificacion nvarchar(15) NOT NULL UNIQUE,
titulo nvarchar(50),
estado int,
cuenta_autores int,
comentario nvarchar(50),
cantidad_copias int,
fisico int,
digital int,
derechos_autor int,
dir_Portada nvarchar(200),
dir_PDF nvarchar(200),
habilitado int,
asignatura_ID int foreign key references Asignatura(asignatura_id)
)

-- tabla bitacoras libro
--Acciones I: insert, U: update, D: delete 

create table Libro_bit(
libro_id int,
clasificacion nvarchar(15),
titulo nvarchar(50),
estado int,
cuenta_autores int,
comentario nvarchar(50),
cantidad_copias int,
fisico int,
digital int,
derechos_autor int,
dir_Portada nvarchar(200),
dir_PDF nvarchar(200),
habilitado int,
accion         nvarchar(1),
fec_accion     date,
usu_accion     nvarchar(20)
);
--Tabla Autores
--pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
--libro_ID: llave foránea asociada a la tabla Libro
--autor_ID: llave foránea asociada a la tabla Autor
CREATE TABLE Autor(
autor_id int primary key identity(1,1),
nombre_autor nvarchar(50) NOT NULL UNIQUE
)

----Tabla Libro_Autor
----pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
----libro_ID: llave foránea asociada a la tabla Libro
----autor_ID: llave foránea asociada a la tabla Autor
CREATE TABLE Libro_Autor(
libro_ID int foreign key references Libro(libro_id),
autor_ID int foreign key references Autor(autor_id),
constraint pk_libro_autor primary key( libro_ID, autor_ID )
)

----Tabla Estado del préstamo
----pk: id asignado automáticamente, cada vez que se crea un nuevo estado
create table Estado(
id int primary key identity(1,1),
estado_prestamo nvarchar(10) not null       
)

----Tabla Préstamo
----pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
----usuario_ID: llave foránea asociada a la tabla Usuario
----libro_ID: llave foránea asociada a la tabla Libro
----estado_ID: llave foránea asociada a la tabla Estado
create table Prestamo(
id int primary key identity(1,1),
fecha_inicio date not null,
fecha_final date not null,
usuario_ID int foreign key references Usuario(id),
libro_ID int foreign key references Libro(libro_id),
estado_ID int foreign key references Estado(id)   
)

CREATE TABLE Prestamo_bit(
id int,
fecha_inicio date,
fecha_final date,
accion         nvarchar(1),
fec_accion     date,
usu_accion     nvarchar(20)
)

create table Claves_Temporales(
id nvarchar(64) primary key,
fecha datetime not null,
usuario_ID int foreign key references Usuario(id)
)


create table Sancion(
id int primary key identity(1,1),
fecha_inicio date not null,
fecha_final date not null,
estado int not null   
)


create trigger Libro_trg on Libro AFTER INSERT, UPDATE, DELETE as
BEGIN
  insert into Libro_bit(libro_id, clasificacion,titulo,estado, cuenta_autores, comentario,cantidad_copias,
				fisico, digital, derechos_autor, dir_Portada,dir_PDF, habilitado, accion, fec_accion, usu_accion)
		SELECT
	i.libro_id,
    clasificacion,
    titulo,
    estado, 
    cuenta_autores, 
    comentario,
    cantidad_copias,
    fisico,
    digital,
    derechos_autor, 
    dir_Portada,
    dir_PDF, 
    i.habilitado,
	'I',
	GETDATE(),
    SYSTEM_USER
		FROM inserted AS i
UNION ALL
    SELECT
    d.libro_id,
    clasificacion,
    titulo,
    estado, 
    cuenta_autores, 
    comentario,
    cantidad_copias,
    fisico,
    digital,
    derechos_autor, 
    dir_Portada,
    dir_PDF, 
    d.habilitado,
	'D',
    GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS d
UNION ALL
    SELECT
    u.libro_id,
    clasificacion,
    titulo,
    estado, 
    cuenta_autores, 
    comentario,
    cantidad_copias,
    fisico,
    digital,
    derechos_autor, 
    dir_Portada,
    dir_PDF, 
    u.habilitado,
	'U',
	GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS u
END


create trigger Usuario_trg on Usuario AFTER UPDATE, DELETE as
BEGIN
  insert into Usuario_bit(id,tipo,identificacion ,nombre ,apellidos ,lugar_residencia ,telefono ,correo,
contrasena ,ref_trab_est, habilitado, cod_verificacion, accion, fec_accion, usu_accion)
    SELECT
    d.id,
    tipo,
    identificacion,
    nombre,
    apellidos,
    lugar_residencia,
    telefono,
    correo,
    contrasena,
    ref_trab_est,
    habilitado,
    d.cod_verificacion,
	'D',
    GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS d
UNION ALL
    SELECT
    u.id,
    tipo,
    identificacion,
    nombre,
    apellidos,
    lugar_residencia,
    telefono,
    correo,
    contrasena,
    ref_trab_est,
    habilitado,
    u.cod_verificacion,
	'U',
	GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS u
END

create trigger Prestamo_trg on Prestamo AFTER UPDATE, DELETE as
BEGIN
  insert into Prestamo_bit(id,fecha_inicio,fecha_final,accion,fec_accion,usu_accion)
    SELECT
    d.id,
    fecha_inicio,
    d.fecha_final,
	'D',
    GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS d
UNION ALL
    SELECT
    u.id,
    fecha_inicio,
    u.fecha_final,
	'U',
	GETDATE(),
    SYSTEM_USER
    FROM
        deleted AS u
END

-- Crea foreign key de usuario en sancion 

--ALTER TABLE Sancion ADD usuario_ID int; 
    
--ALTER TABLE Sancion     
--ADD CONSTRAINT FK_usuario_ID FOREIGN KEY (usuario_ID)     
--    REFERENCES Usuario (id)     
--    ON DELETE CASCADE    
--    ON UPDATE CASCADE    
--;      
