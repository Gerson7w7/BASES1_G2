CREATE OR REPLACE PROCEDURE consultarpensum (codigo_carrera IN NUMBER) AS
  -- Declarar variables para almacenar los resultados
  v_codigo NUMBER;
  v_nombre VARCHAR2(100);
  v_crd_necesarios NUMBER;
  v_crd_otorgados NUMBER;
  v_es_obligatorio NUMBER;
BEGIN
-- verificamos si existe la carrera
    IF (ExisteCarrera(codigo_carrera) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron cursos para la carrera especificada.');
        RETURN;
    END IF;
  -- Consultar los cursos para la carrera especificada
  FOR curso_rec IN (SELECT CODIGO, NOMBRE, CRD_NECESARIOS, CRD_OTORGADOS, ES_OBLIGATORIO
  FROM curso
  WHERE CARRERA_ID = codigo_carrera)

 LOOP
    -- Recuperar los valores del cursor
    v_codigo := curso_rec.CODIGO;
    v_nombre := curso_rec.NOMBRE;
    v_crd_necesarios := curso_rec.CRD_NECESARIOS;
    v_crd_otorgados := curso_rec.CRD_OTORGADOS;
    v_es_obligatorio := curso_rec.ES_OBLIGATORIO;
   
  -- Mostrar los resultados
  DBMS_OUTPUT.PUT_LINE('Código: ' || v_codigo);
  DBMS_OUTPUT.PUT_LINE('Nombre: ' || v_nombre);
  DBMS_OUTPUT.PUT_LINE('Créditos necesarios: ' || v_crd_necesarios);
  DBMS_OUTPUT.PUT_LINE('Créditos otorgados: ' || v_crd_otorgados);
	IF v_es_obligatorio = 1 THEN
	  DBMS_OUTPUT.PUT_LINE('Es obligatorio: Sí');
	ELSE
	  DBMS_OUTPUT.PUT_LINE('Es obligatorio: No');
	END IF;
  DBMS_OUTPUT.PUT_LINE('===============================');

END LOOP;
EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error dentro del procedimiento, posiblemente por no encontrar datos de la carrera.');
END;
-- 1. Debe retornar la información de un estudiante según su carnet.
