set serveroutput on;

DECLARE

CORREO votantes.email%TYPE;
NOMBRE votantes.nombrecompleto%TYPE;

BEGIN
SELECT email INTO CORREO FROM votantes WHERE dni = 30983712;
SELECT nombrecompleto INTO NOMBRE FROM votantes WHERE dni = 30983712;
DBMS_OUTPUT.PUT_LINE(NOMBRE || ' con correo: '||CORREO);
END;
