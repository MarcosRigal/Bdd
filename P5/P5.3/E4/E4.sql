SET SERVEROUTPUT ON

DECLARE

CURSOR votante IS SELECT dni , count(votante) participaciones FROM votantesantiguos, consultas WHERE votantesantiguos.dni = consultas.votante GROUP BY dni;
minimo NUMBER(8);
contador NUMBER(8) := 0;

BEGIN
SELECT MIN(participaciones) into minimo FROM(SELECT nombrecompleto, count(votante) participaciones FROM votantesantiguos, consultas WHERE votantesantiguos.dni = consultas.votante GROUP BY nombrecompleto);
FOR fila IN votante LOOP
    IF fila.participaciones = minimo THEN
       DBMS_OUTPUT.PUT_LINE(fila.dni);
       DELETE
       FROM votantesAntiguos
       WHERE dni = fila.dni;
       contador := contador +1;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se han borrado '||contador||' votantes');
END;