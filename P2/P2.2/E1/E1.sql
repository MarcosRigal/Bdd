SELECT dni, telefono
FROM votantes
WHERE TO_CHAR(telefono) LIKE '%6%6%'
AND TO_CHAR(telefono) NOT LIKE '%6%6%6%';