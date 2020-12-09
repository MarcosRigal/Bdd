SELECT
    estudiossuperiores,
    COUNT(estudiossuperiores) AS numero
FROM
    votantes
WHERE
    fechanacimiento NOT LIKE (
        SELECT
            MIN(fechanacimiento)
        FROM
            votantes
    )
    AND fechanacimiento NOT LIKE (
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
    AND fechanacimiento NOT LIKE (
        SELECT
            MAX(fechanacimiento)
        FROM
            votantes
    )
GROUP BY
    estudiossuperiores;