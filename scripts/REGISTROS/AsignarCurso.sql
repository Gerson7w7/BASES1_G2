-- ===================== asignar curso =======================
CREATE OR REPLACE PROCEDURE AsignarCurso(
	curso_hab_in IN NUMBER,
	carnet_in IN NUMBER
) IS
BEGIN 

    -- verificamos si existe el curso habilitado
    IF (ExisteCursoHab(curso_hab_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL CURSO SELECCIONADO NO ESTÁ HABILITADO');
        RETURN;
    END IF;

    -- verificamos si es un dia valido
    IF (ExisteEstudiante(carnet_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('DIA NO VALIDO (1-7)');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a insertar el docente
    INSERT INTO asignacioncurso(cursohabilitado_id, estudiante_carnet, esta_asignado)
        VALUES (curso_hab_in, carnet_in, 1);
        
    -- mensaje de exito 
    DBMS_OUTPUT.PUT_LINE('Se ha asignado el curso con id habilitado: ' || curso_hab_in || ' al estudiante con carnet: ' || carnet_in || '.');
END;

-- =========== PRUEBA
-- BEGIN
-- AsignarCurso(1, 202000166);
-- END;