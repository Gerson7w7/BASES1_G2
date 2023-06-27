CREATE OR REPLACE PROCEDURE consultar_cursos (codigo_carrera IN VARCHAR2) AS
BEGIN
  -- Consultar los cursos para la carrera especificada
SELECT CODIGO, NOMBRE, CRD_NECESARIOS, CRD_OTORGADOS, ES_OBLIGATORIO
                    FROM curso
                    WHERE CARRERA_ID = codigo_carrera;
END;
-- BEGIN
  -- consultar_cursos(1);
-- END;
