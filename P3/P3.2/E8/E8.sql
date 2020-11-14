SELECT
    localidades.nombre "Nombre localidades"
FROM
    localidades,
    votantes
WHERE
    localidades.idlocalidad = votantes.localidad
HAVING
    AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1,
               'Superiores', 2, 'Doctorado', 3)) > ALL (
        SELECT
            AVG(decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1,
                       'Superiores', 2, 'Doctorado', 3))
        FROM
            localidades,
            votantes
        WHERE
            localidades.idlocalidad = votantes.localidad
        GROUP BY
            localidades.provincia
    )
GROUP by localidades.nombre order by avg ( decode(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1,
                                                  'Superiores', 2, 'Doctorado', 3) ) desc;