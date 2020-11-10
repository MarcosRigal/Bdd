SELECT
    nombrecompleto,
    nombre
FROM
    votantes,
    localidades
WHERE
    localidades.idlocalidad LIKE decode(votantes.localidad, 1, 9, 2, 9, 3, 9, votantes.localidad);

/*
SQL DECODE() function syntax
The following illustrates the syntax of the SQL DECODE() function:

DECODE (e , s1, r1[, s2, r2], ...,[,sn,rn] [, d]);
In this syntax:

e is the argument that to be searched for or compared with other argument s1, s2, … sn.
s1, s2, …, or sn is the expression to search for. The function compares the first argument with s1, s2, …, sn sequentially. If any comparison e = s1, e = s2, …, e = sn return true, the DECODE() function terminates the evaluation and returns the result.
r1, r2, …, or rn is the returned result when ei = si.
d is an expression to return when e does not equal to any argument s1, s,2, … or sn.
*/