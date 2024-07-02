-- Ciem Medic Jad: Este es un bloque de la base de datos del proyecto sobre medicina.
-- Esta sección contiene las definiciones de varias tablas relacionadas con el proyecto Ciem Medic.
-- Las tablas incluyen información sobre usuarios, sus detalles de inicio de sesión, historial de búsqueda y otros datos relacionados.
-- Cada tabla se define con sus respectivas columnas, restricciones y relaciones con otras tablas.
-- El propósito de estas tablas es almacenar y gestionar datos de manera eficiente para el proyecto Ciem Medic.


BEGIN;


CREATE TABLE IF NOT EXISTS public.articulosreferencia
(
    articulo_id serial NOT NULL,
    CONSTRAINT articulosreferencia_pkey PRIMARY KEY (articulo_id)
);

CREATE TABLE IF NOT EXISTS public.articulosreferencia_detalle
(
    articulo_id integer NOT NULL,
    titulo character varying(200) COLLATE pg_catalog."default" NOT NULL,
    contenido text COLLATE pg_catalog."default" NOT NULL,
    autor character varying(100) COLLATE pg_catalog."default" NOT NULL,
    fecha_publicacion timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT articulosreferencia_detalle_fkey FOREIGN KEY (articulo_id)
    REFERENCES public.articulosreferencia (articulo_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);




-- Fragmenting the table cfgseedusuario into multiple tables

CREATE TABLE IF NOT EXISTS public.cfgseedusuario
(
    cfgseed_id serial NOT NULL,
    usuario_id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    CONSTRAINT cfgseedusuario_pkey PRIMARY KEY (cfgseed_id)
);

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_motor_busqueda
(
    cfgseed_id integer NOT NULL,
    motor_busqueda character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT cfgseedusuario_motor_busqueda_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


-- Fragmenting the table cfgseedusuario_nombreperfil into multiple tables

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_nombreperfil
(
    cfgseed_id integer NOT NULL,
    CONSTRAINT cfgseedusuario_nombreperfil_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_nombreperfil_detalle
(
    cfgseed_id integer NOT NULL,
    nombreperfil character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT cfgseedusuario_nombreperfil_detalle_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario_nombreperfil (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


-- Fragmenting the table cfgseedusuario_imgperfil into multiple tables

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_imgperfil
(
    cfgseed_id integer NOT NULL,
    CONSTRAINT cfgseedusuario_imgperfil_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_imgperfil_detalle
(
    cfgseed_id integer NOT NULL,
    imgperfil character varying(300) COLLATE pg_catalog."default",
    CONSTRAINT cfgseedusuario_imgperfil_detalle_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario_imgperfil (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.cfgseedusuario_notificaciones
(
    cfgseed_id integer NOT NULL,
    notificaciones boolean,
    CONSTRAINT cfgseedusuario_notificaciones_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.cfgseedusuario_tipodeseleccion
(
    cfgseed_id integer NOT NULL,
    tipodeseleccion character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT cfgseedusuario_tipodeseleccion_fkey FOREIGN KEY (cfgseed_id)
    REFERENCES public.cfgseedusuario (cfgseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
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

CREATE TABLE IF NOT EXISTS public.reportes_usuario
(
    reporte_id integer NOT NULL DEFAULT nextval('reportes_reporte_id_seq'::regclass),
    usuario_id integer,
    contenido text COLLATE pg_catalog."default",
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reportes_pkey PRIMARY KEY (reporte_id)
);

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




--- Fragmentacion de Tablas

CREATE TABLE IF NOT EXISTS public.loginusuario
(
    login_id serial NOT NULL,
    usuario_id integer NOT NULL,
    fecha_login timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT loginusuario_pkey PRIMARY KEY (login_id)
);

CREATE TABLE IF NOT EXISTS public.loginusuario_detalle
(
    login_id integer NOT NULL,
    ip_address character varying(50) COLLATE pg_catalog."default",
    device character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT loginusuario_detalle_fkey FOREIGN KEY (login_id)
    REFERENCES public.loginusuario (login_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS public.usuarioseed
(
    usuarioseed_id serial NOT NULL,
    nombreseed character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT usuarioseed_pkey PRIMARY KEY (usuarioseed_id)
);

CREATE TABLE IF NOT EXISTS public.usuarioseed_detalle
(
    usuarioseed_id integer NOT NULL,
    descripcion text COLLATE pg_catalog."default",
    CONSTRAINT usuarioseed_detalle_fkey FOREIGN KEY (usuarioseed_id)
    REFERENCES public.usuarioseed (usuarioseed_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.configuraciones
(
    configuracion_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT configuraciones_pkey PRIMARY KEY (configuracion_id)
);

CREATE TABLE IF NOT EXISTS public.configuraciones_detalle
(
    configuracion_id integer NOT NULL,
    clave character varying(50) COLLATE pg_catalog."default",
    valor character varying(100) COLLATE pg_catalog."default",
    CONSTRAINT configuraciones_detalle_fkey FOREIGN KEY (configuracion_id)
    REFERENCES public.configuraciones (configuracion_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS public.direcciones
(
    direccion_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT direcciones_pkey PRIMARY KEY (direccion_id)
);

CREATE TABLE IF NOT EXISTS public.direcciones_detalle
(
    direccion_id integer NOT NULL,
    calle character varying(100) COLLATE pg_catalog."default",
    ciudad character varying(50) COLLATE pg_catalog."default",
    estado character varying(50) COLLATE pg_catalog."default",
    codigo_postal character varying(10) COLLATE pg_catalog."default",
    CONSTRAINT direcciones_detalle_fkey FOREIGN KEY (direccion_id)
    REFERENCES public.direcciones (direccion_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.favoritos
(
    favorito_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT favoritos_pkey PRIMARY KEY (favorito_id)
);

CREATE TABLE IF NOT EXISTS public.favoritos_detalle
(
    favorito_id integer NOT NULL,
    articulo_id integer NOT NULL,
    fecha_agregado timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT favoritos_detalle_fkey FOREIGN KEY (favorito_id)
    REFERENCES public.favoritos (favorito_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.historialbusquedas
(
    historial_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT historialbusquedas_pkey PRIMARY KEY (historial_id)
);

CREATE TABLE IF NOT EXISTS public.historialbusquedas_detalle
(
    historial_id integer NOT NULL,
    termino_busqueda character varying(100) COLLATE pg_catalog."default",
    fecha_busqueda timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT historialbusquedas_detalle_fkey FOREIGN KEY (historial_id)
    REFERENCES public.historialbusquedas (historial_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.recuperacioncuenta
(
    recuperacion_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT recuperacioncuenta_pkey PRIMARY KEY (recuperacion_id)
);

CREATE TABLE IF NOT EXISTS public.recuperacioncuenta_detalle
(
    recuperacion_id integer NOT NULL,
    token character varying(250) COLLATE pg_catalog."default",
    fecha_solicitud timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp without time zone NOT NULL,
    CONSTRAINT recuperacioncuenta_detalle_fkey FOREIGN KEY (recuperacion_id)
    REFERENCES public.recuperacioncuenta (recuperacion_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.registronewuser
(
    registro_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT registronewuser_pkey PRIMARY KEY (registro_id)
);

CREATE TABLE IF NOT EXISTS public.registronewuser_detalle
(
    registro_id integer NOT NULL,
    email character varying(100) COLLATE pg_catalog."default",
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT registronewuser_detalle_fkey FOREIGN KEY (registro_id)
    REFERENCES public.registronewuser (registro_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.reportes_usuario
(
    reporte_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT reportes_usuario_pkey PRIMARY KEY (reporte_id)
);

CREATE TABLE IF NOT EXISTS public.reportes_usuario_detalle
(
    reporte_id integer NOT NULL,
    contenido text COLLATE pg_catalog."default",
    fecha timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT reportes_usuario_detalle_fkey FOREIGN KEY (reporte_id)
    REFERENCES public.reportes_usuario (reporte_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
);



CREATE TABLE IF NOT EXISTS public.sesiones
(
    sesion_id serial NOT NULL,
    usuario_id integer NOT NULL,
    CONSTRAINT sesiones_pkey PRIMARY KEY (sesion_id)
);

CREATE TABLE IF NOT EXISTS public.sesiones_detalle
(
    sesion_id integer NOT NULL,
    token_sesion character varying(250) COLLATE pg_catalog."default" NOT NULL,
    fecha_inicio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion timestamp without time zone NOT NULL,
    CONSTRAINT sesiones_detalle_fkey FOREIGN KEY (sesion_id)
    REFERENCES public.sesiones (sesion_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE CASCADE
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


-- Division Gestionar privilegios
BEGIN;
    CREATE OR REPLACE FUNCTION gestionar_privilegios(usuario_actual text) RETURNS void AS $$
    BEGIN
        IF usuario_actual = 'postgres' THEN
            GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
            RAISE NOTICE 'El usuario % tiene permisos para editar las tablas.', usuario_actual;
        ELSE
            RAISE NOTICE 'El usuario % no tiene permisos para editar las tablas.', usuario_actual;
            REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM usuario_actual;
        END IF;
    END;
    $$ LANGUAGE plpgsql;
    SELECT gestionar_privilegios(current_user);
END;



