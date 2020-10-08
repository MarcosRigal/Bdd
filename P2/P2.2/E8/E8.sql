SELECT dni, count(evento) "conteo"
FROM votantes
JOIN consultas
ON votantes.dni=consultas.votante
GROUP BY dni
HAVING count(evento)>3
ORDER BY count(evento) ASC;