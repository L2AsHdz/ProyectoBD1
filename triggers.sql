---------------------------------GENERAR ASIENTOS AL INSERTAR AVION----------------------------------------

CREATE OR REPLACE FUNCTION inAsientosF()
  RETURNS TRIGGER
  AS $$

DECLARE dist record;
DECLARE fila integer = 1;
BEGIN

    FOR dist in SELECT * FROM DISTRIBUCION_ASIENTOS WHERE idTipoAvion=NEW.idTipoAvion LOOP
        FOR fil in 1..dist.filas LOOP
            FOR col in 1..dist.columnas LOOP
                INSERT INTO ASIENTO_AVION(fila, columna, idAvion) VALUES(fila, col, NEW.idAvion);
            END LOOP;
            fila := fila + 1;
        END LOOP;
    END LOOP;
    RAISE NOTICE 'Asientos creados para el avion con id %', NEW.idAvion;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inAsientosT
  AFTER INSERT
  ON AVION
  FOR EACH ROW
  EXECUTE PROCEDURE inAsientosF();

---------------------------HISTORIAL ESTADO VUELO AL ACTUALIZAR VUELO-----------------------------------------

CREATE OR REPLACE FUNCTION inHistEstVueloF()
  RETURNS TRIGGER
  AS $$

BEGIN
    IF OLD.estadoActual != NEW.estadoActual THEN
        INSERT INTO HIST_ESTADO_VUELO(fechaHora, estadoVuelo, idVuelo) VALUES(NOW(), NEW.estadoActual, NEW.idVuelo);
    END IF;
    RAISE NOTICE 'Nuevo registro en el historial para el vuelo %', NEW.idVuelo;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inHistEstVueloT
  AFTER UPDATE
  ON VUELO
  FOR EACH ROW
  EXECUTE PROCEDURE inHistEstVueloF();

---------------------------HISTORIAL ESTADO VUELO AL INSERTAR VUELO---------------------------------------------

CREATE OR REPLACE FUNCTION inHistEstVueloInF()
  RETURNS TRIGGER
  AS $$

BEGIN
    INSERT INTO HIST_ESTADO_VUELO(fechaHora, estadoVuelo, idVuelo) VALUES(NOW(), NEW.estadoActual, NEW.idVuelo);
    RAISE NOTICE 'Nuevo registro en el historial para el vuelo %', NEW.idVuelo;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inHistEstVueloInT
  AFTER INSERT
  ON VUELO
  FOR EACH ROW
  EXECUTE PROCEDURE inHistEstVueloInF();

--------------------------------HISTORIAL CUENTA AL ACTUALIZAR CUENTA--------------------------------------------

CREATE OR REPLACE FUNCTION inHistCuentaF()
  RETURNS TRIGGER
  AS $$

BEGIN
    IF OLD.idTipoCuenta != NEW.idTipoCuenta THEN
        INSERT INTO HIST_CUENTA(fecha, idTipoCuenta, idPersona) VALUES(NOW(), NEW.idTipoCuenta, NEW.idPersona);
    RAISE NOTICE 'Nuevo registro en el historial para la cuenta %', NEW.idPersona;
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inHistCuentaT
  AFTER UPDATE
  ON CUENTA
  FOR EACH ROW
  EXECUTE PROCEDURE inHistCuentaF();

--------------------------------HISTORIAL CUENTA AL INSERTAR CUENTA-----------------------------------------------

CREATE OR REPLACE FUNCTION inHistCuentaInF()
  RETURNS TRIGGER
  AS $$

BEGIN
    INSERT INTO HIST_CUENTA(fecha, idTipoCuenta, idPersona) VALUES(NOW(), NEW.idTipoCuenta, NEW.idPersona);
    RAISE NOTICE 'Nuevo registro en el historial para la cuenta %', NEW.idPersona;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inHistCuentaInT
  AFTER INSERT
  ON CUENTA
  FOR EACH ROW
  EXECUTE PROCEDURE inHistCuentaInF();

-------------------------------HISTORIAL VARIABLE GENERAL AL ACTUALIZAR VARIABLE---------------------------------


CREATE OR REPLACE FUNCTION inHistVarGenF()
  RETURNS TRIGGER
  AS $$

BEGIN
    IF OLD.valor != NEW.valor THEN
        INSERT INTO HIST_VAR_GENERAL(valorAnterior, valorNuevo, fechaHora) VALUES(OLD.valor, NEW.valor, NOW());
    RAISE NOTICE 'Nuevo registro en el historial de variables generales';
    END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inHistVarGenT
  AFTER UPDATE
  ON VARIABLE_GENERAL
  FOR EACH ROW
  EXECUTE PROCEDURE inHistVarGenF();

------------------------------------------SUMAR MILLAS AL COMPRAR UN BOLETO------------------------------------

CREATE OR REPLACE FUNCTION sumarMillasF()
  RETURNS TRIGGER
  AS $$


DECLARE
    precioB integer;
    millas integer;
    aux float;
BEGIN
    
    IF NEW.estado != OLD.estado AND NEW.estado='Facturada' THEN
        IF EXISTS (SELECT * FROM CUENTA WHERE idPersona = NEW.idPersona) THEN
            IF EXISTS (SELECT precio FROM Boleto WHERE idCompra=NEW.idCompra AND idPersona=NEW.idPersona) THEN
                SELECT precio INTO precioB FROM Boleto WHERE idCompra=NEW.idCompra AND idPersona=NEW.idPersona;
                SELECT recompensa INTO millas FROM TIPO_CUENTA tc INNER JOIN CUENTA c ON tc.idTipoCuenta=c.idTipoCuenta WHERE c.idPersona=NEW.idPersona;
                UPDATE CUENTA SET millas = millas + (precioB*millas) WHERE idPersona=NEW.idPersona;
                RAISE NOTICE '% millas sumadas a la cuenta %', (precioB*millas), NEW.idPersona;
            END IF;
        END IF;
        
        SELECT SUM(precio) INTO aux FROM BOLETO WHERE idCompra=NEW.idCompra;
        UPDATE COMPRA SET total=total::float+aux::float WHERE idCompra=NEW.idCompra;

        RAISE NOTICE 'Compra finalizada';
    END IF;

	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sumarMillasT
  AFTER UPDATE
  ON COMPRA
  FOR EACH ROW
  EXECUTE PROCEDURE sumarMillasF();

---------------------------------------Actualizar existencias vuelo-----------------------------------------

CREATE OR REPLACE FUNCTION upStockVueloF()
  RETURNS TRIGGER
  AS $$

DECLARE
    idVue integer;
BEGIN

    SELECT idVuelo INTO idVue FROM Boleto WHERE idBoleto=NEW.idBoleto;
    UPDATE EXISTENCIAS_VUELO SET existActual=(existActual - 1) WHERE idProducto=NEW.idProducto AND idVuelo=idVue;
    RAISE NOTICE 'Existencias en el vuelo % actualizadas', idVue;
    
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER upStockVueloT
  AFTER INSERT
  ON REGISTRO_MENU_GRATIS
  FOR EACH ROW
  EXECUTE PROCEDURE upStockVueloF();


------------------------------------AUMENTAR MILLAS AL LLENAR ENCUESTA------------------------------------------

CREATE OR REPLACE FUNCTION sumarMillasEncuestaF()
  RETURNS TRIGGER
  AS $$

BEGIN
    UPDATE CUENTA SET millas = (millas + 5) WHERE idPersona=NEW.idPersona;
    RAISE NOTICE '5 millas sumadas a la cuenta %', NEW.idPersona;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER sumarMillasEncuestaT
  AFTER INSERT
  ON ENCUESTA
  FOR EACH ROW
  EXECUTE PROCEDURE sumarMillasEncuestaF();


------------------------------------ASIGNAR ROL AL CREAR PASAJERO-----------------------------------------------
CREATE OR REPLACE FUNCTION createRolPasajeroF()
  RETURNS TRIGGER
  AS $$

BEGIN

    INSERT INTO ASIGNACION_TIPO_PERSONA(idTipoPersona, idPersona) VALUES(2, NEW.idPersona);
    RAISE NOTICE 'Rol Pasajero creado para la persona con id %', NEW.idPersona;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER createRolPasajeroT
  AFTER INSERT
  ON PASAJERO
  FOR EACH ROW
  EXECUTE PROCEDURE createRolPasajeroF();

-----------------------------------ASIGNAR ROL AL CREAR PERSONA------------------------------------------------

CREATE OR REPLACE FUNCTION createRolPersonaF()
  RETURNS TRIGGER
  AS $$

BEGIN

    INSERT INTO ASIGNACION_TIPO_PERSONA(idTipoPersona, idPersona) VALUES(1, NEW.idPersona);
    RAISE NOTICE 'Rol Persona creado para la persona con id %', NEW.idPersona;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER createRolPersonaT
  AFTER INSERT
  ON PERSONA
  FOR EACH ROW
  EXECUTE PROCEDURE createRolPersonaF();

------------------------------------ASIGNAR ROL AL CREAR EMPLEADO---------------------------------------------

CREATE OR REPLACE FUNCTION createRolEmpleadoF()
  RETURNS TRIGGER
  AS $$

BEGIN

    INSERT INTO ASIGNACION_TIPO_PERSONA(idTipoPersona, idPersona) VALUES(2, NEW.idPersona);
    RAISE NOTICE 'Rol Empleado creado para la persona con id %', NEW.idPersona;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER createRolEmpleadoT
  AFTER INSERT
  ON EMPLEADO
  FOR EACH ROW
  EXECUTE PROCEDURE createRolEmpleadoF();


------------------------------------OBTENER DIA EN BASE AL VUELO---------------------------------------------

CREATE OR REPLACE FUNCTION getDiaByVuelo(vuelo integer)
  RETURNS aerolinea.dia
  AS $$

DECLARE
    dia aerolinea.dia;
BEGIN

    SELECT dpv.dia INTO dia FROM VUELO v INNER JOIN DIA_PLAN_VUELO dpv ON v.idDiaPlanVuelo=dpv.idDiaPlanVuelo WHERE v.idVuelo=vuelo;

    RETURN dia;
END;
$$ LANGUAGE plpgsql;


------------------------------------CALCULAR PRECIO BOLETO---------------------------------------------

CREATE OR REPLACE FUNCTION getPrecio(vuel integer, clase integer, person integer)
  RETURNS integer
  AS $$

DECLARE
    precio integer;
    idDia integer;
    edad integer;
BEGIN

    SELECT ((CURRENT_DATE - fechaNacimiento)/365) INTO edad FROM PERSONA WHERE idPersona=person;
    SELECT idDiaPlanVuelo INTO idDia FROM VUELO WHERE idVuelo=vuel;
    
    IF edad > 16 THEN
        SELECT precioAdulto INTO precio FROM PRECIO_DIA_PLAN_VUELO WHERE idDiaPlanVuelo=idDia AND idClaseVuelo=clase;
    ELSE
        SELECT precioChamaco INTO precio FROM PRECIO_DIA_PLAN_VUELO WHERE idDiaPlanVuelo=idDia AND idClaseVuelo=clase;
    END IF;

  RETURN precio;
END;
$$ LANGUAGE plpgsql;
