SELECT nombrecompleto
FROM votantes
WHERE nombrecompleto
LIKE '%s%'
AND fechanacimiento < '12/02/1990';