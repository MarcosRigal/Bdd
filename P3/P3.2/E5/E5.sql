SELECT localidades.nombre"Localidad", localidades.numerohabitantes"Numero de habitantes", provincias.nombre"Provincia"
FROM localidades
JOIN provincias
ON localidades.provincia = provincias.idprovincia
WHERE localidades.numerohabitantes > ANY(SELECT numerohabitantes FROM localidades WHERE provincia=4) 
AND provincias.idprovincia IN (1,2,3);