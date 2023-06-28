CREATE OR REPLACE PROCEDURE consultarestudiante (carnet_estudiante IN NUMBER) AS
  -- Declarar variables para almacenar los resultados
  v_carnet NUMBER;
  v_nombre VARCHAR2(100);
  v_apellido VARCHAR2(100);
  v_nacimiento DATE;
  v_correo VARCHAR2(100);
  v_telefono NUMBER;
  v_direccion VARCHAR2(100);
  v_dpi NUMBER;
  v_nombre_carrera VARCHAR2(100);
  v_creditos NUMBER;
BEGIN
 -- verificamos si existe la carrera
    IF (ExisteEstudiante(carnet_estudiante) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron estudiantes para el carnet especificado.');
        RETURN;
    END IF;
  -- Consultar los cursos para la carrera especificada
  SELECT E.CARNET, E.NOMBRE, E.APELLIDO, E.NACIMIENTO, E.CORREO, E.TELEFONO, E.DIRECCION, E.DPI, CR.NOMBRE, E.CREDITOS
  INTO v_carnet, v_nombre, v_apellido, v_nacimiento, v_correo, v_telefono, v_direccion, v_dpi, v_nombre_carrera, v_creditos 
  FROM ESTUDIANTE E
  JOIN CARRERA CR ON E.CARRERA_ID = CR.ID 
  WHERE CARNET = carnet_estudiante;
 

 
  -- Mostrar los resultados
  DBMS_OUTPUT.PUT_LINE('Carnet: ' || v_carnet);
  DBMS_OUTPUT.PUT_LINE('Nombre completo: ' || v_nombre || ' ' || v_apellido);
  DBMS_OUTPUT.PUT_LINE('Nacimiento: ' || v_nacimiento);
  DBMS_OUTPUT.PUT_LINE('Correo: ' || v_correo);
  DBMS_OUTPUT.PUT_LINE('Telefono: ' || v_telefono);
  DBMS_OUTPUT.PUT_LINE('Direccion: ' || v_direccion);
  DBMS_OUTPUT.PUT_LINE('DPI: ' || v_dpi);
  DBMS_OUTPUT.PUT_LINE('Nombre carrera: ' || v_nombre_carrera);
  DBMS_OUTPUT.PUT_LINE('Creditos: ' || v_creditos);
  DBMS_OUTPUT.PUT_LINE('===============================');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error dentro del procedimiento, posiblemente por no encontrar datos del estudiante.');
END;
-- 1. Debe retornar la información de un estudiante según su carnet.
