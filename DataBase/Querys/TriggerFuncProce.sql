


###############################################################################################
###############################################################################################
###############################################################################################
###############################################################################################



-- Triggers
CREATE OR REPLACE FUNCTION trigger_function_historialbusquedas_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada en la tabla historialbusquedas';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_historialbusquedas_insert
AFTER INSERT ON public.historialbusquedas
FOR EACH ROW EXECUTE FUNCTION trigger_function_historialbusquedas_insert();
-- INSERT INTO public.historialbusquedas (column1, column2, ...) VALUES (value1, value2, ...);

INSERT INTO public.historialbusquedas (historial_id, usuario_id, texto_busqueda, fecha) VALUES (39, 1, 'Registro de nuevas tecnologias en la medicina..' , NOW());



CREATE OR REPLACE FUNCTION trigger_function_historialbusquedas_update()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada en la tabla historialbusquedas actualizada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_historialbusquedas_update
AFTER UPDATE ON public.historialbusquedas
FOR EACH ROW EXECUTE FUNCTION trigger_function_historialbusquedas_update();

--Para la tabla historialbusquedas
INSERT INTO public.historialbusquedas (historial_id, usuario_id, texto_busqueda, fecha) VALUES (40, 2, 'Investigacion sobre inteligencia artificial en medicina', NOW());



CREATE OR REPLACE FUNCTION trigger_function_loginusuario_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada en la tabla login';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_loginusuario_insert
AFTER INSERT ON public.loginusuario
FOR EACH ROW EXECUTE FUNCTION trigger_function_loginusuario_insert();

INSERT INTO public.loginusuario (login_id, nombre_o_semilla, contrasena, usuario_id) VALUES (1, 'Juan', '123456', 22);



CREATE OR REPLACE FUNCTION trigger_function_loginusuario_update()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada en la tabla login actualizada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER trigger_loginusuario_update
AFTER UPDATE ON public.loginusuario
FOR EACH ROW EXECUTE FUNCTION trigger_function_loginusuario_update();

INSERT INTO public.loginusuario (login_id, nombre_o_semilla, contrasena, usuario_id) VALUES (43, 'Joel-ABM', 'admin123456', 22);


CREATE OR REPLACE FUNCTION trigger_function_recuperacioncuenta_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada de registro -> recuperacioncuenta';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_recuperacioncuenta_insert
AFTER INSERT ON public.recuperacioncuenta
FOR EACH ROW EXECUTE FUNCTION trigger_function_recuperacioncuenta_insert();
INSERT INTO public.recuperacioncuenta (recuperacion_id, usuario_id, id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion) VALUES (19, 27, 'un-eibjio', 'token789', NOW(), NOW() + INTERVAL '1 day');



CREATE OR REPLACE FUNCTION trigger_function_recuperacioncuenta_update()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.token_recuperacion IS DISTINCT FROM OLD.token_recuperacion THEN
        RAISE NOTICE 'Token de recuperacion actualizado de % a %', OLD.token_recuperacion, NEW.token_recuperacion;
    END IF;
    IF NEW.fecha_expiracion IS DISTINCT FROM OLD.fecha_expiracion THEN
        RAISE NOTICE 'Fecha de expiracion actualizada de % a %', OLD.fecha_expiracion, NEW.fecha_expiracion;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_recuperacioncuenta_update
AFTER UPDATE ON public.recuperacioncuenta
FOR EACH ROW EXECUTE FUNCTION trigger_function_recuperacioncuenta_update();


-- actualización de recuperación de cuenta, simplemente actualice un registro 
-- Aquí hay un ejemplo de cómo hacerlo:
UPDATE public.recuperacioncuenta
SET token_recuperacion = 'nuevo_token', fecha_expiracion = NOW() + INTERVAL '2 days'
WHERE recuperacion_id = 19;



CREATE OR REPLACE FUNCTION trigger_function_registronewuser_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada en la tabla registronewuser con ID %', NEW.registro_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace TRIGGER trigger_registronewuser_insert
AFTER INSERT ON public.registronewuser
FOR EACH ROW EXECUTE FUNCTION trigger_function_registronewuser_insert();

-- aca el inject para que salte el trigger
INSERT INTO public.registronewuser (registro_id, nombre, apellido, email, telefono, contrasena,usuario_id) VALUES (17, 'Insider', 'MadMax', 'MadMax@Inkz.com', '1234567890', '123456', 22);





CREATE OR REPLACE FUNCTION trigger_function_reportes_usuario_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada en la tabla reportes_usuario con ID %', NEW.reporte_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_reportes_usuario_insert
AFTER INSERT ON public.reportes_usuario
FOR EACH ROW EXECUTE FUNCTION trigger_function_reportes_usuario_insert();

INSERT INTO public.reportes_usuario (reporte_id, usuario_id,contenido, fecha) VALUES (43, 15, 'Reporte analizado y enviada', NOW());

CREATE OR REPLACE FUNCTION trigger_function_reportes_usuario_update()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada en la tabla reportes_usuario actualizada con ID %', NEW.reporte_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_reportes_usuario_update
AFTER UPDATE ON public.reportes_usuario
FOR EACH ROW EXECUTE FUNCTION trigger_function_reportes_usuario_update();




CREATE OR REPLACE FUNCTION trigger_function_sesiones_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Nueva entrada en la tabla sesiones por el usuario con ID %', NEW.usuario_id;
    PERFORM pg_notify('sesiones_insert', 'Usuario con ID ' || NEW.usuario_id || ' ha iniciado una nueva sesión.');
    EXECUTE 'SELECT * FROM public.usuarios WHERE usuario_id = ' || NEW.usuario_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_sesiones_insert
AFTER INSERT ON public.sesiones
FOR EACH ROW EXECUTE FUNCTION trigger_function_sesiones_insert();


INSERT INTO public.sesiones (sesion_id, usuario_id, token_sesion,fecha_inicio, fecha_expiracion) VALUES (13, 18,'sk-aksde8', NOW(), NOW() + INTERVAL '1 hour');


CREATE OR REPLACE FUNCTION trigger_function_sesiones_update()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada registrada -> sesiones actualizada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_sesiones_update
AFTER UPDATE ON public.sesiones
FOR EACH ROW EXECUTE FUNCTION trigger_function_sesiones_update();

INSERT INTO public.sesiones (sesion_id, usuario_id, token_sesion, fecha_inicio, fecha_expiracion) VALUES (14, 19, 'sk-aksde9', NOW(), NOW() + INTERVAL '1 hour');
UPDATE public.sesiones SET token_sesion = 'sk-updated' WHERE sesion_id = 14;




-- Packages

CREATE SCHEMA IF NOT EXISTS historialbusquedas;
CREATE OR REPLACE FUNCTION historialbusquedas.insertar_historialbusqueda(historial_id INT, usuario_id INT, texto_busqueda varchar, fecha DATE)
RETURNS VOID AS $$
BEGIN
    INSERT INTO public.historialbusquedas (historial_id, usuario_id, texto_busqueda, fecha) VALUES (historial_id, usuario_id, texto_busqueda, fecha);
    RAISE NOTICE 'Historial de busqueda  -> injectado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION historialbusquedas.actualizar_historialbusqueda(id INT, p_busqueda TEXT)
RETURNS VOID AS $$
BEGIN
    UPDATE public.historialbusquedas SET texto_busqueda = p_busqueda WHERE historial_id = id;
    RAISE NOTICE 'Historial de busqueda -> actualizado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION historialbusquedas.eliminar_historialbusqueda(id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.historialbusquedas WHERE historial_id = id) THEN
        DELETE FROM public.historialbusquedas WHERE historial_id = id;
        RAISE NOTICE 'Historial de busqueda con ID %  -> eliminado.', id;
    ELSE
        RAISE NOTICE 'Historial de busqueda con ID %  -> no existe.', id;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION historialbusquedas.obtener_historialbusqueda(id INT)
RETURNS VOID AS $$
DECLARE
    v_historial RECORD;
BEGIN
    SELECT * INTO v_historial FROM public.historialbusquedas WHERE historial_id = id;
    RAISE NOTICE 'Historial de busqueda: %', v_historial;
END;
$$ LANGUAGE plpgsql;

-- Execute schema functions
select historialbusquedas.insertar_historialbusqueda(42, 12, 'Nuevo emprendimiento de la realidad aumentada', NOW());

select historialbusquedas.actualizar_historialbusqueda(10,'Experimentaciones en el cambio de visualizacion');
select historialbusquedas.eliminar_historialbusqueda(10);
select historialbusquedas.obtener_historialbusqueda(8);

CREATE SCHEMA IF NOT EXISTS loginusuario;

CREATE OR REPLACE FUNCTION loginusuario.insertar_loginusuario(plogin_id int ,p_nombre_o_semilla varchar ,p_contrasena varchar, p_usuario_id INT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO public.loginusuario (login_id, nombre_o_semilla , contrasena ,usuario_id) VALUES (plogin_id, p_nombre_o_semilla , p_contrasena,p_usuario_id);
    RAISE NOTICE 'Login de usuario insertado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION loginusuario.actualizar_loginusuario(id INT, v_nombre varchar)
RETURNS VOID AS $$
BEGIN
    UPDATE public.loginusuario SET nombre_o_semilla = v_nombre WHERE login_id = id;
    RAISE NOTICE 'Login de usuario actualizado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION loginusuario.eliminar_loginusuario(id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.loginusuario WHERE login_id = id) THEN
        DELETE FROM public.loginusuario WHERE login_id = id;
        RAISE NOTICE 'Login de usuario con ID % eliminado.', id;
    ELSE
        RAISE NOTICE 'Login de usuario con ID % no existe.', id;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION loginusuario.obtener_loginusuario(id INT)
RETURNS VOID AS $$
DECLARE
    v_login RECORD;
BEGIN
    SELECT * INTO v_login FROM public.loginusuario WHERE login_id = id;
    RAISE NOTICE 'Login de usuario: %', v_login;
END;
$$ LANGUAGE plpgsql;

-- Execute schema functions

select loginusuario.insertar_loginusuario(52, 'usuario1', 'contrasena1', 20);
select loginusuario.actualizar_loginusuario(50, 'usuario2');
select loginusuario.eliminar_loginusuario(52);
select loginusuario.obtener_loginusuario(43);


CREATE SCHEMA IF NOT EXISTS recuperacioncuenta;

CREATE OR REPLACE FUNCTION recuperacioncuenta.insertar_recuperacioncuenta(usuario_id INT, token VARCHAR)
RETURNS VOID AS $$
BEGIN
    INSERT INTO public.recuperacioncuenta (usuario_id, token) VALUES (usuario_id, token);
    RAISE NOTICE 'Recuperacion de cuenta insertada';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION recuperacioncuenta.actualizar_recuperacioncuenta(id INT, p_token VARCHAR)
RETURNS VOID AS $$
BEGIN
    UPDATE public.recuperacioncuenta SET token = p_token WHERE recuperacion_id = id;
    RAISE NOTICE 'Recuperacion de cuenta actualizada';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION recuperacioncuenta.eliminar_recuperacioncuenta(id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.recuperacioncuenta WHERE recuperacion_id = id) THEN
        DELETE FROM public.recuperacioncuenta WHERE recuperacion_id = id;
        RAISE NOTICE 'Recuperacion de cuenta con ID % eliminada.', id;
    ELSE
        RAISE NOTICE 'Recuperacion de cuenta con ID % no existe.', id;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION recuperacioncuenta.obtener_recuperacioncuenta(id INT)
RETURNS VOID AS $$
DECLARE
    v_recuperacion RECORD;
BEGIN
    SELECT * INTO v_recuperacion FROM public.recuperacioncuenta WHERE recuperacion_id = id;
    RAISE NOTICE 'Recuperacion de cuenta: %', v_recuperacion;
END;
$$ LANGUAGE plpgsql;

-- Execute schema functions




CREATE SCHEMA IF NOT EXISTS recuperacioncuenta;
CREATE OR REPLACE FUNCTION recuperacioncuenta.eliminar_recuperacioncuenta(id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.recuperacioncuenta WHERE recuperacion_id = id) THEN
        DELETE FROM public.recuperacioncuenta WHERE recuperacion_id = id;
        RAISE NOTICE 'Recuperacion de cuenta con ID % eliminada.', id;
    ELSE
        RAISE NOTICE 'Recuperacion de cuenta con ID % no existe.', id;
    END IF;
END;
$$ LANGUAGE plpgsql;



CREATE OR REPLACE FUNCTION recuperacioncuenta.obtener_recuperacioncuenta(id INT)
RETURNS VOID AS $$
DECLARE
    v_recuperacion RECORD;
BEGIN
    SELECT * INTO v_recuperacion FROM public.recuperacioncuenta WHERE recuperacion_id = id;
    RAISE NOTICE 'Recuperacion de cuenta: %', v_recuperacion;
END;
$$ LANGUAGE plpgsql;

select recuperacioncuenta.obtener_recuperacioncuenta(11);
select recuperacioncuenta.eliminar_recuperacioncuenta(11);

CREATE SCHEMA IF NOT EXISTS registronewuser;

CREATE OR REPLACE FUNCTION registronewuser.insertar_registronewuser(usuario_id INT, fecha TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    INSERT INTO public.registronewuser (usuario_id, fecha) VALUES (usuario_id, fecha);
    RAISE NOTICE 'Registro de nuevo usuario insertado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION registronewuser.actualizar_registronewuser(id INT, p_fecha TIMESTAMP)
RETURNS VOID AS $$
BEGIN
    UPDATE public.registronewuser SET fecha = p_fecha WHERE registro_id = id;
    RAISE NOTICE 'Registro de nuevo usuario actualizado';
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION registronewuser.eliminar_registronewuser(id INT)
RETURNS VOID AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.registronewuser WHERE registro_id = id) THEN
        DELETE FROM public.registronewuser WHERE registro_id = id;
        RAISE NOTICE 'Registro de nuevo usuario con ID % eliminado.', id;
    ELSE
        RAISE NOTICE 'Registro de nuevo usuario con ID % no existe.', id;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION registronewuser.obtener_registronewuser(id INT)
RETURNS VOID AS $$
DECLARE
    v_registro RECORD;
BEGIN
    SELECT * INTO v_registro FROM public.registronewuser WHERE registro_id = id;
    RAISE NOTICE 'Registro de nuevo usuario: %', v_registro;
END;
$$ LANGUAGE plpgsql;

-- Execute schema functions
CALL registronewuser.insertar_registronewuser();
CALL registronewuser.actualizar_registronewuser(1, NOW());
CALL registronewuser.eliminar_registronewuser(2);
CALL registronewuser.obtener_registronewuser(1);






CREATE SCHEMA IF NOT EXISTS registronewuser;
CREATE OR REPLACE FUNCTION registronewuser.obtener_registronewuser(id INT)
RETURNS VOID AS $$
DECLARE
    v_registro RECORD;
BEGIN
    SELECT * INTO v_registro FROM public.registronewuser WHERE registro_id = id;
    RAISE NOTICE 'Registro de nuevo usuario: %', v_registro;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION registronewuser.insertar_registronewuser(v_registro_id int,vname varchar, v_ap varchar, v_email varchar, v_fono varchar, vcontrasena varchar, usuarioid INT)
RETURNS VOID AS $$
BEGIN
    INSERT INTO public.registronewuser (registro_id, nombre, apellido, email, telefono, contrasena , usuario_id) VALUES (v_registro_id, vname, v_ap, v_email, v_fono, vcontrasena,usuarioid);
    RAISE NOTICE 'Registro de nuevo usuario insertado';
END;
$$ LANGUAGE plpgsql;



select registronewuser.insertar_registronewuser(1, 'Juan', 'Perez', 'juan.perez@example.com', '123456789', 'password123', 1);
select registronewuser.obtener_registronewuser(6);


###############################################################################################
###############################################################################################
###############################################################################################
###############################################################################################



-- Procedimientos para la tabla articulosreferencia
CREATE OR REPLACE PROCEDURE insertar_articulo(titulo VARCHAR, contenido TEXT, autor VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.articulosreferencia (titulo, contenido, autor) VALUES (titulo, contenido, autor);
END;
$$;
CALL insertar_articulo('Callisto', 'de la luna a una vista mas alla de la imaginacion', 'Gargamel');

CREATE OR REPLACE PROCEDURE actualizar_articulo(id INT, p_titulo VARCHAR, p_contenido TEXT, p_autor VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.articulosreferencia SET titulo = p_titulo, contenido = p_contenido, autor = p_autor WHERE articulo_id = id;
    RAISE NOTICE 'Articulo actualizado';
END;
$$;

CALL actualizar_articulo(1, 'Innovaciones en Terapia Génica', 'Este artículo explora los últimos avances en terapia génica y su impacto en el tratamiento de enfermedades hereditarias.', 'Gargamel');

CREATE OR REPLACE PROCEDURE eliminar_articulo(id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM public.articulosreferencia WHERE articulo_id = id) THEN
        DELETE FROM public.articulosreferencia WHERE articulo_id = id;
        RAISE NOTICE 'Articulo con ID % eliminado.', id;
    ELSE
        RAISE NOTICE 'Articulo con ID % no existe.', id;
    END IF;
END;
$$;
-- Para ejecutar el procedimiento eliminar_articulo, puedes usar la siguiente llamada:
-- CALL eliminar_articulo(id);

-- Ejemplo de uso:
-- CALL eliminar_articulo(1);


CREATE OR REPLACE PROCEDURE obtener_articulo(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_articulo RECORD;
BEGIN
    SELECT * INTO v_articulo FROM public.articulosreferencia WHERE articulo_id = id;
    RAISE NOTICE 'Articulo: %', v_articulo;
END;
$$;

CREATE OR REPLACE PROCEDURE listar_articulos()
LANGUAGE plpgsql
AS $$
DECLARE
    v_articulo RECORD;
BEGIN
    FOR v_articulo IN SELECT * FROM public.articulosreferencia LOOP
        RAISE NOTICE 'Articulo: %', v_articulo;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE contar_articulos()
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.articulosreferencia;
    RAISE NOTICE 'Total de articulos: %', v_count;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_autor_articulo(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_autor VARCHAR;
BEGIN
    SELECT autor INTO v_autor FROM public.articulosreferencia WHERE articulo_id = id;
    RAISE NOTICE 'Autor: %', v_autor;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_titulo_articulo(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_titulo VARCHAR;
BEGIN
    SELECT titulo INTO v_titulo FROM public.articulosreferencia WHERE articulo_id = id;
    RAISE NOTICE 'Titulo: %', v_titulo;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_contenido_articulo(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_contenido TEXT;
BEGIN
    SELECT contenido INTO v_contenido FROM public.articulosreferencia WHERE articulo_id = id;
    RAISE NOTICE 'Contenido: %', v_contenido;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_fecha_publicacion_articulo(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_fecha TIMESTAMP;
BEGIN
    SELECT fecha_publicacion INTO v_fecha FROM public.articulosreferencia WHERE articulo_id = id;
    RAISE NOTICE 'Fecha de publicacion: %', v_fecha;
END;
$$;

-- Funciones para la tabla articulosreferencia
CREATE OR REPLACE FUNCTION obtener_titulo_articulo_fn(id INT)
RETURNS VARCHAR
AS $$
DECLARE
    v_titulo VARCHAR;
BEGIN
    SELECT titulo INTO v_titulo FROM public.articulosreferencia WHERE articulo_id = id;
    RETURN v_titulo;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_contenido_articulo_fn(id INT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    v_contenido TEXT;
BEGIN
    SELECT contenido INTO v_contenido FROM public.articulosreferencia WHERE articulo_id = id;
    RETURN v_contenido;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_autor_articulo_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_autor VARCHAR;
BEGIN
    SELECT autor INTO v_autor FROM public.articulosreferencia WHERE articulo_id = id;
    RETURN v_autor;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_fecha_publicacion_articulo_fn(id INT)
RETURNS TIMESTAMP
LANGUAGE plpgsql
AS $$
DECLARE
    v_fecha TIMESTAMP;
BEGIN
    SELECT fecha_publicacion INTO v_fecha FROM public.articulosreferencia WHERE articulo_id = id;
    RETURN v_fecha;
END;
$$;

CREATE OR REPLACE FUNCTION contar_articulos_fn()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.articulosreferencia;
    RETURN v_count;
END;
$$;

CREATE OR REPLACE FUNCTION listar_articulos_fn()
RETURNS SETOF public.articulosreferencia
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.articulosreferencia;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_articulo_fn(id INT)
RETURNS public.articulosreferencia
LANGUAGE plpgsql
AS $$
DECLARE
    v_articulo public.articulosreferencia%ROWTYPE;
BEGIN
    SELECT * INTO v_articulo FROM public.articulosreferencia WHERE articulo_id = id;
    RETURN v_articulo;
END;
$$;

CREATE OR REPLACE FUNCTION insertar_articulo_fn(titulo VARCHAR, contenido TEXT, autor VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.articulosreferencia (titulo, contenido, autor) VALUES (titulo, contenido, autor);
END;
$$;



CREATE OR REPLACE FUNCTION listar_articulos()
RETURNS TABLE (articulo public.articulosreferencia%ROWTYPE)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.articulosreferencia;
END;
$$;













CREATE OR REPLACE FUNCTION actualizar_articulo_fn(id INT, titulo VARCHAR, contenido TEXT, autor VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.articulosreferencia SET titulo = titulo, contenido = contenido, autor = autor WHERE articulo_id = id;
END;
$$;

CREATE OR REPLACE FUNCTION eliminar_articulo_fn(id INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.articulosreferencia WHERE articulo_id = id;
END;
$$;

-- Procedimientos para la tabla cfgseedusuario
CREATE OR REPLACE PROCEDURE insertar_cfgseedusuario(motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.cfgseedusuario (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion) VALUES (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion);
END;
$$;

CREATE OR REPLACE PROCEDURE actualizar_cfgseedusuario(id INT, motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.cfgseedusuario SET motor_busqueda = motor_busqueda, nombreperfil = nombreperfil, imgperfil = imgperfil, notificaciones = notificaciones, tipodeseleccion = tipodeseleccion WHERE cfgseed_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.cfgseedusuario WHERE cfgseed_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_cfgseedusuario RECORD;
BEGIN
    SELECT * INTO v_cfgseedusuario FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RAISE NOTICE 'CfgseedUsuario: %', v_cfgseedusuario;
END;
$$;

CREATE OR REPLACE PROCEDURE listar_cfgseedusuarios()
LANGUAGE plpgsql
AS $$
DECLARE
    v_cfgseedusuario RECORD;
BEGIN
    FOR v_cfgseedusuario IN SELECT * FROM public.cfgseedusuario LOOP
        RAISE NOTICE 'CfgseedUsuario: %', v_cfgseedusuario;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE contar_cfgseedusuarios()
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.cfgseedusuario;
    RAISE NOTICE 'Total de cfgseedusuarios: %', v_count;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_motor_busqueda_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_motor_busqueda VARCHAR;
BEGIN
    SELECT motor_busqueda INTO v_motor_busqueda FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RAISE NOTICE 'Motor de busqueda: %', v_motor_busqueda;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_nombreperfil_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nombreperfil VARCHAR;
BEGIN
    SELECT nombreperfil INTO v_nombreperfil FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RAISE NOTICE 'Nombre de perfil: %', v_nombreperfil;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_imgperfil_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_imgperfil VARCHAR;
BEGIN
    SELECT imgperfil INTO v_imgperfil FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RAISE NOTICE 'Imagen de perfil: %', v_imgperfil;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_notificaciones_cfgseedusuario(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_notificaciones BOOLEAN;
BEGIN
    SELECT notificaciones INTO v_notificaciones FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RAISE NOTICE 'Notificaciones: %', v_notificaciones;
END;
$$;

-- Funciones para la tabla cfgseedusuario
CREATE OR REPLACE FUNCTION obtener_motor_busqueda_cfgseedusuario_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_motor_busqueda VARCHAR;
BEGIN
    SELECT motor_busqueda INTO v_motor_busqueda FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RETURN v_motor_busqueda;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_nombreperfil_cfgseedusuario_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_nombreperfil VARCHAR;
BEGIN
    SELECT nombreperfil INTO v_nombreperfil FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RETURN v_nombreperfil;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_imgperfil_cfgseedusuario_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_imgperfil VARCHAR;
BEGIN
    SELECT imgperfil INTO v_imgperfil FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RETURN v_imgperfil;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_notificaciones_cfgseedusuario_fn(id INT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    v_notificaciones BOOLEAN;
BEGIN
    SELECT notificaciones INTO v_notificaciones FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RETURN v_notificaciones;
END;
$$;

CREATE OR REPLACE FUNCTION contar_cfgseedusuarios_fn()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.cfgseedusuario;
    RETURN v_count;
END;
$$;

CREATE OR REPLACE FUNCTION listar_cfgseedusuarios_fn()
RETURNS SETOF public.cfgseedusuario
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.cfgseedusuario;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_cfgseedusuario_fn(id INT)
RETURNS public.cfgseedusuario
LANGUAGE plpgsql
AS $$
DECLARE
    v_cfgseedusuario public.cfgseedusuario%ROWTYPE;
BEGIN
    SELECT * INTO v_cfgseedusuario FROM public.cfgseedusuario WHERE cfgseed_id = id;
    RETURN v_cfgseedusuario;
END;
$$;

CREATE OR REPLACE FUNCTION insertar_cfgseedusuario_fn(motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.cfgseedusuario (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion) VALUES (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion);
END;
$$;

CREATE OR REPLACE FUNCTION actualizar_cfgseedusuario_fn(id INT, motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.cfgseedusuario SET motor_busqueda = motor_busqueda, nombreperfil = nombreperfil, imgperfil = imgperfil, notificaciones = notificaciones, tipodeseleccion = tipodeseleccion WHERE cfgseed_id = id;
END;
$$;

CREATE OR REPLACE FUNCTION eliminar_cfgseedusuario_fn(id INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.cfgseedusuario WHERE cfgseed_id = id;
END;
$$;

-- Procedimientos para la tabla configuraciones
CREATE OR REPLACE PROCEDURE insertar_configuracion(usuario_id INT, motor_busqueda VARCHAR, idioma_preferido VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.configuraciones (usuario_id, motor_busqueda, idioma_preferido, nombreperfil, imgperfil, notificaciones, tipodeseleccion) VALUES (usuario_id, motor_busqueda, idioma_preferido, nombreperfil, imgperfil, notificaciones, tipodeseleccion);
END;
$$;

CREATE OR REPLACE PROCEDURE actualizar_configuracion(id INT, usuario_id INT, motor_busqueda VARCHAR, idioma_preferido VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.configuraciones SET usuario_id = usuario_id, motor_busqueda = motor_busqueda, idioma_preferido = idioma_preferido, nombreperfil = nombreperfil, imgperfil = imgperfil, notificaciones = notificaciones, tipodeseleccion = tipodeseleccion WHERE configuracion_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_configuracion(id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.configuraciones WHERE configuracion_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_configuracion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_configuracion RECORD;
BEGIN
    SELECT * INTO v_configuracion FROM public.configuraciones WHERE configuracion_id = id;
    RAISE NOTICE 'Configuracion: %', v_configuracion;
END;
$$;

CREATE OR REPLACE PROCEDURE listar_configuraciones()
LANGUAGE plpgsql
AS $$
DECLARE
    v_configuracion RECORD;
BEGIN
    FOR v_configuracion IN SELECT * FROM public.configuraciones LOOP
        RAISE NOTICE 'Configuracion: %', v_configuracion;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE contar_configuraciones()
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.configuraciones;
    RAISE NOTICE 'Total de configuraciones: %', v_count;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_motor_busqueda_configuracion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_motor_busqueda VARCHAR;
BEGIN
    SELECT motor_busqueda INTO v_motor_busqueda FROM public.configuraciones WHERE configuracion_id = id;
    RAISE NOTICE 'Motor de busqueda: %', v_motor_busqueda;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_idioma_preferido_configuracion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_idioma_preferido VARCHAR;
BEGIN
    SELECT idioma_preferido INTO v_idioma_preferido FROM public.configuraciones WHERE configuracion_id = id;
    RAISE NOTICE 'Idioma preferido: %', v_idioma_preferido;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_nombreperfil_configuracion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_nombreperfil VARCHAR;
BEGIN
    SELECT nombreperfil INTO v_nombreperfil FROM public.configuraciones WHERE configuracion_id = id;
    RAISE NOTICE 'Nombre de perfil: %', v_nombreperfil;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_imgperfil_configuracion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_imgperfil VARCHAR;
BEGIN
    SELECT imgperfil INTO v_imgperfil FROM public.configuraciones WHERE configuracion_id = id;
    RAISE NOTICE 'Imagen de perfil: %', v_imgperfil;
END;
$$;

-- Funciones para la tabla configuraciones
CREATE OR REPLACE FUNCTION obtener_motor_busqueda_configuracion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_motor_busqueda VARCHAR;
BEGIN
    SELECT motor_busqueda INTO v_motor_busqueda FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_motor_busqueda;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_idioma_preferido_configuracion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_idioma_preferido VARCHAR;
BEGIN
    SELECT idioma_preferido INTO v_idioma_preferido FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_idioma_preferido;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_nombreperfil_configuracion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_nombreperfil VARCHAR;
BEGIN
    SELECT nombreperfil INTO v_nombreperfil FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_nombreperfil;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_imgperfil_configuracion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_imgperfil VARCHAR;
BEGIN
    SELECT imgperfil INTO v_imgperfil FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_imgperfil;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_notificaciones_configuracion_fn(id INT)
RETURNS BOOLEAN
LANGUAGE plpgsql
AS $$
DECLARE
    v_notificaciones BOOLEAN;
BEGIN
    SELECT notificaciones INTO v_notificaciones FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_notificaciones;
END;
$$;

CREATE OR REPLACE FUNCTION contar_configuraciones_fn()
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.configuraciones;
    RETURN v_count;
END;
$$;

CREATE OR REPLACE FUNCTION listar_configuraciones_fn()
RETURNS SETOF public.configuraciones
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT * FROM public.configuraciones;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_configuracion_fn(id INT)
RETURNS public.configuraciones
LANGUAGE plpgsql
AS $$
DECLARE
    v_configuracion public.configuraciones%ROWTYPE;
BEGIN
    SELECT * INTO v_configuracion FROM public.configuraciones WHERE configuracion_id = id;
    RETURN v_configuracion;
END;
$$;

CREATE OR REPLACE FUNCTION insertar_configuracion_fn(usuario_id INT, motor_busqueda VARCHAR, idioma_preferido VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.configuraciones (usuario_id, motor_busqueda, idioma_preferido, nombreperfil, imgperfil, notificaciones, tipodeseleccion) VALUES (usuario_id, motor_busqueda, idioma_preferido, nombreperfil, imgperfil, notificaciones, tipodeseleccion);
END;
$$;

CREATE OR REPLACE FUNCTION actualizar_configuracion_fn(id INT, usuario_id INT, motor_busqueda VARCHAR, idioma_preferido VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN, tipodeseleccion VARCHAR)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.configuraciones SET usuario_id = usuario_id, motor_busqueda = motor_busqueda, idioma_preferido = idioma_preferido, nombreperfil = nombreperfil, imgperfil = imgperfil, notificaciones = notificaciones, tipodeseleccion = tipodeseleccion WHERE configuracion_id = id;
END;
$$;

CREATE OR REPLACE FUNCTION eliminar_configuracion_fn(id INT)
RETURNS VOID
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.configuraciones WHERE configuracion_id = id;
END;
$$;

-- Procedimientos para la tabla direcciones
CREATE OR REPLACE PROCEDURE insertar_direccion(usuario_id INT, calle VARCHAR, ciudad VARCHAR, codigo_postal VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO public.direcciones (usuario_id, calle, ciudad, codigo_postal) VALUES (usuario_id, calle, ciudad, codigo_postal);
END;
$$;

CREATE OR REPLACE PROCEDURE actualizar_direccion(id INT, usuario_id INT, calle VARCHAR, ciudad VARCHAR, codigo_postal VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE public.direcciones SET usuario_id = usuario_id, calle = calle, ciudad = ciudad, codigo_postal = codigo_postal WHERE direccion_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE eliminar_direccion(id INT)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM public.direcciones WHERE direccion_id = id;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_direccion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_direccion RECORD;
BEGIN
    SELECT * INTO v_direccion FROM public.direcciones WHERE direccion_id = id;
    RAISE NOTICE 'Direccion: %', v_direccion;
END;
$$;

CREATE OR REPLACE PROCEDURE listar_direcciones()
LANGUAGE plpgsql
AS $$
DECLARE
    v_direccion RECORD;
BEGIN
    FOR v_direccion IN SELECT * FROM public.direcciones LOOP
        RAISE NOTICE 'Direccion: %', v_direccion;
    END LOOP;
END;
$$;

CREATE OR REPLACE PROCEDURE contar_direcciones()
LANGUAGE plpgsql
AS $$
DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count FROM public.direcciones;
    RAISE NOTICE 'Total de direcciones: %', v_count;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_calle_direccion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_calle VARCHAR;
BEGIN
    SELECT calle INTO v_calle FROM public.direcciones WHERE direccion_id = id;
    RAISE NOTICE 'Calle: %', v_calle;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_ciudad_direccion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_ciudad VARCHAR;
BEGIN
    SELECT ciudad INTO v_ciudad FROM public.direcciones WHERE direccion_id = id;
    RAISE NOTICE 'Ciudad: %', v_ciudad;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_codigo_postal_direccion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_codigo_postal VARCHAR;
BEGIN
    SELECT codigo_postal INTO v_codigo_postal FROM public.direcciones WHERE direccion_id = id;
    RAISE NOTICE 'Codigo Postal: %', v_codigo_postal;
END;
$$;

CREATE OR REPLACE PROCEDURE obtener_usuario_id_direccion(id INT)
LANGUAGE plpgsql
AS $$
DECLARE
    v_usuario_id INT;
BEGIN
    SELECT usuario_id INTO v_usuario_id FROM public.direcciones WHERE direccion_id = id;
    RAISE NOTICE 'Usuario ID: %', v_usuario_id;
END;
$$;

-- Funciones para la tabla direcciones
CREATE OR REPLACE FUNCTION obtener_calle_direccion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_calle VARCHAR;
BEGIN
    SELECT calle INTO v_calle FROM public.direcciones WHERE direccion_id = id;
    RETURN v_calle;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_ciudad_direccion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_ciudad VARCHAR;
BEGIN
    SELECT ciudad INTO v_ciudad FROM public.direcciones WHERE direccion_id = id;
    RETURN v_ciudad;
END;
$$;

CREATE OR REPLACE FUNCTION obtener_codigo_postal_direccion_fn(id INT)
RETURNS VARCHAR
LANGUAGE plpgsql
AS $$
DECLARE
    v_codigo_postal VARCHAR;
BEGIN
    SELECT codigo_postal INTO v_codigo_postal FROM public.direcciones WHERE direccion_id = id;
    RETURN v_codigo_postal;
END;
$$;
CREATE OR REPLACE FUNCTION obtener_usuario_id_direccion_fn(id INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
    v_usuario_id INT;
BEGIN
    SELECT usuario_id INTO v_usuario_id FROM public.direcciones WHERE direccion_id = id;
    RETURN v_usuario_id;
END;
$$;

call obtener_usuario_id_direccion_fn(13);
-- Funciones para la tabla usuarios
CREATE OR REPLACE FUNCTION obtener_detalles_usuario_fn(id INT)
RETURNS TABLE (email VARCHAR, nombre VARCHAR, telefono VARCHAR, direccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    IF id IS NULL THEN
        RAISE EXCEPTION 'El ID no puede ser nulo';
    END IF;

    RETURN QUERY
    SELECT email, nombre, telefono, direccion
    FROM public.usuarios
    WHERE usuario_id = id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Usuario con ID % no encontrado', id;
    END IF;
END;
$$;
CREATE OR REPLACE FUNCTION obtener_detalles_configuracion_fn(id INT)
RETURNS TABLE (motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    IF id IS NULL THEN
        RAISE EXCEPTION 'El ID no puede ser nulo';
    END IF;

    RETURN QUERY
    SELECT c.motor_busqueda, c.nombreperfil, c.imgperfil, c.notificaciones
    FROM public.configuraciones c
    WHERE c.configuracion_id = id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Configuración con ID % no encontrada', id;
    END IF;
END;
$$;

DO $$
DECLARE
    v_motor_busqueda VARCHAR;
    v_nombreperfil VARCHAR;
    v_imgperfil VARCHAR;
    v_notificaciones BOOLEAN;
BEGIN
    SELECT motor_busqueda, nombreperfil, imgperfil, notificaciones
    INTO v_motor_busqueda, v_nombreperfil, v_imgperfil, v_notificaciones
    FROM obtener_detalles_configuracion_fn(1);
    
    RAISE NOTICE 'Detalles de la configuración: Motor de búsqueda: %, Nombre de perfil: %, Imagen de perfil: %, Notificaciones: %', v_motor_busqueda, v_nombreperfil, v_imgperfil, v_notificaciones;
END;
$$;


DO $$
DECLARE
    v_email VARCHAR;
    v_nombre VARCHAR;
    v_telefono VARCHAR;
    v_direccion VARCHAR;
BEGIN
    PERFORM * FROM obtener_detalles_usuario_fn(1) INTO v_email, v_nombre, v_telefono, v_direccion;
    RAISE NOTICE 'Detalles del usuario: Email: %, Nombre: %, Teléfono: %, Dirección: %', v_email, v_nombre, v_telefono, v_direccion;
END;
$$;


-- Procedimientos para la tabla usuarios
CREATE OR REPLACE PROCEDURE gestionar_usuario(opcion VARCHAR, id INT, email VARCHAR, nombre VARCHAR, telefono VARCHAR, direccion VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    IF opcion IS NULL THEN
        RAISE EXCEPTION 'La opción no puede ser nula';
    END IF;

    IF opcion = 'insertar' THEN
        IF email IS NULL OR nombre IS NULL OR telefono IS NULL OR direccion IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la inserción';
        END IF;
        INSERT INTO public.usuarios (email, nombre, telefono, direccion) VALUES (email, nombre, telefono, direccion);
        RAISE NOTICE 'Usuario insertado con éxito: %', email;

    ELSIF opcion = 'actualizar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la actualización';
        END IF;
        IF email IS NULL OR nombre IS NULL OR telefono IS NULL OR direccion IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la actualización';
        END IF;
        UPDATE public.usuarios SET email = email, nombre = nombre, telefono = telefono, direccion = direccion WHERE usuario_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Usuario con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Usuario actualizado con éxito: %', id;

    ELSIF opcion = 'eliminar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la eliminación';
        END IF;
        DELETE FROM public.usuarios WHERE usuario_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Usuario con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Usuario eliminado con éxito: %', id;

    ELSE
        RAISE EXCEPTION 'Opción no válida. Use "insertar", "actualizar" o "eliminar"';
    END IF;
END;
$$;

-- Funciones para la tabla configuraciones
CREATE OR REPLACE FUNCTION obtener_detalles_configuracion_fn(id INT)
RETURNS TABLE (motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    IF id IS NULL THEN
        RAISE EXCEPTION 'El ID no puede ser nulo';
    END IF;

    RETURN QUERY
    SELECT motor_busqueda, nombreperfil, imgperfil, notificaciones
    FROM public.configuraciones
    WHERE configuracion_id = id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Configuración con ID % no encontrada', id;
    END IF;
END;
$$;

-- Procedimientos para la tabla configuraciones
CREATE OR REPLACE PROCEDURE gestionar_configuracion(opcion VARCHAR, id INT, motor_busqueda VARCHAR, nombreperfil VARCHAR, imgperfil VARCHAR, notificaciones BOOLEAN)
LANGUAGE plpgsql
AS $$
BEGIN
    IF opcion IS NULL THEN
        RAISE EXCEPTION 'La opción no puede ser nula';
    END IF;

    IF opcion = 'insertar' THEN
        IF motor_busqueda IS NULL OR nombreperfil IS NULL OR imgperfil IS NULL OR notificaciones IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la inserción';
        END IF;
        INSERT INTO public.configuraciones (motor_busqueda, nombreperfil, imgperfil, notificaciones) VALUES (motor_busqueda, nombreperfil, imgperfil, notificaciones);
        RAISE NOTICE 'Configuración insertada con éxito: %', motor_busqueda;

    ELSIF opcion = 'actualizar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la actualización';
        END IF;
        IF motor_busqueda IS NULL OR nombreperfil IS NULL OR imgperfil IS NULL OR notificaciones IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la actualización';
        END IF;
        UPDATE public.configuraciones SET motor_busqueda = motor_busqueda, nombreperfil = nombreperfil, imgperfil = imgperfil, notificaciones = notificaciones WHERE configuracion_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Configuración con ID % no encontrada', id;
        END IF;
        RAISE NOTICE 'Configuración actualizada con éxito: %', id;

    ELSIF opcion = 'eliminar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la eliminación';
        END IF;
        DELETE FROM public.configuraciones WHERE configuracion_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Configuración con ID % no encontrada', id;
        END IF;
        RAISE NOTICE 'Configuración eliminada con éxito: %', id;

    ELSE
        RAISE EXCEPTION 'Opción no válida. Use "insertar", "actualizar" o "eliminar"';
    END IF;
END;
$$;


call gestionar_configuracion('insertar', 1, 'Google', 'Perfil1', 'img1.png', true);


-- Procedimientos para la tabla login
CREATE OR REPLACE PROCEDURE gestionar_login(opcion VARCHAR, id INT, usuario_id INT, fecha TIMESTAMP, token VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    IF opcion IS NULL THEN
        RAISE EXCEPTION 'La opción no puede ser nula';
    END IF;

    IF opcion = 'insertar' THEN
        IF usuario_id IS NULL OR fecha IS NULL OR token IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la inserción';
        END IF;
        INSERT INTO public.login (usuario_id, fecha, token) VALUES (usuario_id, fecha, token);
        RAISE NOTICE 'Login insertado con éxito: %', token;

    ELSIF opcion = 'actualizar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la actualización';
        END IF;
        IF usuario_id IS NULL OR fecha IS NULL OR token IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la actualización';
        END IF;
        UPDATE public.login SET usuario_id = usuario_id, fecha = fecha, token = token WHERE login_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Login con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Login actualizado con éxito: %', id;

    ELSIF opcion = 'eliminar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la eliminación';
        END IF;
        DELETE FROM public.login WHERE login_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Login con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Login eliminado con éxito: %', id;

    ELSE
        RAISE EXCEPTION 'Opción no válida. Use "insertar", "actualizar" o "eliminar"';
    END IF;
END;
$$;

call gestionar_login('insertar', NULL, 1, NOW(), 'token123');

-- Procedimientos para la tabla usuaroseed
CREATE OR REPLACE PROCEDURE gestionar_usuaroseed(opcion VARCHAR, id INT, nombre VARCHAR, email VARCHAR, fecha_registro TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    IF opcion IS NULL THEN
        RAISE EXCEPTION 'La opción no puede ser nula';
    END IF;

    IF opcion = 'insertar' THEN
        IF nombre IS NULL OR email IS NULL OR fecha_registro IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la inserción';
        END IF;
        INSERT INTO public.usuaroseed (nombre, email, fecha_registro) VALUES (nombre, email, fecha_registro);
        RAISE NOTICE 'UsuarioSeed insertado con éxito: %', email;

    ELSIF opcion = 'actualizar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la actualización';
        END IF;
        IF nombre IS NULL OR email IS NULL OR fecha_registro IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la actualización';
        END IF;
        UPDATE public.usuaroseed SET nombre = nombre, email = email, fecha_registro = fecha_registro WHERE usuaroseed_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'UsuarioSeed con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'UsuarioSeed actualizado con éxito: %', id;

    ELSIF opcion = 'eliminar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la eliminación';
        END IF;
        DELETE FROM public.usuaroseed WHERE usuaroseed_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'UsuarioSeed con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'UsuarioSeed eliminado con éxito: %', id;

    ELSE
        RAISE EXCEPTION 'Opción no válida. Use "insertar", "actualizar" o "eliminar"';
    END IF;
END;
$$;

-- Procedimientos para la tabla reportes
CREATE OR REPLACE PROCEDURE gestionar_reporte(opcion VARCHAR, id INT, titulo VARCHAR, contenido TEXT, fecha TIMESTAMP)
LANGUAGE plpgsql
AS $$
BEGIN
    IF opcion IS NULL THEN
        RAISE EXCEPTION 'La opción no puede ser nula';
    END IF;

    IF opcion = 'insertar' THEN
        IF titulo IS NULL OR contenido IS NULL OR fecha IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la inserción';
        END IF;
        INSERT INTO public.reportes (titulo, contenido, fecha) VALUES (titulo, contenido, fecha);
        RAISE NOTICE 'Reporte insertado con éxito: %', titulo;

    ELSIF opcion = 'actualizar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la actualización';
        END IF;
        IF titulo IS NULL OR contenido IS NULL OR fecha IS NULL THEN
            RAISE EXCEPTION 'Ningún campo puede ser nulo para la actualización';
        END IF;
        UPDATE public.reportes SET titulo = titulo, contenido = contenido, fecha = fecha WHERE reporte_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Reporte con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Reporte actualizado con éxito: %', id;

    ELSIF opcion = 'eliminar' THEN
        IF id IS NULL THEN
            RAISE EXCEPTION 'El ID no puede ser nulo para la eliminación';
        END IF;
        DELETE FROM public.reportes WHERE reporte_id = id;
        IF NOT FOUND THEN
            RAISE EXCEPTION 'Reporte con ID % no encontrado', id;
        END IF;
        RAISE NOTICE 'Reporte eliminado con éxito: %', id;

    ELSE
        RAISE EXCEPTION 'Opción no válida. Use "insertar", "actualizar" o "eliminar"';
    END IF;
END;
$$;


