SELECT nombrecompleto
FROM votantes
WHERE substr(to_char(dni),-length(localidad), length(localidad))
LIKE to_char(localidad+1);