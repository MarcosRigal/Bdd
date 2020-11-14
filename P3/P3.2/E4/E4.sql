SELECT nombrecompleto, localidad, decode(trunc((sysdate - to_date(fechanacimiento)) / 365.25), 0, 'menor edad', 1, 'menor edad',
           2, 
           'menor edad',
           3,
           'menor edad',
           4,
           'menor edad',
           5,
           'menor edad',
           6,
           'menor edad',
           7,
           'menor edad',
           8,
           'menor edad',
           9,
           'menor edad',
           10,
           'menor edad',
           11,
           'menor edad',
           12,
           'menor edad',
           13,
           'menor edad',
           14,
           'menor edad',
           15,
           'menor edad',
           16,
           'menor edad',
           17,
           'menor edad',
           'mayor edad') AS edad
FROM
    votantes
WHERE
    localidad IN (2,4,8);
    
/*
Purpose

The TRUNC (date) function returns date with the time portion of the day truncated to the unit specified by the format model fmt. The value returned is always of datatype DATE, even if you specify a different datetime datatype for date. If you omit fmt, then date is truncated to the nearest day. Please refer to "ROUND and TRUNC Date Functions" for the permitted format models to use in fmt.

Examples

The following example truncates a date:

SELECT 
TRUNC((SYSDATE - TO_DATE(DOB, 'YYYY-MM-DD'))/ 365.25) AS AGE_TODAY FROM DUAL;
 
*/