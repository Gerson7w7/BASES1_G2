-- ===================== registrar estudiante =======================
CREATE OR REPLACE PROCEDURE RegistrarEstudiante(
	carnet_in IN INTEGER,
	nombre_in IN VARCHAR2,
	apellido_in IN VARCHAR2,
	nacimiento_in IN VARCHAR2,
	correo_in IN VARCHAR2,
	telefono_in IN NUMBER,
	direccion_in IN VARCHAR2,
	dpi_in IN NUMBER,
	carrera_in IN INTEGER
) IS
BEGIN 

-- verificamos si ya existe
IF (ExisteEstudiante(carnet_in) = 1) THEN
	DBMS_OUTPUT.PUT_LINE('EL ESTUDIANTE YA HA SIDO ASIGNADO');
	RETURN;
END IF;

-- verificamos que sus nombres y apellidos solo contengan letras
IF (NombreCorrecto(nombre_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('EL NOMBRE NO PUEDE LLEVAR NUMEROS O SIGNOS');
	RETURN;
END IF;

IF (NombreCorrecto(apellido_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('EL APELLIDO NO PUEDE LLEVAR NUMEROS O SIGNOS');
	RETURN;
END IF;

-- verificamos que sea una fecha valida
IF (FechaCorrecta(nacimiento_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('LA FECHA DE NACIMIENTO PROPORCIONADA NO ES VALIDA');
	RETURN;
END IF;

-- verificamos si es un correo valido
IF (CorreoValido(correo_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('CORREO NO VALIDO');
	RETURN;
END IF;

-- verificamos si es un telefono valido
IF (TelefonoValido(telefono_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('TELEFONO NO VALIDO');
	RETURN;
END IF;

-- verificamos si es un dpi valido
IF (DpiValido(dpi_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('DPI NO VALIDO');
	RETURN;
END IF;

-- verificamos si existe la carrera
IF (ExisteCarrera(carrera_in) = 0) THEN
	DBMS_OUTPUT.PUT_LINE('LA CARRERA SELECCIONADA NO EXISTE');
	RETURN;
END IF;

-- si se cumple todas las validaciones procedemos a insertar el estudiante
-- INSERT INTO estudiante(carnet, nombre, apellido, nacimiento, correo, telefono, direccion, dpi, carrera_id, creditos, fecha)
-- 	VALUES (carnet_in, nombre_in, apellido_in, nacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, carrera_in, 0, SYSDATE);
	
-- mensaje de exito 
DBMS_OUTPUT.PUT_LINE('El alumno ' || nombre_in || ' ' || apellido_in || ' ha sido asignado exitosamente.');
END;

-- =========== PRUEBA
-- BEGIN
-- RegistrarEstudiante(202000166, 'Gerson', 'Quiroa', '18-10-2000', 'juan@example.com', 12345678, 'Dirección. 3-45 Zona 2 de Mixco', 1234567890125, 2);
-- END;