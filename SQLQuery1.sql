use BIM

CREATE TABLE Asignatura(
ID int primary key identity(1,1),
Nombre nvarchar(15)
)

CREATE TABLE Libro(
ID int primary key identity(1,1),
Clasificacion int NOT NULL,
Autor nvarchar(30),
Estado int,
Comentario nvarchar(25),
Cantidad_copias int,
Fisico int,
Digital int,
Dir_Portada nvarchar(30),
Dir_PDF nvarchar(40),
Asignatura_ID int foreign key references Asignatura(ID)
)