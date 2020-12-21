/*Como no manipulamos la variable da igual hacerlo antes o despues falta crear tabla audit table*/
create or replace trigger trigger1
before update on eventos for each row
begin
   insert into audit_table values(:old.nombre||' '||:new.nombre, 'eventos');
end;