-- ===================== desasignar curso =======================
CREATE OR REPLACE PROCEDURE DesasignarCurso(
	curso_hab_in IN NUMBER,
	carnet_in IN NUMBER
) IS
BEGIN 

    -- verificamos si existe el curso habilitado
    IF (ExisteCursoHab(curso_hab_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL CURSO SELECCIONADO NO ESTÁ HABILITADO');
        RETURN;
    END IF;

    -- verificamos si existe el estudiante
    IF (ExisteEstudiante(carnet_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL ESTUDIANTE NO EXISTE');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a desasignar el curso
    UPDATE asignacioncurso ac 
    SET ac.esta_asignado = 0 
    WHERE ac.cursohabilitado_id = curso_hab_in AND ac.estudiante_carnet = carnet_in;
        
    -- mensaje de exito 
    DBMS_OUTPUT.PUT_LINE('Se ha desasignado el curso con id habilitado: ' || curso_hab_in || ' al estudiante con carnet: ' || carnet_in || '.');
END;

-- =========== PRUEBA
-- BEGIN
-- DesasignarCurso(1, 202000166);
-- END;