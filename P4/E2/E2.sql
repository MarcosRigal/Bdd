set serveroutput on;

DECLARE

DNI votantes.dni%TYPE;
APELLIDO1 votantes.nombrecompleto%TYPE;

BEGIN
SELECT dni INTO DNI FROM votantes WHERE fechanacimiento = (SELECT MIN(fechanacimiento) FROM votantes);
SELECT substr(nombrecompleto,instr(nombrecompleto,' '),(instr(nombrecompleto,' ',1,2)-instr(nombrecompleto,' '))) INTO APELLIDO1 FROM votantes WHERE fechanacimiento = (SELECT MIN(fechanacimiento) FROM votantes);
DBMS_OUTPUT.PUT_LINE(APELLIDO1 || ' con dni: '||DNI||' es el/la votante con más años');
END;

/*
Syntax

{INSTR | INSTRB | INSTRC | INSTR2 | INSTR4} (string , substring [, position [, occurrence]])

Arguments

string
The text expression to search.

substring
The string to search for.

position
A nonzero INTEGER indicating where in string the function begins the search. INSTR calculates position using characters as defined by the input character set. INSTRB calculates position using bytes. INSTRC calculates position using Unicode complete characters. INSTR2 calculates position using UCS2 code points. INSTR4 calculates position using UCS4 code points.

When position is negative, then INSTR counts and searches backward from the end of string. The default value of position is 1, which means that the function begins searching at the beginning of string.

occurrence
An INTEGER indicating which occurrence of string the function should search for. The value of occurrence must be positive. The default values of occurrence is 1, meaning the function searches for the first occurrence of substring.

Examples

Example 7-127 Using Character Position to Search Forward to Find the Position of a Substring

The following example searches the string "Corporate Floor", beginning with the third character, for the string "or". It returns the position in "Corporate Floor" at which the second occurrence of "or" begins.

SHOW INSTR('Corporate Floor','or', 3, 2)
*/

