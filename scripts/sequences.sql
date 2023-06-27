-- auto increment para carreras
CREATE OR REPLACE SEQUENCE CarreraSeq
    START WITH 1
    INCREMENT BY 1
    CACHE 100;

ALTER SEQUENCE CarreraSeq
    RESTART;

-- auto increment para habilitar curso
CREATE OR REPLACE SEQUENCE CursoHabSeq
    START WITH 1
    INCREMENT BY 1;

ALTER SEQUENCE CursoHabSeq
    RESTART;

-- auto increment para horario
CREATE OR REPLACE SEQUENCE HorarioSeq
    START WITH 1
    INCREMENT BY 1;

ALTER SEQUENCE HorarioSeq
    RESTART;

-- auto increment para notas
CREATE OR REPLACE SEQUENCE NotaSeq
    START WITH 1
    INCREMENT BY 1;

ALTER SEQUENCE NotaSeq
    RESTART; 
-- cuando se inserta un valor auto incremental sería: name_of_sequence.nextval