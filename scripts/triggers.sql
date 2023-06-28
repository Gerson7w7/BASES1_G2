-- asignacioncurso
CREATE OR REPLACE TRIGGER BitacoraInsertAC
AFTER INSERT OR UPDATE OR DELETE ON asignacioncurso
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: asignacioncurso.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla asignacioncurso.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla asignacioncurso.', 'DELETE');
    END IF;
END;

-- carrera
CREATE OR REPLACE TRIGGER BitacoraInsertC
AFTER INSERT OR UPDATE OR DELETE ON carrera
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: carrera.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla carrera.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla carrera.', 'DELETE');
    END IF;
END;

-- curso
CREATE OR REPLACE TRIGGER BitacoraInsertCURSO
AFTER INSERT OR UPDATE OR DELETE ON curso
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: curso.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla curso.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla curso.', 'DELETE');
    END IF;
END;

-- cursohabilitado
CREATE OR REPLACE TRIGGER BitacoraInsertCH
AFTER INSERT OR UPDATE OR DELETE ON cursohabilitado
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: cursohabilitado.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla cursohabilitado.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla cursohabilitado.', 'DELETE');
    END IF;
END;

-- docente
CREATE OR REPLACE TRIGGER BitacoraInsertD
AFTER INSERT OR UPDATE OR DELETE ON docente
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: docente.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla docente.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla docente.', 'DELETE');
    END IF;
END;

-- estudiante
CREATE OR REPLACE TRIGGER BitacoraInserE
AFTER INSERT OR UPDATE OR DELETE ON estudiante
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: estudiante.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla estudiante.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla estudiante.', 'DELETE');
    END IF;
END;

-- horario
CREATE OR REPLACE TRIGGER BitacoraInserH
AFTER INSERT OR UPDATE OR DELETE ON horario
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: horario.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla horario.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla horario.', 'DELETE');
    END IF;
END;

-- nota
CREATE OR REPLACE TRIGGER BitacoraInserN
AFTER INSERT OR UPDATE OR DELETE ON nota
    FOR EACH ROW
BEGIN 
    IF INSERTING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha insertado en la tabla: nota.', 'INSERT');
    ELSIF UPDATING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha actualizado en la tabla nota.', 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO historial (fecha, descripcion, tipo)
        VALUES (SYSDATE, 'Se ha eliminado en la tabla nota.', 'DELETE');
    END IF;
END;