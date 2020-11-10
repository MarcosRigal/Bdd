SELECT
    nombrecompleto       "Nombre",
    AVG(certidumbre)     "Certidumbre media"
FROM
    partidos,
    consultas_datos
WHERE
        partido = idpartido
    AND respuesta = 'No'
    AND certidumbre > 0.6
GROUP BY
    nombrecompleto;