--Consulta 1
SELECT idPlanVuelo, getPorcentaje(idPlanVuelo, '2022-11-01', '2022-12-31') porcentaje 
FROM PLAN_VUELO 
WHERE getPorcentaje(idPlanVuelo, '2022-11-01', '2022-12-31') IS NOT NULL 
ORDER BY porcentaje DESC LIMIT 3;

--Consulta 2
SELECT tc.idPiloto, SUM(pv.distancia) millas, getComisiones(idPiloto) comisiones,
getNoVuelo(idPiloto, '2020-01-01', '2022-12-12') vuelos FROM TRIPULANTES_CABINA tc 
INNER JOIN ASIGNAR_EQUIPO_VUELO av ON tc.idTripulantesCabina=av.idTripulantesCabina 
INNER JOIN VUELO v ON av.idVuelo=v.idVuelo 
INNER JOIN DIA_PLAN_VUELO dpv ON v.idDiaPlanVuelo=dpv.idDiaPlanVuelo 
INNER JOIN PLAN_VUELO pv ON dpv.idPlanVuelo=pv.idPlanVuelo 
WHERE v.fecha BETWEEN '2020-01-01' AND '2022-12-12' 
GROUP BY idPiloto
ORDER BY millas DESC
LIMIT 3;

--Consulta 6
SELECT idPlanVuelo,
getRetrasados(idPlanVuelo, '2020-01-01', '2022-12-12') retrasados,
getCancelados(idPlanVuelo, '2020-01-01', '2022-12-12') cancelados FROM PLAN_VUELO;

--Consulta 9
SELECT a.idAvion, ta.nombre, 
COUNT(*) vuelos, 
getprimerVuelo(a.idAvion) primerVuelo, 
getlastVuelo(a.idAvion) ultimoVuelo FROM AVION a 
INNER JOIN TIPO_AVION ta ON a.idTipoAvion=ta.idTipoAvion 
INNER JOIN VUELO v ON a.idAvion=v.idAvion 
WHERE v.estadoActual='Finalizado' 
GROUP BY a.idAvion, ta.nombre 
ORDER BY vuelos DESC LIMIT 5;

--Consulta 10
SELECT p.idPersona, p.nombre, 
e.fechaContratacion, COUNT(*) noChamacos, 
getVuelosByEmpleado(p.idPersona) vuelos, 
getPromChamacos(COUNT(*), p.idPersona) promedioChamacos FROM PERSONA p 
INNER JOIN EMPLEADO e ON p.idPersona=e.idPersona 
INNER JOIN REGISTRO_ENCARGADO_CHAMACO rc ON p.idPersona=rc.idPersona 
GROUP BY p.idPersona, e.fechaContratacion;
