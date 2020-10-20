SELECT siglas
FROM partidos
WHERE idpartido = ANY
    (SELECT partido
    FROM eventos_resultados er2
    GROUP BY partido
    having count(*)=
        (select max(participaciones)
        from
            (select partido,
            count(*) participaciones
            from eventos_resultados er
            group by partido) sub1));
