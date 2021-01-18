SELECT nombrecompleto"Nombre", localidad"Localidad", DECODE(SIGN(18-TRUNC((SYSDATE-fechanacimiento)/365.6)),1,'Menor de Edad','Mayor de Edad')"Mayoría edad"
FROM votantes
WHERE localidad IN (2,4,8);
    
/*
Purpose

The TRUNC (date) function returns date with the time portion of the day truncated to the unit specified by the format model fmt. The value returned is always of datatype DATE, even if you specify a different datetime datatype for date. If you omit fmt, then date is truncated to the nearest day. Please refer to "ROUND and TRUNC Date Functions" for the permitted format models to use in fmt.

Examples

The following example truncates a date:

SELECT 
TRUNC((SYSDATE - TO_DATE(DOB, 'YYYY-MM-DD'))/ 365.25) AS AGE_TODAY FROM DUAL;
 
*/