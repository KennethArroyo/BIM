use BIM

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
telefono int,
correo nvarchar(50) not null unique,
contrasena nvarchar(15) not null,
ref_trab_est nvarchar(30),
habilitado int not null,
cod_verificacion nvarchar(10)
)

--Tabla Asignatura
--pk: id asignado automáticamente, cada vez que se crea una nueva asignatura
--nombre: llave única
CREATE TABLE Asignatura(
id int primary key identity(1,1),
nombre nvarchar(50) NOT NULL UNIQUE
)

--Tabla Libro
--pk: id asignado automáticamente, cada vez que se crea un nuevo libro
--clasificacion: llave única
--asignatura_ID: llave foránea asociada a la tabla Asignatura
CREATE TABLE Libro(
id int primary key identity(1,1),
clasificacion nvarchar(15) NOT NULL UNIQUE,
titulo nvarchar(50),
estado int,
comentario nvarchar(50),
cantidad_copias int,
fisico int,
digital int,
dir_Portada nvarchar(200),
dir_PDF nvarchar(200),
habilitado int,
asignatura_ID int foreign key references Asignatura(id)
)

--Tabla Autores
--pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
--libro_ID: llave foránea asociada a la tabla Libro
--autor_ID: llave foránea asociada a la tabla Autor
CREATE TABLE Autor(
id int primary key identity(1,1),
nombre nvarchar(50) NOT NULL UNIQUE
)

--Tabla Libro_Autor
--pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
--libro_ID: llave foránea asociada a la tabla Libro
--autor_ID: llave foránea asociada a la tabla Autor
CREATE TABLE Libro_Autor(
libro_ID int foreign key references Libro(id),
autor_ID int foreign key references Autor(id),
constraint pk_libro_autor primary key( libro_ID, autor_ID )
)

--Tabla Estado del préstamo
--pk: id asignado automáticamente, cada vez que se crea un nuevo estado
create table Estado(
id int primary key identity(1,1),
estado_prestamo nvarchar(10) not null       
)

--Tabla Préstamo
--pk: id asignado automáticamente, cada vez que se crea un nuevo préstamo
--usuario_ID: llave foránea asociada a la tabla Usuario
--libro_ID: llave foránea asociada a la tabla Libro
--estado_ID: llave foránea asociada a la tabla Estado
create table Prestamo(
id int primary key identity(1,1),
fecha_inicio date not null,
fecha_final date not null,
usuario_ID int foreign key references Usuario(id),
libro_ID int foreign key references Libro(id),
estado_ID int foreign key references Estado(id)   
)


