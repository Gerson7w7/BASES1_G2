CREATE OR REPLACE PROCEDURE consultarestudientesdesasignados (
codigo_curso IN NUMBER, 
ciclo_curso IN VARCHAR2, 
anio_curso IN NUMBER, 
seccion_curso IN VARCHAR2
) AS
  -- Declarar variables para almacenar los resultados
  v_codigo_curso NUMBER;
  v_cantidad_asignados NUMBER;
  v_cantidad_desasignados NUMBER;
  v_porcentaje_desasignados NUMBER;
  v_total NUMBER;
 v_ciclo_curso VARCHAR2(100);
BEGIN
 -- verificamos si existe la curso
    IF (ExisteCurso(codigo_curso) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron cursos para el código especificado.');
        RETURN;
    END IF;
   -- verificamos si es ciclo valido
    IF (CicloValido(ciclo_curso) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Ciclo no valido.');
        RETURN;
    END IF;
   -- verificamos si es año valido
    IF (anio_curso > 2023) THEN
        RETURN;
    END IF;
   -- verificamos si es seccion valido
    IF (SeccionValida(seccion_curso) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('Sección no valido.');
        RETURN;
    END IF;
  -- Consultar asignaciones y desasignaciones
  SELECT 
  C.CODIGO,
  COUNT(CASE WHEN A.ESTA_ASIGNADO = 1 THEN 1 END) AS cantidad_asignados,
  COUNT(CASE WHEN A.ESTA_ASIGNADO = 0 THEN 1 END) AS cantidad_desasignados
	INTO v_codigo_curso, v_cantidad_asignados, v_cantidad_desasignados
	FROM CURSOHABILITADO CH
	JOIN CURSO C ON CH.CURSO_CODIGO = C.CODIGO 
	JOIN ESTUDIANTE E ON C.CARRERA_ID = E.CARRERA_ID 
	JOIN ASIGNACIONCURSO A ON CH.ID = A.CURSOHABILITADO_ID 
	WHERE CH.CICLO = ciclo_curso AND CH.SECCION = seccion_curso AND CH.ANIO = anio_curso
	GROUP BY C.CODIGO;
 
  v_total := v_cantidad_desasignados + v_cantidad_asignados;
  -- Calcular el porcentaje de desasignados
    IF v_cantidad_asignados > 0 THEN
        v_porcentaje_desasignados := (v_cantidad_desasignados / v_cantidad_asignados) * 100;
    ELSE
        v_porcentaje_desasignados := 0;
    END IF;
  -- Mostrar los resultados
  DBMS_OUTPUT.PUT_LINE('Código curso: ' || v_codigo_curso);
  DBMS_OUTPUT.PUT_LINE('Sección: ' || seccion_curso);
  IF ciclo_curso = '1S' THEN
    v_ciclo_curso := 'PRIMER SEMESTRE';
	ELSIF ciclo_curso = '2S' THEN
    v_ciclo_curso := 'SEGUNDO SEMESTRE';
	ELSIF ciclo_curso = 'VJ' THEN
    v_ciclo_curso := 'VACACIONES DE JUNIO';
	ELSIF ciclo_curso = 'VD' THEN
    v_ciclo_curso := 'VACACIONES DE DICIEMBRE';
	ELSE
    v_ciclo_curso := 'NO ENCONTRADO';
	END IF;
  DBMS_OUTPUT.PUT_LINE('Ciclo: ' || v_ciclo_curso);
  DBMS_OUTPUT.PUT_LINE('Año: ' || anio_curso);
  DBMS_OUTPUT.PUT_LINE('Cantidad estudiantes que llevaron el curso: ' || v_total);
  DBMS_OUTPUT.PUT_LINE('Cantidad estudiantes que desasignaron: ' || v_cantidad_desasignados);
  DBMS_OUTPUT.PUT_LINE('Porcentaje estudiantes que desasignaron: ' || v_porcentaje_desasignados || '%');
  DBMS_OUTPUT.PUT_LINE('===============================');
 

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error dentro del procedimiento, posiblemente por no encontrar datos del docente.');
END;
-- 1. Debe retornar la información de un estudiante según su carnet.
