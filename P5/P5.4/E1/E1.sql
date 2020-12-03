SET SERVEROUTPUT ON

DECLARE

TYPE tabla_hash IS TABLE OF NUMBER(3,0) INDEX BY VARCHAR2(100);
mitabla tabla_hash;
apellido VARCHAR2(100);
apellidoMayor VARCHAR2(100);
CURSOR apellidos IS SELECT substr(APELLIDOS,1,INSTR(APELLIDOS, ' ',1,2)-1) APELLIDO1, substr(APELLIDOS, INSTR(APELLIDOS, ' ',1,2)) APELLIDO2
FROM (
    SELECT substr(nombrecompleto, INSTR(nombrecompleto, ' ',-1,2)) APELLIDOS
    FROM votantes
);
BEGIN

FOR apellido IN apellidos LOOP
    IF mitabla.EXISTS(apellido.APELLIDO1) THEN
        mitabla(apellido.APELLIDO1) := mitabla(apellido.APELLIDO1) + 1;
    ELSE
        mitabla(apellido.APELLIDO1) := 1;
    END IF;
    IF mitabla.EXISTS(apellido.APELLIDO2) THEN
        mitabla(apellido.APELLIDO2) := mitabla(apellido.APELLIDO2) + 1;
    ELSE
        mitabla(apellido.APELLIDO2) := 1;
    END IF;
END LOOP;
apellido := mitabla.FIRST;
apellidoMayor := mitabla.FIRST;
WHILE apellido IS NOT NULL LOOP
    IF mitabla(apellidoMayor) < mitabla(apellido) THEN
        apellidoMayor := apellido;
    END IF;
    DBMS_OUTPUT.PUT_LINE(apellido||' -> '||mitabla(apellido));
    apellido := mitabla.next(apellido);
END LOOP;
DBMS_OUTPUT.PUT_LINE('El apellido que más se repite es:'||apellidoMayor||' y se repite '||mitabla(apellidoMayor)||' veces');
END;