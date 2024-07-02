-- Acceso a gestionar privilegios

CREATE OR REPLACE FUNCTION gestionar_privilegios(usuario_actual text) RETURNS void AS $$
BEGIN
    IF usuario_actual = 'postgres' THEN
        -- Conceder todos los privilegios
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
		RAISE NOTICE 'El usuario % tiene permisos para editar las tablas.', usuario_actual;
    ELSE
        -- Remover todos los privilegios de otros usuarios
        RAISE NOTICE 'El usuario % no tiene permisos para editar las tablas.', usuario_actual;
        REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM usuario_actual;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Llamar a la función para gestionar privilegios
SELECT gestionar_privilegios(current_user);

END;


-- Acceso a gestionar privilegios

CREATE OR REPLACE FUNCTION gestionar_privilegios(usuario_actual text) RETURNS void AS $$
BEGIN
    IF usuario_actual = 'postgres' THEN
        -- Conceder todos los privilegios
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO postgres;
		RAISE NOTICE 'El usuario % tiene permisos para editar las tablas.', usuario_actual;
    ELSE
        -- Remover todos los privilegios de otros usuarios
        RAISE NOTICE 'El usuario % no tiene permisos para editar las tablas.', usuario_actual;
        REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM usuario_actual;
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Llamar a la función para gestionar privilegios
SELECT gestionar_privilegios(current_user);

END;
