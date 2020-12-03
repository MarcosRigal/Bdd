/*
Los atributos llega y sale del tipo de entidad OfertaPasa 
indican la fecha de llegada y salida de la escala.
Se debe considerar:
   a) Sale >= llega
   b) Llega(X) >= sale(y) para y < x siendo (x,y) el orden de
      la escala de la excurisón (Basicamente que no lleguemos a B antes de haber salido de A)
*/

CREATE OR REPLACE TRIGGER trigger -2 --Creamos un trigger y si ya existe uno con ese nombre se reemplaza
BEFORE INSERT OR UPDATE ON OfertaPasa --Indicamos cuando queremos que se ejecute
FOR EACH ROW --Indicamos que lo queremos para todas las filas

DECLARE
   siguiente NUMBER(3,0); --Creamos una variable de tipo numero de tres cifras sin decimales

BEGIN
   IF INSERTING --Comprueba que estemos insertando 
      IF new.sale < new.llega THEN -- Si estamos insertando comprueba que la fecha de salida no sea menor que la de llegada
         raise_application_error(-20001, 'Debe salir despues de llegar');--Si la condición anterior se cumple salta un error ya que no podemos irnos de un sitio antes de llegar
      --No se ha cumplido la primera condición por lo tanto podemos continuar
      SELECT MAX(orden) AS actual--Cogemos el orden mayor que representa la ultima parada
         FROM OfertaPasa WHERE new.idoferta = idoferta;--De la oferta cuyo id sea igual al id que queremos insertar
      siguiente = actual+1;-- Y le sumamos 1 para obtener el orden que tendrá esta parada pasando a ser la ultima
      SELECT sale --Cogemos la hora de salida de la ultima actividad
         FROM OfertaPasa WHERE new.idoferta = idoferta AND OfertaPasa.orden = actual;
      /*
      ¿No podríamos hacer estos dos select en uno solo y sacando el orden máximo y su fecha de salida con un HAVING ORDEN = MAX(orden)?
      También he quitado un ELSE porque no era necesario
      */
      IF sale > new.llega THEN--Comparamos la hora de salida de la ultima actividad con la de llegada de la nueva
         raise_application_error(-2002, 'No puede llegar antes de salir del lugar anterior');--Como no cumple la condición salimos y devolvemos
      ElSE--Como cumple la condición actualizamos
         INSERT INTO OfertaPasa 
         VALUES
         (new.idoferta, siguiente, new.llega, new.sale, new.actividad, new.old-datos, new lugar);
         END IF;
      END IF;
   END IF;
   ELSIF UPDATING THEN
      IF new.sale < new.llega THEN -- Si estamos insertando comprueba que la fecha de salida no sea menor que la de llegada
         raise_application_error(-20001, 'Debe salir despues de llegar');--Si la condición anterior se cumple salta un error ya que no podemos irnos de un sitio antes de llegar
      --No se ha cumplido la primera condición por lo tanto podemos continuar
      SELECT orden AS actual--Cogemos el orden mayor que representa la ultima parada
         FROM OfertaPasa WHERE new.idoferta = idoferta AND orden = new.orden;--De la oferta cuyo id sea igual al id que queremos insertar
      SELECT sale --Cogemos la hora de salida de la actividad
         FROM OfertaPasa WHERE new.idoferta = idoferta AND OfertaPasa.orden = actual;
         siguiente = actual+1;-- Y le sumamos 1 para obtener el orden que tendrá esta parada pasando a ser la ultima
      SELECT llega --Cogemos la hora de salida de la actividad
         FROM OfertaPasa WHERE new.idoferta = idoferta AND OfertaPasa.orden = siguiente;
      /*
      ¿No podríamos hacer estos tres select en uno solo y sacando el orden, su fecha de salida y su fecha de llegada con un HAVING ORDEN = orden?
      También he quitado un ELSE porque no era necesario
      */
      IF sale > new.llega THEN--Comparamos la hora de salida de la ultima actividad con la de llegada de la nueva
         raise_application_error(-2002, 'No puede llegar antes de salir del lugar anterior');--Como no cumple la condición salimos y devolvemos
      ELSIF new.sale > llega THEN
         raise_application_error(-2002, 'No puede llegar antes de salir del lugar anterior');--Como no cumple la condición salimos y devolvemos
      ElSE--Como cumple la condición actualizamos
         UPDATE OfertaPasa
         SET idoferta = new.idoferta, orden = new.orden, llega = new.llega, sale = new.sale, actividad = new.actividad, old-datos = new.old-datos, lugar = new.lugar;
         WHERE idoferta = new.idoferta;
         END IF;
      END IF;
   END IF;
END;

/*
Podríamos ahorrarnos una comprobación en cada insercción si comprobasemos las dos condiciones en un solo if
sacando lo que hay dentro de los segundos
Además este programa inserta al final que pasa si queremos añadir una parada en mitad de la ruta
Tampoco tiene un IF UPDATING
*/