create proc insertar_asignatura
(
@nombre nvarchar(50)
)
as
begin
insert into Asignatura(nombre) values(@nombre)
end 

exec insertar_asignatura 'Ciencias'
select* from Asignatura

create proc lista_asignatura
(@id int
)
as
begin
select * from Asignatura
where id=@id
end 
