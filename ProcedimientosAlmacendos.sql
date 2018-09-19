create proc insertar_asignatura
(
@nombre nvarchar(50)
)
as
begin
insert into Asignatura(nombre) values(@nombre)
end 

exec insertar_asignatura 'Ciencias'
exec insertar_asignatura 'Historia'
select* from Asignatura

create proc lista_asignatura
(@id int
)
as
begin
select * from Asignatura
where id=@id
end 

create procedure insertar_libro(@clas nvarchar(15),@titulo nvarchar(50),@autor nvarchar(50),@estado int,@coment nvarchar(50),
@cant int,@fisico int,@digital int,@porada nvarchar(50),@pdf nvarchar(50), @asignatura int)
as
begin
insert into Libro(clasificacion,titulo,autor,estado,comentario,cantidad_copias,fisico,digital,dir_Portada,dir_PDF,asignatura_ID)
values(@clas,@titulo,@autor,@estado,@coment,@cant,@fisico,@digital,@porada,@pdf,@asignatura)
end


exec insertar_libro '1','esteban','libro1',1,'hola',2,1,1,'portada','pdf',1
exec insertar_libro '2','esteban','libro2',1,'hola',2,1,1,'portada','pdf',1
exec insertar_libro '3','maria','libro3',1,'hola',2,1,1,'portada','pdf',2
exec insertar_libro '4','maria','libro4',1,'hola',2,1,1,'portada','pdf',2

select * from Libro