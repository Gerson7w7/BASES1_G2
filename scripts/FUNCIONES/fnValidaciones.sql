-- ========== NOMBRE Y APELLIDO VALIDO ========================
CREATE FUNCTION NombreCorrecto (
    nombre IN VARCHAR2(50) 
)
RETURN BOOLEAN IS
    es_valido BOOLEAN;
BEGIN

    -- declaración de variables
    es_valido := FALSE; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(nombre, '^[a-zA-Z]+$') THEN
        es_valido := TRUE;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;
/

-- ========== FECHA VALIDA ========================
CREATE FUNCTION FechaCorrecta(
    fecha IN DATE
)
RETURN BOOLEAN IS
BEGIN

    SELECT 1 FROM DUAL WHERE fecha = TO_DATE(TO_CHAR(fecha, 'YYYY-MM-DD'), 'YYYY-MM-DD');
    RETURN TRUE;
    -- excepción si no es una fecha valida
    EXCEPTION
        WHEN OTHERS THEN
            RETURN FALSE;
    END;
END;
/

-- ========== CORREO VALIDO ========================
CREATE FUNCTION CorreoValido (
    correo IN VARCHAR2(100) 
)
RETURN BOOLEAN IS 
    es_valido BOOLEAN;
BEGIN

    -- declaración de variables
    es_valido := FALSE; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(correo, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        es_valido := TRUE;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;
/

-- ========== TELEFONO VALIDO ========================
CREATE FUNCTION TelefonoValido (
    telefono IS NUMBER(8) 
)
RETURN BOOLEAN IS 
    es_valido BOOLEAN;
BEGIN

    -- declaración de variables
    es_valido := FALSE; 
    -- regex para validar la cadena
    IF LENGTH(telefono) = 8 THEN
        es_valido := TRUE;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;
/

-- ========== TELEFONO VALIDO ========================
CREATE FUNCTION DpiValido (
    dpi IS NUMBER(13)  
)
RETURN BOOLEAN IS 
    es_valido BOOLEAN;
BEGIN

    -- declaración de variables
    es_valido := FALSE; 
    -- regex para validar la cadena
    IF LENGTH(dpi) = 13 THEN
        es_valido := TRUE;
    END IF;
    -- retorno de la función
    RETURN es_valido;;

END;
/