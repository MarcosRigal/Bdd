SELECT idpartido, count(partido) "conteo" 
FROM partidos, consultas_datos
WHERE partidos.idpartido=consultas_datos.partido 
GROUP BY idpartido;


/*¿Diferencia con el apartado 6? La diferencia es que aqui 
los datos deben de salir de la tabla de partidos y 
sacar el numero de consultas no como en el 6 que tenias 
que sacar los datos de la tabla consultas_datos