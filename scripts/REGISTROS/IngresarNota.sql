-- ===================== ingresar nota =======================
CREATE OR REPLACE PROCEDURE IngresarNota(
	curso_hab_in IN NUMBER,
	carnet_in IN NUMBER,
	nota_in IN NUMBER
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

    -- verificamos si existe el estudiante
    IF (NotaValida(nota_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('LA NOTA INGRESADA DEBE DE SER POSITIVA Y ESTAR ENTRE 0-100');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a desasignar el curso
    INSERT INTO nota(id, nota, cursohabilitado_id, estudiante_carnet)
        VALUES (NotaSeq.nextval, ROUND(nota_in), curso_hab_in, carnet_in);

    -- mensaje de exito 
    DBMS_OUTPUT.PUT_LINE('Se ha ingresado la nota con punteo de: ' || nota_in || ' al estudiante con carnet: ' || carnet_in || '.');
END;

-- =========== PRUEBA
-- BEGIN
-- IngresarNota(1, 202000166, 61);
-- END;