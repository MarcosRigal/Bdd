/*
create table votantesAntiguos
	(dni number(8) primary key,
	nombreCompleto varchar2(64),
	estudiosSuperiores varchar2(16) not null,
	situacionLaboral varchar2(16) not null,
	email varchar2(32) not null,
	localidad number(3) not null,
	fechaNacimiento date not null,
	telefono number(14),
    sueldo number(8),
	constraint ck_estudiosa CHECK (estudiosSuperiores in ('Ninguno','Basicos','Superiores','Doctorado')),
	constraint ck_laborala CHECK (situacionLaboral in ('Estudiante','Jubilado','Parado','Activo')),
	constraint fk_localidad_vota foreign key (localidad) references localidades(idLocalidad));
*/

SET SERVEROUTPUT ON

DECLARE

CURSOR votante IS SELECT * FROM VOTANTES WHERE fechanacimiento < '01/01/1980';
contador NUMBER(8) := 0;

BEGIN
FOR fila IN votante LOOP
    IF fila.situacionLaboral LIKE 'Activo' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       insert into votantesAntiguos
       values (fila.dni, fila.nombreCompleto, fila.estudiosSuperiores, fila.situacionLaboral, fila.email, fila.localidad,fila.fechanacimiento, fila.telefono, 1500);
       contador := contador+1;
    ELSE
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       insert into votantesAntiguos
       values (fila.dni, fila.nombreCompleto, fila.estudiosSuperiores, fila.situacionLaboral, fila.email, fila.localidad,fila.fechanacimiento, fila.telefono, 0);    
       contador := contador+1;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se han insertado '||contador||' votantes');
END;