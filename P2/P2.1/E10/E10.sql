SELECT nombrecompleto, count(partido) "conteo"
FROM partidos, consultas_datos
WHERE partido=idpartido AND respuesta='Si' AND certidumbre>0.8
GROUP BY nombrecompleto;
/*Es necesario agrupar por el mismo campo por el que hacemos el select
mirar group by de moodle.