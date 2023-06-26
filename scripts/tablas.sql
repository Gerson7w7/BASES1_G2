CREATE TABLE asignacioncurso (
    cursohabilitado_id INTEGER NOT NULL,
    estudiante_carnet  INTEGER NOT NULL,
    esta_asignado      NUMBER NOT NULL
);

CREATE TABLE carrera (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(100) NOT NULL
);

ALTER TABLE carrera ADD CONSTRAINT carrera_pk PRIMARY KEY ( id );

CREATE TABLE curso (
    codigo         INTEGER NOT NULL,
    nombre         VARCHAR2(100) NOT NULL,
    crd_necesarios INTEGER NOT NULL,
    crd_otorgados  INTEGER NOT NULL,
    es_obligatorio NUMBER NOT NULL,
    carrera_id     INTEGER NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( codigo );

CREATE TABLE cursohabilitado (
    id           INTEGER NOT NULL,
    ciclo        VARCHAR2(2) NOT NULL,
    cupo_max     INTEGER NOT NULL,
    seccion      VARCHAR2(1) NOT NULL,
    curso_codigo INTEGER NOT NULL,
    docente_siif INTEGER NOT NULL,
    anio         DATE NOT NULL,
    asignados    INTEGER NOT NULL
);

ALTER TABLE cursohabilitado ADD CONSTRAINT cursohabilitado_pk PRIMARY KEY ( id );

CREATE TABLE docente (
    nombre     VARCHAR2(50) NOT NULL,
    apellido   VARCHAR2(50) NOT NULL,
    nacimiento DATE NOT NULL,
    correo     VARCHAR2(100) NOT NULL,
    telefono   INTEGER NOT NULL,
    direccion  VARCHAR2(100) NOT NULL,
    dpi        INTEGER NOT NULL,
    siif       INTEGER NOT NULL,
    fecha      DATE NOT NULL
);

ALTER TABLE docente ADD CONSTRAINT docente_pk PRIMARY KEY ( siif );

CREATE TABLE estudiante (
    carnet     INTEGER NOT NULL,
    nombre     VARCHAR2(50) NOT NULL,
    apellido   VARCHAR2(50) NOT NULL,
    nacimiento DATE NOT NULL,
    correo     VARCHAR2(100) NOT NULL,
    telefono   INTEGER NOT NULL,
    direccion  VARCHAR2(100) NOT NULL,
    dpi        INTEGER NOT NULL,
    carrera_id INTEGER NOT NULL,
    creditos   INTEGER NOT NULL,
    fecha      DATE NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( carnet );

CREATE TABLE historial (
    fecha       DATE NOT NULL,
    descripcion VARCHAR2(150) NOT NULL,
    tipo        VARCHAR2(20) NOT NULL
);

CREATE TABLE horario (
    dia                INTEGER NOT NULL,
    horario            VARCHAR2(12) NOT NULL,
    cursohabilitado_id INTEGER NOT NULL
);

CREATE TABLE nota (
	id 				   INTEGER NOT NULL,
    nota               INTEGER NOT NULL,
    cursohabilitado_id INTEGER NOT NULL,
    estudiante_carnet  INTEGER NOT NULL
);

ALTER TABLE nota ADD CONSTRAINT nota_pk PRIMARY KEY ( id );

ALTER TABLE asignacioncurso
    ADD CONSTRAINT asigcurso_cursohabil_fk FOREIGN KEY ( cursohabilitado_id )
        REFERENCES cursohabilitado ( id );

ALTER TABLE asignacioncurso
    ADD CONSTRAINT asignacioncurso_estudiante_fk FOREIGN KEY ( estudiante_carnet )
        REFERENCES estudiante ( carnet );

ALTER TABLE curso
    ADD CONSTRAINT curso_carrera_fk FOREIGN KEY ( carrera_id )
        REFERENCES carrera ( id );

ALTER TABLE cursohabilitado
    ADD CONSTRAINT cursohabilitado_curso_fk FOREIGN KEY ( curso_codigo )
        REFERENCES curso ( codigo );

ALTER TABLE cursohabilitado
    ADD CONSTRAINT cursohabilitado_docente_fk FOREIGN KEY ( docente_siif )
        REFERENCES docente ( siif );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_carrera_fk FOREIGN KEY ( carrera_id )
        REFERENCES carrera ( id );

ALTER TABLE horario
    ADD CONSTRAINT horario_cursohabilitado_fk FOREIGN KEY ( cursohabilitado_id )
        REFERENCES cursohabilitado ( id );

ALTER TABLE nota
    ADD CONSTRAINT nota_cursohabilitado_fk FOREIGN KEY ( cursohabilitado_id )
        REFERENCES cursohabilitado ( id );

ALTER TABLE nota
    ADD CONSTRAINT nota_estudiante_fk FOREIGN KEY ( estudiante_carnet )
        REFERENCES estudiante ( carnet );

--SELECT * FROM asignacioncurso;
--SELECT * FROM carrera;
--SELECT * FROM curso;
--SELECT * FROM cursohabilitado;
--SELECT * FROM docente;
--SELECT * FROM estudiante;
--SELECT * FROM horario;
--SELECT * FROM nota;

--DROP TABLE asignacioncurso;
--DROP TABLE carrera;
--DROP TABLE curso;
--DROP TABLE cursohabilitado;
--DROP TABLE docente;
--DROP TABLE estudiante;
--DROP TABLE horario;
--DROP TABLE nota;



        