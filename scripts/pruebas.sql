-- ================= PRUEBAS ===================
-- CREAR CARRERAS
-- AREA COMUN 
INSERT INTO carrera(id, nombre) VALUES(0, 'Area Comun');

BEGIN
    CrearCarrera('Civil');
    CrearCarrera('Ciencias y Sistemas');
    CrearCarrera('Industrial');
END;
    
-- REGISTRAR ESTUDIANTES
BEGIN
    RegistrarEstudiante(202000166, 'Gerson', 'Quiroa', '18-10-2000', 'gerson@ingenieria.com', 12345678, 'Col. Tesoro 3-45 Zona 2 de Mixco', 1234567890125, 2);
    RegistrarEstudiante(202003926, 'Daniel', 'Minchez', '05-01-2002', 'daniel@ingenieria.com', 12345678, 'Col. Comunidad 1-25 Zona 3 de Mixco', 3005154950501, 1);
    RegistrarEstudiante(202000006, 'Lionel', 'Messi', '24-06-2000', 'messi@goat.com', 12345678, 'Col. Rosario 1-25 Zona 1 de Mixco', 3005134955508, 2);
END;

-- REGISTRAR DOCENTE
BEGIN
    RegistrarDocente('Juan', 'Perez', '01-01-1988', 'juan@example.com', 12345678, 'Dirección', 1234567890125, 11);
    RegistrarDocente('Ibai', 'Llanos', '01-05-1988', 'ibai@example.com', 12345678, 'Dirección', 5534567890125, 22);
    RegistrarDocente('Duko', 'ModoDiablo', '24-06-1988', 'duko@losdelespacio.com', 12345678, 'Dirección', 6634567890125, 33);
END;

-- CREAR CURSO
BEGIN
    CrearCurso(701, 'Sistema de bases de datos 1', 90, 4, 1, 1);
    CrearCurso(512, 'Sistemas Operativos 1', 70, 3, 2, 1);
    CrearCurso(120, 'Introduccion a la Programacion y Computacion 1', 20, 5, 0, 0);
END;

-- HABILITAR CURSO
BEGIN
    HabilitarCurso(701, '1S', 11, 110, 'A');
    HabilitarCurso(512, '2s', 22, 70, 'P');
    HabilitarCurso(120, 'vD', 33, 110, 'B');
END;

-- AGREGAR HORARIO
BEGIN
    AgregarHorario(1, 1, '7:10-9:50');
    AgregarHorario(2, 3, '11:00-13:20');
    AgregarHorario(3, 6, '18:10-20:00');
END;

-- ASIGNAR CURSO
BEGIN
    AsignarCurso(1, 202000166);
    AsignarCurso(2, 202000166);
    AsignarCurso(3, 202000166);

    AsignarCurso(1, 202003926);
    AsignarCurso(2, 202003926);
    AsignarCurso(3, 202003926);

    AsignarCurso(1, 202000006);
    AsignarCurso(2, 202000006);
    AsignarCurso(3, 202000006);
END;

-- DESASIGNAR CURSO
BEGIN
    DesasignarCurso(1, 202000166);
    DesasignarCurso(2, 202003926);
    DesasignarCurso(3, 202000006);
END;

-- INGRESAR NOTA
BEGIN
    IngresarNota(2, 202000166, 99);
    IngresarNota(3, 202000006, 78.4);
    IngresarNota(1, 202000006, 60.5);
END;