SELECT
    localidades.nombre,
    localidades.numerohabitantes,
    comunidad
FROM
    localidades,
    provincias
WHERE
        localidades.provincia = provincias.idprovincia
    AND provincia IN ( 1, 2, 3 )
    AND localidades.numerohabitantes > ANY (
        SELECT
            numerohabitantes
        FROM
            localidades
        WHERE
            provincia = 4
    );