SELECT
    nombrecompleto
FROM
         votantes
    JOIN consultas ON votantes.dni = consultas.votante
WHERE
    situacionlaboral LIKE 'Activo'
GROUP BY
    nombrecompleto
HAVING
    COUNT(evento) < AVG(evento);