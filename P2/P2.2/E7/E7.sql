SELECT dni
FROM votantes
JOIN consultas
ON votantes.dni=consultas.votante
GROUP BY dni
HAVING count(evento)>3;