SELECT nombrecompleto, count(evento) "Consultas"
FROM votantes
JOIN consultas
ON votantes.dni=consultas.votante
GROUP BY nombrecompleto
HAVING count(evento)>3
ORDER BY count(evento) ASC;