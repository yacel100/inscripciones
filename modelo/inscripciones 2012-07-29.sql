-- SQL Manager Lite for PostgreSQL 5.1.1.1
-- ---------------------------------------
-- Host      : localhost
-- Database  : inscripciones
-- Version   : PostgreSQL 9.1.3, compiled by Visual C++ build 1500, 64-bit



SET check_function_bodies = false;
--
-- Definition for sequence cuentas_id_seq (OID = 17057) : 
--
SET search_path = public, pg_catalog;
CREATE SEQUENCE public.cuentas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table cuentas (OID = 17059) : 
--
CREATE TABLE public.cuentas (
    id integer DEFAULT nextval('cuentas_id_seq'::regclass) NOT NULL,
    rol_id integer NOT NULL,
    persona_id integer NOT NULL,
    nombre_de_usuario varchar(20) NOT NULL,
    password char(40) NOT NULL,
    fecha_inicio_validez date DEFAULT now() NOT NULL,
    fecha_fin_validez date
) WITHOUT OIDS;
--
-- Definition for sequence cursos_id_seq (OID = 17064) : 
--
CREATE SEQUENCE public.cursos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table cursos (OID = 17066) : 
--
CREATE TABLE public.cursos (
    id integer DEFAULT nextval('cursos_id_seq'::regclass) NOT NULL,
    nombre_del_curso varchar(100) NOT NULL,
    objetivo_del_curso varchar(255) NOT NULL,
    costo_auxiliares money NOT NULL,
    costo_estudiantes money NOT NULL,
    costo_otros money NOT NULL
) WITHOUT OIDS;
--
-- Definition for sequence descripciones_id_seq (OID = 17070) : 
--
CREATE SEQUENCE public.descripciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table descripciones (OID = 17072) : 
--
CREATE TABLE public.descripciones (
    id integer DEFAULT nextval('descripciones_id_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    descripcion_general text,
    afiche char(1024),
    banner char(512)
) WITHOUT OIDS;
--
-- Definition for sequence devoluciones_id_seq (OID = 17079) : 
--
CREATE SEQUENCE public.devoluciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table devoluciones (OID = 17081) : 
--
CREATE TABLE public.devoluciones (
    id integer DEFAULT nextval('devoluciones_id_seq'::regclass) NOT NULL,
    inscripcion_id integer NOT NULL,
    fecha_devolucion date,
    motivo_devolucion varchar(255),
    comprobante_devolucion char(255)
) WITHOUT OIDS;
--
-- Definition for sequence gestiones_id_seq (OID = 17088) : 
--
CREATE SEQUENCE public.gestiones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table gestiones (OID = 17090) : 
--
CREATE TABLE public.gestiones (
    id integer DEFAULT nextval('gestiones_id_seq'::regclass) NOT NULL,
    nombre_gestion char(7),
    descripcion_gestion varchar(255)
) WITHOUT OIDS;
--
-- Definition for sequence grupos_id_seq (OID = 17094) : 
--
CREATE SEQUENCE public.grupos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table grupos (OID = 17096) : 
--
CREATE TABLE public.grupos (
    id integer DEFAULT nextval('grupos_id_seq'::regclass) NOT NULL,
    curso_id integer,
    gestion_id integer NOT NULL,
    persona_id integer NOT NULL,
    nombre_grupo varchar(10),
    hora_inicio time without time zone,
    hora_fin time without time zone
) WITHOUT OIDS;
--
-- Definition for sequence inscripciones_id_seq (OID = 17100) : 
--
CREATE SEQUENCE public.inscripciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table inscripciones (OID = 17102) : 
--
CREATE TABLE public.inscripciones (
    id integer DEFAULT nextval('inscripciones_id_seq'::regclass) NOT NULL,
    cuenta_id integer NOT NULL,
    grupo_id integer,
    persona_id integer,
    fecha_inscripcion date,
    observaciones varchar(255),
    curso_id integer
) WITHOUT OIDS;
--
-- Definition for sequence personas_id_seq (OID = 17106) : 
--
CREATE SEQUENCE public.personas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table personas (OID = 17108) : 
--
CREATE TABLE public.personas (
    id integer DEFAULT nextval('personas_id_seq'::regclass) NOT NULL,
    ci integer,
    sis integer,
    nombres varchar(30),
    apellido_paterno varchar(30),
    apellido_materno varchar(30),
    telefono integer,
    email varchar(50)
) WITHOUT OIDS;
--
-- Definition for sequence roles_id_seq (OID = 17112) : 
--
CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table roles (OID = 17114) : 
--
CREATE TABLE public.roles (
    id integer DEFAULT nextval('roles_id_seq'::regclass) NOT NULL,
    nombre_rol varchar(20),
    descripcion_rol varchar(255)
) WITHOUT OIDS;
--
-- Definition for sequence temas_id_seq (OID = 17118) : 
--
CREATE SEQUENCE public.temas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;
--
-- Structure for table temas (OID = 17120) : 
--
CREATE TABLE public.temas (
    id integer DEFAULT nextval('temas_id_seq'::regclass) NOT NULL,
    curso_id integer NOT NULL,
    numero_tema integer,
    nombre_tema varchar(100),
    descripcion_tema varchar(255)
) WITHOUT OIDS;
--
-- Data for table public.cuentas (OID = 17059) (LIMIT 0,1)
--
INSERT INTO cuentas (id, rol_id, persona_id, nombre_de_usuario, password, fecha_inicio_validez, fecha_fin_validez)
VALUES (1, 1, 1, 'ecaceres', 'hpscan5590jeT', '2012-01-01', '2012-12-31');

--
-- Data for table public.cursos (OID = 17066) (LIMIT 0,1)
--
INSERT INTO cursos (id, nombre_del_curso, objetivo_del_curso, costo_auxiliares, costo_estudiantes, costo_otros)
VALUES (1, 'PHP Avanzado', 'Enseñar al estudiante las estructuras avanzadas del PHP', '300000.00', '600000.00', '800000.00');

--
-- Data for table public.gestiones (OID = 17090) (LIMIT 0,1)
--
INSERT INTO gestiones (id, nombre_gestion, descripcion_gestion)
VALUES (2, 'I-2012', 'Primer semestre del año 2012');

--
-- Data for table public.grupos (OID = 17096) (LIMIT 0,1)
--
INSERT INTO grupos (id, curso_id, gestion_id, persona_id, nombre_grupo, hora_inicio, hora_fin)
VALUES (1, 1, 2, 1, '1', '07:30:00', '09:00:00');

--
-- Data for table public.personas (OID = 17108) (LIMIT 0,2)
--
INSERT INTO personas (id, ci, sis, nombres, apellido_paterno, apellido_materno, telefono, email)
VALUES (1, 5287704, 200105481, 'Edner Elvis', 'Caceres', '', 70727734, 'ecaceres@cs.umss.edu.bo');

INSERT INTO personas (id, ci, sis, nombres, apellido_paterno, apellido_materno, telefono, email)
VALUES (2, 5153990, 200105886, 'Maria Angelica', 'Vasquez', 'Torrico', 72273444, 'mageli_sis@hotmail.com');

--
-- Data for table public.roles (OID = 17114) (LIMIT 0,1)
--
INSERT INTO roles (id, nombre_rol, descripcion_rol)
VALUES (1, 'Auxiliar Titular', 'Auxiliar titular de laboratorio de computo con una carga horaria de 80 h/mes');

--
-- Definition for index rol_de_la_cuenta_fk (OID = 17124) : 
--
CREATE INDEX rol_de_la_cuenta_fk ON cuentas USING btree (rol_id);
--
-- Definition for index puede_tener_cuenta_fk (OID = 17125) : 
--
CREATE INDEX puede_tener_cuenta_fk ON cuentas USING btree (persona_id);
--
-- Definition for index tiene_descripcion_fk (OID = 17126) : 
--
CREATE INDEX tiene_descripcion_fk ON descripciones USING btree (curso_id);
--
-- Definition for index devoliciones_pk (OID = 17127) : 
--
CREATE UNIQUE INDEX devoliciones_pk ON devoluciones USING btree (id);
--
-- Definition for index es_devuelto_fk (OID = 17128) : 
--
CREATE INDEX es_devuelto_fk ON devoluciones USING btree (inscripcion_id);
--
-- Definition for index dictado_en_al_gestion_fk (OID = 17129) : 
--
CREATE INDEX dictado_en_al_gestion_fk ON grupos USING btree (gestion_id);
--
-- Definition for index tiene_grupos_fk (OID = 17130) : 
--
CREATE INDEX tiene_grupos_fk ON grupos USING btree (curso_id);
--
-- Definition for index instructor_fk (OID = 17131) : 
--
CREATE INDEX instructor_fk ON grupos USING btree (persona_id);
--
-- Definition for index inscripciones_pk (OID = 17132) : 
--
CREATE UNIQUE INDEX inscripciones_pk ON inscripciones USING btree (id);
--
-- Definition for index se_inscribe_fk (OID = 17133) : 
--
CREATE INDEX se_inscribe_fk ON inscripciones USING btree (persona_id);
--
-- Definition for index inscribio_fk (OID = 17134) : 
--
CREATE INDEX inscribio_fk ON inscripciones USING btree (cuenta_id);
--
-- Definition for index tiene_temas_fk (OID = 17135) : 
--
CREATE INDEX tiene_temas_fk ON temas USING btree (curso_id);
--
-- Definition for index pk_cuentas (OID = 17136) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT pk_cuentas
    PRIMARY KEY (id);
--
-- Definition for index pk_cursos (OID = 17138) : 
--
ALTER TABLE ONLY cursos
    ADD CONSTRAINT pk_cursos
    PRIMARY KEY (id);
--
-- Definition for index pk_descripciones (OID = 17140) : 
--
ALTER TABLE ONLY descripciones
    ADD CONSTRAINT pk_descripciones
    PRIMARY KEY (id);
--
-- Definition for index pk_devoliciones (OID = 17142) : 
--
ALTER TABLE ONLY devoluciones
    ADD CONSTRAINT pk_devoliciones
    PRIMARY KEY (id);
--
-- Definition for index pk_gestiones (OID = 17144) : 
--
ALTER TABLE ONLY gestiones
    ADD CONSTRAINT pk_gestiones
    PRIMARY KEY (id);
--
-- Definition for index pk_grupos (OID = 17146) : 
--
ALTER TABLE ONLY grupos
    ADD CONSTRAINT pk_grupos
    PRIMARY KEY (id);
--
-- Definition for index pk_inscripciones (OID = 17148) : 
--
ALTER TABLE ONLY inscripciones
    ADD CONSTRAINT pk_inscripciones
    PRIMARY KEY (id);
--
-- Definition for index pk_personas (OID = 17150) : 
--
ALTER TABLE ONLY personas
    ADD CONSTRAINT pk_personas
    PRIMARY KEY (id);
--
-- Definition for index pk_roles (OID = 17152) : 
--
ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles
    PRIMARY KEY (id);
--
-- Definition for index pk_temas (OID = 17154) : 
--
ALTER TABLE ONLY temas
    ADD CONSTRAINT pk_temas
    PRIMARY KEY (id);
--
-- Definition for index fk_cuentas_puede_ten_personas (OID = 17156) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT fk_cuentas_puede_ten_personas
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_cuentas_rol_de_la_roles (OID = 17161) : 
--
ALTER TABLE ONLY cuentas
    ADD CONSTRAINT fk_cuentas_rol_de_la_roles
    FOREIGN KEY (rol_id) REFERENCES roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_descripc_tiene_des_cursos (OID = 17166) : 
--
ALTER TABLE ONLY descripciones
    ADD CONSTRAINT fk_descripc_tiene_des_cursos
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_devolici_es_devuel_inscripc (OID = 17171) : 
--
ALTER TABLE ONLY devoluciones
    ADD CONSTRAINT fk_devolici_es_devuel_inscripc
    FOREIGN KEY (inscripcion_id) REFERENCES inscripciones(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_grupos_dictado_e_gestione (OID = 17176) : 
--
ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_grupos_dictado_e_gestione
    FOREIGN KEY (gestion_id) REFERENCES gestiones(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_grupos_instructo_personas (OID = 17181) : 
--
ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_grupos_instructo_personas
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_grupos_tiene_gru_cursos (OID = 17186) : 
--
ALTER TABLE ONLY grupos
    ADD CONSTRAINT fk_grupos_tiene_gru_cursos
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_inscripc_inscribio_cuentas (OID = 17191) : 
--
ALTER TABLE ONLY inscripciones
    ADD CONSTRAINT fk_inscripc_inscribio_cuentas
    FOREIGN KEY (cuenta_id) REFERENCES cuentas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_inscripc_inscrito__grupos (OID = 17196) : 
--
ALTER TABLE ONLY inscripciones
    ADD CONSTRAINT fk_inscripc_inscrito__grupos
    FOREIGN KEY (grupo_id) REFERENCES grupos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_inscripc_se_inscri_personas (OID = 17201) : 
--
ALTER TABLE ONLY inscripciones
    ADD CONSTRAINT fk_inscripc_se_inscri_personas
    FOREIGN KEY (persona_id) REFERENCES personas(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index fk_temas_tiene_tem_cursos (OID = 17206) : 
--
ALTER TABLE ONLY temas
    ADD CONSTRAINT fk_temas_tiene_tem_cursos
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
--
-- Definition for index inscripciones_curso_fk (OID = 17211) : 
--
ALTER TABLE ONLY inscripciones
    ADD CONSTRAINT inscripciones_curso_fk
    FOREIGN KEY (curso_id) REFERENCES cursos(id) MATCH FULL ON UPDATE CASCADE ON DELETE CASCADE;
--
-- Data for sequence public.cuentas_id_seq (OID = 17057)
--
SELECT pg_catalog.setval('cuentas_id_seq', 1, true);
--
-- Data for sequence public.cursos_id_seq (OID = 17064)
--
SELECT pg_catalog.setval('cursos_id_seq', 1, true);
--
-- Data for sequence public.descripciones_id_seq (OID = 17070)
--
SELECT pg_catalog.setval('descripciones_id_seq', 1, false);
--
-- Data for sequence public.devoluciones_id_seq (OID = 17079)
--
SELECT pg_catalog.setval('devoluciones_id_seq', 1, false);
--
-- Data for sequence public.gestiones_id_seq (OID = 17088)
--
SELECT pg_catalog.setval('gestiones_id_seq', 2, true);
--
-- Data for sequence public.grupos_id_seq (OID = 17094)
--
SELECT pg_catalog.setval('grupos_id_seq', 1, true);
--
-- Data for sequence public.inscripciones_id_seq (OID = 17100)
--
SELECT pg_catalog.setval('inscripciones_id_seq', 1, false);
--
-- Data for sequence public.personas_id_seq (OID = 17106)
--
SELECT pg_catalog.setval('personas_id_seq', 2, true);
--
-- Data for sequence public.roles_id_seq (OID = 17112)
--
SELECT pg_catalog.setval('roles_id_seq', 1, true);
--
-- Data for sequence public.temas_id_seq (OID = 17118)
--
SELECT pg_catalog.setval('temas_id_seq', 1, false);
--
-- Comments
--
COMMENT ON SCHEMA public IS 'standard public schema';
