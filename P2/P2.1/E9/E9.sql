SELECT nombrecompleto, count(partido) "conteo" FROM partidos, consultas_datos WHERE partido=idpartido GROUP BY nombrecompleto HAVING COUNT(partido)>10;
/*revisar porque pasa lo mismo que entre el 6 y el 7 ¿En realidad está bien así no?
El group by da error si no es el mismo campo que el del select