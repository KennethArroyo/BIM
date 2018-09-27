use BIM 
create table Usuario(
cedula nvarchar(15) primary key,
nombre nvarchar(20) not null,
apellidos nvarchar(22) not null,
lugar_residencia nvarchar(30),
telefono int,
correo nvarchar(50) not null unique,
contrasena nvarchar(15) not null,
ref_trab_est nvarchar(30)
)
create table Estado(
id int primary key identity(1,1),
estado_prestamo nvarchar(10) not null       
)
create table Prestamo(
id int primary key identity(1,1),
numero int not null unique,
fecha_inicio date not null,
fecha_final date not null,
cedula_ID nvarchar(15) not null foreign key references Usuario(cedula),
libro_ID int foreign key references Libro(id),
estado_ID int foreign key references Estado(id)   
)