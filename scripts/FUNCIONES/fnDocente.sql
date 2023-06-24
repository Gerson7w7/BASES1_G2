-- ========== EXISTE DOCENTE ========================
DELIMITER $$
CREATE FUNCTION ExisteDocente (
    siif INTEGER 
)
RETURN BOOLEAN
DETERMINISTIC
BEGIN

-- declaración de variables
DECLARE existe BOOLEAN;
SELECT EXISTS (SELECT 1 FROM docente c WHERE c.siif = siif) INTO existe;
-- retorno de la función
RETURN(existe);

END $$

-- ========== NOMBRE Y APELLIDO DOCENTE ========================
CREATE FUNCTION NombreCorrecto (
    nombre INTEGER 
)
RETURN BOOLEAN
DETERMINISTIC
BEGIN

-- declaración de variables
DECLARE es_valido BOOLEAN;
SELECT REGEXP_INSTR(nombre, '[a-zA-Z]') INTO es_valido;
-- retorno de la función
RETURN(es_valido);

END $$