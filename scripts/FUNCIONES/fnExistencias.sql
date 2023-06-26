-- ========== EXISTE DOCENTE ========================
CREATE OR REPLACE FUNCTION ExisteDocente (
    p_siif IN INTEGER 
)
RETURN NUMBER IS 
    existe NUMBER(1) := 0; -- Declaración de la variable
BEGIN

    -- consulta para verificar la existencia del docente
    SELECT 1
    INTO existe
    FROM dual
    WHERE EXISTS (SELECT 1 FROM docente d WHERE d.siif = p_siif);
    -- retorno de la función
    RETURN existe;

EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Manejo de excepción si no se encuentra ningún docente
        RETURN 0;

END;

-- ========== EXISTE ESTUDIANTE ========================
CREATE OR REPLACE FUNCTION ExisteEstudiante (
    p_carnet IN INTEGER 
)
RETURN NUMBER IS 
    existe NUMBER(1) := 0; -- Declaración de la variable
BEGIN

    -- consulta para verificar la existencia del docente
    SELECT 1
    INTO existe
    FROM dual
    WHERE EXISTS (SELECT 1 FROM estudiante e WHERE e.carnet = p_carnet);
    -- retorno de la función
    RETURN existe;

EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Manejo de excepción si no se encuentra ningún docente
        RETURN 0;

END;

-- ========== EXISTE CARRERA ========================
CREATE OR REPLACE FUNCTION ExisteCarrera (
    p_carrera IN INTEGER 
)
RETURN NUMBER IS 
    existe NUMBER(1) := 0; -- Declaración de la variable
BEGIN

    -- consulta para verificar la existencia del docente
    SELECT 1
    INTO existe
    FROM dual
    WHERE EXISTS (SELECT 1 FROM carrera c WHERE c.id = p_carrera);
    -- retorno de la función
    RETURN existe;

EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Manejo de excepción si no se encuentra ningún docente
        RETURN 0;

END;

-- ========== EXISTE CURSO ========================
CREATE OR REPLACE FUNCTION ExisteCurso (
    p_curso IN INTEGER 
)
RETURN NUMBER IS 
    existe NUMBER(1) := 0; -- Declaración de la variable
BEGIN

    -- consulta para verificar la existencia del docente
    SELECT 1
    INTO existe
    FROM dual
    WHERE EXISTS (SELECT 1 FROM curso c WHERE c.codigo = p_curso);
    -- retorno de la función
    RETURN existe;

EXCEPTION
    WHEN NO_DATA_FOUND THEN -- Manejo de excepción si no se encuentra ningún docente
        RETURN 0;

END;

-- llamada a función: SELECT funcion('aa') FROM DUAL;