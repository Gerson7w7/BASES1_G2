CREATE OR REPLACE PROCEDURE consultardocente (siif_docente IN NUMBER) AS
  -- Declarar variables para almacenar los resultados
  v_siif NUMBER;
  v_nombre VARCHAR2(100);
  v_apellido VARCHAR2(100);
  v_nacimiento DATE;
  v_correo VARCHAR2(100);
  v_telefono NUMBER;
  v_direccion VARCHAR2(100);
  v_dpi NUMBER;
BEGIN
 -- verificamos si existe la carrera
    IF (ExisteDocente(siif_docente) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('No se encontraron docentes para el siif especificado.');
        RETURN;
    END IF;
  -- Consultar los cursos para la carrera especificada
  SELECT D.SIIF , D.NOMBRE, D.APELLIDO, D.NACIMIENTO, D.CORREO, D.TELEFONO, D.DIRECCION, D.DPI 
  INTO v_siif, v_nombre, v_apellido, v_nacimiento, v_correo, v_telefono, v_direccion, v_dpi
  FROM DOCENTE D
  WHERE D.SIIF = siif_docente;
 

 
  -- Mostrar los resultados
  DBMS_OUTPUT.PUT_LINE('Siif: ' || v_siif);
  DBMS_OUTPUT.PUT_LINE('Nombre completo: ' || v_nombre || ' ' || v_apellido);
  DBMS_OUTPUT.PUT_LINE('Nacimiento: ' || v_nacimiento);
  DBMS_OUTPUT.PUT_LINE('Correo: ' || v_correo);
  DBMS_OUTPUT.PUT_LINE('Telefono: ' || v_telefono);
  DBMS_OUTPUT.PUT_LINE('Direccion: ' || v_direccion);
  DBMS_OUTPUT.PUT_LINE('DPI: ' || v_dpi);
  DBMS_OUTPUT.PUT_LINE('===============================');

EXCEPTION
  WHEN NO_DATA_FOUND THEN
    DBMS_OUTPUT.PUT_LINE('Error dentro del procedimiento, posiblemente por no encontrar datos del docente.');
END;
-- 1. Debe retornar la información de un estudiante según su carnet.
