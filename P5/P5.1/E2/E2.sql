SET SERVEROUTPUT ON

DECLARE 

TYPE tabla_hash IS TABLE OF FLOAT INDEX BY VARCHAR2(100);
mitabla tabla_hash;
nombre VARCHAR2(100);
CURSOR resultados IS SELECT nombrecompleto, resultado FROM partidos, eventos_resultados WHERE partidos.idpartido= eventos_resultados.partido;

BEGIN

FOR resultado IN resultados LOOP
    IF mitabla.EXISTS(resultado.nombrecompleto) THEN
        mitabla(resultado.nombrecompleto) := mitabla(resultado.nombrecompleto) + resultado.resultado;
    ELSE
        mitabla(resultado.nombrecompleto) := resultado.resultado;
    END IF;
END LOOP;
nombre := mitabla.FIRST;
WHILE nombre IS NOT NULL LOOP
    DBMS_OUTPUT.PUT_LINE(nombre||' -> '||mitabla(nombre));
    nombre := mitabla.next(nombre);
END LOOP;
END;

/*
En este ejercicio tenemos que conseguir un resultado similar a:
Podemos	0.89
Izquierda Unida	1.3
Partido Popular	3.32
Partido Socialista Obrero Español	3.16
Ciudadanos	1.35

El cual sería tan simple como hacer: 

SELECT nombrecompleto, SUM(resultado)
FROM partidos, eventos_resultados
WHERE partidos.idpartido= eventos_resultados.partido
GROUP BY nombrecompleto;

Y hacer un puntero que iterase la tabla resultante para imprimirlo con el formato solicitado pero
tenemos restringido el uso de sentencias sql así que solo podemos extraer la tabla principal sin hacer la suma
o la agrupación. Para hacerlas creamos la tabla hash que hace lo siguiente:

definimos un nuevo tipo de dato: TYPE tabla_hash IS TABLE OF FLOAT INDEX BY VARCHAR2(100);
que va a ser una tabla de flotantes indexados por cadenas de caracteres tambien declaramos una
cadena de caracteres (nombre) para iterar con la tabla hash y un cursor para iterar con la tabla
resultante del select

La tabla hash es similar a un diccionario de python

En el primer bucle lo que hacemos es ir iterando la tabla resultante del select con el puntero
y si el partido ya se encuentra en la tabla hash simplemente hacemos que el valor de la suma sea 
igual al anterior mas el del valor que acabamos de leer

Si no existe el partido en la tabla hash lo incluimos y guardamos el resultado que acabamos de leer

En el segundo bucle leemos el primer elemento de la tabla hash antes de entrar para que se cumpla la
condición del bucle ya que si no nombre sería null (Tal y como hacías en la clase ruleta al leer el 
fichero de jugadores)
Y vamos leyendo hasta que ya no quede nada

nombre = nombre del partido
mitabla(nombre) = el dato almacenado para ese nombre

*/