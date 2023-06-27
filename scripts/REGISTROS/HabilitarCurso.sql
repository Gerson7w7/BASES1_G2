-- ===================== habilitar curso =======================
CREATE OR REPLACE PROCEDURE HabilitarCurso(
	codigo_in IN NUMBER,
	ciclo_in IN VARCHAR2,
	docente_in IN NUMBER,
	cupo_max_in IN NUMBER,
	seccion_in IN VARCHAR2
) IS
	ciclo_upper VARCHAR2(2);
	seccion_upper VARCHAR2(1);
BEGIN 
    -- pasamos a mayuscula el ciclo y la seccion
    ciclo_upper := UPPER(ciclo_in);
    seccion_upper := UPPER(seccion_in);

    -- verificamos si existe el curso
    IF (ExisteCurso(codigo_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('NO SE HA ENCONTRADO EL CURSO SOLICITADO');
        RETURN;
    END IF;

    -- verificamos si es un ciclo valido
    IF (CicloValido(ciclo_upper) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL CICLO PROPORCIONADO NO ES VALIDO');
        RETURN;
    END IF;

    -- verificamos si existe el docente
    IF (ExisteDocente(docente_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('NO SE HA ENCONTRADO EL DOCENTE INGRESADO');
        RETURN;
    END IF;

    -- verificamos si es una seccion valida
    IF (SeccionValida(seccion_upper) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('LA SECCION SOLO PUEDE TENER UN CARACTER EN RANGO DE A-Z');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a insertar el docente
    INSERT INTO cursohabilitado(id, ciclo, cupo_max, seccion, curso_codigo, docente_siif, anio, asignados)
        VALUES (CursoHabSeq.nextval, ciclo_upper, cupo_max_in, seccion_upper, codigo_in, docente_in, EXTRACT(YEAR FROM SYSDATE), 0);
        
    -- mensaje de exito 
    DBMS_OUTPUT.PUT_LINE('Se ha habilitado el curso con codigo ' || codigo_in || ' para el ciclo ' || ciclo_upper || '.');
END;

-- =========== PRUEBA
-- BEGIN
-- HabilitarCurso(1, 'vj', 1, 110, 'A');
-- END;