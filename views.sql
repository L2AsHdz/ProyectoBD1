SELECT idPlanVuelo, getPorcentaje(idPlanVuelo) porcentaje FROM PLAN_VUELO WHERE getPorcentaje(idPlanVuelo) IS NOT NULL ORDER BY porcentaje DESC LIMIT 3;
