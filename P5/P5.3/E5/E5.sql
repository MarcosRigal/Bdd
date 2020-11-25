SET SERVEROUTPUT ON

DECLARE

CURSOR partido IS SELECT * FROM partidos;
tPresupuestos NUMBER(14);
nPartidos NUMBER(8);
contador partidos.idpartido%TYPE := 0;

BEGIN
SELECT SUM(presupuesto) INTO tPresupuestos FROM partidos;
SELECT COUNT(presupuesto) INTO nPartidos FROM partidos;
nPartidos := nPartidos + 1;

FOR fila IN partido LOOP
    UPDATE partidos
    SET idpartido=fila.idpartido, nombreCompleto = fila.nombreCompleto, siglas = fila.siglas, direccion = fila.direccion, ciudad = fila.ciudad, presidente = fila.presidente, fechacreacion = fila.fechacreacion, presupuesto = tPresupuestos/nPartidos
    WHERE idpartido = fila.idpartido;
    DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto || ' dispone de ' || fila.presupuesto);
    contador := contador+1;
END LOOP;
contador := contador+1;
insert into partidos
values (contador, 'Vox', 'Vox', 'C Calle 22', 'Madrid', 'Santiago Abascal', '20/10/2014', tPresupuestos/nPartidos);
FOR fila IN partido LOOP
    DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto || ' dispone de ' || fila.presupuesto);
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se ha actualizado el presupuesto de '||contador||' partidos');
END;