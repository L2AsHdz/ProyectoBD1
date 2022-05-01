---------------------------------GENERAR ASIENTOS AL INSERTAR AVION----------------------------------------

CREATE OR REPLACE FUNCTION inAsientosF()
  RETURNS TRIGGER
  AS $inAsientosF$

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

	RETURN NEW;
END;
$inAsientosF$ LANGUAGE plpgsql;

CREATE TRIGGER inAsientosT
  AFTER INSERT
  ON AVION
  FOR EACH ROW
  EXECUTE PROCEDURE inAsientosF();

---------------------------HISTORIAL ESTADO VUELO AL ACTUALIZAR VUELO-----------------------------------------

CREATE OR REPLACE FUNCTION inHistEstVueloF()
  RETURNS TRIGGER
  AS $inHistEstVueloF$

BEGIN
    IF OLD.estadoActual != NEW.estadoActual THEN
        INSERT INTO HIST_ESTADO_VUELO(fechaHora, estadoVuelo, idVuelo) VALUES(NOW(), NEW.estadoActual, NEW.idVuelo);
    END IF;
	RETURN NEW;
END;
$inHistEstVueloF$ LANGUAGE plpgsql;

CREATE TRIGGER inHistEstVueloT
  AFTER UPDATE
  ON VUELO
  FOR EACH ROW
  EXECUTE PROCEDURE inHistEstVueloF();

---------------------------HISTORIAL ESTADO VUELO AL INSERTAR VUELO---------------------------------------------

CREATE OR REPLACE FUNCTION inHistEstVueloInF()
  RETURNS TRIGGER
  AS $inHistEstVueloInF$

BEGIN
    INSERT INTO HIST_ESTADO_VUELO(fechaHora, estadoVuelo, idVuelo) VALUES(NOW(), NEW.estadoActual, NEW.idVuelo);
	RETURN NEW;
END;
$inHistEstVueloInF$ LANGUAGE plpgsql;

CREATE TRIGGER inHistEstVueloInT
  AFTER INSERT
  ON VUELO
  FOR EACH ROW
  EXECUTE PROCEDURE inHistEstVueloInF();

--------------------------------HISTORIAL CUENTA AL ACTUALIZAR CUENTA--------------------------------------------

CREATE OR REPLACE FUNCTION inHistCuentaF()
  RETURNS TRIGGER
  AS $inHistCuentaF$

BEGIN
    IF OLD.idTipoCuenta != NEW.idTipoCuenta THEN
        INSERT INTO HIST_CUENTA(fecha, idTipoCuenta, idPersona) VALUES(NOW(), NEW.idTipoCuenta, NEW.idPersona);
    END IF;
	RETURN NEW;
END;
$inHistCuentaF$ LANGUAGE plpgsql;

CREATE TRIGGER inHistCuentaT
  AFTER UPDATE
  ON CUENTA
  FOR EACH ROW
  EXECUTE PROCEDURE inHistCuentaF();

--------------------------------HISTORIAL CUENTA AL INSERTAR CUENTA-----------------------------------------------

CREATE OR REPLACE FUNCTION inHistCuentaInF()
  RETURNS TRIGGER
  AS $inHistCuentaInF$

BEGIN
    INSERT INTO HIST_CUENTA(fecha, idTipoCuenta, idPersona) VALUES(NOW(), NEW.idTipoCuenta, NEW.idPersona);
	RETURN NEW;
END;
$inHistCuentaInF$ LANGUAGE plpgsql;

CREATE TRIGGER inHistCuentaInT
  AFTER INSERT
  ON CUENTA
  FOR EACH ROW
  EXECUTE PROCEDURE inHistCuentaInF();

-------------------------------HISTORIAL VARIABLE GENERAL AL ACTUALIZAR VARIABLE---------------------------------


CREATE OR REPLACE FUNCTION inHistVarGenF()
  RETURNS TRIGGER
  AS $inHistVarGenF$

BEGIN
    IF OLD.valor != NEW.valor THEN
        INSERT INTO HIST_VAR_GENERAL(valorAnterior, valorNuevo, fechaHora) VALUES(OLD.valor, NEW.valor, NOW());
    END IF;
	RETURN NEW;
END;
$inHistVarGenF$ LANGUAGE plpgsql;

CREATE TRIGGER inHistVarGenT
  AFTER UPDATE
  ON VARIABLE_GENERAL
  FOR EACH ROW
  EXECUTE PROCEDURE inHistVarGenF();

------------------------------------------SUMAR MILLAS AL COMPRAR UN BOLETO------------------------------------

CREATE OR REPLACE FUNCTION sumarMillasF()
  RETURNS TRIGGER
  AS $sumarMillasF$


DECLARE
    precioB integer;
BEGIN
    
    IF NEW.estadoBoleto == 'Facturada' THEN
        IF EXISTS (SELECT * FROM CUENTA WHERE idPersona = NEW.idComprador) THEN
            IF EXISTS (SELECT precio FROM Boleto WHERE idCompra=NEW.idCompra AND idPersona=NEW.idPersona) THEN
                SELECT precio INTO precioB FROM Boleto WHERE idCompra=NEW.idCompra AND idPersona=NEW.idPersona;
                UPDATE CUENTA SET millas = millas + precioB WHERE idPersona=NEW.idPersona;
            END IF;
        END IF;
    END IF;

	RETURN NEW;
END;
$sumarMillasF$ LANGUAGE plpgsql;

CREATE TRIGGER sumarMillasT
  AFTER UPDATE
  ON COMPRA
  FOR EACH ROW
  EXECUTE PROCEDURE sumarMillasF();

---------------------------------------Actualizar existencias vuelo-----------------------------------------

CREATE OR REPLACE FUNCTION upStockVueloF()
  RETURNS TRIGGER
  AS $upStockVueloF$

DECLARE
    idVue integer;
BEGIN

    SELECT idVuelo INTO idVue FROM Boleto WHERE idBoleto=NEW.idBoleto;
    UPDATE EXISTENCIAS_VUELO SET existActual=(existActual - 1) WHERE idProducto=NEW.idProducto AND idVuelo=idVue;
    
	RETURN NEW;
END;
$upStockVueloF$ LANGUAGE plpgsql;

CREATE TRIGGER upStockVueloT
  AFTER INSERT
  ON REGISTRO_MENU_GRATIS
  FOR EACH ROW
  EXECUTE PROCEDURE upStockVueloF();


------------------------------------AUMENTAR MILLAS AL LLENAR ENCUESTA------------------------------------------

CREATE OR REPLACE FUNCTION sumarMillasEncuestaF()
  RETURNS TRIGGER
  AS $sumarMillasEncuestaF$

BEGIN
    UPDATE CUENTA SET millas = (millas + 5) WHERE idPersona=NEW.idPersona;
	RETURN NEW;
END;
$sumarMillasEncuestaF$ LANGUAGE plpgsql;

CREATE TRIGGER sumarMillasEncuestaT
  AFTER INSERT
  ON ENCUESTA
  FOR EACH ROW
  EXECUTE PROCEDURE sumarMillasEncuestaF();

-----------------------------------------------------------------------------------------------------------
