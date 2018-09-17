use BIM 
BEGIN TRAN 
insert into Asignatura values('Historia')
insert into Asignatura values('Geografia')
insert into Asignatura values('Matematica')
insert into Asignatura values('Computacion')
commit 
select * from Asignatura
