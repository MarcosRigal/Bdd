set serveroutput on;

DECLARE

NOMBRE votantes.nombrecompleto%TYPE;

BEGIN
SELECT ('Pepe'||substr(nombrecompleto, instr(nombrecompleto,' '))) INTO NOMBRE FROM votantes WHERE dni = 30983712;
DBMS_OUTPUT.PUT_LINE(NOMBRE);
END;
