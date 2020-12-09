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

CURSOR VIP IS SELECT dni, nombrecompleto, situacionlaboral, fechanacimiento, email FROM VOTANTES WHERE substr(nombrecompleto,1,1) LIKE 'A' AND fechanacimiento NOT BETWEEN '01/01/60' AND '01/01/93';
TYPE tabla_hash IS TABLE OF NUMBER(3,0) INDEX BY VARCHAR2(100);
mitabla tabla_hash;
slaboral VARCHAR2 (100);
totalPrestaciones NUMBER(8) := 0;
nVIPS NUMBER(8) := 0;

BEGIN
FOR fila in VIP LOOP
    IF fila.situacionlaboral LIKE 'Estudiante' THEN
        IF mitabla.EXISTS(fila.situacionlaboral) THEN
            mitabla(fila.situacionlaboral) := mitabla(fila.situacionlaboral) + 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 1500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 1500;
        ELSE
            mitabla(fila.situacionlaboral):= 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 1500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 1500;
        END IF;
    ELSIF fila.situacionlaboral LIKE 'Activo' THEN
        IF mitabla.EXISTS(fila.situacionlaboral) THEN
            mitabla(fila.situacionlaboral) := mitabla(fila.situacionlaboral) + 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 500;
        ELSE
            mitabla(fila.situacionlaboral):= 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 500;
        END IF;
    ELSIF fila.situacionlaboral LIKE 'Parado' THEN
        IF mitabla.EXISTS(fila.situacionlaboral) THEN
            mitabla(fila.situacionlaboral) := mitabla(fila.situacionlaboral) + 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 2000, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 2000;
        ELSE
            mitabla(fila.situacionlaboral):= 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 2000, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 2000;
        END IF;
    ELSIF fila.situacionlaboral LIKE 'Jubilado' THEN
        IF mitabla.EXISTS(fila.situacionlaboral) THEN
            mitabla(fila.situacionlaboral) := mitabla(fila.situacionlaboral) + 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 500;
        ELSE
            mitabla(fila.situacionlaboral):= 1;
            nVIPS := nVIPS+1;
            insert into VIP
            values(fila.dni, fila.nombrecompleto, 500, fila.fechanacimiento, fila.email);
            totalPrestaciones := totalPrestaciones + 500;
        END IF;
    END IF;
END LOOP;


slaboral := mitabla.FIRST;
WHILE slaboral IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE('Hay '||mitabla(slaboral)||' '||slaboral);
    slaboral := mitabla.next(slaboral);
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se necesitará: '||totalPrestaciones||'€ para pagar todas las prestaciones');
DBMS_OUTPUT.PUT_LINE('La prestacion media es de: '||totalPrestaciones/nVIPS||'€');
END;

/*
mitabla(fila.situacionlaboral) := mitabla(fila.situacionlaboral)+1;
        insert into VIP
        values(fila.dni, fila.nombrecompleto, decode(fila.situacionlaboral,'Estudiante',1500,'Parado',2000,'Activo',500,'Jubilado',500), fila.fechanacimiento, fila.email);
        nVIPS:= nVIPS+1;
        totalPrestaciones := totalPrestaciones + fila.prestacion;
    ELSE
        mitabla(fila.situacionlaboral) := 1;
        insert into VIP
        values(fila.dni, fila.nombrecompleto, decode(fila.situacionlaboral,'Estudiante',1500,'Parado',2000,'Activo',500,'Jubilado',500), fila.fechanacimiento, fila.email);
        nVIPS:= nVIPS+1;
        totalPrestaciones := totalPrestaciones + fila.prestacion;
*/