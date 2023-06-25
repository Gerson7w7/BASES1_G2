-- ===================== registrar estudiante =======================
DELIMITER $$
CREATE PROCEDURE RegistrarEstudiante(
	IN carnet_in INTEGER
	IN nombre_in VARCHAR2(50)
	IN apellido_in VARCHAR2(50)
	IN nacimiento_in DATE
	IN correo_in VARCHAR2(100)
	IN telefono_in NUMBER(8)
	IN direccion_in VARCHAR2(100)
	IN dpi_in NUMBER(8)
	IN carrera_in INTEGER
) 
add_estudiante:BEGIN -- para salir del procedimiento

-- verificamos si ya existe
IF (ExisteEstudiante(carnet_in)) THEN
	SELECT 'EL ESTUDIANTE YA HA SIDO ASIGNADO' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos que sus nombres y apellidos solo contengan letras
IF (NOT NombreCorrecto(nombre_in)) THEN
	SELECT 'EL NOMBRE NO PUEDE LLEVAR NUMEROS O SIGNOS' AS ERROR;
	LEAVE add_estudiante;
END IF;

IF (NOT NombreCorrecto(apellido_in)) THEN
	SELECT 'EL APELLIDO NO PUEDE LLEVAR NUMEROS O SIGNOS' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos que sea una fecha valida
IF (NOT FechaCorrecta(nacimiento_in)) THEN
	SELECT 'LA FECHA DE NACIMIENTO PROPORCIONADA NO ES VALIDA' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos si es un correo valido
IF (NOT CorreoValido(correo_in)) THEN
	SELECT 'CORREO NO VALIDO' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos si es un telefono valido
IF (NOT TelefonoValido(telefono_in)) THEN
	SELECT 'TELEFONO NO VALIDO' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos si es un dpi valido
IF (NOT DpiValido(dpi_in)) THEN
	SELECT 'DPI NO VALIDO' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- verificamos si existe la carrera
IF (NOT ExisteCarrera(carrera_in)) THEN
	SELECT 'LA CARRERA SELECCIONADA NO EXISTE' AS ERROR;
	LEAVE add_estudiante;
END IF;

-- si se cumple todas las validaciones procedemos a insertar el estudiante
INSERT INTO estudiante(carnet, nombre, apellido, nacimiento, correo, telefono, direccion, dpi, carrera_id, creditos, fecha)
	VALUES (carnet_in, nombre_in, apellido_in, nacimiento_in, correo_in, telefono_in, direccion_in, dpi_in, carrera_in, 0, SYSDATE);
	
-- mensaje de exito 
SELECT CONCAT('El estudiante ', nombre_in, ' ', apellido_in, 'ha sido asignado exitosamente.') AS MENSAJE;
END $$ 