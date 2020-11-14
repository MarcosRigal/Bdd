SELECT
    concat(concat(a.nombre, ' va antes que '), b.nombre) "Ordenación"
FROM
    localidades  a,
    localidades  b
WHERE
    b.idlocalidad LIKE a.idlocalidad + 1;