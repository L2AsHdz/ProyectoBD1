-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 1.0.0-alpha
-- PostgreSQL version: 14.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: "AerolineaBD1" | type: DATABASE --
-- DROP DATABASE IF EXISTS "AerolineaBD1";
CREATE DATABASE "AerolineaBD1";
-- ddl-end --


-- object: public.genero | type: TYPE --
-- DROP TYPE IF EXISTS public.genero CASCADE;
CREATE TYPE public.genero AS
ENUM ('Masculino','Femenino');
-- ddl-end --
ALTER TYPE public.genero OWNER TO postgres;
-- ddl-end --

-- object: public."PASAJERO" | type: TABLE --
-- DROP TABLE IF EXISTS public."PASAJERO" CASCADE;
CREATE TABLE public."PASAJERO" (
	"idPersona" integer NOT NULL,
	pasaporte varchar(50),
	CONSTRAINT "PASAJERO_pk" PRIMARY KEY ("idPersona")
);
-- ddl-end --
ALTER TABLE public."PASAJERO" OWNER TO postgres;
-- ddl-end --

-- object: public."PERSONA" | type: TABLE --
-- DROP TABLE IF EXISTS public."PERSONA" CASCADE;
CREATE TABLE public."PERSONA" (
	"idPersona" serial NOT NULL,
	"docIdentificacion" varchar(20) NOT NULL,
	nombre varchar(100) NOT NULL,
	"fechaNacimiento" date NOT NULL,
	genero public.genero NOT NULL,
	email varchar(150) NOT NULL,
	CONSTRAINT "Persona_pk" PRIMARY KEY ("idPersona"),
	CONSTRAINT email_uq UNIQUE (email)
);
-- ddl-end --
ALTER TABLE public."PERSONA" OWNER TO postgres;
-- ddl-end --

-- object: public."TELEFONO_PERSONA" | type: TABLE --
-- DROP TABLE IF EXISTS public."TELEFONO_PERSONA" CASCADE;
CREATE TABLE public."TELEFONO_PERSONA" (
	"idTelefono" serial NOT NULL,
	telefono varchar(15) NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "TELEFONO_PERSONA_pk" PRIMARY KEY ("idTelefono"),
	CONSTRAINT telefono_uq UNIQUE (telefono)
);
-- ddl-end --
ALTER TABLE public."TELEFONO_PERSONA" OWNER TO postgres;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TELEFONO_PERSONA" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."TELEFONO_PERSONA" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PASAJERO" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."PASAJERO" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."TIPO_PERSONA" | type: TABLE --
-- DROP TABLE IF EXISTS public."TIPO_PERSONA" CASCADE;
CREATE TABLE public."TIPO_PERSONA" (
	"idTipoPersona" serial NOT NULL,
	"nombreTipo" varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "TIPO_PERSONA_pk" PRIMARY KEY ("idTipoPersona")
);
-- ddl-end --
ALTER TABLE public."TIPO_PERSONA" OWNER TO postgres;
-- ddl-end --

-- object: public."ASIGNACION_TIPO_PERSONA" | type: TABLE --
-- DROP TABLE IF EXISTS public."ASIGNACION_TIPO_PERSONA" CASCADE;
CREATE TABLE public."ASIGNACION_TIPO_PERSONA" (
	"idAsignacionTipoPersona" serial NOT NULL,
	"idTipoPersona" integer NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "ASIGNACION_TIPO_PERSONA_pk" PRIMARY KEY ("idAsignacionTipoPersona")
);
-- ddl-end --
ALTER TABLE public."ASIGNACION_TIPO_PERSONA" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ASIGNACION_TIPO_PERSONA" DROP CONSTRAINT IF EXISTS "TIPO_PERSONA_fk" CASCADE;
ALTER TABLE public."ASIGNACION_TIPO_PERSONA" ADD CONSTRAINT "TIPO_PERSONA_fk" FOREIGN KEY ("idTipoPersona")
REFERENCES public."TIPO_PERSONA" ("idTipoPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ASIGNACION_TIPO_PERSONA" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."ASIGNACION_TIPO_PERSONA" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."EMPLEADO" | type: TABLE --
-- DROP TABLE IF EXISTS public."EMPLEADO" CASCADE;
CREATE TABLE public."EMPLEADO" (
	"idPersona" integer NOT NULL,
	"fechaContratacion" date NOT NULL,
	experiencia smallint NOT NULL,
	"idPuesto" integer NOT NULL,
	"idHorario" integer NOT NULL,
	CONSTRAINT "EMPLEADO_pk" PRIMARY KEY ("idPersona")
);
-- ddl-end --
ALTER TABLE public."EMPLEADO" OWNER TO postgres;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EMPLEADO" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."EMPLEADO" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."tipoEmpleado" | type: TYPE --
-- DROP TYPE IF EXISTS public."tipoEmpleado" CASCADE;
CREATE TYPE public."tipoEmpleado" AS
ENUM ('Abordo','No Abordo');
-- ddl-end --
ALTER TYPE public."tipoEmpleado" OWNER TO postgres;
-- ddl-end --

-- object: public."PUESTO" | type: TABLE --
-- DROP TABLE IF EXISTS public."PUESTO" CASCADE;
CREATE TABLE public."PUESTO" (
	"idPuesto" serial NOT NULL,
	nombre varchar(100) NOT NULL,
	sueldo_base float NOT NULL,
	comision float NOT NULL,
	descripcion varchar(250) NOT NULL,
	"tipoEmpleado" public."tipoEmpleado" NOT NULL,
	CONSTRAINT "PUESTO_pk" PRIMARY KEY ("idPuesto")
);
-- ddl-end --
ALTER TABLE public."PUESTO" OWNER TO postgres;
-- ddl-end --

-- object: "PUESTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EMPLEADO" DROP CONSTRAINT IF EXISTS "PUESTO_fk" CASCADE;
ALTER TABLE public."EMPLEADO" ADD CONSTRAINT "PUESTO_fk" FOREIGN KEY ("idPuesto")
REFERENCES public."PUESTO" ("idPuesto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."HORAS_TRABAJADAS" | type: TABLE --
-- DROP TABLE IF EXISTS public."HORAS_TRABAJADAS" CASCADE;
CREATE TABLE public."HORAS_TRABAJADAS" (
	"idHorasTrabajadas" serial NOT NULL,
	"horaEntrada" time NOT NULL,
	"horaSalida" time NOT NULL,
	fecha date NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "HORAS_TRABAJADAS_pk" PRIMARY KEY ("idHorasTrabajadas")
);
-- ddl-end --
ALTER TABLE public."HORAS_TRABAJADAS" OWNER TO postgres;
-- ddl-end --

-- object: "EMPLEADO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."HORAS_TRABAJADAS" DROP CONSTRAINT IF EXISTS "EMPLEADO_fk" CASCADE;
ALTER TABLE public."HORAS_TRABAJADAS" ADD CONSTRAINT "EMPLEADO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."EMPLEADO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.dia | type: TYPE --
-- DROP TYPE IF EXISTS public.dia CASCADE;
CREATE TYPE public.dia AS
ENUM ('Domingo','Lunes','Martes','Miercoles','Jueves','Viernes','Sabado');
-- ddl-end --
ALTER TYPE public.dia OWNER TO postgres;
-- ddl-end --

-- object: public."HORARIO" | type: TABLE --
-- DROP TABLE IF EXISTS public."HORARIO" CASCADE;
CREATE TABLE public."HORARIO" (
	"idHorario" serial NOT NULL,
	dia public.dia NOT NULL,
	"horaEntrada" time NOT NULL,
	"horaSalida" time NOT NULL,
	CONSTRAINT "HORARIO_pk" PRIMARY KEY ("idHorario")
);
-- ddl-end --
ALTER TABLE public."HORARIO" OWNER TO postgres;
-- ddl-end --

-- object: "HORARIO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EMPLEADO" DROP CONSTRAINT IF EXISTS "HORARIO_fk" CASCADE;
ALTER TABLE public."EMPLEADO" ADD CONSTRAINT "HORARIO_fk" FOREIGN KEY ("idHorario")
REFERENCES public."HORARIO" ("idHorario") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DIA_ENFERMEDAD" | type: TABLE --
-- DROP TABLE IF EXISTS public."DIA_ENFERMEDAD" CASCADE;
CREATE TABLE public."DIA_ENFERMEDAD" (
	"idDiaEnfermedad" serial NOT NULL,
	fecha date NOT NULL,
	"comprobanteMedico" text NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "DIA_ENFERMEDAD_pk" PRIMARY KEY ("idDiaEnfermedad")
);
-- ddl-end --
ALTER TABLE public."DIA_ENFERMEDAD" OWNER TO postgres;
-- ddl-end --

-- object: "EMPLEADO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DIA_ENFERMEDAD" DROP CONSTRAINT IF EXISTS "EMPLEADO_fk" CASCADE;
ALTER TABLE public."DIA_ENFERMEDAD" ADD CONSTRAINT "EMPLEADO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."EMPLEADO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "DIA_ENFERMEDAD_uq" | type: CONSTRAINT --
-- ALTER TABLE public."DIA_ENFERMEDAD" DROP CONSTRAINT IF EXISTS "DIA_ENFERMEDAD_uq" CASCADE;
ALTER TABLE public."DIA_ENFERMEDAD" ADD CONSTRAINT "DIA_ENFERMEDAD_uq" UNIQUE ("idPersona");
-- ddl-end --

-- object: public."REGISTRO_VACACIONES" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGISTRO_VACACIONES" CASCADE;
CREATE TABLE public."REGISTRO_VACACIONES" (
	"idRegistroVacaciones" serial NOT NULL,
	"fechaInicio" date NOT NULL,
	"fechaFinal" date NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "REGISTRO_VACACIONES_pk" PRIMARY KEY ("idRegistroVacaciones")
);
-- ddl-end --
ALTER TABLE public."REGISTRO_VACACIONES" OWNER TO postgres;
-- ddl-end --

-- object: "EMPLEADO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_VACACIONES" DROP CONSTRAINT IF EXISTS "EMPLEADO_fk" CASCADE;
ALTER TABLE public."REGISTRO_VACACIONES" ADD CONSTRAINT "EMPLEADO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."EMPLEADO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "REGISTRO_VACACIONES_uq" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_VACACIONES" DROP CONSTRAINT IF EXISTS "REGISTRO_VACACIONES_uq" CASCADE;
ALTER TABLE public."REGISTRO_VACACIONES" ADD CONSTRAINT "REGISTRO_VACACIONES_uq" UNIQUE ("idPersona");
-- ddl-end --

-- object: public."SOLICITUD_VACACIONES" | type: TABLE --
-- DROP TABLE IF EXISTS public."SOLICITUD_VACACIONES" CASCADE;
CREATE TABLE public."SOLICITUD_VACACIONES" (
	"idSolicitudVacaciones" serial NOT NULL,
	fecha date NOT NULL,
	"cartaSolicitud" text NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "SOLICITUD_VACACIONES_pk" PRIMARY KEY ("idSolicitudVacaciones")
);
-- ddl-end --
ALTER TABLE public."SOLICITUD_VACACIONES" OWNER TO postgres;
-- ddl-end --

-- object: "EMPLEADO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."SOLICITUD_VACACIONES" DROP CONSTRAINT IF EXISTS "EMPLEADO_fk" CASCADE;
ALTER TABLE public."SOLICITUD_VACACIONES" ADD CONSTRAINT "EMPLEADO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."EMPLEADO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "SOLICITUD_VACACIONES_uq" | type: CONSTRAINT --
-- ALTER TABLE public."SOLICITUD_VACACIONES" DROP CONSTRAINT IF EXISTS "SOLICITUD_VACACIONES_uq" CASCADE;
ALTER TABLE public."SOLICITUD_VACACIONES" ADD CONSTRAINT "SOLICITUD_VACACIONES_uq" UNIQUE ("idPersona");
-- ddl-end --

-- object: public."TIPO_CUENTA" | type: TABLE --
-- DROP TABLE IF EXISTS public."TIPO_CUENTA" CASCADE;
CREATE TABLE public."TIPO_CUENTA" (
	"idTipoCuenta" serial NOT NULL,
	nombre varchar(100) NOT NULL,
	descripcion varchar(250) NOT NULL,
	recompensa float NOT NULL,
	CONSTRAINT "TIPO_CUENTA_pk" PRIMARY KEY ("idTipoCuenta")
);
-- ddl-end --
ALTER TABLE public."TIPO_CUENTA" OWNER TO postgres;
-- ddl-end --

-- object: public."CUENTA" | type: TABLE --
-- DROP TABLE IF EXISTS public."CUENTA" CASCADE;
CREATE TABLE public."CUENTA" (
	"idPersona" integer NOT NULL,
	username varchar(60) NOT NULL,
	password varchar(100) NOT NULL,
	millas float NOT NULL,
	"idTipoCuenta" integer NOT NULL,
	CONSTRAINT "CUENTA_pk" PRIMARY KEY ("idPersona"),
	CONSTRAINT username_uq UNIQUE (username)
);
-- ddl-end --
ALTER TABLE public."CUENTA" OWNER TO postgres;
-- ddl-end --

-- object: public."METODO_PAGO_CUENTA" | type: TABLE --
-- DROP TABLE IF EXISTS public."METODO_PAGO_CUENTA" CASCADE;
CREATE TABLE public."METODO_PAGO_CUENTA" (
	"idMetodoPago" serial NOT NULL,
	descripcion varchar(250) NOT NULL,
	"idTipoPago" integer NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "METODO_PAGO_CUENTA_pk" PRIMARY KEY ("idMetodoPago")
);
-- ddl-end --
ALTER TABLE public."METODO_PAGO_CUENTA" OWNER TO postgres;
-- ddl-end --

-- object: public."TIPO_METODO_PAGO" | type: TABLE --
-- DROP TABLE IF EXISTS public."TIPO_METODO_PAGO" CASCADE;
CREATE TABLE public."TIPO_METODO_PAGO" (
	"idTipoPago" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "TIPO_METODO_PAGO_pk" PRIMARY KEY ("idTipoPago"),
	CONSTRAINT nombre_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE public."TIPO_METODO_PAGO" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_METODO_PAGO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."METODO_PAGO_CUENTA" DROP CONSTRAINT IF EXISTS "TIPO_METODO_PAGO_fk" CASCADE;
ALTER TABLE public."METODO_PAGO_CUENTA" ADD CONSTRAINT "TIPO_METODO_PAGO_fk" FOREIGN KEY ("idTipoPago")
REFERENCES public."TIPO_METODO_PAGO" ("idTipoPago") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PASAJERO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."CUENTA" DROP CONSTRAINT IF EXISTS "PASAJERO_fk" CASCADE;
ALTER TABLE public."CUENTA" ADD CONSTRAINT "PASAJERO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PASAJERO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."METODO_PAGO_CUENTA" DROP CONSTRAINT IF EXISTS "CUENTA_fk" CASCADE;
ALTER TABLE public."METODO_PAGO_CUENTA" ADD CONSTRAINT "CUENTA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."CUENTA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TIPO_CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."CUENTA" DROP CONSTRAINT IF EXISTS "TIPO_CUENTA_fk" CASCADE;
ALTER TABLE public."CUENTA" ADD CONSTRAINT "TIPO_CUENTA_fk" FOREIGN KEY ("idTipoCuenta")
REFERENCES public."TIPO_CUENTA" ("idTipoCuenta") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PAYPAL" | type: TABLE --
-- DROP TABLE IF EXISTS public."PAYPAL" CASCADE;
CREATE TABLE public."PAYPAL" (
	"idMetodoPago" integer NOT NULL,
	email varchar(150) NOT NULL,
	CONSTRAINT "PAYPAL_pk" PRIMARY KEY ("idMetodoPago")
);
-- ddl-end --
ALTER TABLE public."PAYPAL" OWNER TO postgres;
-- ddl-end --

-- object: "METODO_PAGO_CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PAYPAL" DROP CONSTRAINT IF EXISTS "METODO_PAGO_CUENTA_fk" CASCADE;
ALTER TABLE public."PAYPAL" ADD CONSTRAINT "METODO_PAGO_CUENTA_fk" FOREIGN KEY ("idMetodoPago")
REFERENCES public."METODO_PAGO_CUENTA" ("idMetodoPago") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."tipoTarjeta" | type: TYPE --
-- DROP TYPE IF EXISTS public."tipoTarjeta" CASCADE;
CREATE TYPE public."tipoTarjeta" AS
ENUM ('Debito','Credito');
-- ddl-end --
ALTER TYPE public."tipoTarjeta" OWNER TO postgres;
-- ddl-end --

-- object: public."TARJETA" | type: TABLE --
-- DROP TABLE IF EXISTS public."TARJETA" CASCADE;
CREATE TABLE public."TARJETA" (
	"idMetodoPago" integer NOT NULL,
	"numeroTarjeta" varchar(25) NOT NULL,
	"fechaExpiracion" date NOT NULL,
	"tipoTarjeta" public."tipoTarjeta" NOT NULL,
	CONSTRAINT "TARJETA_pk" PRIMARY KEY ("idMetodoPago")
);
-- ddl-end --
ALTER TABLE public."TARJETA" OWNER TO postgres;
-- ddl-end --

-- object: "METODO_PAGO_CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."TARJETA" DROP CONSTRAINT IF EXISTS "METODO_PAGO_CUENTA_fk" CASCADE;
ALTER TABLE public."TARJETA" ADD CONSTRAINT "METODO_PAGO_CUENTA_fk" FOREIGN KEY ("idMetodoPago")
REFERENCES public."METODO_PAGO_CUENTA" ("idMetodoPago") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."HIST_CUENTA" | type: TABLE --
-- DROP TABLE IF EXISTS public."HIST_CUENTA" CASCADE;
CREATE TABLE public."HIST_CUENTA" (
	"idHistCuenta" serial NOT NULL,
	fecha date NOT NULL,
	"idTipoCuenta" integer NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "HIST_CUENTA_pk" PRIMARY KEY ("idHistCuenta")
);
-- ddl-end --
ALTER TABLE public."HIST_CUENTA" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_CUENTA" DROP CONSTRAINT IF EXISTS "TIPO_CUENTA_fk" CASCADE;
ALTER TABLE public."HIST_CUENTA" ADD CONSTRAINT "TIPO_CUENTA_fk" FOREIGN KEY ("idTipoCuenta")
REFERENCES public."TIPO_CUENTA" ("idTipoCuenta") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "HIST_CUENTA_uq" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_CUENTA" DROP CONSTRAINT IF EXISTS "HIST_CUENTA_uq" CASCADE;
ALTER TABLE public."HIST_CUENTA" ADD CONSTRAINT "HIST_CUENTA_uq" UNIQUE ("idTipoCuenta");
-- ddl-end --

-- object: "CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_CUENTA" DROP CONSTRAINT IF EXISTS "CUENTA_fk" CASCADE;
ALTER TABLE public."HIST_CUENTA" ADD CONSTRAINT "CUENTA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."CUENTA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "HIST_CUENTA_uq1" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_CUENTA" DROP CONSTRAINT IF EXISTS "HIST_CUENTA_uq1" CASCADE;
ALTER TABLE public."HIST_CUENTA" ADD CONSTRAINT "HIST_CUENTA_uq1" UNIQUE ("idPersona");
-- ddl-end --

-- object: public."BENEFICIO" | type: TABLE --
-- DROP TABLE IF EXISTS public."BENEFICIO" CASCADE;
CREATE TABLE public."BENEFICIO" (
	"idBeneficio" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "BENEFICIO_pk" PRIMARY KEY ("idBeneficio")
);
-- ddl-end --
ALTER TABLE public."BENEFICIO" OWNER TO postgres;
-- ddl-end --

-- object: public."BENEFICIO_CUENTA" | type: TABLE --
-- DROP TABLE IF EXISTS public."BENEFICIO_CUENTA" CASCADE;
CREATE TABLE public."BENEFICIO_CUENTA" (
	"idBeneficioCuenta" serial NOT NULL,
	valor float NOT NULL,
	"idTipoCuenta" integer NOT NULL,
	"idBeneficio" integer NOT NULL,
	CONSTRAINT "BENEFICIO_CUENTA_pk" PRIMARY KEY ("idBeneficioCuenta")
);
-- ddl-end --
ALTER TABLE public."BENEFICIO_CUENTA" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CUENTA" DROP CONSTRAINT IF EXISTS "TIPO_CUENTA_fk" CASCADE;
ALTER TABLE public."BENEFICIO_CUENTA" ADD CONSTRAINT "TIPO_CUENTA_fk" FOREIGN KEY ("idTipoCuenta")
REFERENCES public."TIPO_CUENTA" ("idTipoCuenta") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "BENEFICIO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CUENTA" DROP CONSTRAINT IF EXISTS "BENEFICIO_fk" CASCADE;
ALTER TABLE public."BENEFICIO_CUENTA" ADD CONSTRAINT "BENEFICIO_fk" FOREIGN KEY ("idBeneficio")
REFERENCES public."BENEFICIO" ("idBeneficio") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PAIS" | type: TABLE --
-- DROP TABLE IF EXISTS public."PAIS" CASCADE;
CREATE TABLE public."PAIS" (
	"idPais" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	nacionalidad varchar(100) NOT NULL,
	"idiomaOficial" varchar(50) NOT NULL,
	CONSTRAINT "PAIS_pk" PRIMARY KEY ("idPais")
);
-- ddl-end --
ALTER TABLE public."PAIS" OWNER TO postgres;
-- ddl-end --

-- object: public."PAIS_PERSONA" | type: TABLE --
-- DROP TABLE IF EXISTS public."PAIS_PERSONA" CASCADE;
CREATE TABLE public."PAIS_PERSONA" (
	"idPais" integer NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "PAIS_PERSONA_pk" PRIMARY KEY ("idPais","idPersona")
);
-- ddl-end --
ALTER TABLE public."PAIS_PERSONA" OWNER TO postgres;
-- ddl-end --

-- object: "PAIS_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PAIS_PERSONA" DROP CONSTRAINT IF EXISTS "PAIS_fk" CASCADE;
ALTER TABLE public."PAIS_PERSONA" ADD CONSTRAINT "PAIS_fk" FOREIGN KEY ("idPais")
REFERENCES public."PAIS" ("idPais") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PAIS_PERSONA" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."PAIS_PERSONA" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."AEROPUERTO" | type: TABLE --
-- DROP TABLE IF EXISTS public."AEROPUERTO" CASCADE;
CREATE TABLE public."AEROPUERTO" (
	"idAeropuerto" serial NOT NULL,
	nombre varchar(60) NOT NULL,
	direccion varchar(200) NOT NULL,
	"idPais" integer NOT NULL,
	CONSTRAINT "Aeropuerto_pk" PRIMARY KEY ("idAeropuerto")
);
-- ddl-end --
ALTER TABLE public."AEROPUERTO" OWNER TO postgres;
-- ddl-end --

-- object: "PAIS_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AEROPUERTO" DROP CONSTRAINT IF EXISTS "PAIS_fk" CASCADE;
ALTER TABLE public."AEROPUERTO" ADD CONSTRAINT "PAIS_fk" FOREIGN KEY ("idPais")
REFERENCES public."PAIS" ("idPais") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."estadoGeneral" | type: TYPE --
-- DROP TYPE IF EXISTS public."estadoGeneral" CASCADE;
CREATE TYPE public."estadoGeneral" AS
ENUM ('Habilitado','Deshabilitado','Sin estado');
-- ddl-end --
ALTER TYPE public."estadoGeneral" OWNER TO postgres;
-- ddl-end --

-- object: public."PLAN_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."PLAN_VUELO" CASCADE;
CREATE TABLE public."PLAN_VUELO" (
	"idPlanVuelo" serial NOT NULL,
	distancia float NOT NULL,
	"idAeropuertoSalida" integer NOT NULL,
	"puertaSalida" varchar(15) NOT NULL,
	"horaSalida" time NOT NULL,
	"horaAbordaje" time NOT NULL,
	"idAeropuertoLlegada" integer NOT NULL,
	"horaLlegada" time NOT NULL,
	"puertaLlegada" varchar(15) NOT NULL,
	"fechaInicio" date NOT NULL,
	"fechaFinal" date NOT NULL,
	estado public."estadoGeneral" NOT NULL,
	"idTipoAvion" integer NOT NULL,
	CONSTRAINT "PLAN_VUELO_pk" PRIMARY KEY ("idPlanVuelo")
);
-- ddl-end --
ALTER TABLE public."PLAN_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: public."TIPO_AVION" | type: TABLE --
-- DROP TABLE IF EXISTS public."TIPO_AVION" CASCADE;
CREATE TABLE public."TIPO_AVION" (
	"idTipoAvion" serial NOT NULL,
	nombre varchar(60) NOT NULL,
	descripcion varchar(250) NOT NULL,
	"numeroTripulantes" integer NOT NULL,
	"capacidadFilas" smallint NOT NULL,
	"capacidadColumnas" smallint NOT NULL,
	CONSTRAINT "TIPO_AVION_pk" PRIMARY KEY ("idTipoAvion"),
	CONSTRAINT nomobre_uq UNIQUE (nombre)
);
-- ddl-end --
ALTER TABLE public."TIPO_AVION" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PLAN_VUELO" DROP CONSTRAINT IF EXISTS "TIPO_AVION_fk" CASCADE;
ALTER TABLE public."PLAN_VUELO" ADD CONSTRAINT "TIPO_AVION_fk" FOREIGN KEY ("idTipoAvion")
REFERENCES public."TIPO_AVION" ("idTipoAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DIA_PLAN_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."DIA_PLAN_VUELO" CASCADE;
CREATE TABLE public."DIA_PLAN_VUELO" (
	"idDiaPlanVuelo" serial NOT NULL,
	dia public.dia NOT NULL,
	"idPlanVuelo" integer NOT NULL,
	CONSTRAINT "DIA_PLAN_VUELO_pk" PRIMARY KEY ("idDiaPlanVuelo")
);
-- ddl-end --
ALTER TABLE public."DIA_PLAN_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: "PLAN_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DIA_PLAN_VUELO" DROP CONSTRAINT IF EXISTS "PLAN_VUELO_fk" CASCADE;
ALTER TABLE public."DIA_PLAN_VUELO" ADD CONSTRAINT "PLAN_VUELO_fk" FOREIGN KEY ("idPlanVuelo")
REFERENCES public."PLAN_VUELO" ("idPlanVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PRECIO_DIA_PLAN_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."PRECIO_DIA_PLAN_VUELO" CASCADE;
CREATE TABLE public."PRECIO_DIA_PLAN_VUELO" (
	"idPrecioDiaPlanVuelo" serial NOT NULL,
	"precioChamaco" float NOT NULL,
	"precioAdulto" float NOT NULL,
	"porcentajeAumentoChamaco" float NOT NULL,
	"porcentajeAumentoAdulto" float NOT NULL,
	"idClaseVuelo" integer NOT NULL,
	"idDiaPlanVuelo" integer NOT NULL,
	CONSTRAINT "PRECIO_DIA_PLAN_VUELO_pk" PRIMARY KEY ("idPrecioDiaPlanVuelo")
);
-- ddl-end --
ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: public."CLASE_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."CLASE_VUELO" CASCADE;
CREATE TABLE public."CLASE_VUELO" (
	"idClaseVuelo" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "CLASE_VUELO_pk" PRIMARY KEY ("idClaseVuelo")
);
-- ddl-end --
ALTER TABLE public."CLASE_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: "CLASE_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" DROP CONSTRAINT IF EXISTS "CLASE_VUELO_fk" CASCADE;
ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" ADD CONSTRAINT "CLASE_VUELO_fk" FOREIGN KEY ("idClaseVuelo")
REFERENCES public."CLASE_VUELO" ("idClaseVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "DIA_PLAN_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" DROP CONSTRAINT IF EXISTS "DIA_PLAN_VUELO_fk" CASCADE;
ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" ADD CONSTRAINT "DIA_PLAN_VUELO_fk" FOREIGN KEY ("idDiaPlanVuelo")
REFERENCES public."DIA_PLAN_VUELO" ("idDiaPlanVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."BENEFICIO_CLASE" | type: TABLE --
-- DROP TABLE IF EXISTS public."BENEFICIO_CLASE" CASCADE;
CREATE TABLE public."BENEFICIO_CLASE" (
	"idBeneficioClase" serial NOT NULL,
	valor float NOT NULL,
	"idClaseVuelo" integer NOT NULL,
	"idBeneficio" integer NOT NULL,
	CONSTRAINT "BENEFICIO_CLASE_pk" PRIMARY KEY ("idBeneficioClase")
);
-- ddl-end --
ALTER TABLE public."BENEFICIO_CLASE" OWNER TO postgres;
-- ddl-end --

-- object: "CLASE_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CLASE" DROP CONSTRAINT IF EXISTS "CLASE_VUELO_fk" CASCADE;
ALTER TABLE public."BENEFICIO_CLASE" ADD CONSTRAINT "CLASE_VUELO_fk" FOREIGN KEY ("idClaseVuelo")
REFERENCES public."CLASE_VUELO" ("idClaseVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "BENEFICIO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CLASE" DROP CONSTRAINT IF EXISTS "BENEFICIO_fk" CASCADE;
ALTER TABLE public."BENEFICIO_CLASE" ADD CONSTRAINT "BENEFICIO_fk" FOREIGN KEY ("idBeneficio")
REFERENCES public."BENEFICIO" ("idBeneficio") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DISTRIBUCION_ASIENTOS" | type: TABLE --
-- DROP TABLE IF EXISTS public."DISTRIBUCION_ASIENTOS" CASCADE;
CREATE TABLE public."DISTRIBUCION_ASIENTOS" (
	"idDistribucionAsientos" serial NOT NULL,
	filas smallint NOT NULL,
	columnas smallint NOT NULL,
	"idClaseVuelo" integer NOT NULL,
	"idTipoAvion" integer NOT NULL,
	CONSTRAINT "DISTRIBUCION_ASIENTOS_pk" PRIMARY KEY ("idDistribucionAsientos")
);
-- ddl-end --
ALTER TABLE public."DISTRIBUCION_ASIENTOS" OWNER TO postgres;
-- ddl-end --

-- object: "CLASE_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DISTRIBUCION_ASIENTOS" DROP CONSTRAINT IF EXISTS "CLASE_VUELO_fk" CASCADE;
ALTER TABLE public."DISTRIBUCION_ASIENTOS" ADD CONSTRAINT "CLASE_VUELO_fk" FOREIGN KEY ("idClaseVuelo")
REFERENCES public."CLASE_VUELO" ("idClaseVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TIPO_AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DISTRIBUCION_ASIENTOS" DROP CONSTRAINT IF EXISTS "TIPO_AVION_fk" CASCADE;
ALTER TABLE public."DISTRIBUCION_ASIENTOS" ADD CONSTRAINT "TIPO_AVION_fk" FOREIGN KEY ("idTipoAvion")
REFERENCES public."TIPO_AVION" ("idTipoAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."estadoAvion" | type: TYPE --
-- DROP TYPE IF EXISTS public."estadoAvion" CASCADE;
CREATE TYPE public."estadoAvion" AS
ENUM ('Disponible','Ocupado','En mantenimiento','Retirado');
-- ddl-end --
ALTER TYPE public."estadoAvion" OWNER TO postgres;
-- ddl-end --

-- object: public."AVION" | type: TABLE --
-- DROP TABLE IF EXISTS public."AVION" CASCADE;
CREATE TABLE public."AVION" (
	"idAvion" serial NOT NULL,
	"fechaAdquisicion" date NOT NULL,
	"fechaPrimerVuelo" date,
	"fehcaUltimoMantenimiento" date,
	estado public."estadoAvion" NOT NULL,
	"idTipoAvion" integer NOT NULL,
	CONSTRAINT "AVION_pk" PRIMARY KEY ("idAvion")
);
-- ddl-end --
ALTER TABLE public."AVION" OWNER TO postgres;
-- ddl-end --

-- object: public."ASIENTO_AVION" | type: TABLE --
-- DROP TABLE IF EXISTS public."ASIENTO_AVION" CASCADE;
CREATE TABLE public."ASIENTO_AVION" (
	"idAsiento" serial NOT NULL,
	fila smallint NOT NULL,
	columna smallint NOT NULL,
	"idAvion" integer NOT NULL,
	CONSTRAINT "ASIENTO_pk" PRIMARY KEY ("idAsiento")
);
-- ddl-end --
ALTER TABLE public."ASIENTO_AVION" OWNER TO postgres;
-- ddl-end --

-- object: "AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ASIENTO_AVION" DROP CONSTRAINT IF EXISTS "AVION_fk" CASCADE;
ALTER TABLE public."ASIENTO_AVION" ADD CONSTRAINT "AVION_fk" FOREIGN KEY ("idAvion")
REFERENCES public."AVION" ("idAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "planVuelo_dia_uq" | type: CONSTRAINT --
-- ALTER TABLE public."DIA_PLAN_VUELO" DROP CONSTRAINT IF EXISTS "planVuelo_dia_uq" CASCADE;
ALTER TABLE public."DIA_PLAN_VUELO" ADD CONSTRAINT "planVuelo_dia_uq" UNIQUE (dia,"idPlanVuelo");
-- ddl-end --

-- object: "diaPlanVuelo_clase_uq" | type: CONSTRAINT --
-- ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" DROP CONSTRAINT IF EXISTS "diaPlanVuelo_clase_uq" CASCADE;
ALTER TABLE public."PRECIO_DIA_PLAN_VUELO" ADD CONSTRAINT "diaPlanVuelo_clase_uq" UNIQUE ("idClaseVuelo","idDiaPlanVuelo");
-- ddl-end --

-- object: beneficio_clase_uq | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CLASE" DROP CONSTRAINT IF EXISTS beneficio_clase_uq CASCADE;
ALTER TABLE public."BENEFICIO_CLASE" ADD CONSTRAINT beneficio_clase_uq UNIQUE ("idClaseVuelo","idBeneficio");
-- ddl-end --

-- object: benedicio_cuenta_uq | type: CONSTRAINT --
-- ALTER TABLE public."BENEFICIO_CUENTA" DROP CONSTRAINT IF EXISTS benedicio_cuenta_uq CASCADE;
ALTER TABLE public."BENEFICIO_CUENTA" ADD CONSTRAINT benedicio_cuenta_uq UNIQUE ("idTipoCuenta","idBeneficio");
-- ddl-end --

-- object: "tipoAvion_calse_uq" | type: CONSTRAINT --
-- ALTER TABLE public."DISTRIBUCION_ASIENTOS" DROP CONSTRAINT IF EXISTS "tipoAvion_calse_uq" CASCADE;
ALTER TABLE public."DISTRIBUCION_ASIENTOS" ADD CONSTRAINT "tipoAvion_calse_uq" UNIQUE ("idClaseVuelo","idTipoAvion");
-- ddl-end --

-- object: public."estadoVuelo" | type: TYPE --
-- DROP TYPE IF EXISTS public."estadoVuelo" CASCADE;
CREATE TYPE public."estadoVuelo" AS
ENUM ('Preparando','Abordaje','Despegue','En vuelo','Aterrizaje','Desbordaje','Finalizado');
-- ddl-end --
ALTER TYPE public."estadoVuelo" OWNER TO postgres;
-- ddl-end --

-- object: public."VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."VUELO" CASCADE;
CREATE TABLE public."VUELO" (
	"idVuelo" serial NOT NULL,
	"horaRealDespegue" time NOT NULL,
	"horaRealAterrizaje" time NOT NULL,
	"estadoActual" public."estadoVuelo" NOT NULL,
	fecha date NOT NULL,
	"idDiaPlanVuelo" integer NOT NULL,
	"idAvion" integer NOT NULL,
	CONSTRAINT "VUELO_pk" PRIMARY KEY ("idVuelo")
);
-- ddl-end --
ALTER TABLE public."VUELO" OWNER TO postgres;
-- ddl-end --

-- object: "DIA_PLAN_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."VUELO" DROP CONSTRAINT IF EXISTS "DIA_PLAN_VUELO_fk" CASCADE;
ALTER TABLE public."VUELO" ADD CONSTRAINT "DIA_PLAN_VUELO_fk" FOREIGN KEY ("idDiaPlanVuelo")
REFERENCES public."DIA_PLAN_VUELO" ("idDiaPlanVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TIPO_AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."AVION" DROP CONSTRAINT IF EXISTS "TIPO_AVION_fk" CASCADE;
ALTER TABLE public."AVION" ADD CONSTRAINT "TIPO_AVION_fk" FOREIGN KEY ("idTipoAvion")
REFERENCES public."TIPO_AVION" ("idTipoAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."VUELO" DROP CONSTRAINT IF EXISTS "AVION_fk" CASCADE;
ALTER TABLE public."VUELO" ADD CONSTRAINT "AVION_fk" FOREIGN KEY ("idAvion")
REFERENCES public."AVION" ("idAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."HIST_ESTADO_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."HIST_ESTADO_VUELO" CASCADE;
CREATE TABLE public."HIST_ESTADO_VUELO" (
	"idHistEstadoVuelo" serial NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"estadoVuelo" public."estadoVuelo" NOT NULL,
	"idVuelo" integer NOT NULL,
	CONSTRAINT "HIST_ESTADO_VUELO_pk" PRIMARY KEY ("idHistEstadoVuelo")
);
-- ddl-end --
ALTER TABLE public."HIST_ESTADO_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: "VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_ESTADO_VUELO" DROP CONSTRAINT IF EXISTS "VUELO_fk" CASCADE;
ALTER TABLE public."HIST_ESTADO_VUELO" ADD CONSTRAINT "VUELO_fk" FOREIGN KEY ("idVuelo")
REFERENCES public."VUELO" ("idVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."estadoCompra" | type: TYPE --
-- DROP TYPE IF EXISTS public."estadoCompra" CASCADE;
CREATE TYPE public."estadoCompra" AS
ENUM ('Normal','Modificado','Anulada');
-- ddl-end --
ALTER TYPE public."estadoCompra" OWNER TO postgres;
-- ddl-end --

-- object: public."COMPRA" | type: TABLE --
-- DROP TABLE IF EXISTS public."COMPRA" CASCADE;
CREATE TABLE public."COMPRA" (
	"idCompra" serial NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"fechaCancelacion" timestamp NOT NULL,
	"fechaModificacion" timestamp NOT NULL,
	estado public."estadoCompra" NOT NULL DEFAULT Normal,
	"idPersona" integer NOT NULL,
	CONSTRAINT "COMPRA_pk" PRIMARY KEY ("idCompra")
);
-- ddl-end --
ALTER TABLE public."COMPRA" OWNER TO postgres;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."COMPRA" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."COMPRA" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."BOLETO" | type: TABLE --
-- DROP TABLE IF EXISTS public."BOLETO" CASCADE;
CREATE TABLE public."BOLETO" (
	"idBoleto" serial NOT NULL,
	dia public.dia NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"costoAseguranza" float NOT NULL,
	descuento float NOT NULL,
	"isIdaVuelta" boolean NOT NULL DEFAULT false,
	precio float NOT NULL,
	"idCompra" integer NOT NULL,
	"idClaseVuelo" integer NOT NULL,
	"idPersona" integer NOT NULL,
	"idAsiento" integer NOT NULL,
	"idVuelo" integer NOT NULL,
	CONSTRAINT "Boleto_pk" PRIMARY KEY ("idBoleto")
);
-- ddl-end --
ALTER TABLE public."BOLETO" OWNER TO postgres;
-- ddl-end --

-- object: "COMPRA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOLETO" DROP CONSTRAINT IF EXISTS "COMPRA_fk" CASCADE;
ALTER TABLE public."BOLETO" ADD CONSTRAINT "COMPRA_fk" FOREIGN KEY ("idCompra")
REFERENCES public."COMPRA" ("idCompra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "CLASE_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOLETO" DROP CONSTRAINT IF EXISTS "CLASE_VUELO_fk" CASCADE;
ALTER TABLE public."BOLETO" ADD CONSTRAINT "CLASE_VUELO_fk" FOREIGN KEY ("idClaseVuelo")
REFERENCES public."CLASE_VUELO" ("idClaseVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PASAJERO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOLETO" DROP CONSTRAINT IF EXISTS "PASAJERO_fk" CASCADE;
ALTER TABLE public."BOLETO" ADD CONSTRAINT "PASAJERO_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PASAJERO" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "ASIENTO_AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOLETO" DROP CONSTRAINT IF EXISTS "ASIENTO_AVION_fk" CASCADE;
ALTER TABLE public."BOLETO" ADD CONSTRAINT "ASIENTO_AVION_fk" FOREIGN KEY ("idAsiento")
REFERENCES public."ASIENTO_AVION" ("idAsiento") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."BOLETO" DROP CONSTRAINT IF EXISTS "VUELO_fk" CASCADE;
ALTER TABLE public."BOLETO" ADD CONSTRAINT "VUELO_fk" FOREIGN KEY ("idVuelo")
REFERENCES public."VUELO" ("idVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DETALLE_PAGO" | type: TABLE --
-- DROP TABLE IF EXISTS public."DETALLE_PAGO" CASCADE;
CREATE TABLE public."DETALLE_PAGO" (
	"idDetallePago" serial NOT NULL,
	"porcentajePagado" float NOT NULL,
	"idCompra" integer NOT NULL,
	"idTipoPago" integer NOT NULL,
	CONSTRAINT "DETALLE_PAGO_pk" PRIMARY KEY ("idDetallePago")
);
-- ddl-end --
ALTER TABLE public."DETALLE_PAGO" OWNER TO postgres;
-- ddl-end --

-- object: "COMPRA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_PAGO" DROP CONSTRAINT IF EXISTS "COMPRA_fk" CASCADE;
ALTER TABLE public."DETALLE_PAGO" ADD CONSTRAINT "COMPRA_fk" FOREIGN KEY ("idCompra")
REFERENCES public."COMPRA" ("idCompra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "TIPO_METODO_PAGO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_PAGO" DROP CONSTRAINT IF EXISTS "TIPO_METODO_PAGO_fk" CASCADE;
ALTER TABLE public."DETALLE_PAGO" ADD CONSTRAINT "TIPO_METODO_PAGO_fk" FOREIGN KEY ("idTipoPago")
REFERENCES public."TIPO_METODO_PAGO" ("idTipoPago") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."tipoRegistro" | type: TYPE --
-- DROP TYPE IF EXISTS public."tipoRegistro" CASCADE;
CREATE TYPE public."tipoRegistro" AS
ENUM ('Comprado','Beneficio Cuenta','Beneficio Clase');
-- ddl-end --
ALTER TYPE public."tipoRegistro" OWNER TO postgres;
-- ddl-end --

-- object: public."REGISTRO_MALETA" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGISTRO_MALETA" CASCADE;
CREATE TABLE public."REGISTRO_MALETA" (
	"idRegistroMaleta" serial NOT NULL,
	precio float NOT NULL,
	peso float NOT NULL,
	"tipoRegistro" public."tipoRegistro" NOT NULL,
	"idBoleto" integer NOT NULL,
	"idCompra" integer NOT NULL,
	CONSTRAINT "REGISTRO_MALETA_pk" PRIMARY KEY ("idRegistroMaleta")
);
-- ddl-end --
ALTER TABLE public."REGISTRO_MALETA" OWNER TO postgres;
-- ddl-end --

-- object: "BOLETO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_MALETA" DROP CONSTRAINT IF EXISTS "BOLETO_fk" CASCADE;
ALTER TABLE public."REGISTRO_MALETA" ADD CONSTRAINT "BOLETO_fk" FOREIGN KEY ("idBoleto")
REFERENCES public."BOLETO" ("idBoleto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COMPRA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_MALETA" DROP CONSTRAINT IF EXISTS "COMPRA_fk" CASCADE;
ALTER TABLE public."REGISTRO_MALETA" ADD CONSTRAINT "COMPRA_fk" FOREIGN KEY ("idCompra")
REFERENCES public."COMPRA" ("idCompra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."RegistroMascota" | type: TABLE --
-- DROP TABLE IF EXISTS public."RegistroMascota" CASCADE;
CREATE TABLE public."RegistroMascota" (
	"idRegistroMascota" serial NOT NULL,
	precio float NOT NULL,
	peso float NOT NULL,
	especie varchar(50) NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	"listadoVacunas" text NOT NULL,
	"certificadoVeterinario" varchar(30) NOT NULL,
	"tipoRegistro" public."tipoRegistro" NOT NULL,
	"idBoleto" integer NOT NULL,
	"idCompra" integer NOT NULL,
	CONSTRAINT "RegistroMascota_pk" PRIMARY KEY ("idRegistroMascota")
);
-- ddl-end --
ALTER TABLE public."RegistroMascota" OWNER TO postgres;
-- ddl-end --

-- object: "BOLETO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."RegistroMascota" DROP CONSTRAINT IF EXISTS "BOLETO_fk" CASCADE;
ALTER TABLE public."RegistroMascota" ADD CONSTRAINT "BOLETO_fk" FOREIGN KEY ("idBoleto")
REFERENCES public."BOLETO" ("idBoleto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COMPRA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."RegistroMascota" DROP CONSTRAINT IF EXISTS "COMPRA_fk" CASCADE;
ALTER TABLE public."RegistroMascota" ADD CONSTRAINT "COMPRA_fk" FOREIGN KEY ("idCompra")
REFERENCES public."COMPRA" ("idCompra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."REGISTRO_ENCARGADO_CHAMACO" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGISTRO_ENCARGADO_CHAMACO" CASCADE;
CREATE TABLE public."REGISTRO_ENCARGADO_CHAMACO" (
	"idEncargadoChamaco" serial NOT NULL,
	precio float NOT NULL,
	"tipoRegistro" public."tipoRegistro" NOT NULL,
	"idBoleto" integer NOT NULL,
	"idCompra" integer NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "ENCARGADO_CHAMACO_pk" PRIMARY KEY ("idEncargadoChamaco")
);
-- ddl-end --
ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" OWNER TO postgres;
-- ddl-end --

-- object: "BOLETO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" DROP CONSTRAINT IF EXISTS "BOLETO_fk" CASCADE;
ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" ADD CONSTRAINT "BOLETO_fk" FOREIGN KEY ("idBoleto")
REFERENCES public."BOLETO" ("idBoleto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "REGISTRO_ENCARGADO_CHAMACO_uq" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" DROP CONSTRAINT IF EXISTS "REGISTRO_ENCARGADO_CHAMACO_uq" CASCADE;
ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" ADD CONSTRAINT "REGISTRO_ENCARGADO_CHAMACO_uq" UNIQUE ("idBoleto");
-- ddl-end --

-- object: "COMPRA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" DROP CONSTRAINT IF EXISTS "COMPRA_fk" CASCADE;
ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" ADD CONSTRAINT "COMPRA_fk" FOREIGN KEY ("idCompra")
REFERENCES public."COMPRA" ("idCompra") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PERSONA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" DROP CONSTRAINT IF EXISTS "PERSONA_fk" CASCADE;
ALTER TABLE public."REGISTRO_ENCARGADO_CHAMACO" ADD CONSTRAINT "PERSONA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."PERSONA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DETALLE_PAGO_ABORDO" | type: TABLE --
-- DROP TABLE IF EXISTS public."DETALLE_PAGO_ABORDO" CASCADE;
CREATE TABLE public."DETALLE_PAGO_ABORDO" (
	"idDetallePago" serial NOT NULL,
	"porcentajePagado" float NOT NULL,
	"idTipoPago" integer NOT NULL,
	"idCompraA" integer NOT NULL,
	CONSTRAINT "DETALLE_PAGO_ABORDO_pk" PRIMARY KEY ("idDetallePago")
);
-- ddl-end --
ALTER TABLE public."DETALLE_PAGO_ABORDO" OWNER TO postgres;
-- ddl-end --

-- object: public."tipoCompraA" | type: TYPE --
-- DROP TYPE IF EXISTS public."tipoCompraA" CASCADE;
CREATE TYPE public."tipoCompraA" AS
ENUM ('Wifi','Pelicula','Comida');
-- ddl-end --
ALTER TYPE public."tipoCompraA" OWNER TO postgres;
-- ddl-end --

-- object: public."COMPRA_ABORDO" | type: TABLE --
-- DROP TABLE IF EXISTS public."COMPRA_ABORDO" CASCADE;
CREATE TABLE public."COMPRA_ABORDO" (
	"idCompraA" serial NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"tipoCompraAbordo" public."tipoCompraA" NOT NULL,
	CONSTRAINT "COMPRA_ABORDO_pk" PRIMARY KEY ("idCompraA")
);
-- ddl-end --
ALTER TABLE public."COMPRA_ABORDO" OWNER TO postgres;
-- ddl-end --

-- object: "TIPO_METODO_PAGO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_PAGO_ABORDO" DROP CONSTRAINT IF EXISTS "TIPO_METODO_PAGO_fk" CASCADE;
ALTER TABLE public."DETALLE_PAGO_ABORDO" ADD CONSTRAINT "TIPO_METODO_PAGO_fk" FOREIGN KEY ("idTipoPago")
REFERENCES public."TIPO_METODO_PAGO" ("idTipoPago") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COMPRA_ABORDO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_PAGO_ABORDO" DROP CONSTRAINT IF EXISTS "COMPRA_ABORDO_fk" CASCADE;
ALTER TABLE public."DETALLE_PAGO_ABORDO" ADD CONSTRAINT "COMPRA_ABORDO_fk" FOREIGN KEY ("idCompraA")
REFERENCES public."COMPRA_ABORDO" ("idCompraA") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."COMPRA_WIFI" | type: TABLE --
-- DROP TABLE IF EXISTS public."COMPRA_WIFI" CASCADE;
CREATE TABLE public."COMPRA_WIFI" (
	"idCompraA" integer NOT NULL,
	precio float NOT NULL,
	"idPersona" integer NOT NULL,
	CONSTRAINT "COMPRA_WIFI_pk" PRIMARY KEY ("idCompraA")
);
-- ddl-end --
ALTER TABLE public."COMPRA_WIFI" OWNER TO postgres;
-- ddl-end --

-- object: "CUENTA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."COMPRA_WIFI" DROP CONSTRAINT IF EXISTS "CUENTA_fk" CASCADE;
ALTER TABLE public."COMPRA_WIFI" ADD CONSTRAINT "CUENTA_fk" FOREIGN KEY ("idPersona")
REFERENCES public."CUENTA" ("idPersona") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COMPRA_ABORDO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."COMPRA_WIFI" DROP CONSTRAINT IF EXISTS "COMPRA_ABORDO_fk" CASCADE;
ALTER TABLE public."COMPRA_WIFI" ADD CONSTRAINT "COMPRA_ABORDO_fk" FOREIGN KEY ("idCompraA")
REFERENCES public."COMPRA_ABORDO" ("idCompraA") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."VARIABLE_GENERAL" | type: TABLE --
-- DROP TABLE IF EXISTS public."VARIABLE_GENERAL" CASCADE;
CREATE TABLE public."VARIABLE_GENERAL" (
	"idVariableGeneral" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	valor float NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "VARIABLE_GENERAL_pk" PRIMARY KEY ("idVariableGeneral")
);
-- ddl-end --
ALTER TABLE public."VARIABLE_GENERAL" OWNER TO postgres;
-- ddl-end --

-- object: public."HIST_VAR_GENERAL" | type: TABLE --
-- DROP TABLE IF EXISTS public."HIST_VAR_GENERAL" CASCADE;
CREATE TABLE public."HIST_VAR_GENERAL" (
	"idHistVarGeneral" serial NOT NULL,
	"valorAnterior" float NOT NULL,
	"valorNuevo" float NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"idVariableGeneral" integer NOT NULL,
	CONSTRAINT "HIST_VAR_GENERAL_pk" PRIMARY KEY ("idHistVarGeneral")
);
-- ddl-end --
ALTER TABLE public."HIST_VAR_GENERAL" OWNER TO postgres;
-- ddl-end --

-- object: "VARIABLE_GENERAL_fk" | type: CONSTRAINT --
-- ALTER TABLE public."HIST_VAR_GENERAL" DROP CONSTRAINT IF EXISTS "VARIABLE_GENERAL_fk" CASCADE;
ALTER TABLE public."HIST_VAR_GENERAL" ADD CONSTRAINT "VARIABLE_GENERAL_fk" FOREIGN KEY ("idVariableGeneral")
REFERENCES public."VARIABLE_GENERAL" ("idVariableGeneral") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."COMPRA_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."COMPRA_PELICULA" CASCADE;
CREATE TABLE public."COMPRA_PELICULA" (
	"idCompraA" integer NOT NULL,
	precio float NOT NULL,
	"idPelicula" integer NOT NULL,
	CONSTRAINT "COMPRA_PELICULA_pk" PRIMARY KEY ("idCompraA")
);
-- ddl-end --
ALTER TABLE public."COMPRA_PELICULA" OWNER TO postgres;
-- ddl-end --

-- object: "COMPRA_ABORDO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."COMPRA_PELICULA" DROP CONSTRAINT IF EXISTS "COMPRA_ABORDO_fk" CASCADE;
ALTER TABLE public."COMPRA_PELICULA" ADD CONSTRAINT "COMPRA_ABORDO_fk" FOREIGN KEY ("idCompraA")
REFERENCES public."COMPRA_ABORDO" ("idCompraA") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."PELICULA" CASCADE;
CREATE TABLE public."PELICULA" (
	"idPelicula" serial NOT NULL,
	titulo varchar(300) NOT NULL,
	descripcion varchar(250) NOT NULL,
	duracion float NOT NULL,
	costo float NOT NULL,
	precio float NOT NULL,
	"listaActores" text NOT NULL,
	"idCategoriaPelicula" integer NOT NULL,
	"idClasificacionPelicula" integer NOT NULL,
	CONSTRAINT "PELICULA_pk" PRIMARY KEY ("idPelicula")
);
-- ddl-end --
ALTER TABLE public."PELICULA" OWNER TO postgres;
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."COMPRA_PELICULA" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."COMPRA_PELICULA" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("idPelicula")
REFERENCES public."PELICULA" ("idPelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."CATEGORIA_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."CATEGORIA_PELICULA" CASCADE;
CREATE TABLE public."CATEGORIA_PELICULA" (
	"idCategoriaPelicula" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "CATEGORIA_PELICULA_pk" PRIMARY KEY ("idCategoriaPelicula")
);
-- ddl-end --
ALTER TABLE public."CATEGORIA_PELICULA" OWNER TO postgres;
-- ddl-end --

-- object: public."CLASIFICACION_PELICULA" | type: TABLE --
-- DROP TABLE IF EXISTS public."CLASIFICACION_PELICULA" CASCADE;
CREATE TABLE public."CLASIFICACION_PELICULA" (
	"idClasificacionPelicula" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "CLASIFICACION_PELICULA_pk" PRIMARY KEY ("idClasificacionPelicula")
);
-- ddl-end --
ALTER TABLE public."CLASIFICACION_PELICULA" OWNER TO postgres;
-- ddl-end --

-- object: "CATEGORIA_PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PELICULA" DROP CONSTRAINT IF EXISTS "CATEGORIA_PELICULA_fk" CASCADE;
ALTER TABLE public."PELICULA" ADD CONSTRAINT "CATEGORIA_PELICULA_fk" FOREIGN KEY ("idCategoriaPelicula")
REFERENCES public."CATEGORIA_PELICULA" ("idCategoriaPelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "CLASIFICACION_PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PELICULA" DROP CONSTRAINT IF EXISTS "CLASIFICACION_PELICULA_fk" CASCADE;
ALTER TABLE public."PELICULA" ADD CONSTRAINT "CLASIFICACION_PELICULA_fk" FOREIGN KEY ("idClasificacionPelicula")
REFERENCES public."CLASIFICACION_PELICULA" ("idClasificacionPelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."DETALLE_COMPRA_ABORDO" | type: TABLE --
-- DROP TABLE IF EXISTS public."DETALLE_COMPRA_ABORDO" CASCADE;
CREATE TABLE public."DETALLE_COMPRA_ABORDO" (
	"idDetalleCompraA" serial NOT NULL,
	cantidad smallint NOT NULL,
	"precioUnitario" float NOT NULL,
	"idProducto" integer NOT NULL,
	"idCompraA" integer NOT NULL,
	CONSTRAINT "DETALLE_COMPRA_ABORDO_pk" PRIMARY KEY ("idDetalleCompraA")
);
-- ddl-end --
ALTER TABLE public."DETALLE_COMPRA_ABORDO" OWNER TO postgres;
-- ddl-end --

-- object: public."PRODUCTO" | type: TABLE --
-- DROP TABLE IF EXISTS public."PRODUCTO" CASCADE;
CREATE TABLE public."PRODUCTO" (
	"idProducto" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	precio float NOT NULL,
	costo float NOT NULL,
	"idCategoriaProducto" integer NOT NULL,
	CONSTRAINT "PRODUCTO_pk" PRIMARY KEY ("idProducto")
);
-- ddl-end --
ALTER TABLE public."PRODUCTO" OWNER TO postgres;
-- ddl-end --

-- object: public."CATEGORIA_PRODUCTO" | type: TABLE --
-- DROP TABLE IF EXISTS public."CATEGORIA_PRODUCTO" CASCADE;
CREATE TABLE public."CATEGORIA_PRODUCTO" (
	"idCategoriaProducto" serial NOT NULL,
	nombre varchar(50) NOT NULL,
	descripcion varchar(250) NOT NULL,
	CONSTRAINT "CATEGORIA_PRODUCTO_pk" PRIMARY KEY ("idCategoriaProducto")
);
-- ddl-end --
ALTER TABLE public."CATEGORIA_PRODUCTO" OWNER TO postgres;
-- ddl-end --

-- object: "CATEGORIA_PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PRODUCTO" DROP CONSTRAINT IF EXISTS "CATEGORIA_PRODUCTO_fk" CASCADE;
ALTER TABLE public."PRODUCTO" ADD CONSTRAINT "CATEGORIA_PRODUCTO_fk" FOREIGN KEY ("idCategoriaProducto")
REFERENCES public."CATEGORIA_PRODUCTO" ("idCategoriaProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_COMPRA_ABORDO" DROP CONSTRAINT IF EXISTS "PRODUCTO_fk" CASCADE;
ALTER TABLE public."DETALLE_COMPRA_ABORDO" ADD CONSTRAINT "PRODUCTO_fk" FOREIGN KEY ("idProducto")
REFERENCES public."PRODUCTO" ("idProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "COMPRA_ABORDO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."DETALLE_COMPRA_ABORDO" DROP CONSTRAINT IF EXISTS "COMPRA_ABORDO_fk" CASCADE;
ALTER TABLE public."DETALLE_COMPRA_ABORDO" ADD CONSTRAINT "COMPRA_ABORDO_fk" FOREIGN KEY ("idCompraA")
REFERENCES public."COMPRA_ABORDO" ("idCompraA") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."MENU_GRATIS" | type: TABLE --
-- DROP TABLE IF EXISTS public."MENU_GRATIS" CASCADE;
CREATE TABLE public."MENU_GRATIS" (
	"idMenuGratis" serial NOT NULL,
	"idClaseVuelo" integer NOT NULL,
	id_menu integer NOT NULL,
	CONSTRAINT "MENU_GRATIS_pk" PRIMARY KEY ("idMenuGratis")
);
-- ddl-end --
ALTER TABLE public."MENU_GRATIS" OWNER TO postgres;
-- ddl-end --

-- object: public."MENU_GENERAL" | type: TABLE --
-- DROP TABLE IF EXISTS public."MENU_GENERAL" CASCADE;
CREATE TABLE public."MENU_GENERAL" (
	id_menu serial NOT NULL,
	"idAvion" integer NOT NULL,
	"idProducto" integer NOT NULL,
	CONSTRAINT "MENU_GENERAL_pk" PRIMARY KEY (id_menu)
);
-- ddl-end --
ALTER TABLE public."MENU_GENERAL" OWNER TO postgres;
-- ddl-end --

-- object: "CLASE_VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."MENU_GRATIS" DROP CONSTRAINT IF EXISTS "CLASE_VUELO_fk" CASCADE;
ALTER TABLE public."MENU_GRATIS" ADD CONSTRAINT "CLASE_VUELO_fk" FOREIGN KEY ("idClaseVuelo")
REFERENCES public."CLASE_VUELO" ("idClaseVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "MENU_GENERAL_fk" | type: CONSTRAINT --
-- ALTER TABLE public."MENU_GRATIS" DROP CONSTRAINT IF EXISTS "MENU_GENERAL_fk" CASCADE;
ALTER TABLE public."MENU_GRATIS" ADD CONSTRAINT "MENU_GENERAL_fk" FOREIGN KEY (id_menu)
REFERENCES public."MENU_GENERAL" (id_menu) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."MENU_GENERAL" DROP CONSTRAINT IF EXISTS "AVION_fk" CASCADE;
ALTER TABLE public."MENU_GENERAL" ADD CONSTRAINT "AVION_fk" FOREIGN KEY ("idAvion")
REFERENCES public."AVION" ("idAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."MENU_GENERAL" DROP CONSTRAINT IF EXISTS "PRODUCTO_fk" CASCADE;
ALTER TABLE public."MENU_GENERAL" ADD CONSTRAINT "PRODUCTO_fk" FOREIGN KEY ("idProducto")
REFERENCES public."PRODUCTO" ("idProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: avion_producto_uq | type: CONSTRAINT --
-- ALTER TABLE public."MENU_GENERAL" DROP CONSTRAINT IF EXISTS avion_producto_uq CASCADE;
ALTER TABLE public."MENU_GENERAL" ADD CONSTRAINT avion_producto_uq UNIQUE ("idAvion","idProducto");
-- ddl-end --

-- object: public."ExistenciasDefault" | type: TABLE --
-- DROP TABLE IF EXISTS public."ExistenciasDefault" CASCADE;
CREATE TABLE public."ExistenciasDefault" (
	"idExistDefault" serial NOT NULL,
	cantidad integer NOT NULL,
	"idProducto" integer NOT NULL,
	"idAvion" integer NOT NULL,
	CONSTRAINT "ExistenciasDefault_pk" PRIMARY KEY ("idExistDefault")
);
-- ddl-end --
ALTER TABLE public."ExistenciasDefault" OWNER TO postgres;
-- ddl-end --

-- object: "PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ExistenciasDefault" DROP CONSTRAINT IF EXISTS "PRODUCTO_fk" CASCADE;
ALTER TABLE public."ExistenciasDefault" ADD CONSTRAINT "PRODUCTO_fk" FOREIGN KEY ("idProducto")
REFERENCES public."PRODUCTO" ("idProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "AVION_fk" | type: CONSTRAINT --
-- ALTER TABLE public."ExistenciasDefault" DROP CONSTRAINT IF EXISTS "AVION_fk" CASCADE;
ALTER TABLE public."ExistenciasDefault" ADD CONSTRAINT "AVION_fk" FOREIGN KEY ("idAvion")
REFERENCES public."AVION" ("idAvion") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public."EXISTENCIAS_VUELO" | type: TABLE --
-- DROP TABLE IF EXISTS public."EXISTENCIAS_VUELO" CASCADE;
CREATE TABLE public."EXISTENCIAS_VUELO" (
	"idExistVuelo" serial NOT NULL,
	costo float NOT NULL,
	"existActual" integer NOT NULL,
	"existInicial" integer NOT NULL,
	"idProducto" integer NOT NULL,
	"idVuelo" integer NOT NULL,
	CONSTRAINT "EXISTENCIAS_VUELO_pk" PRIMARY KEY ("idExistVuelo")
);
-- ddl-end --
ALTER TABLE public."EXISTENCIAS_VUELO" OWNER TO postgres;
-- ddl-end --

-- object: "PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EXISTENCIAS_VUELO" DROP CONSTRAINT IF EXISTS "PRODUCTO_fk" CASCADE;
ALTER TABLE public."EXISTENCIAS_VUELO" ADD CONSTRAINT "PRODUCTO_fk" FOREIGN KEY ("idProducto")
REFERENCES public."PRODUCTO" ("idProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "VUELO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."EXISTENCIAS_VUELO" DROP CONSTRAINT IF EXISTS "VUELO_fk" CASCADE;
ALTER TABLE public."EXISTENCIAS_VUELO" ADD CONSTRAINT "VUELO_fk" FOREIGN KEY ("idVuelo")
REFERENCES public."VUELO" ("idVuelo") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: avion_producto_uq_1 | type: CONSTRAINT --
-- ALTER TABLE public."ExistenciasDefault" DROP CONSTRAINT IF EXISTS avion_producto_uq_1 CASCADE;
ALTER TABLE public."ExistenciasDefault" ADD CONSTRAINT avion_producto_uq_1 UNIQUE ("idProducto","idAvion");
-- ddl-end --

-- object: vuelo_producto_uq | type: CONSTRAINT --
-- ALTER TABLE public."EXISTENCIAS_VUELO" DROP CONSTRAINT IF EXISTS vuelo_producto_uq CASCADE;
ALTER TABLE public."EXISTENCIAS_VUELO" ADD CONSTRAINT vuelo_producto_uq UNIQUE ("idProducto","idVuelo");
-- ddl-end --

-- object: public."REGISTRO_MENU_GRATIS" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGISTRO_MENU_GRATIS" CASCADE;
CREATE TABLE public."REGISTRO_MENU_GRATIS" (
	"idRegistroMenuGratis" serial NOT NULL,
	"fechaHora" timestamp NOT NULL,
	costo float NOT NULL,
	"idProducto" integer NOT NULL,
	"idBoleto" integer NOT NULL,
	CONSTRAINT "REGISTRO_MENU_GRATIS_pk" PRIMARY KEY ("idRegistroMenuGratis")
);
-- ddl-end --
ALTER TABLE public."REGISTRO_MENU_GRATIS" OWNER TO postgres;
-- ddl-end --

-- object: public."REGISTRO_PELICULA_GRATIS" | type: TABLE --
-- DROP TABLE IF EXISTS public."REGISTRO_PELICULA_GRATIS" CASCADE;
CREATE TABLE public."REGISTRO_PELICULA_GRATIS" (
	"idRegistroPelGratis" serial NOT NULL,
	costo float NOT NULL,
	"fechaHora" timestamp NOT NULL,
	"idPelicula" integer NOT NULL,
	"idBoleto" integer NOT NULL,
	CONSTRAINT "REGISTRO_PELICULA_GRATIS_pk" PRIMARY KEY ("idRegistroPelGratis")
);
-- ddl-end --
ALTER TABLE public."REGISTRO_PELICULA_GRATIS" OWNER TO postgres;
-- ddl-end --

-- object: "PELICULA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_PELICULA_GRATIS" DROP CONSTRAINT IF EXISTS "PELICULA_fk" CASCADE;
ALTER TABLE public."REGISTRO_PELICULA_GRATIS" ADD CONSTRAINT "PELICULA_fk" FOREIGN KEY ("idPelicula")
REFERENCES public."PELICULA" ("idPelicula") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "PRODUCTO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_MENU_GRATIS" DROP CONSTRAINT IF EXISTS "PRODUCTO_fk" CASCADE;
ALTER TABLE public."REGISTRO_MENU_GRATIS" ADD CONSTRAINT "PRODUCTO_fk" FOREIGN KEY ("idProducto")
REFERENCES public."PRODUCTO" ("idProducto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOLETO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_MENU_GRATIS" DROP CONSTRAINT IF EXISTS "BOLETO_fk" CASCADE;
ALTER TABLE public."REGISTRO_MENU_GRATIS" ADD CONSTRAINT "BOLETO_fk" FOREIGN KEY ("idBoleto")
REFERENCES public."BOLETO" ("idBoleto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "BOLETO_fk" | type: CONSTRAINT --
-- ALTER TABLE public."REGISTRO_PELICULA_GRATIS" DROP CONSTRAINT IF EXISTS "BOLETO_fk" CASCADE;
ALTER TABLE public."REGISTRO_PELICULA_GRATIS" ADD CONSTRAINT "BOLETO_fk" FOREIGN KEY ("idBoleto")
REFERENCES public."BOLETO" ("idBoleto") MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "AEROPUERTO_SALIDA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PLAN_VUELO" DROP CONSTRAINT IF EXISTS "AEROPUERTO_SALIDA_fk" CASCADE;
ALTER TABLE public."PLAN_VUELO" ADD CONSTRAINT "AEROPUERTO_SALIDA_fk" FOREIGN KEY ("idAeropuertoSalida")
REFERENCES public."AEROPUERTO" ("idAeropuerto") MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "AEROPUERTO_LLEGADA_fk" | type: CONSTRAINT --
-- ALTER TABLE public."PLAN_VUELO" DROP CONSTRAINT IF EXISTS "AEROPUERTO_LLEGADA_fk" CASCADE;
ALTER TABLE public."PLAN_VUELO" ADD CONSTRAINT "AEROPUERTO_LLEGADA_fk" FOREIGN KEY ("idAeropuertoLlegada")
REFERENCES public."AEROPUERTO" ("idAeropuerto") MATCH SIMPLE
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


