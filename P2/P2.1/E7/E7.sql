SELECT idpartido, count(partido) "conteo"
FROM partidos
LEFT JOIN consultas_datos /*LEFT JOIN sirve para sacar el partido que borraste antes y que ponga 0*/
ON partidos.idpartido=consultas_datos.partido
GROUP BY idpartido;


/*
¿Diferencia con el apartado 6? La diferencia es que aqui 
los datos deben de salir de la tabla de partidos y 
sacar el numero de consultas no como en el 6 que tenias 
que sacar los datos de la tabla consultas_datos
Para eso hacemos uso de LEFT JOIN si quieres comprobar 
borra un partido veras que si no usas LEFT JOIN el partido 
que has borrado no aparece ya que no puede hacer un count de
algo que no existe
*/