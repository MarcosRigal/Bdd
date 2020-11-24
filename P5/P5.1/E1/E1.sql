SET SERVEROUTPUT ON

DECLARE

CURSOR fila is SELECT presidente FROM partidos;

BEGIN

FOR nombre IN fila LOOP
    IF SUBSTR(nombre.presidente, instr(nombre.presidente,' ',1,1)-1, 1) LIKE 'o' THEN
        IF SUBSTR(nombre.presidente, instr(nombre.presidente,' ',1,2)-1, 1) LIKE 'o' THEN
            IF SUBSTR(nombre.presidente, instr(nombre.presidente,' ',1,3)-1, 1) LIKE 'o' THEN
                DBMS_OUTPUT.PUT_LINE(nombre.presidente);
            END IF;
        END IF;
    END IF;
END LOOP;
END;