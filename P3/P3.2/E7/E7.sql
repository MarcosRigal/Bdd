SELECT localidades.nombre
FROM localidades, votantes
WHERE localidades.idlocalidad = votantes.localidad
GROUP BY localidades.nombre
ORDER BY AVG(DECODE(estudiossuperiores, 'Ninguno', 0, 'Basicos', 1, 'Superiores', 2, 'Doctorado', 3)) DESC;
