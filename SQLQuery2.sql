use BIM
drop table libro
drop table Asignatura
CREATE TABLE Asignatura(
id int primary key identity(1,1),
nombre nvarchar(50) NOT NULL UNIQUE
)

CREATE TABLE Libro(
id int primary key identity(1,1),
clasificacion nvarchar(15) NOT NULL UNIQUE,
titulo nvarchar(50),
autor nvarchar(50),
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


