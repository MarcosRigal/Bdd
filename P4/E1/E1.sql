set serveroutput on;

BEGIN
DBMS_OUTPUT.PUT_LINE('Hola mundo, hoy es: ' || sysdate);
END;