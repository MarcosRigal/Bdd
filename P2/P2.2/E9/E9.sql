SELECT nombrecompleto "Nombre", nombre "Localidad"
FROM votantes
JOIN localidades
ON votantes.localidad=localidades.idlocalidad
WHERE numerohabitantes>300000;