SET SERVEROUTPUT ON

DECLARE

CURSOR dnis IS SELECT dni FROM votantes ORDER BY dni DESC;
dniAnterior votantes.dni%TYPE;

BEGIN

FOR dniActual IN dnis LOOP
    IF dniAnterior IS NULL THEN
        dniAnterior := dniActual.dni;
    ELSE
        DBMS_OUTPUT.PUT_LINE(dniAnterior||' antes '||dniActual.dni);
        dniAnterior := dniActual.dni;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('El menor es: '||dniAnterior);
END;

/*
Creamos un cursor para recorer la tabla y una variable que almacenará el dni
en la primera iteración del bucle no imprimiremos nada guardaremos el dniactual en dnianterior
para que cuando lleguemos al final no pete el bucle

En la segunda iteración si imprimimos el primer dni y el segundo como si fuese el dni 1 el actual y el 
otro el siguiente pero en realidad el bucle va una iteración adelantado a los dbms ademas en cada iteracion
guardamos el actual en la anterior despues de imprimir para la siguiente iteración

Cuando acaba el bucle dni actual ya no tiene valor pero dni anterior almacena el ultimo valor del dni
que se imprimirá aparte en un dbms fuera del bucle ya que este dni al ser el ultimo tiene precedente
pero no sucesor por lo que nno puede seguir el formato anterior
*/