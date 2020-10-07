SELECT to_char(numerohabitantes) from provincias; /* Transforma en una cadena el int*/
SELECT length(to_char(numerohabitantes)) from provincias; /*longitud de la cadena*/
SELECT substr(to_char(numerohabitantes),1,3) from provincias;/*Saca los tres primeros caracteres de una cadena*/
instr /*Devuelve la posicion de una cadena dentro de otra*/
DISTINC /*Elimina los repetidos*/