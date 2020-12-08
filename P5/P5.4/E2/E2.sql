/*
create table VIP
	(dni number(8) primary key,
	nombreCompleto varchar2(64),
   prestacion number(5) not null,
	fechaNacimiento date not null,
	email varchar2(32) not null);
*/

SET SERVEROUTPUT ON

DECLARE

CURSOR VIP IS SELECT dni, nombrecompleto, decode(situacionlaboral,'Estudiante',1500,'Parado',2000,'Activo',500,'Jubilado',500) prestacion, fechanacimiento, email FROM VOTANTES WHERE substr(nombrecompleto,1,1) LIKE 'A' AND fechanacimiento NOT BETWEEN '01/01/60' AND '01/01/93';
totalPrestaciones NUMBER(8) := 0;
nVIPS NUMBER(8) := 0;

BEGIN
FOR fila in VIP LOOP
    insert into VIP
    values(fila.dni, fila.nombrecompleto, fila.prestacion, fila.fechanacimiento, fila.email);
    nVIPS:= nVIPS+1;
    totalPrestaciones := totalPrestaciones + fila.prestacion;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se necesitará: '||totalPrestaciones||'€ para pagar todas las prestaciones');
DBMS_OUTPUT.PUT_LINE('La prestacion media es de: '||totalPrestaciones/nVIPS||'€');
END;