-- ===================== crear carrera =======================
CREATE OR REPLACE PROCEDURE CrearCarrera(
	nombre_in IN VARCHAR2
) IS
BEGIN 

-- verificamos que la carrera solo contengan letras
IF (NombreCorrecto(nombre_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('EL NOMBRE NO PUEDE LLEVAR NUMEROS O SIGNOS');
	RETURN;
END IF;

-- si se cumple todas las validaciones procedemos a insertar el estudiante
INSERT INTO carrera(id, nombre)
	VALUES (CarreraSeq.nextval, nombre_in);
	
-- mensaje de exito 
DBMS_OUTPUT.PUT_LINE('La carrera ' || nombre_in || ' ha sido creado exitosamente.');
END;

-- =========== PRUEBA
-- BEGIN
-- CrearCarrera('Ciencias y Sistemas');
-- END;