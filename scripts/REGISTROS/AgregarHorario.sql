-- ===================== agregar horario =======================
CREATE OR REPLACE PROCEDURE AgregarHorario(
	curso_hab_in IN NUMBER,
	dia_in IN NUMBER,
	horario_in IN VARCHAR2
) IS
BEGIN 

    -- verificamos si existe el curso habilitado
    IF (ExisteCursoHab(curso_hab_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL CURSO SELECCIONADO NO ESTÁ HABILITADO');
        RETURN;
    END IF;

    -- verificamos si es un dia valido
    IF (DiaValido(dia_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('DIA NO VALIDO (1-7)');
        RETURN;
    END IF;

    -- verificamos si es un horario valido
    IF (HorarioValido(horario_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('HORARIO NO VALIDO');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a insertar el docente
    INSERT INTO horario(dia, horario, cursohabilitado_id)
        VALUES (dia_in, horario_in, curso_hab_in);
        
    -- mensaje de exito 
    DBMS_OUTPUT.PUT_LINE('Se ha agregado el horario para el curso con id habilitado: ' || curso_hab_in || '.');
END;

-- =========== PRUEBA
-- BEGIN
-- AgregarHorario(1, 7, '7:10-10:00');
-- END;