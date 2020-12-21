create or replace trigger trigger6
before insert or update on votantes 
for each row 
begin
   if ((trunc(sysdate - :new.fechanacimiento) / 365.25)>59) AND :new.situacionLaboral != 'Jubilado' then
      insert into audit_table values('El votante con dni: '||:new.dni||' tiene mas de 59 años y no está jubilado', 'votantes');
   end if;
end;

/*
Funcionalidad = trigger
Restrinja = constraint
*/