-- ========== NOMBRE Y APELLIDO VALIDO ========================
CREATE OR REPLACE FUNCTION NombreCorrecto (
    nombre IN VARCHAR2 
)
RETURN NUMBER IS
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(nombre, '^[a-zA-Z ]+$') THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== FECHA VALIDA ========================
CREATE OR REPLACE FUNCTION FechaCorrecta(
    fecha IN VARCHAR2
)
RETURN NUMBER IS
	fecha_valida DATE;
BEGIN
    -- Validar la fecha utilizando una consulta
    fecha_valida := TO_DATE(fecha, 'DD-MM-YYYY');
    RETURN 1; -- Retorna 1 si la fecha es válida

EXCEPTION
    WHEN OTHERS THEN
        RETURN 0; -- Retorna 0 si hay alguna excepción
END;

-- ========== CORREO VALIDO ========================
CREATE OR REPLACE FUNCTION CorreoValido (
    correo IN VARCHAR2 
)
RETURN NUMBER IS 
    es_valido NUMBER;
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(correo, '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$') THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== TELEFONO VALIDO ========================
CREATE OR REPLACE FUNCTION TelefonoValido (
    telefono IN NUMBER
)
RETURN NUMBER IS 
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF LENGTH(telefono) = 8 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== TELEFONO VALIDO ========================
CREATE OR REPLACE FUNCTION DpiValido (
    dpi IN NUMBER  
)
RETURN NUMBER IS 
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF LENGTH(dpi) = 13 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== NUMERO POSITIVO ========================
CREATE OR REPLACE FUNCTION NumeroPositivo (
    p_num IN NUMBER
)
RETURN NUMBER IS 
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF p_num >= 0 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== BOOLEAN VALIDO ========================
CREATE OR REPLACE FUNCTION BoolValido (
    p_bool IN NUMBER
)
RETURN NUMBER IS 
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF p_bool = 0 OR p_bool = 1 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== CICLO VALIDO ========================
CREATE OR REPLACE FUNCTION CicloValido (
    p_ciclo IN VARCHAR2
)
RETURN NUMBER IS 
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF p_ciclo = '1S' OR p_ciclo = '2S' OR p_ciclo = 'VJ' OR p_ciclo = 'VD' THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== SECCION VALIDO ========================
CREATE OR REPLACE FUNCTION SeccionValida (
    seccion IN VARCHAR2 
)
RETURN NUMBER IS
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(nombre, '^[A-Z]$') THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== DIA VALIDO ========================
CREATE OR REPLACE FUNCTION DiaValido (
    dia IN NUMBER 
)
RETURN NUMBER IS
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF dia >= 1 AND dia <= 7 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== HORARIO VALIDO ========================
CREATE OR REPLACE FUNCTION HorarioValido (
    horario IN VARCHAR2 
)
RETURN NUMBER IS
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF REGEXP_LIKE(horario, '^[0-9]{1,2}:[0-9]{2}-[0-9]{1,2}:[0-9]{2}$') THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- ========== NOTA VALIDO ========================
CREATE OR REPLACE FUNCTION NotaValida (
    nota IN NUMBER 
)
RETURN NUMBER IS
    es_valido NUMBER(1);
BEGIN

    -- declaración de variables
    es_valido := 0; 
    -- regex para validar la cadena
    IF nota >= 0 AND nota <= 100 THEN
        es_valido := 1;
    END IF;
    -- retorno de la función
    RETURN es_valido;

END;

-- llamada a función: SELECT funcion('aa') FROM DUAL;