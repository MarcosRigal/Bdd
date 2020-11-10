SELECT
    dni,
    COUNT(votante)
FROM
    votantes
    LEFT JOIN consultas ON votantes.dni = consultas.votante
HAVING
    COUNT(votante) > (
        SELECT
            AVG(COUNT(votante))
        FROM
            consultas
        GROUP BY
            votante
    )
GROUP by dni order by ( COUNT(votante) ) desc;
