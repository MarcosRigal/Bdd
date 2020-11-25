SET SERVEROUTPUT ON

DECLARE

CURSOR votante IS SELECT * FROM VOTANTESANTIGUOS;
contador NUMBER(8) := 0;

BEGIN
FOR fila IN votante LOOP
    IF fila.situacionLaboral LIKE 'Jubilado' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       UPDATE votantesAntiguos
       SET dni=fila.dni, nombreCompleto = fila.nombreCompleto, estudiosSuperiores = fila.estudiosSuperiores, situacionLaboral = fila.situacionLaboral, email = fila.email, localidad = fila.localidad, fechanacimiento = fila.fechanacimiento, telefono = fila.telefono, sueldo = 1000
       WHERE dni = fila.dni;
       contador := contador+1;
    ELSIF fila.situacionLaboral LIKE 'Activo' AND fila.estudiosSuperiores LIKE 'Ninguno' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       UPDATE votantesAntiguos
       SET dni=fila.dni, nombreCompleto = fila.nombreCompleto, estudiosSuperiores = fila.estudiosSuperiores, situacionLaboral = fila.situacionLaboral, email = fila.email, localidad = fila.localidad, fechanacimiento = fila.fechanacimiento, telefono = fila.telefono, sueldo = fila.sueldo + 100
       WHERE dni = fila.dni;
       contador := contador+1;
    ELSIF fila.situacionLaboral LIKE 'Activo' AND fila.estudiosSuperiores LIKE 'Basicos' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       UPDATE votantesAntiguos
       SET dni=fila.dni, nombreCompleto = fila.nombreCompleto, estudiosSuperiores = fila.estudiosSuperiores, situacionLaboral = fila.situacionLaboral, email = fila.email, localidad = fila.localidad, fechanacimiento = fila.fechanacimiento, telefono = fila.telefono, sueldo = fila.sueldo + 200
       WHERE dni = fila.dni;
       contador := contador+1;
    ELSIF fila.situacionLaboral LIKE 'Activo' AND fila.estudiosSuperiores LIKE 'Superiores' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       UPDATE votantesAntiguos
       SET dni=fila.dni, nombreCompleto = fila.nombreCompleto, estudiosSuperiores = fila.estudiosSuperiores, situacionLaboral = fila.situacionLaboral, email = fila.email, localidad = fila.localidad, fechanacimiento = fila.fechanacimiento, telefono = fila.telefono, sueldo = fila.sueldo + 300
       WHERE dni = fila.dni;
       contador := contador+1;
    ELSIF fila.situacionLaboral LIKE 'Activo' AND fila.estudiosSuperiores LIKE 'Doctorado' THEN
       DBMS_OUTPUT.PUT_LINE(fila.nombreCompleto);
       UPDATE votantesAntiguos
       SET dni=fila.dni, nombreCompleto = fila.nombreCompleto, estudiosSuperiores = fila.estudiosSuperiores, situacionLaboral = fila.situacionLaboral, email = fila.email, localidad = fila.localidad, fechanacimiento = fila.fechanacimiento, telefono = fila.telefono, sueldo = fila.sueldo + 1000
       WHERE dni = fila.dni;
       contador := contador+1;
    END IF;
END LOOP;
DBMS_OUTPUT.PUT_LINE('Se han actualizado '||contador||' votantes');
END;