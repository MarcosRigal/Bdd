SELECT nombre
FROM localidades
WHERE substr(to_char(numerohabitantes),-1,1)
LIKE to_char(provincia);