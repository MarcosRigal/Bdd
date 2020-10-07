SELECT partido, count(partido) "conteo" FROM consultas_datos GROUP BY partido;
/*probar a borrar un partido de consultas a ver si se mantienen los resultados la idea es que
obtenga los partidos de la tabla consultas_datos y no de la tabla partidos
