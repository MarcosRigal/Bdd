SELECT nombrecompleto, comunidad FROM votantes
JOIN localidades ON votantes.localidad=localidades.idlocalidad
JOIN provincias ON localidades.provincia=provincias.idprovincia
WHERE localidades.numerohabitantes>300000;
/*Es igual que el apartado anterior solo que esta vez enlazas dos tablas por eso hay dos join