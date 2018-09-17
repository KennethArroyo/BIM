use BIM

CREATE TABLE Asignatura(
id int primary key identity(1,1),
nombre nvarchar(50)
)

CREATE TABLE Libro(
id int primary key identity(1,1),
clasificacion int NOT NULL,
autor nvarchar(50),
estado int,
comentario nvarchar(50),
cantidad_copias int,
fisico int,
digital int,
dir_Portada nvarchar(50),
dir_PDF nvarchar(50),
asignatura_ID int foreign key references Asignatura(id)
)