-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.articulosreferencia
(
    articulo_id serial NOT NULL,
    titulo character varying(200) COLLATE pg_catalog."default" NOT NULL,
    contenido text COLLATE pg_catalog."default" NOT NULL,
    autor character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT articulosreferencia_pkey PRIMARY KEY (articulo_id)
);

CREATE TABLE IF NOT EXISTS public.cfgseedusuario
(
    cfgseed_id serial NOT NULL,
    usuario_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    motor_busqueda character varying(50) COLLATE pg_catalog."default",
    nombreperfil character varying(50) COLLATE pg_catalog."default",
    imgperfil character varying(300) COLLATE pg_catalog."default",
    notificaciones boolean,
    tipodeseleccion character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT cfgseedusuario_pkey PRIMARY KEY (cfgseed_id)
);

CREATE TABLE IF NOT EXISTS public.configuraciones
(
    configuracion_id serial NOT NULL,
    usuario_id integer,
    motor_busqueda character varying(50) COLLATE pg_catalog."default",
    idioma_preferido character varying(50) COLLATE pg_catalog."default",
    nombreperfil character varying(50) COLLATE pg_catalog."default",
    imgperfil character varying(100) COLLATE pg_catalog."default",
    notificaciones boolean,
    tipodeseleccion character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT configuraciones_pkey PRIMARY KEY (configuracion_id)
);

CREATE TABLE IF NOT EXISTS public.direcciones
(
    direccion_id serial NOT NULL,
    usuario_id integer,
    calle character varying(100) COLLATE pg_catalog."default",
    ciudad character varying(100) COLLATE pg_catalog."default",
    codigo_postal character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT direcciones_pkey PRIMARY KEY (direccion_id)
);

CREATE TABLE IF NOT EXISTS public.favoritos
(
    favorito_id serial NOT NULL,
    usuario_id integer,
    articulo_id integer,
    CONSTRAINT favoritos_pkey PRIMARY KEY (favorito_id)
);

CREATE TABLE IF NOT EXISTS public.historialbusquedas
(
    historial_id serial NOT NULL,
    usuario_id integer,
    texto_busqueda text COLLATE pg_catalog."default",
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT historialbusquedas_pkey PRIMARY KEY (historial_id)
);

CREATE TABLE IF NOT EXISTS public.loginusuario
(
    login_id serial NOT NULL,
    nombre_o_semilla character varying(50) COLLATE pg_catalog."default" NOT NULL,
    contrasena character varying(100) COLLATE pg_catalog."default" NOT NULL,
    usuario_id integer,
    CONSTRAINT loginusuario_pkey PRIMARY KEY (login_id)
);

CREATE TABLE IF NOT EXISTS public.recuperacioncuenta
(
    recuperacion_id serial NOT NULL,
    usuario_id integer,
    id_unico character varying(10) COLLATE pg_catalog."default" NOT NULL,
    token_recuperacion character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp without time zone NOT NULL,
    CONSTRAINT recuperacioncuenta_pkey PRIMARY KEY (recuperacion_id),
    CONSTRAINT recuperacioncuenta_token_recuperacion_key UNIQUE (token_recuperacion)
);

CREATE TABLE IF NOT EXISTS public.registronewuser
(
    registro_id serial NOT NULL,
    nombre character varying(80) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(80) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(25) COLLATE pg_catalog."default" NOT NULL,
    contrasena character varying(100) COLLATE pg_catalog."default" NOT NULL,
    usuario_id serial NOT NULL,
    CONSTRAINT registronewuser_pkey PRIMARY KEY (registro_id),
    CONSTRAINT registronewuser_email_key UNIQUE (email)
);
----------------------------------------------
CREATE TABLE IF NOT EXISTS public.reportes_usuario
(
    reporte_id integer NOT NULL,
    usuario_id integer,
    contenido text COLLATE pg_catalog."default",
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reportes_pkey PRIMARY KEY (reporte_id)
);
-----------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS public.sesiones
(
    sesion_id serial NOT NULL,
    usuario_id integer,
    token_sesion character varying(250) COLLATE pg_catalog."default" NOT NULL,
    fecha_inicio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp without time zone NOT NULL,
    CONSTRAINT sesiones_pkey PRIMARY KEY (sesion_id),
    CONSTRAINT sesiones_token_sesion_key UNIQUE (token_sesion)
);

CREATE TABLE IF NOT EXISTS public.usuarios
(
    usuario_id serial NOT NULL,
    nombre character varying(50) COLLATE pg_catalog."default" NOT NULL,
    apellido character varying(50) COLLATE pg_catalog."default" NOT NULL,
    email character varying(100) COLLATE pg_catalog."default" NOT NULL,
    telefono character varying(15) COLLATE pg_catalog."default" NOT NULL,
    semilla character varying(20) COLLATE pg_catalog."default" NOT NULL,
    contrasena character varying(150) COLLATE pg_catalog."default" NOT NULL,
    id_unico character varying(20) COLLATE pg_catalog."default" NOT NULL,
    id bigserial NOT NULL,
    CONSTRAINT usuarios_pkey PRIMARY KEY (usuario_id),
    CONSTRAINT usuarios_email_key UNIQUE (email),
    CONSTRAINT usuarios_id_unico_key UNIQUE (id_unico),
    CONSTRAINT usuarios_semilla_key UNIQUE (semilla)
);

CREATE TABLE IF NOT EXISTS public.usuarioseed
(
    usuarioseed_id serial NOT NULL,
    nombreseed character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT usuarioseed_pkey PRIMARY KEY (usuarioseed_id)
);

ALTER TABLE IF EXISTS public.cfgseedusuario
    ADD CONSTRAINT cfgseedusuario_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarioseed (usuarioseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.configuraciones
    ADD CONSTRAINT configuraciones_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.direcciones
    ADD CONSTRAINT direcciones_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.favoritos
    ADD CONSTRAINT favoritos_articulo_id_fkey FOREIGN KEY (articulo_id)
    REFERENCES public.articulosreferencia (articulo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.favoritos
    ADD CONSTRAINT favoritos_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.historialbusquedas
    ADD CONSTRAINT historialbusquedas_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.loginusuario
    ADD CONSTRAINT loginusuario_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.recuperacioncuenta
    ADD CONSTRAINT recuperacioncuenta_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.registronewuser
    ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.reportes_usuario
    ADD CONSTRAINT reportes_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;


ALTER TABLE IF EXISTS public.sesiones
    ADD CONSTRAINT sesiones_usuario_id_fkey FOREIGN KEY (usuario_id)
    REFERENCES public.usuarios (usuario_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE;

END;




