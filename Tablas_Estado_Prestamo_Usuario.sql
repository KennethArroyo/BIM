use BIM 
drop table Prestamo
drop table Estado
drop table Usuario
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
create table Estado(
id int primary key identity(1,1),
estado_prestamo nvarchar(10) not null       
)
create table Prestamo(
id int primary key identity(1,1),
fecha_inicio date not null,
fecha_final date not null,
usuario_ID int foreign key references Usuario(id),
libro_ID int foreign key references Libro(id),
estado_ID int foreign key references Estado(id)   
)
