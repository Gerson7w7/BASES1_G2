-- ===================== consultar pensum =======================
-- 1. Consultar pensum
-- Debe retornar un listado de todos los cursos pertenecientes a una carrera
-- (incluir los de área común y área profesional).
CREATE OR REPLACE PROCEDURE ConsultarPensum(
	carrera_in IN NUMBER
) IS
  CURSOR cursos_cur IS
    SELECT c.codigo, c.nombre, c.es_obligatorio, c.crd_necesarios, c.crd_otorgados
    FROM curso c 
    INNER JOIN carrera cr ON c.carrera_id = cr.id
    WHERE cr.id = carrera_in;
  curso_rec cursos_cur%ROWTYPE;
BEGIN 

    -- verificamos si existe la carrera
    IF (ExisteCarrera(carrera_in) = 0) THEN
        DBMS_OUTPUT.PUT_LINE('EL CURSO SELECCIONADO NO ESTÁ HABILITADO');
        RETURN;
    END IF;

    -- si se cumple todas las validaciones procedemos a consultar
    -- Recorrer los cursos y mostrar los resultados
    FOR curso_rec IN cursos_cur LOOP
        DBMS_OUTPUT.PUT_LINE('Código: ' || curso_rec.codigo);
        DBMS_OUTPUT.PUT_LINE('Nombre: ' || curso_rec.nombre);
        DBMS_OUTPUT.PUT_LINE('Es obligatorio: ' || curso_rec.es_obligatorio);
        DBMS_OUTPUT.PUT_LINE('Créditos necesarios: ' || curso_rec.crd_necesarios);
        DBMS_OUTPUT.PUT_LINE('Créditos otorgados: ' || curso_rec.crd_otorgados);
        DBMS_OUTPUT.PUT_LINE('------------------------');
    END LOOP;

END;

-- =========== PRUEBA
-- BEGIN
-- ConsultarPensum(1);
-- END;