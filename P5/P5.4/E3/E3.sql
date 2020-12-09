SELECT
    localidad,
    COUNT(dni) AS total,
    COUNT(CASE WHEN situacionlaboral LIKE 'Parado' THEN 1 END) AS parado,
    COUNT(CASE WHEN situacionlaboral LIKE 'Activo' THEN 1 END) AS activo,
    COUNT(CASE WHEN situacionlaboral LIKE 'Estudiante' THEN 1 END) AS estudiante,
    COUNT(CASE WHEN situacionlaboral LIKE 'Jubilado' THEN 1 END) AS jubilado
FROM
    votantes
GROUP BY
    localidad
ORDER BY
    localidad ASC;