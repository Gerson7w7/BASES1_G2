CREATE OR REPLACE PROCEDURE consultarestudientesaprobados (
codigo_curso IN NUMBER, 
ciclo_curso IN VARCHAR2, 
anio_curso IN NUMBER, 
seccion_curso IN VARCHAR2
) AS
  -- Declarar variables para almacenar los resultados
  v_codigo_curso NUMBER;
  v_carnet NUMBER;
  v_nombre VARCHAR2(100);
  v_apellido VARCHAR2(100);
  v_nota NUMBER;
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
  -- Consultar los cursos para la carrera especificada
  FOR estudiantes_rec IN ( SELECT E.CARNET, E.NOMBRE, E.APELLIDO, C.CODIGO, N.NOTA
  FROM CURSOHABILITADO CH
  JOIN CURSO C ON CH.CURSO_CODIGO = C.CODIGO 
  JOIN ESTUDIANTE E ON C.CARRERA_ID = E.CARRERA_ID 
  JOIN NOTA N ON CH.ID = N.CURSOHABILITADO_ID
  WHERE CH.CICLO = ciclo_curso AND CH.SECCION = seccion_curso AND CH.ANIO = anio_curso)
 

 LOOP
	 
   v_codigo_curso := estudiantes_rec.CODIGO;
   v_carnet := estudiantes_rec.CARNET;
   v_nombre := estudiantes_rec.NOMBRE;
   v_apellido := estudiantes_rec.APELLIDO;
   v_nota := estudiantes_rec.NOTA;
  -- Mostrar los resultados
  DBMS_OUTPUT.PUT_LINE('Código curso: ' || v_codigo_curso);
  DBMS_OUTPUT.PUT_LINE('Carnet: ' || v_carnet);
  DBMS_OUTPUT.PUT_LINE('Nombre completo: ' || v_nombre || ' ' || v_apellido);
 	IF v_nota > 60 THEN
	  DBMS_OUTPUT.PUT_LINE('Curso aprobado.');
	ELSE
	  DBMS_OUTPUT.PUT_LINE('Curso reprobado.');
	END IF;
  DBMS_OUTPUT.PUT_LINE('===============================');
 	
 END LOOP;
 

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error dentro del procedimiento, posiblemente por no encontrar datos del docente.');
END;
-- 1. Debe retornar la información de un estudiante según su carnet.
