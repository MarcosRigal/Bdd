SELECT
    dni,
    COUNT(votante)
FROM
    votantes
    LEFT JOIN consultas ON votantes.dni = consultas.votante
WHERE dni != ( 
    SELECT
        dni
    FROM
        votantes
    WHERE
        fechanacimiento = (
            SELECT
                MIN(fechanacimiento)
            FROM
                votantes
            WHERE
                fechanacimiento > (
                    SELECT
                        MIN(fechanacimiento)
                    FROM
                        votantes
                )
        )
    )
GROUP by dni order by ( COUNT(votante) ) desc;