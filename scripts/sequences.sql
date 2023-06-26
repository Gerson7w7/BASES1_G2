-- auto increment para carreras
CREATE SEQUENCE CarreraSeq
    START WITH 1
    INCREMENT BY 1
    CACHE 100;

-- auto increment para habilitar curso
CREATE SEQUENCE CursoHabSeq
    START WITH 1
    INCREMENT BY 1;

-- auto increment para horario
CREATE SEQUENCE HorarioSeq
    START WITH 1
    INCREMENT BY 1;
    
-- cuando se inserta un valor auto incremental sería: name_of_sequence.nextval