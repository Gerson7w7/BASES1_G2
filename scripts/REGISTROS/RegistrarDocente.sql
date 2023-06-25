-- ===================== registrar docente =======================
DELIMITER $$
CREATE PROCEDURE RegistrarDocente(
	IN nombre_in VARCHAR2(50)
	IN apellido_in VARCHAR2(50)
	IN nacimiento_in DATE
	IN correo_in VARCHAR2(100)
	IN telefono_in NUMBER(8)
	IN direccion_in VARCHAR2(100)
	IN dpi_in NUMBER(13)
	IN siif_in INTEGER
) 
add_docente:BEGIN -- para salir del procedimiento

-- verificamos si ya existe
IF (ExisteDocente(siif_in)) THEN
	SELECT 'EL DOCENTE YA HA SIDO REGISTRADO' AS ERROR;
	LEAVE add_docente;
END IF;

-- verificamos que sus nombres y apellidos solo contengan letras
IF (NOT NombreCorrecto(nombre_in)) THEN
	SELECT 'EL NOMBRE NO PUEDE LLEVAR NUMEROS O SIGNOS' AS ERROR;
	LEAVE add_docente;
END IF;

IF (NOT NombreCorrecto(apellido_in)) THEN
	SELECT 'EL APELLIDO NO PUEDE LLEVAR NUMEROS O SIGNOS' AS ERROR;
	LEAVE add_docente;
END IF;

-- verificamos que sea una fecha valida
IF (NOT FechaCorrecta(nacimiento_in)) THEN
	SELECT 'LA FECHA DE NACIMIENTO PROPORCIONADA NO ES VALIDA' AS ERROR;
	LEAVE add_docente;
END IF;

-- verificamos si es un correo valido
IF (NOT CorreoValido(correo_in)) THEN
	SELECT 'CORREO NO VALIDO' AS ERROR;
	LEAVE add_docente;
END IF;

-- verificamos si es un telefono valido
IF (NOT TelefonoValido(telefono_in)) THEN
	SELECT 'TELEFONO NO VALIDO' AS ERROR;
	LEAVE add_docente;
END IF;

-- verificamos si es un dpi valido
IF (NOT DpiValido(dpi_in)) THEN
	SELECT 'DPI NO VALIDO' AS ERROR;
	LEAVE add_docente;
END IF;

-- si se cumple todas las validaciones procedemos a insertar el docente
INSERT INTO docente(nombre, apellido, nacimiento, correo, telefono, direccion, dpi, siif, fecha)
	VALUES (nombre_in, apellido_in, nacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, siif_in, SYSDATE);
	
-- mensaje de exito 
SELECT CONCAT('El docente ', nombre_in, ' ', apellido_in, 'ha sido registrado exitosamente.') AS MENSAJE;
END $$ 