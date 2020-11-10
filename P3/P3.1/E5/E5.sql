SELECT
    dni,
    COUNT(votante)
FROM
    votantes
    LEFT JOIN consultas ON votantes.dni = consultas.votante
GROUP BY
    dni
ORDER BY
    ( COUNT(votante) ) DESC;

/*
¿Habría que utilizar el left join?
Mas que nada por si tenemos algun votante en la tabla votantes
que no haya participado en ninguna consulta
*/