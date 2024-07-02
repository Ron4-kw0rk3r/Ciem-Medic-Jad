CREATE OR REPLACE FUNCTION trigger_function_historialbusquedas_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada en la tabla historialbusquedas actualizada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_historialbusquedas_insert
AFTER INSERT ON public.historialbusquedas
FOR EACH ROW EXECUTE FUNCTION trigger_function_historialbusquedas_insert();


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
INSERT INTO public.historialbusquedas (historial_id, usuario_id, texto_busqueda, fecha) VALUES (41, 2, 'Investigacion sobre inteligencia artificial en medicina', NOW());




CREATE OR REPLACE FUNCTION trigger_function_loginusuario_insert()
RETURNS TRIGGER AS $$
BEGIN
    RAISE NOTICE 'Entrada en la tabla login actualizada';
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE or replace  TRIGGER trigger_loginusuario_insert
AFTER INSERT ON public.loginusuario
FOR EACH ROW EXECUTE FUNCTION trigger_function_loginusuario_insert();

INSERT INTO public.loginusuario (login_id, nombre_o_semilla, contrasena, usuario_id) VALUES (41, 'Juan', '123456', 22);




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


INSERT INTO public.recuperacioncuenta (recuperacion_id, usuario_id,id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion) VALUES (19, 27, 'token789');
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



select registronewuser.insertar_registronewuser();
select registronewuser.obtener_registronewuser(6);


