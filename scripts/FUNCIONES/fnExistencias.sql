-- ========== EXISTE DOCENTE ========================
CREATE FUNCTION ExisteDocente (
    siif IN INTEGER 
)
RETURN BOOLEAN IS 
    existe BOOLEAN;
BEGIN

    -- declaración de variables
    existe := FALSE;
    -- consulta para verificar la existencia del docente
    SELECT EXISTS (SELECT 1 FROM docente d WHERE d.siif = siif) INTO existe;
    -- retorno de la función
    RETURN existe;

END;
/

-- ========== EXISTE ESTUDIANTE ========================
CREATE FUNCTION ExisteEstudiante (
    carnet IN INTEGER 
)
RETURN BOOLEAN IS 
    existe BOOLEAN;
BEGIN

    -- declaración de variables
    existe := FALSE;
    -- consulta para verificar la existencia del docente
    SELECT EXISTS (SELECT 1 FROM estudiante e WHERE e.carnet = carnet) INTO existe;
    -- retorno de la función
    RETURN existe;

END;
/

-- ========== EXISTE CARRERA ========================
CREATE FUNCTION ExisteCarrera (
    carrera IN INTEGER 
)
RETURN BOOLEAN IS 
    existe BOOLEAN;
BEGIN

    -- declaración de variables
    existe := FALSE;
    -- consulta para verificar la existencia del docente
    SELECT EXISTS (SELECT 1 FROM carrera c WHERE c.id = carrera) INTO existe;
    -- retorno de la función
    RETURN existe;

END;
/