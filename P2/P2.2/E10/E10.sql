SELECT nombrecompleto "Nombre", MAX(certidumbre) "Certidumbre"
FROM partidos
JOIN consultas_datos
ON partidos.idpartido=consultas_datos.partido
GROUP BY nombrecompleto; 