SELECT nombrecompleto, COUNT(votante)
FROM votantes
JOIN consultas
ON votantes.dni=consultas.votante
WHERE situacionlaboral LIKE 'Activo'
HAVING COUNT(votante) < (SELECT AVG(COUNT(votante)) FROM consultas GROUP BY votante)
GROUP BY nombrecompleto;