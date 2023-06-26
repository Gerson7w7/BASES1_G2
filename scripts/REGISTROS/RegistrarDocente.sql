-- ===================== registrar docente =======================
CREATE OR REPLACE PROCEDURE RegistrarDocente(
	nombre_in IN VARCHAR2,
	apellido_in IN VARCHAR2,
	nacimiento_in IN VARCHAR2,
	correo_in IN VARCHAR2,
	telefono_in IN NUMBER,
	direccion_in IN VARCHAR2,
	dpi_in IN NUMBER,
	siif_in IN INTEGER
) IS
BEGIN 

-- verificamos si ya existe
IF (ExisteDocente(siif_in) = 1) THEN
	DBMS_OUTPUT.PUT_LINE('EL DOCENTE YA HA SIDO REGISTRADO');
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

-- si se cumple todas las validaciones procedemos a insertar el docente
INSERT INTO docente(nombre, apellido, nacimiento, correo, telefono, direccion, dpi, siif, fecha)
	VALUES (nombre_in, apellido_in, nacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, siif_in, SYSDATE);
	
-- mensaje de exito 
DBMS_OUTPUT.PUT_LINE('El docente ' || nombre_in || ' ' || apellido_in || ' ha sido registrado exitosamente.');
END;

-- =========== PRUEBA
-- BEGIN
-- RegistrarDocente('Juan', 'Perez', '01-01-1988', 'juan@example.com', 12345678, 'Dirección', 1234567890125, 55);
-- END;