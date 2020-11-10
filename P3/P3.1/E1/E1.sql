SELECT
    nombrecompleto
FROM
    votantes
WHERE
    substr(dni, - length(localidad + 1), length(localidad + 1)) LIKE localidad + 1;

/*
Hay que coger length de localidad +1 porque si no no estamos comparado bien ya que si localidad es nueve 
a la izquierda del like tendremos un 10 (2 cifras) y a la derecha un numero (de 1 cifra) ¿no?
*/