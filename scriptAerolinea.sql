-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.0-alpha
-- PostgreSQL version: 14.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: AerolineaBD1 | type: DATABASE --
-- DROP DATABASE IF EXISTS AerolineaBD1;

-- Prepended SQL commands --
DROP DATABASE IF EXISTS AerolineaBD1;
DROP SCHEMA IF EXISTS aerolinea CASCADE;
-- ddl-end --

CREATE DATABASE AerolineaBD1;
-- ddl-end --


-- object: aerolinea | type: SCHEMA --
-- DROP SCHEMA IF EXISTS aerolinea CASCADE;
CREATE SCHEMA aerolinea;
-- ddl-end --
ALTER SCHEMA aerolinea OWNER TO postgres;
-- ddl-end --

SET search_path TO aerolinea,aerolinea;
-- ddl-end --

-- object: aerolinea.genero | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.genero CASCADE;
CREATE TYPE aerolinea.genero AS
ENUM ('Masculino','Femenino');
-- ddl-end --
ALTER TYPE aerolinea.genero OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PASAJERO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PASAJERO CASCADE;
CREATE TABLE aerolinea.PASAJERO (
	idPersona integer NOT NULL,
	pasaporte varchar(50),
	CONSTRAINT PASAJERO_pk PRIMARY KEY (idPersona)
);
-- ddl-end --
ALTER TABLE aerolinea.PASAJERO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PERSONA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PERSONA CASCADE;
CREATE TABLE aerolinea.PERSONA (
	idPersona serial NOT NULL,
	docIdentificacion varchar(20) NOT NULL,
	nombre varchar(100) NOT NULL,
	fechaNacimiento date NOT NULL,
	genero aerolinea.genero NOT NULL,
	email varchar(150) NOT NULL,
	CONSTRAINT Persona_pk PRIMARY KEY (idPersona),
	CONSTRAINT email_uq UNIQUE (email)
);
-- ddl-end --
ALTER TABLE aerolinea.PERSONA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.TELEFONO_PERSONA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TELEFONO_PERSONA CASCADE;
CREATE TABLE aerolinea.TELEFONO_PERSONA (
	idTelefono serial NOT NULL,
	telefono varchar(15) NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT TELEFONO_PERSONA_pk PRIMARY KEY (idTelefono),
	CONSTRAINT telefono_uq UNIQUE (telefono)
);
-- ddl-end --
ALTER TABLE aerolinea.TELEFONO_PERSONA OWNER TO postgres;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.TELEFONO_PERSONA DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.TELEFONO_PERSONA ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PASAJERO DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.PASAJERO ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.TIPO_PERSONA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TIPO_PERSONA CASCADE;
CREATE TABLE aerolinea.TIPO_PERSONA (
	idTipoPersona serial NOT NULL,
	nombreTipo varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT TIPO_PERSONA_pk PRIMARY KEY (idTipoPersona)
);
-- ddl-end --
ALTER TABLE aerolinea.TIPO_PERSONA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.ASIGNACION_TIPO_PERSONA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ASIGNACION_TIPO_PERSONA CASCADE;
CREATE TABLE aerolinea.ASIGNACION_TIPO_PERSONA (
	idAsignacionTipoPersona serial NOT NULL,
	idTipoPersona integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT ASIGNACION_TIPO_PERSONA_pk PRIMARY KEY (idAsignacionTipoPersona)
);
-- ddl-end --
ALTER TABLE aerolinea.ASIGNACION_TIPO_PERSONA OWNER TO postgres;
-- ddl-end --

-- object: TIPO_PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASIGNACION_TIPO_PERSONA DROP CONSTRAINT IF EXISTS TIPO_PERSONA_fk CASCADE;
ALTER TABLE aerolinea.ASIGNACION_TIPO_PERSONA ADD CONSTRAINT TIPO_PERSONA_fk FOREIGN KEY (idTipoPersona)
REFERENCES aerolinea.TIPO_PERSONA (idTipoPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASIGNACION_TIPO_PERSONA DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.ASIGNACION_TIPO_PERSONA ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.EMPLEADO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.EMPLEADO CASCADE;
CREATE TABLE aerolinea.EMPLEADO (
	idPersona integer NOT NULL,
	fechaContratacion date NOT NULL,
	experiencia smallint NOT NULL,
	idPuesto integer NOT NULL,
	idHorario integer NOT NULL,
	CONSTRAINT EMPLEADO_pk PRIMARY KEY (idPersona)
);
-- ddl-end --
ALTER TABLE aerolinea.EMPLEADO OWNER TO postgres;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EMPLEADO DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.EMPLEADO ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.tipoEmpleado | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.tipoEmpleado CASCADE;
CREATE TYPE aerolinea.tipoEmpleado AS
ENUM ('Abordo','No Abordo');
-- ddl-end --
ALTER TYPE aerolinea.tipoEmpleado OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PUESTO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PUESTO CASCADE;
CREATE TABLE aerolinea.PUESTO (
	idPuesto serial NOT NULL,
	nombre varchar(100) NOT NULL,
	sueldo_base float NOT NULL,
	comision float NOT NULL,
	descripcion varchar(250) NOT NULL,
	tipoEmpleado aerolinea.tipoEmpleado NOT NULL,
	CONSTRAINT PUESTO_pk PRIMARY KEY (idPuesto),
	CONSTRAINT nombrePuesto_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.PUESTO OWNER TO postgres;
-- ddl-end --

-- object: PUESTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EMPLEADO DROP CONSTRAINT IF EXISTS PUESTO_fk CASCADE;
ALTER TABLE aerolinea.EMPLEADO ADD CONSTRAINT PUESTO_fk FOREIGN KEY (idPuesto)
REFERENCES aerolinea.PUESTO (idPuesto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.HORAS_TRABAJADAS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.HORAS_TRABAJADAS CASCADE;
CREATE TABLE aerolinea.HORAS_TRABAJADAS (
	idHorasTrabajadas serial NOT NULL,
	horaEntrada time NOT NULL,
	horaSalida time NOT NULL,
	fecha date NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT HORAS_TRABAJADAS_pk PRIMARY KEY (idHorasTrabajadas)
);
-- ddl-end --
ALTER TABLE aerolinea.HORAS_TRABAJADAS OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HORAS_TRABAJADAS DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.HORAS_TRABAJADAS ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.dia | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.dia CASCADE;
CREATE TYPE aerolinea.dia AS
ENUM ('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');
-- ddl-end --
ALTER TYPE aerolinea.dia OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.HORARIO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.HORARIO CASCADE;
CREATE TABLE aerolinea.HORARIO (
	idHorario serial NOT NULL,
	dia aerolinea.dia NOT NULL,
	horaEntrada time NOT NULL,
	horaSalida time NOT NULL,
	CONSTRAINT HORARIO_pk PRIMARY KEY (idHorario)
);
-- ddl-end --
ALTER TABLE aerolinea.HORARIO OWNER TO postgres;
-- ddl-end --

-- object: HORARIO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EMPLEADO DROP CONSTRAINT IF EXISTS HORARIO_fk CASCADE;
ALTER TABLE aerolinea.EMPLEADO ADD CONSTRAINT HORARIO_fk FOREIGN KEY (idHorario)
REFERENCES aerolinea.HORARIO (idHorario) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DIA_ENFERMEDAD | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DIA_ENFERMEDAD CASCADE;
CREATE TABLE aerolinea.DIA_ENFERMEDAD (
	idDiaEnfermedad serial NOT NULL,
	fecha date NOT NULL,
	comprobanteMedico text NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT DIA_ENFERMEDAD_pk PRIMARY KEY (idDiaEnfermedad)
);
-- ddl-end --
ALTER TABLE aerolinea.DIA_ENFERMEDAD OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DIA_ENFERMEDAD DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.DIA_ENFERMEDAD ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: DIA_ENFERMEDAD_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DIA_ENFERMEDAD DROP CONSTRAINT IF EXISTS DIA_ENFERMEDAD_uq CASCADE;
ALTER TABLE aerolinea.DIA_ENFERMEDAD ADD CONSTRAINT DIA_ENFERMEDAD_uq UNIQUE (idPersona);
-- ddl-end --

-- object: aerolinea.REGISTRO_VACACIONES | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_VACACIONES CASCADE;
CREATE TABLE aerolinea.REGISTRO_VACACIONES (
	idRegistroVacaciones serial NOT NULL,
	fechaInicio date NOT NULL,
	fechaFinal date NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT REGISTRO_VACACIONES_pk PRIMARY KEY (idRegistroVacaciones)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_VACACIONES OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_VACACIONES DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_VACACIONES ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: REGISTRO_VACACIONES_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_VACACIONES DROP CONSTRAINT IF EXISTS REGISTRO_VACACIONES_uq CASCADE;
ALTER TABLE aerolinea.REGISTRO_VACACIONES ADD CONSTRAINT REGISTRO_VACACIONES_uq UNIQUE (idPersona);
-- ddl-end --

-- object: aerolinea.SOLICITUD_VACACIONES | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.SOLICITUD_VACACIONES CASCADE;
CREATE TABLE aerolinea.SOLICITUD_VACACIONES (
	idSolicitudVacaciones serial NOT NULL,
	fecha date NOT NULL,
	cartaSolicitud text NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT SOLICITUD_VACACIONES_pk PRIMARY KEY (idSolicitudVacaciones)
);
-- ddl-end --
ALTER TABLE aerolinea.SOLICITUD_VACACIONES OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.SOLICITUD_VACACIONES DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.SOLICITUD_VACACIONES ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: SOLICITUD_VACACIONES_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.SOLICITUD_VACACIONES DROP CONSTRAINT IF EXISTS SOLICITUD_VACACIONES_uq CASCADE;
ALTER TABLE aerolinea.SOLICITUD_VACACIONES ADD CONSTRAINT SOLICITUD_VACACIONES_uq UNIQUE (idPersona);
-- ddl-end --

-- object: aerolinea.TIPO_CUENTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TIPO_CUENTA CASCADE;
CREATE TABLE aerolinea.TIPO_CUENTA (
	idTipoCuenta serial NOT NULL,
	nombre varchar(100) NOT NULL,
	descripcion varchar(250) NOT NULL,
	recompensa float NOT NULL,
	porcentajeCubierto float NOT NULL,
	CONSTRAINT TIPO_CUENTA_pk PRIMARY KEY (idTipoCuenta),
	CONSTRAINT nombreTipoCuenta_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.TIPO_CUENTA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.CUENTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.CUENTA CASCADE;
CREATE TABLE aerolinea.CUENTA (
	idPersona integer NOT NULL,
	username varchar(60) NOT NULL,
	password varchar(100) NOT NULL,
	millas float NOT NULL,
	idTipoCuenta integer NOT NULL,
	metodoPagoPredeterminado integer NOT NULL,
	CONSTRAINT CUENTA_pk PRIMARY KEY (idPersona),
	CONSTRAINT username_uq UNIQUE (username)
);
-- ddl-end --
ALTER TABLE aerolinea.CUENTA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.METODO_PAGO_CUENTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.METODO_PAGO_CUENTA CASCADE;
CREATE TABLE aerolinea.METODO_PAGO_CUENTA (
	idMetodoPago serial NOT NULL,
	descripcion varchar(250) NOT NULL,
	idTipoPago integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT METODO_PAGO_CUENTA_pk PRIMARY KEY (idMetodoPago)
);
-- ddl-end --
ALTER TABLE aerolinea.METODO_PAGO_CUENTA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.TIPO_METODO_PAGO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TIPO_METODO_PAGO CASCADE;
CREATE TABLE aerolinea.TIPO_METODO_PAGO (
	idTipoPago serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT TIPO_METODO_PAGO_pk PRIMARY KEY (idTipoPago),
	CONSTRAINT nombre_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.TIPO_METODO_PAGO OWNER TO postgres;
-- ddl-end --

-- object: TIPO_METODO_PAGO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.METODO_PAGO_CUENTA DROP CONSTRAINT IF EXISTS TIPO_METODO_PAGO_fk CASCADE;
ALTER TABLE aerolinea.METODO_PAGO_CUENTA ADD CONSTRAINT TIPO_METODO_PAGO_fk FOREIGN KEY (idTipoPago)
REFERENCES aerolinea.TIPO_METODO_PAGO (idTipoPago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PASAJERO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.CUENTA DROP CONSTRAINT IF EXISTS PASAJERO_fk CASCADE;
ALTER TABLE aerolinea.CUENTA ADD CONSTRAINT PASAJERO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PASAJERO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.METODO_PAGO_CUENTA DROP CONSTRAINT IF EXISTS CUENTA_fk CASCADE;
ALTER TABLE aerolinea.METODO_PAGO_CUENTA ADD CONSTRAINT CUENTA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.CUENTA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: TIPO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.CUENTA DROP CONSTRAINT IF EXISTS TIPO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.CUENTA ADD CONSTRAINT TIPO_CUENTA_fk FOREIGN KEY (idTipoCuenta)
REFERENCES aerolinea.TIPO_CUENTA (idTipoCuenta) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.PAYPAL | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PAYPAL CASCADE;
CREATE TABLE aerolinea.PAYPAL (
	idMetodoPago integer NOT NULL,
	email varchar(150) NOT NULL,
	CONSTRAINT PAYPAL_pk PRIMARY KEY (idMetodoPago),
	CONSTRAINT emailPaypal_uq UNIQUE (email)
);
-- ddl-end --
ALTER TABLE aerolinea.PAYPAL OWNER TO postgres;
-- ddl-end --

-- object: METODO_PAGO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PAYPAL DROP CONSTRAINT IF EXISTS METODO_PAGO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.PAYPAL ADD CONSTRAINT METODO_PAGO_CUENTA_fk FOREIGN KEY (idMetodoPago)
REFERENCES aerolinea.METODO_PAGO_CUENTA (idMetodoPago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.tipoTarjeta | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.tipoTarjeta CASCADE;
CREATE TYPE aerolinea.tipoTarjeta AS
ENUM ('Debito','Credito');
-- ddl-end --
ALTER TYPE aerolinea.tipoTarjeta OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.TARJETA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TARJETA CASCADE;
CREATE TABLE aerolinea.TARJETA (
	idMetodoPago integer NOT NULL,
	numeroTarjeta varchar(25) NOT NULL,
	fechaExpiracion date NOT NULL,
	tipoTarjeta aerolinea.tipoTarjeta NOT NULL,
	CONSTRAINT TARJETA_pk PRIMARY KEY (idMetodoPago),
	CONSTRAINT noTarjeta_uq UNIQUE (numeroTarjeta)
);
-- ddl-end --
ALTER TABLE aerolinea.TARJETA OWNER TO postgres;
-- ddl-end --

-- object: METODO_PAGO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.TARJETA DROP CONSTRAINT IF EXISTS METODO_PAGO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.TARJETA ADD CONSTRAINT METODO_PAGO_CUENTA_fk FOREIGN KEY (idMetodoPago)
REFERENCES aerolinea.METODO_PAGO_CUENTA (idMetodoPago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.HIST_CUENTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.HIST_CUENTA CASCADE;
CREATE TABLE aerolinea.HIST_CUENTA (
	idHistCuenta serial NOT NULL,
	fecha date NOT NULL,
	idTipoCuenta integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT HIST_CUENTA_pk PRIMARY KEY (idHistCuenta)
);
-- ddl-end --
ALTER TABLE aerolinea.HIST_CUENTA OWNER TO postgres;
-- ddl-end --

-- object: TIPO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_CUENTA DROP CONSTRAINT IF EXISTS TIPO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.HIST_CUENTA ADD CONSTRAINT TIPO_CUENTA_fk FOREIGN KEY (idTipoCuenta)
REFERENCES aerolinea.TIPO_CUENTA (idTipoCuenta) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: HIST_CUENTA_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_CUENTA DROP CONSTRAINT IF EXISTS HIST_CUENTA_uq CASCADE;
ALTER TABLE aerolinea.HIST_CUENTA ADD CONSTRAINT HIST_CUENTA_uq UNIQUE (idTipoCuenta);
-- ddl-end --

-- object: CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_CUENTA DROP CONSTRAINT IF EXISTS CUENTA_fk CASCADE;
ALTER TABLE aerolinea.HIST_CUENTA ADD CONSTRAINT CUENTA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.CUENTA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: HIST_CUENTA_uq1 | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_CUENTA DROP CONSTRAINT IF EXISTS HIST_CUENTA_uq1 CASCADE;
ALTER TABLE aerolinea.HIST_CUENTA ADD CONSTRAINT HIST_CUENTA_uq1 UNIQUE (idPersona);
-- ddl-end --

-- object: aerolinea.BENEFICIO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.BENEFICIO CASCADE;
CREATE TABLE aerolinea.BENEFICIO (
	idBeneficio serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT BENEFICIO_pk PRIMARY KEY (idBeneficio),
	CONSTRAINT nombreBeneficio_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.BENEFICIO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.BENEFICIO_CUENTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.BENEFICIO_CUENTA CASCADE;
CREATE TABLE aerolinea.BENEFICIO_CUENTA (
	idBeneficioCuenta serial NOT NULL,
	valor float NOT NULL,
	idTipoCuenta integer NOT NULL,
	idBeneficio integer NOT NULL,
	CONSTRAINT BENEFICIO_CUENTA_pk PRIMARY KEY (idBeneficioCuenta)
);
-- ddl-end --
ALTER TABLE aerolinea.BENEFICIO_CUENTA OWNER TO postgres;
-- ddl-end --

-- object: TIPO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CUENTA DROP CONSTRAINT IF EXISTS TIPO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CUENTA ADD CONSTRAINT TIPO_CUENTA_fk FOREIGN KEY (idTipoCuenta)
REFERENCES aerolinea.TIPO_CUENTA (idTipoCuenta) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: BENEFICIO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CUENTA DROP CONSTRAINT IF EXISTS BENEFICIO_fk CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CUENTA ADD CONSTRAINT BENEFICIO_fk FOREIGN KEY (idBeneficio)
REFERENCES aerolinea.BENEFICIO (idBeneficio) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.PAIS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PAIS CASCADE;
CREATE TABLE aerolinea.PAIS (
	idPais serial NOT NULL,
	nombre varchar(50) NOT NULL,
	nacionalidad varchar(100) NOT NULL,
	idiomaOficial varchar(50) NOT NULL,
	CONSTRAINT PAIS_pk PRIMARY KEY (idPais),
	CONSTRAINT pais_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.PAIS OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PAIS_PERSONA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PAIS_PERSONA CASCADE;
CREATE TABLE aerolinea.PAIS_PERSONA (
	idPais integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT PAIS_PERSONA_pk PRIMARY KEY (idPais,idPersona)
);
-- ddl-end --
ALTER TABLE aerolinea.PAIS_PERSONA OWNER TO postgres;
-- ddl-end --

-- object: PAIS_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PAIS_PERSONA DROP CONSTRAINT IF EXISTS PAIS_fk CASCADE;
ALTER TABLE aerolinea.PAIS_PERSONA ADD CONSTRAINT PAIS_fk FOREIGN KEY (idPais)
REFERENCES aerolinea.PAIS (idPais) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PAIS_PERSONA DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.PAIS_PERSONA ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.AEROPUERTO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.AEROPUERTO CASCADE;
CREATE TABLE aerolinea.AEROPUERTO (
	idAeropuerto serial NOT NULL,
	nombre varchar(60) NOT NULL,
	direccion varchar(200) NOT NULL,
	idPais integer NOT NULL,
	CONSTRAINT Aeropuerto_pk PRIMARY KEY (idAeropuerto)
);
-- ddl-end --
ALTER TABLE aerolinea.AEROPUERTO OWNER TO postgres;
-- ddl-end --

-- object: PAIS_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.AEROPUERTO DROP CONSTRAINT IF EXISTS PAIS_fk CASCADE;
ALTER TABLE aerolinea.AEROPUERTO ADD CONSTRAINT PAIS_fk FOREIGN KEY (idPais)
REFERENCES aerolinea.PAIS (idPais) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.estadoGeneral | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.estadoGeneral CASCADE;
CREATE TYPE aerolinea.estadoGeneral AS
ENUM ('Habilitado','Deshabilitado','Sin estado');
-- ddl-end --
ALTER TYPE aerolinea.estadoGeneral OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PLAN_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PLAN_VUELO CASCADE;
CREATE TABLE aerolinea.PLAN_VUELO (
	idPlanVuelo serial NOT NULL,
	distancia float NOT NULL,
	fechaInicio date,
	fechaFinal date,
	estado aerolinea.estadoGeneral NOT NULL,
	idTipoAvion integer NOT NULL,
	idAeropuertoSalida integer NOT NULL,
	idAeropuertoLlegada integer NOT NULL,
	CONSTRAINT PLAN_VUELO_pk PRIMARY KEY (idPlanVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.PLAN_VUELO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.TIPO_AVION | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TIPO_AVION CASCADE;
CREATE TABLE aerolinea.TIPO_AVION (
	idTipoAvion serial NOT NULL,
	nombre varchar(60) NOT NULL,
	descripcion varchar(250) NOT NULL,
	numeroTripulantes integer NOT NULL,
	capacidadFilas smallint NOT NULL,
	capacidadColumnas smallint NOT NULL,
	CONSTRAINT TIPO_AVION_pk PRIMARY KEY (idTipoAvion),
	CONSTRAINT nomobre_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.TIPO_AVION OWNER TO postgres;
-- ddl-end --

INSERT INTO aerolinea.TIPO_AVION (idTipoAvion, nombre, descripcion, numeroTripulantes, capacidadFilas, capacidadColumnas) VALUES (E'1', E'avioneta', E'alskdjaslkdjlaskjdk', E'4', E'10', E'4');
-- ddl-end --

-- object: TIPO_AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PLAN_VUELO DROP CONSTRAINT IF EXISTS TIPO_AVION_fk CASCADE;
ALTER TABLE aerolinea.PLAN_VUELO ADD CONSTRAINT TIPO_AVION_fk FOREIGN KEY (idTipoAvion)
REFERENCES aerolinea.TIPO_AVION (idTipoAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DIA_PLAN_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DIA_PLAN_VUELO CASCADE;
CREATE TABLE aerolinea.DIA_PLAN_VUELO (
	idDiaPlanVuelo serial NOT NULL,
	dia aerolinea.dia NOT NULL,
	idPlanVuelo integer NOT NULL,
	CONSTRAINT DIA_PLAN_VUELO_pk PRIMARY KEY (idDiaPlanVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.DIA_PLAN_VUELO OWNER TO postgres;
-- ddl-end --

-- object: PLAN_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DIA_PLAN_VUELO DROP CONSTRAINT IF EXISTS PLAN_VUELO_fk CASCADE;
ALTER TABLE aerolinea.DIA_PLAN_VUELO ADD CONSTRAINT PLAN_VUELO_fk FOREIGN KEY (idPlanVuelo)
REFERENCES aerolinea.PLAN_VUELO (idPlanVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.PRECIO_DIA_PLAN_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PRECIO_DIA_PLAN_VUELO CASCADE;
CREATE TABLE aerolinea.PRECIO_DIA_PLAN_VUELO (
	idPrecioDiaPlanVuelo serial NOT NULL,
	precioChamaco float NOT NULL,
	precioAdulto float NOT NULL,
	porcentajeAumentoChamaco float NOT NULL,
	porcentajeAumentoAdulto float NOT NULL,
	idClaseVuelo integer NOT NULL,
	idDiaPlanVuelo integer NOT NULL,
	CONSTRAINT PRECIO_DIA_PLAN_VUELO_pk PRIMARY KEY (idPrecioDiaPlanVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.CLASE_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.CLASE_VUELO CASCADE;
CREATE TABLE aerolinea.CLASE_VUELO (
	idClaseVuelo serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT CLASE_VUELO_pk PRIMARY KEY (idClaseVuelo),
	CONSTRAINT nombreClase_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.CLASE_VUELO OWNER TO postgres;
-- ddl-end --

INSERT INTO aerolinea.CLASE_VUELO (idClaseVuelo, nombre, descripcion) VALUES (E'1', E'clase perra', E'esta clase es solo para el david');
-- ddl-end --
INSERT INTO aerolinea.CLASE_VUELO (idClaseVuelo, nombre, descripcion) VALUES (E'2', E'clase pro', E'pa mi');
-- ddl-end --

-- object: CLASE_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO DROP CONSTRAINT IF EXISTS CLASE_VUELO_fk CASCADE;
ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO ADD CONSTRAINT CLASE_VUELO_fk FOREIGN KEY (idClaseVuelo)
REFERENCES aerolinea.CLASE_VUELO (idClaseVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: DIA_PLAN_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO DROP CONSTRAINT IF EXISTS DIA_PLAN_VUELO_fk CASCADE;
ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO ADD CONSTRAINT DIA_PLAN_VUELO_fk FOREIGN KEY (idDiaPlanVuelo)
REFERENCES aerolinea.DIA_PLAN_VUELO (idDiaPlanVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.BENEFICIO_CLASE | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.BENEFICIO_CLASE CASCADE;
CREATE TABLE aerolinea.BENEFICIO_CLASE (
	idBeneficioClase serial NOT NULL,
	valor float NOT NULL,
	idClaseVuelo integer NOT NULL,
	idBeneficio integer NOT NULL,
	CONSTRAINT BENEFICIO_CLASE_pk PRIMARY KEY (idBeneficioClase)
);
-- ddl-end --
ALTER TABLE aerolinea.BENEFICIO_CLASE OWNER TO postgres;
-- ddl-end --

-- object: CLASE_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CLASE DROP CONSTRAINT IF EXISTS CLASE_VUELO_fk CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CLASE ADD CONSTRAINT CLASE_VUELO_fk FOREIGN KEY (idClaseVuelo)
REFERENCES aerolinea.CLASE_VUELO (idClaseVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: BENEFICIO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CLASE DROP CONSTRAINT IF EXISTS BENEFICIO_fk CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CLASE ADD CONSTRAINT BENEFICIO_fk FOREIGN KEY (idBeneficio)
REFERENCES aerolinea.BENEFICIO (idBeneficio) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DISTRIBUCION_ASIENTOS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DISTRIBUCION_ASIENTOS CASCADE;
CREATE TABLE aerolinea.DISTRIBUCION_ASIENTOS (
	idDistribucionAsientos serial NOT NULL,
	filas smallint NOT NULL,
	columnas smallint NOT NULL,
	idClaseVuelo integer NOT NULL,
	idTipoAvion integer NOT NULL,
	CONSTRAINT DISTRIBUCION_ASIENTOS_pk PRIMARY KEY (idDistribucionAsientos)
);
-- ddl-end --
ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS OWNER TO postgres;
-- ddl-end --

INSERT INTO aerolinea.DISTRIBUCION_ASIENTOS (idDistribucionAsientos, filas, columnas, idClaseVuelo, idTipoAvion) VALUES (E'1', E'5', E'4', E'1', E'1');
-- ddl-end --
INSERT INTO aerolinea.DISTRIBUCION_ASIENTOS (idDistribucionAsientos, filas, columnas, idClaseVuelo, idTipoAvion) VALUES (E'2', E'5', E'4', E'2', E'1');
-- ddl-end --

-- object: CLASE_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS DROP CONSTRAINT IF EXISTS CLASE_VUELO_fk CASCADE;
ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS ADD CONSTRAINT CLASE_VUELO_fk FOREIGN KEY (idClaseVuelo)
REFERENCES aerolinea.CLASE_VUELO (idClaseVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: TIPO_AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS DROP CONSTRAINT IF EXISTS TIPO_AVION_fk CASCADE;
ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS ADD CONSTRAINT TIPO_AVION_fk FOREIGN KEY (idTipoAvion)
REFERENCES aerolinea.TIPO_AVION (idTipoAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.estadoAvion | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.estadoAvion CASCADE;
CREATE TYPE aerolinea.estadoAvion AS
ENUM ('Disponible','Ocupado','En mantenimiento','Retirado');
-- ddl-end --
ALTER TYPE aerolinea.estadoAvion OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.AVION | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.AVION CASCADE;
CREATE TABLE aerolinea.AVION (
	idAvion serial NOT NULL,
	fechaAdquisicion date NOT NULL,
	fechaPrimerVuelo date,
	fechaUltimoMantenimiento date,
	estado aerolinea.estadoAvion NOT NULL,
	idTipoAvion integer NOT NULL,
	CONSTRAINT AVION_pk PRIMARY KEY (idAvion)
);
-- ddl-end --
ALTER TABLE aerolinea.AVION OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.ASIENTO_AVION | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ASIENTO_AVION CASCADE;
CREATE TABLE aerolinea.ASIENTO_AVION (
	idAsiento serial NOT NULL,
	fila smallint NOT NULL,
	columna smallint NOT NULL,
	idAvion integer NOT NULL,
	CONSTRAINT ASIENTO_pk PRIMARY KEY (idAsiento)
);
-- ddl-end --
ALTER TABLE aerolinea.ASIENTO_AVION OWNER TO postgres;
-- ddl-end --

-- object: AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASIENTO_AVION DROP CONSTRAINT IF EXISTS AVION_fk CASCADE;
ALTER TABLE aerolinea.ASIENTO_AVION ADD CONSTRAINT AVION_fk FOREIGN KEY (idAvion)
REFERENCES aerolinea.AVION (idAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: planVuelo_dia_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DIA_PLAN_VUELO DROP CONSTRAINT IF EXISTS planVuelo_dia_uq CASCADE;
ALTER TABLE aerolinea.DIA_PLAN_VUELO ADD CONSTRAINT planVuelo_dia_uq UNIQUE (dia,idPlanVuelo);
-- ddl-end --

-- object: diaPlanVuelo_clase_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO DROP CONSTRAINT IF EXISTS diaPlanVuelo_clase_uq CASCADE;
ALTER TABLE aerolinea.PRECIO_DIA_PLAN_VUELO ADD CONSTRAINT diaPlanVuelo_clase_uq UNIQUE (idClaseVuelo,idDiaPlanVuelo);
-- ddl-end --

-- object: beneficio_clase_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CLASE DROP CONSTRAINT IF EXISTS beneficio_clase_uq CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CLASE ADD CONSTRAINT beneficio_clase_uq UNIQUE (idClaseVuelo,idBeneficio);
-- ddl-end --

-- object: benedicio_cuenta_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BENEFICIO_CUENTA DROP CONSTRAINT IF EXISTS benedicio_cuenta_uq CASCADE;
ALTER TABLE aerolinea.BENEFICIO_CUENTA ADD CONSTRAINT benedicio_cuenta_uq UNIQUE (idTipoCuenta,idBeneficio);
-- ddl-end --

-- object: tipoAvion_calse_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS DROP CONSTRAINT IF EXISTS tipoAvion_calse_uq CASCADE;
ALTER TABLE aerolinea.DISTRIBUCION_ASIENTOS ADD CONSTRAINT tipoAvion_calse_uq UNIQUE (idClaseVuelo,idTipoAvion);
-- ddl-end --

-- object: aerolinea.estadoVuelo | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.estadoVuelo CASCADE;
CREATE TYPE aerolinea.estadoVuelo AS
ENUM ('Agendado','Preparando','Abordaje','Despegue','En vuelo','Aterrizaje','Desbordaje','Finalizado');
-- ddl-end --
ALTER TYPE aerolinea.estadoVuelo OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.VUELO CASCADE;
CREATE TABLE aerolinea.VUELO (
	idVuelo serial NOT NULL,
	horaRealDespegue time NOT NULL,
	horaRealAterrizaje time NOT NULL,
	estadoActual aerolinea.estadoVuelo NOT NULL,
	fecha date NOT NULL,
	idDiaPlanVuelo integer NOT NULL,
	idAvion integer NOT NULL,
	CONSTRAINT VUELO_pk PRIMARY KEY (idVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.VUELO OWNER TO postgres;
-- ddl-end --

-- object: DIA_PLAN_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.VUELO DROP CONSTRAINT IF EXISTS DIA_PLAN_VUELO_fk CASCADE;
ALTER TABLE aerolinea.VUELO ADD CONSTRAINT DIA_PLAN_VUELO_fk FOREIGN KEY (idDiaPlanVuelo)
REFERENCES aerolinea.DIA_PLAN_VUELO (idDiaPlanVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: TIPO_AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.AVION DROP CONSTRAINT IF EXISTS TIPO_AVION_fk CASCADE;
ALTER TABLE aerolinea.AVION ADD CONSTRAINT TIPO_AVION_fk FOREIGN KEY (idTipoAvion)
REFERENCES aerolinea.TIPO_AVION (idTipoAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.VUELO DROP CONSTRAINT IF EXISTS AVION_fk CASCADE;
ALTER TABLE aerolinea.VUELO ADD CONSTRAINT AVION_fk FOREIGN KEY (idAvion)
REFERENCES aerolinea.AVION (idAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.HIST_ESTADO_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.HIST_ESTADO_VUELO CASCADE;
CREATE TABLE aerolinea.HIST_ESTADO_VUELO (
	idHistEstadoVuelo serial NOT NULL,
	fechaHora timestamp NOT NULL,
	estadoVuelo aerolinea.estadoVuelo NOT NULL,
	idVuelo integer NOT NULL,
	CONSTRAINT HIST_ESTADO_VUELO_pk PRIMARY KEY (idHistEstadoVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.HIST_ESTADO_VUELO OWNER TO postgres;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_ESTADO_VUELO DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.HIST_ESTADO_VUELO ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.estadoCompra | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.estadoCompra CASCADE;
CREATE TYPE aerolinea.estadoCompra AS
ENUM ('Facturando','Facturada','Cancelado');
-- ddl-end --
ALTER TYPE aerolinea.estadoCompra OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.COMPRA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.COMPRA CASCADE;
CREATE TABLE aerolinea.COMPRA (
	idCompra serial NOT NULL,
	fechaHora timestamp NOT NULL,
	fechaCancelacion timestamp NOT NULL,
	fechaModificacion timestamp NOT NULL,
	estado aerolinea.estadoCompra NOT NULL DEFAULT 'Facturando',
	idPersona integer NOT NULL,
	CONSTRAINT COMPRA_pk PRIMARY KEY (idCompra)
);
-- ddl-end --
ALTER TABLE aerolinea.COMPRA OWNER TO postgres;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.COMPRA DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.COMPRA ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.estadoBoleto | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.estadoBoleto CASCADE;
CREATE TYPE aerolinea.estadoBoleto AS
ENUM ('Vendido','Usado','Cancelado');
-- ddl-end --
ALTER TYPE aerolinea.estadoBoleto OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.BOLETO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.BOLETO CASCADE;
CREATE TABLE aerolinea.BOLETO (
	idBoleto serial NOT NULL,
	dia aerolinea.dia NOT NULL,
	fechaHora timestamp NOT NULL,
	costoAseguranza float NOT NULL,
	descuento float NOT NULL,
	isIdaVuelta boolean NOT NULL DEFAULT false,
	precio float NOT NULL,
	fechaCancelacion timestamp NOT NULL,
	estadoBoleto aerolinea.estadoBoleto NOT NULL,
	idCompra integer NOT NULL,
	idClaseVuelo integer NOT NULL,
	idPersona integer NOT NULL,
	idAsiento integer NOT NULL,
	idVuelo integer NOT NULL,
	CONSTRAINT Boleto_pk PRIMARY KEY (idBoleto)
);
-- ddl-end --
ALTER TABLE aerolinea.BOLETO OWNER TO postgres;
-- ddl-end --

-- object: CLASE_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS CLASE_VUELO_fk CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT CLASE_VUELO_fk FOREIGN KEY (idClaseVuelo)
REFERENCES aerolinea.CLASE_VUELO (idClaseVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PASAJERO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS PASAJERO_fk CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT PASAJERO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PASAJERO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: ASIENTO_AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS ASIENTO_AVION_fk CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT ASIENTO_AVION_fk FOREIGN KEY (idAsiento)
REFERENCES aerolinea.ASIENTO_AVION (idAsiento) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DETALLE_PAGO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DETALLE_PAGO CASCADE;
CREATE TABLE aerolinea.DETALLE_PAGO (
	idDetallePago serial NOT NULL,
	porcentajePagado float NOT NULL,
	idCompra integer NOT NULL,
	idTipoPago integer NOT NULL,
	CONSTRAINT DETALLE_PAGO_pk PRIMARY KEY (idDetallePago)
);
-- ddl-end --
ALTER TABLE aerolinea.DETALLE_PAGO OWNER TO postgres;
-- ddl-end --

-- object: COMPRA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO DROP CONSTRAINT IF EXISTS COMPRA_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO ADD CONSTRAINT COMPRA_fk FOREIGN KEY (idCompra)
REFERENCES aerolinea.COMPRA (idCompra) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: TIPO_METODO_PAGO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO DROP CONSTRAINT IF EXISTS TIPO_METODO_PAGO_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO ADD CONSTRAINT TIPO_METODO_PAGO_fk FOREIGN KEY (idTipoPago)
REFERENCES aerolinea.TIPO_METODO_PAGO (idTipoPago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.tipoRegistro | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.tipoRegistro CASCADE;
CREATE TYPE aerolinea.tipoRegistro AS
ENUM ('Comprado','Beneficio Cuenta','Beneficio Clase');
-- ddl-end --
ALTER TYPE aerolinea.tipoRegistro OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.REGISTRO_MALETA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_MALETA CASCADE;
CREATE TABLE aerolinea.REGISTRO_MALETA (
	idRegistroMaleta serial NOT NULL,
	precio float NOT NULL,
	peso float NOT NULL,
	tipoRegistro aerolinea.tipoRegistro NOT NULL,
	idBoleto integer NOT NULL,
	idCompra integer NOT NULL,
	CONSTRAINT REGISTRO_MALETA_pk PRIMARY KEY (idRegistroMaleta)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_MALETA OWNER TO postgres;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_MALETA DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_MALETA ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_MALETA DROP CONSTRAINT IF EXISTS COMPRA_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_MALETA ADD CONSTRAINT COMPRA_fk FOREIGN KEY (idCompra)
REFERENCES aerolinea.COMPRA (idCompra) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.RegistroMascota | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.RegistroMascota CASCADE;
CREATE TABLE aerolinea.RegistroMascota (
	idRegistroMascota serial NOT NULL,
	precio float NOT NULL,
	peso float NOT NULL,
	especie varchar(50) NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	listadoVacunas text NOT NULL,
	certificadoVeterinario varchar(30) NOT NULL,
	tipoRegistro aerolinea.tipoRegistro NOT NULL,
	idBoleto integer NOT NULL,
	idCompra integer NOT NULL,
	CONSTRAINT RegistroMascota_pk PRIMARY KEY (idRegistroMascota)
);
-- ddl-end --
ALTER TABLE aerolinea.RegistroMascota OWNER TO postgres;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.RegistroMascota DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.RegistroMascota ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.RegistroMascota DROP CONSTRAINT IF EXISTS COMPRA_fk CASCADE;
ALTER TABLE aerolinea.RegistroMascota ADD CONSTRAINT COMPRA_fk FOREIGN KEY (idCompra)
REFERENCES aerolinea.COMPRA (idCompra) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.REGISTRO_ENCARGADO_CHAMACO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_ENCARGADO_CHAMACO CASCADE;
CREATE TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO (
	idBoleto integer NOT NULL,
	precio float NOT NULL,
	tipoRegistro aerolinea.tipoRegistro NOT NULL,
	idCompra integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT REGISTRO_ENCARGADO_CHAMACO_pk PRIMARY KEY (idBoleto)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO OWNER TO postgres;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO DROP CONSTRAINT IF EXISTS COMPRA_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO ADD CONSTRAINT COMPRA_fk FOREIGN KEY (idCompra)
REFERENCES aerolinea.COMPRA (idCompra) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PERSONA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO DROP CONSTRAINT IF EXISTS PERSONA_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_ENCARGADO_CHAMACO ADD CONSTRAINT PERSONA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.PERSONA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DETALLE_PAGO_ABORDO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DETALLE_PAGO_ABORDO CASCADE;
CREATE TABLE aerolinea.DETALLE_PAGO_ABORDO (
	idDetallePago serial NOT NULL,
	porcentajePagado float NOT NULL,
	idTipoPago integer NOT NULL,
	idCompraA integer NOT NULL,
	CONSTRAINT DETALLE_PAGO_ABORDO_pk PRIMARY KEY (idDetallePago)
);
-- ddl-end --
ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.tipoCompraA | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.tipoCompraA CASCADE;
CREATE TYPE aerolinea.tipoCompraA AS
ENUM ('Wifi','Pelicula','Comida');
-- ddl-end --
ALTER TYPE aerolinea.tipoCompraA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.COMPRA_ABORDO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.COMPRA_ABORDO CASCADE;
CREATE TABLE aerolinea.COMPRA_ABORDO (
	idCompraA serial NOT NULL,
	fechaHora timestamp NOT NULL,
	tipoCompraAbordo aerolinea.tipoCompraA NOT NULL,
	CONSTRAINT COMPRA_ABORDO_pk PRIMARY KEY (idCompraA)
);
-- ddl-end --
ALTER TABLE aerolinea.COMPRA_ABORDO OWNER TO postgres;
-- ddl-end --

-- object: TIPO_METODO_PAGO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO DROP CONSTRAINT IF EXISTS TIPO_METODO_PAGO_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO ADD CONSTRAINT TIPO_METODO_PAGO_fk FOREIGN KEY (idTipoPago)
REFERENCES aerolinea.TIPO_METODO_PAGO (idTipoPago) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_ABORDO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO DROP CONSTRAINT IF EXISTS COMPRA_ABORDO_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO ADD CONSTRAINT COMPRA_ABORDO_fk FOREIGN KEY (idCompraA)
REFERENCES aerolinea.COMPRA_ABORDO (idCompraA) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.COMPRA_WIFI | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.COMPRA_WIFI CASCADE;
CREATE TABLE aerolinea.COMPRA_WIFI (
	idCompraA integer NOT NULL,
	precio float NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT COMPRA_WIFI_pk PRIMARY KEY (idCompraA)
);
-- ddl-end --
ALTER TABLE aerolinea.COMPRA_WIFI OWNER TO postgres;
-- ddl-end --

-- object: CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.COMPRA_WIFI DROP CONSTRAINT IF EXISTS CUENTA_fk CASCADE;
ALTER TABLE aerolinea.COMPRA_WIFI ADD CONSTRAINT CUENTA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.CUENTA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_ABORDO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.COMPRA_WIFI DROP CONSTRAINT IF EXISTS COMPRA_ABORDO_fk CASCADE;
ALTER TABLE aerolinea.COMPRA_WIFI ADD CONSTRAINT COMPRA_ABORDO_fk FOREIGN KEY (idCompraA)
REFERENCES aerolinea.COMPRA_ABORDO (idCompraA) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.VARIABLE_GENERAL | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.VARIABLE_GENERAL CASCADE;
CREATE TABLE aerolinea.VARIABLE_GENERAL (
	idVariableGeneral serial NOT NULL,
	nombre varchar(50) NOT NULL,
	valor float NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT VARIABLE_GENERAL_pk PRIMARY KEY (idVariableGeneral),
	CONSTRAINT nombreVarG_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.VARIABLE_GENERAL OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.HIST_VAR_GENERAL | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.HIST_VAR_GENERAL CASCADE;
CREATE TABLE aerolinea.HIST_VAR_GENERAL (
	idHistVarGeneral serial NOT NULL,
	valorAnterior float NOT NULL,
	valorNuevo float NOT NULL,
	fechaHora timestamp NOT NULL,
	idVariableGeneral integer NOT NULL,
	CONSTRAINT HIST_VAR_GENERAL_pk PRIMARY KEY (idHistVarGeneral)
);
-- ddl-end --
ALTER TABLE aerolinea.HIST_VAR_GENERAL OWNER TO postgres;
-- ddl-end --

-- object: VARIABLE_GENERAL_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_VAR_GENERAL DROP CONSTRAINT IF EXISTS VARIABLE_GENERAL_fk CASCADE;
ALTER TABLE aerolinea.HIST_VAR_GENERAL ADD CONSTRAINT VARIABLE_GENERAL_fk FOREIGN KEY (idVariableGeneral)
REFERENCES aerolinea.VARIABLE_GENERAL (idVariableGeneral) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.COMPRA_PELICULA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.COMPRA_PELICULA CASCADE;
CREATE TABLE aerolinea.COMPRA_PELICULA (
	idCompraA integer NOT NULL,
	precio float NOT NULL,
	idPelicula integer NOT NULL,
	CONSTRAINT COMPRA_PELICULA_pk PRIMARY KEY (idCompraA)
);
-- ddl-end --
ALTER TABLE aerolinea.COMPRA_PELICULA OWNER TO postgres;
-- ddl-end --

-- object: COMPRA_ABORDO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.COMPRA_PELICULA DROP CONSTRAINT IF EXISTS COMPRA_ABORDO_fk CASCADE;
ALTER TABLE aerolinea.COMPRA_PELICULA ADD CONSTRAINT COMPRA_ABORDO_fk FOREIGN KEY (idCompraA)
REFERENCES aerolinea.COMPRA_ABORDO (idCompraA) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.PELICULA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PELICULA CASCADE;
CREATE TABLE aerolinea.PELICULA (
	idPelicula serial NOT NULL,
	titulo varchar(300) NOT NULL,
	descripcion varchar(250) NOT NULL,
	duracion float NOT NULL,
	costo float NOT NULL,
	precio float NOT NULL,
	listaActores text NOT NULL,
	idCategoriaPelicula integer NOT NULL,
	idClasificacionPelicula integer NOT NULL,
	CONSTRAINT PELICULA_pk PRIMARY KEY (idPelicula)
);
-- ddl-end --
ALTER TABLE aerolinea.PELICULA OWNER TO postgres;
-- ddl-end --

-- object: PELICULA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.COMPRA_PELICULA DROP CONSTRAINT IF EXISTS PELICULA_fk CASCADE;
ALTER TABLE aerolinea.COMPRA_PELICULA ADD CONSTRAINT PELICULA_fk FOREIGN KEY (idPelicula)
REFERENCES aerolinea.PELICULA (idPelicula) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.CATEGORIA_PELICULA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.CATEGORIA_PELICULA CASCADE;
CREATE TABLE aerolinea.CATEGORIA_PELICULA (
	idCategoriaPelicula serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT CATEGORIA_PELICULA_pk PRIMARY KEY (idCategoriaPelicula),
	CONSTRAINT nombreClasificacion_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.CATEGORIA_PELICULA OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.CLASIFICACION_PELICULA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.CLASIFICACION_PELICULA CASCADE;
CREATE TABLE aerolinea.CLASIFICACION_PELICULA (
	idClasificacionPelicula serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT CLASIFICACION_PELICULA_pk PRIMARY KEY (idClasificacionPelicula),
	CONSTRAINT nombreCategoria UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.CLASIFICACION_PELICULA OWNER TO postgres;
-- ddl-end --

-- object: CATEGORIA_PELICULA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PELICULA DROP CONSTRAINT IF EXISTS CATEGORIA_PELICULA_fk CASCADE;
ALTER TABLE aerolinea.PELICULA ADD CONSTRAINT CATEGORIA_PELICULA_fk FOREIGN KEY (idCategoriaPelicula)
REFERENCES aerolinea.CATEGORIA_PELICULA (idCategoriaPelicula) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: CLASIFICACION_PELICULA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PELICULA DROP CONSTRAINT IF EXISTS CLASIFICACION_PELICULA_fk CASCADE;
ALTER TABLE aerolinea.PELICULA ADD CONSTRAINT CLASIFICACION_PELICULA_fk FOREIGN KEY (idClasificacionPelicula)
REFERENCES aerolinea.CLASIFICACION_PELICULA (idClasificacionPelicula) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.DETALLE_COMPRA_ABORDO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.DETALLE_COMPRA_ABORDO CASCADE;
CREATE TABLE aerolinea.DETALLE_COMPRA_ABORDO (
	idDetalleCompraA serial NOT NULL,
	cantidad smallint NOT NULL,
	precioUnitario float NOT NULL,
	idProducto integer NOT NULL,
	idCompraA integer NOT NULL,
	CONSTRAINT DETALLE_COMPRA_ABORDO_pk PRIMARY KEY (idDetalleCompraA)
);
-- ddl-end --
ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.PRODUCTO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.PRODUCTO CASCADE;
CREATE TABLE aerolinea.PRODUCTO (
	idProducto serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	precio float NOT NULL,
	costo float NOT NULL,
	idCategoriaProducto integer NOT NULL,
	CONSTRAINT PRODUCTO_pk PRIMARY KEY (idProducto)
);
-- ddl-end --
ALTER TABLE aerolinea.PRODUCTO OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.CATEGORIA_PRODUCTO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.CATEGORIA_PRODUCTO CASCADE;
CREATE TABLE aerolinea.CATEGORIA_PRODUCTO (
	idCategoriaProducto serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT CATEGORIA_PRODUCTO_pk PRIMARY KEY (idCategoriaProducto),
	CONSTRAINT nombreCatProd_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE aerolinea.CATEGORIA_PRODUCTO OWNER TO postgres;
-- ddl-end --

-- object: CATEGORIA_PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PRODUCTO DROP CONSTRAINT IF EXISTS CATEGORIA_PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.PRODUCTO ADD CONSTRAINT CATEGORIA_PRODUCTO_fk FOREIGN KEY (idCategoriaProducto)
REFERENCES aerolinea.CATEGORIA_PRODUCTO (idCategoriaProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO DROP CONSTRAINT IF EXISTS PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO ADD CONSTRAINT PRODUCTO_fk FOREIGN KEY (idProducto)
REFERENCES aerolinea.PRODUCTO (idProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: COMPRA_ABORDO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO DROP CONSTRAINT IF EXISTS COMPRA_ABORDO_fk CASCADE;
ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO ADD CONSTRAINT COMPRA_ABORDO_fk FOREIGN KEY (idCompraA)
REFERENCES aerolinea.COMPRA_ABORDO (idCompraA) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.MENU_GRATIS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.MENU_GRATIS CASCADE;
CREATE TABLE aerolinea.MENU_GRATIS (
	idMenuGratis serial NOT NULL,
	idClaseVuelo integer NOT NULL,
	id_menu integer NOT NULL,
	CONSTRAINT MENU_GRATIS_pk PRIMARY KEY (idMenuGratis)
);
-- ddl-end --
ALTER TABLE aerolinea.MENU_GRATIS OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.MENU_GENERAL | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.MENU_GENERAL CASCADE;
CREATE TABLE aerolinea.MENU_GENERAL (
	id_menu serial NOT NULL,
	idAvion integer NOT NULL,
	idProducto integer NOT NULL,
	CONSTRAINT MENU_GENERAL_pk PRIMARY KEY (id_menu)
);
-- ddl-end --
ALTER TABLE aerolinea.MENU_GENERAL OWNER TO postgres;
-- ddl-end --

-- object: CLASE_VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GRATIS DROP CONSTRAINT IF EXISTS CLASE_VUELO_fk CASCADE;
ALTER TABLE aerolinea.MENU_GRATIS ADD CONSTRAINT CLASE_VUELO_fk FOREIGN KEY (idClaseVuelo)
REFERENCES aerolinea.CLASE_VUELO (idClaseVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: MENU_GENERAL_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GRATIS DROP CONSTRAINT IF EXISTS MENU_GENERAL_fk CASCADE;
ALTER TABLE aerolinea.MENU_GRATIS ADD CONSTRAINT MENU_GENERAL_fk FOREIGN KEY (id_menu)
REFERENCES aerolinea.MENU_GENERAL (id_menu) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GENERAL DROP CONSTRAINT IF EXISTS AVION_fk CASCADE;
ALTER TABLE aerolinea.MENU_GENERAL ADD CONSTRAINT AVION_fk FOREIGN KEY (idAvion)
REFERENCES aerolinea.AVION (idAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GENERAL DROP CONSTRAINT IF EXISTS PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.MENU_GENERAL ADD CONSTRAINT PRODUCTO_fk FOREIGN KEY (idProducto)
REFERENCES aerolinea.PRODUCTO (idProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: avion_producto_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GENERAL DROP CONSTRAINT IF EXISTS avion_producto_uq CASCADE;
ALTER TABLE aerolinea.MENU_GENERAL ADD CONSTRAINT avion_producto_uq UNIQUE (idAvion,idProducto);
-- ddl-end --

-- object: aerolinea.ExistenciasDefault | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ExistenciasDefault CASCADE;
CREATE TABLE aerolinea.ExistenciasDefault (
	idExistDefault serial NOT NULL,
	cantidad integer NOT NULL,
	idProducto integer NOT NULL,
	idAvion integer NOT NULL,
	CONSTRAINT ExistenciasDefault_pk PRIMARY KEY (idExistDefault)
);
-- ddl-end --
ALTER TABLE aerolinea.ExistenciasDefault OWNER TO postgres;
-- ddl-end --

-- object: PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ExistenciasDefault DROP CONSTRAINT IF EXISTS PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.ExistenciasDefault ADD CONSTRAINT PRODUCTO_fk FOREIGN KEY (idProducto)
REFERENCES aerolinea.PRODUCTO (idProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AVION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ExistenciasDefault DROP CONSTRAINT IF EXISTS AVION_fk CASCADE;
ALTER TABLE aerolinea.ExistenciasDefault ADD CONSTRAINT AVION_fk FOREIGN KEY (idAvion)
REFERENCES aerolinea.AVION (idAvion) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.EXISTENCIAS_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.EXISTENCIAS_VUELO CASCADE;
CREATE TABLE aerolinea.EXISTENCIAS_VUELO (
	idExistVuelo serial NOT NULL,
	costo float NOT NULL,
	existActual integer NOT NULL,
	existInicial integer NOT NULL,
	idProducto integer NOT NULL,
	idVuelo integer NOT NULL,
	CONSTRAINT EXISTENCIAS_VUELO_pk PRIMARY KEY (idExistVuelo)
);
-- ddl-end --
ALTER TABLE aerolinea.EXISTENCIAS_VUELO OWNER TO postgres;
-- ddl-end --

-- object: PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EXISTENCIAS_VUELO DROP CONSTRAINT IF EXISTS PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.EXISTENCIAS_VUELO ADD CONSTRAINT PRODUCTO_fk FOREIGN KEY (idProducto)
REFERENCES aerolinea.PRODUCTO (idProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EXISTENCIAS_VUELO DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.EXISTENCIAS_VUELO ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: avion_producto_uq_1 | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ExistenciasDefault DROP CONSTRAINT IF EXISTS avion_producto_uq_1 CASCADE;
ALTER TABLE aerolinea.ExistenciasDefault ADD CONSTRAINT avion_producto_uq_1 UNIQUE (idProducto,idAvion);
-- ddl-end --

-- object: vuelo_producto_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.EXISTENCIAS_VUELO DROP CONSTRAINT IF EXISTS vuelo_producto_uq CASCADE;
ALTER TABLE aerolinea.EXISTENCIAS_VUELO ADD CONSTRAINT vuelo_producto_uq UNIQUE (idProducto,idVuelo);
-- ddl-end --

-- object: aerolinea.REGISTRO_MENU_GRATIS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_MENU_GRATIS CASCADE;
CREATE TABLE aerolinea.REGISTRO_MENU_GRATIS (
	idRegistroMenuGratis serial NOT NULL,
	fechaHora timestamp NOT NULL,
	costo float NOT NULL,
	idProducto integer NOT NULL,
	idBoleto integer NOT NULL,
	CONSTRAINT REGISTRO_MENU_GRATIS_pk PRIMARY KEY (idRegistroMenuGratis)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_MENU_GRATIS OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.REGISTRO_PELICULA_GRATIS | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_PELICULA_GRATIS CASCADE;
CREATE TABLE aerolinea.REGISTRO_PELICULA_GRATIS (
	idRegistroPelGratis serial NOT NULL,
	costo float NOT NULL,
	fechaHora timestamp NOT NULL,
	idPelicula integer NOT NULL,
	idBoleto integer NOT NULL,
	CONSTRAINT REGISTRO_PELICULA_GRATIS_pk PRIMARY KEY (idRegistroPelGratis)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_PELICULA_GRATIS OWNER TO postgres;
-- ddl-end --

-- object: PELICULA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_PELICULA_GRATIS DROP CONSTRAINT IF EXISTS PELICULA_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_PELICULA_GRATIS ADD CONSTRAINT PELICULA_fk FOREIGN KEY (idPelicula)
REFERENCES aerolinea.PELICULA (idPelicula) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: PRODUCTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_MENU_GRATIS DROP CONSTRAINT IF EXISTS PRODUCTO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_MENU_GRATIS ADD CONSTRAINT PRODUCTO_fk FOREIGN KEY (idProducto)
REFERENCES aerolinea.PRODUCTO (idProducto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_MENU_GRATIS DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_MENU_GRATIS ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_PELICULA_GRATIS DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_PELICULA_GRATIS ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.ENCUESTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ENCUESTA CASCADE;
CREATE TABLE aerolinea.ENCUESTA (
	idEncuesta serial NOT NULL,
	idVuelo integer NOT NULL,
	idPersona integer NOT NULL,
	CONSTRAINT ENCUESTA_pk PRIMARY KEY (idEncuesta)
);
-- ddl-end --
ALTER TABLE aerolinea.ENCUESTA OWNER TO postgres;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ENCUESTA DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.ENCUESTA ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ENCUESTA DROP CONSTRAINT IF EXISTS CUENTA_fk CASCADE;
ALTER TABLE aerolinea.ENCUESTA ADD CONSTRAINT CUENTA_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.CUENTA (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.ASPECTO_EVALUACION | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ASPECTO_EVALUACION CASCADE;
CREATE TABLE aerolinea.ASPECTO_EVALUACION (
	idAspectoEvaluacoin serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT ASPECTO_EVALUACION_pk PRIMARY KEY (idAspectoEvaluacoin)
);
-- ddl-end --
ALTER TABLE aerolinea.ASPECTO_EVALUACION OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.ASPECTO_ENCUESTA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.ASPECTO_ENCUESTA CASCADE;
CREATE TABLE aerolinea.ASPECTO_ENCUESTA (
	idAspectoEncuesta serial NOT NULL,
	calificacion smallint NOT NULL,
	idAspectoEvaluacoin integer NOT NULL,
	idEncuesta integer NOT NULL

);
-- ddl-end --
ALTER TABLE aerolinea.ASPECTO_ENCUESTA OWNER TO postgres;
-- ddl-end --

-- object: ASPECTO_EVALUACION_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASPECTO_ENCUESTA DROP CONSTRAINT IF EXISTS ASPECTO_EVALUACION_fk CASCADE;
ALTER TABLE aerolinea.ASPECTO_ENCUESTA ADD CONSTRAINT ASPECTO_EVALUACION_fk FOREIGN KEY (idAspectoEvaluacoin)
REFERENCES aerolinea.ASPECTO_EVALUACION (idAspectoEvaluacoin) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: ENCUESTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASPECTO_ENCUESTA DROP CONSTRAINT IF EXISTS ENCUESTA_fk CASCADE;
ALTER TABLE aerolinea.ASPECTO_ENCUESTA ADD CONSTRAINT ENCUESTA_fk FOREIGN KEY (idEncuesta)
REFERENCES aerolinea.ENCUESTA (idEncuesta) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aspecto_encuesta_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASPECTO_ENCUESTA DROP CONSTRAINT IF EXISTS aspecto_encuesta_uq CASCADE;
ALTER TABLE aerolinea.ASPECTO_ENCUESTA ADD CONSTRAINT aspecto_encuesta_uq UNIQUE (idAspectoEvaluacoin,idEncuesta);
-- ddl-end --

-- object: aerolinea.REGISTRO_COMISION | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_COMISION CASCADE;
CREATE TABLE aerolinea.REGISTRO_COMISION (
	idRegsitroComision serial NOT NULL,
	comision float NOT NULL,
	idPersona integer NOT NULL,
	idVuelo integer NOT NULL

);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_COMISION OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_COMISION DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_COMISION ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_COMISION DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_COMISION ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.TRIPULANTE_CABINA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.TRIPULANTE_CABINA CASCADE;
CREATE TABLE aerolinea.TRIPULANTE_CABINA (
	idTripulanteCabina serial NOT NULL,
	idPersona integer NOT NULL,
	idVuelo integer NOT NULL

);
-- ddl-end --
ALTER TABLE aerolinea.TRIPULANTE_CABINA OWNER TO postgres;
-- ddl-end --

-- object: EMPLEADO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.TRIPULANTE_CABINA DROP CONSTRAINT IF EXISTS EMPLEADO_fk CASCADE;
ALTER TABLE aerolinea.TRIPULANTE_CABINA ADD CONSTRAINT EMPLEADO_fk FOREIGN KEY (idPersona)
REFERENCES aerolinea.EMPLEADO (idPersona) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: VUELO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.TRIPULANTE_CABINA DROP CONSTRAINT IF EXISTS VUELO_fk CASCADE;
ALTER TABLE aerolinea.TRIPULANTE_CABINA ADD CONSTRAINT VUELO_fk FOREIGN KEY (idVuelo)
REFERENCES aerolinea.VUELO (idVuelo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: empleado_vuelo_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.TRIPULANTE_CABINA DROP CONSTRAINT IF EXISTS empleado_vuelo_uq CASCADE;
ALTER TABLE aerolinea.TRIPULANTE_CABINA ADD CONSTRAINT empleado_vuelo_uq UNIQUE (idPersona,idVuelo);
-- ddl-end --

-- object: empleado_comision_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_COMISION DROP CONSTRAINT IF EXISTS empleado_comision_uq CASCADE;
ALTER TABLE aerolinea.REGISTRO_COMISION ADD CONSTRAINT empleado_comision_uq UNIQUE (idPersona,idVuelo);
-- ddl-end --

-- object: COMPRA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS COMPRA_fk CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT COMPRA_fk FOREIGN KEY (idCompra)
REFERENCES aerolinea.COMPRA (idCompra) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.tipoAeropuertoPlan | type: TYPE --
-- DROP TYPE IF EXISTS aerolinea.tipoAeropuertoPlan CASCADE;
CREATE TYPE aerolinea.tipoAeropuertoPlan AS
ENUM ('Salida','Llegada');
-- ddl-end --
ALTER TYPE aerolinea.tipoAeropuertoPlan OWNER TO postgres;
-- ddl-end --

-- object: aerolinea.AEROPUERTO_PLAN_VUELO | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.AEROPUERTO_PLAN_VUELO CASCADE;
CREATE TABLE aerolinea.AEROPUERTO_PLAN_VUELO (
	idAeropuertoPlanVuleo serial NOT NULL,
	puertaDefecto varchar(15) NOT NULL,
	hora time NOT NULL,
	horaAbordaje time NOT NULL,
	idAeropuerto integer NOT NULL,
	tipoAeropuertoPlan aerolinea.tipoAeropuertoPlan NOT NULL,
	CONSTRAINT AEROPUERTO_PLAN_VUELO_pk PRIMARY KEY (idAeropuertoPlanVuleo)
);
-- ddl-end --
ALTER TABLE aerolinea.AEROPUERTO_PLAN_VUELO OWNER TO postgres;
-- ddl-end --

-- object: AEROPUERTO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.AEROPUERTO_PLAN_VUELO DROP CONSTRAINT IF EXISTS AEROPUERTO_fk CASCADE;
ALTER TABLE aerolinea.AEROPUERTO_PLAN_VUELO ADD CONSTRAINT AEROPUERTO_fk FOREIGN KEY (idAeropuerto)
REFERENCES aerolinea.AEROPUERTO (idAeropuerto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: aerolinea.REGISTRO_ASEGURANZA | type: TABLE --
-- DROP TABLE IF EXISTS aerolinea.REGISTRO_ASEGURANZA CASCADE;
CREATE TABLE aerolinea.REGISTRO_ASEGURANZA (
	idBoleto integer NOT NULL,
	montoDevuelto float NOT NULL,
	fecha timestamp NOT NULL,
	CONSTRAINT REGISTRO_ASEGURANZA_pk PRIMARY KEY (idBoleto)
);
-- ddl-end --
ALTER TABLE aerolinea.REGISTRO_ASEGURANZA OWNER TO postgres;
-- ddl-end --

-- object: BOLETO_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.REGISTRO_ASEGURANZA DROP CONSTRAINT IF EXISTS BOLETO_fk CASCADE;
ALTER TABLE aerolinea.REGISTRO_ASEGURANZA ADD CONSTRAINT BOLETO_fk FOREIGN KEY (idBoleto)
REFERENCES aerolinea.BOLETO (idBoleto) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: avion_dia_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.VUELO DROP CONSTRAINT IF EXISTS avion_dia_uq CASCADE;
ALTER TABLE aerolinea.VUELO ADD CONSTRAINT avion_dia_uq UNIQUE (idDiaPlanVuelo,idAvion);
-- ddl-end --

-- object: vuelo_estado_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.HIST_ESTADO_VUELO DROP CONSTRAINT IF EXISTS vuelo_estado_uq CASCADE;
ALTER TABLE aerolinea.HIST_ESTADO_VUELO ADD CONSTRAINT vuelo_estado_uq UNIQUE (estadoVuelo,idVuelo);
-- ddl-end --

-- object: avion_fila_columna_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ASIENTO_AVION DROP CONSTRAINT IF EXISTS avion_fila_columna_uq CASCADE;
ALTER TABLE aerolinea.ASIENTO_AVION ADD CONSTRAINT avion_fila_columna_uq UNIQUE (fila,columna,idAvion);
-- ddl-end --

-- object: pasajero_vuelo_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.BOLETO DROP CONSTRAINT IF EXISTS pasajero_vuelo_uq CASCADE;
ALTER TABLE aerolinea.BOLETO ADD CONSTRAINT pasajero_vuelo_uq UNIQUE (idPersona,idVuelo);
-- ddl-end --

-- object: compra_tipoPago_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO DROP CONSTRAINT IF EXISTS compra_tipoPago_uq CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO ADD CONSTRAINT compra_tipoPago_uq UNIQUE (idCompra,idTipoPago);
-- ddl-end --

-- object: clase_menuGratis_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.MENU_GRATIS DROP CONSTRAINT IF EXISTS clase_menuGratis_uq CASCADE;
ALTER TABLE aerolinea.MENU_GRATIS ADD CONSTRAINT clase_menuGratis_uq UNIQUE (idClaseVuelo,id_menu);
-- ddl-end --

-- object: prod_compraA_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO DROP CONSTRAINT IF EXISTS prod_compraA_uq CASCADE;
ALTER TABLE aerolinea.DETALLE_COMPRA_ABORDO ADD CONSTRAINT prod_compraA_uq UNIQUE (idProducto,idCompraA);
-- ddl-end --

-- object: compraA_tipoPago_uq | type: CONSTRAINT --
-- ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO DROP CONSTRAINT IF EXISTS compraA_tipoPago_uq CASCADE;
ALTER TABLE aerolinea.DETALLE_PAGO_ABORDO ADD CONSTRAINT compraA_tipoPago_uq UNIQUE (idTipoPago,idCompraA);
-- ddl-end --

-- object: cuenta_vuelo | type: CONSTRAINT --
-- ALTER TABLE aerolinea.ENCUESTA DROP CONSTRAINT IF EXISTS cuenta_vuelo CASCADE;
ALTER TABLE aerolinea.ENCUESTA ADD CONSTRAINT cuenta_vuelo UNIQUE (idVuelo,idPersona);
-- ddl-end --

-- object: MEOTODO_PAGO_CUENTA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.CUENTA DROP CONSTRAINT IF EXISTS MEOTODO_PAGO_CUENTA_fk CASCADE;
ALTER TABLE aerolinea.CUENTA ADD CONSTRAINT MEOTODO_PAGO_CUENTA_fk FOREIGN KEY (metodoPagoPredeterminado)
REFERENCES aerolinea.METODO_PAGO_CUENTA (idMetodoPago) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AEROPUERTO_SALIDA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PLAN_VUELO DROP CONSTRAINT IF EXISTS AEROPUERTO_SALIDA_fk CASCADE;
ALTER TABLE aerolinea.PLAN_VUELO ADD CONSTRAINT AEROPUERTO_SALIDA_fk FOREIGN KEY (idAeropuertoSalida)
REFERENCES aerolinea.AEROPUERTO_PLAN_VUELO (idAeropuertoPlanVuleo) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: AEROPUERTO_LLEGADA_fk | type: CONSTRAINT --
-- ALTER TABLE aerolinea.PLAN_VUELO DROP CONSTRAINT IF EXISTS AEROPUERTO_LLEGADA_fk CASCADE;
ALTER TABLE aerolinea.PLAN_VUELO ADD CONSTRAINT AEROPUERTO_LLEGADA_fk FOREIGN KEY (idAeropuertoLlegada)
REFERENCES aerolinea.AEROPUERTO_PLAN_VUELO (idAeropuertoPlanVuleo) MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


