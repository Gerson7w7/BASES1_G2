-- ===================== crear curso =======================
CREATE OR REPLACE PROCEDURE CrearCurso(
	codigo_in IN NUMBER,
	nombre_in IN VARCHAR2,
	crd_necesarios_in IN NUMBER,
	crd_otorgados_in IN NUMBER,
	carrera_id_in IN NUMBER,
	es_obligatorio_in IN NUMBER
) IS
BEGIN 

	-- verificamos si ya existe
	IF (ExisteCurso(codigo_in) = 1) THEN
		DBMS_OUTPUT.PUT_LINE('EL CURSO YA HA SIDO REGISTRADO');
		RETURN;
	END IF;

	-- verificamos que sea una fecha valida
	IF (NumeroPositivo(crd_necesarios_in) = 0) THEN
		DBMS_OUTPUT.PUT_LINE('LOS CREDITOS INGRESADOS DEBEN DE SER POSITIVOS');
		RETURN;
	END IF;

	-- verificamos que sea una fecha valida
	IF (NumeroPositivo(crd_otorgados_in) = 0) THEN
		DBMS_OUTPUT.PUT_LINE('LOS CREDITOS INGRESADOS DEBEN DE SER POSITIVOS');
		RETURN;
	END IF;

	-- verificamos si es un telefono valido
	IF (ExisteCarrera(carrera_id_in) = 0) THEN
		DBMS_OUTPUT.PUT_LINE('LA CARRERA SELECCIONADA NO EXISTE');
		RETURN;
	END IF;

	-- verificamos si es un dpi valido
	IF (BoolValido(es_obligatorio_in) = 0) THEN
		DBMS_OUTPUT.PUT_LINE('SE ESPERA UN 1 (OBLIGATORIO) O UN 0(NO OBLIGATORIO)');
		RETURN;
	END IF;

	-- si se cumple todas las validaciones procedemos a insertar el docente
	INSERT INTO curso(codigo, nombre, crd_necesarios, crd_otorgados, es_obligatorio, carrera_id)
		VALUES (codigo_in, nombre_in, crd_necesarios_in, crd_otorgados_in, es_obligatorio_in, carrera_id_in);
		
	-- mensaje de exito 
	DBMS_OUTPUT.PUT_LINE('El curso con codigo ' || codigo_in || ' y nombre ' || nombre_in || ', ha sido registrado exitosamente.');
END;

-- =========== PRUEBA
-- BEGIN
-- CrearCurso(701, 'Sistema de bases de datos 1', 90, 4, 09, 1);
-- END;