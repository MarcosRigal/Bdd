SELECT v.nombrecompleto, v.DNI, v.LOCALIDAD FROM votantes v
WHERE SUBSTR(v.dni,1,1)=v.localidad;

# con SUBSTR(caden, primer item a seleccionar, ultimo item a seleccionar) si hacemos SUBSTR(v.dni,1,1) estamos cogiendo un dni 19823476012 
# y seleccionando solo el 1, para despues compararlo con la localidad
