SELECT presidente ||' presidente del '||nombrecompleto AS politicos FROM partidos;
SELECT nombre||' pertenece a la comunidad de '||comunidad AS provincias FROM provincias;
SELECT nombre||' pertenece a la provincia de '||provincia AS localidades FROM localidades;
/*Como hago para que salga el nombre de la provincia en vez de numero
  Solución: mirar P2->E4 se hace usando join