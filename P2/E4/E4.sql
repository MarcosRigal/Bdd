SELECT nombrecompleto, nombre FROM votantes JOIN localidades ON votantes.localidad=localidades.idlocalidad
WHERE numerohabitantes > 300000;

/*Así conseguimos imprimir campos de dos tablas diferentes que se relacionan por medio del
  id de la localidad. nombrecompleto pertenece a la tabla votantes mientras que nombre 
  pertenece a la tabla localidades. El where simplemente filtra por numero de habitantes
  que es uno de los campos de la tabla localidades.
