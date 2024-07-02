/*
	Autor: Brayan Ronaldo
	Materia : Base de Datos II
	Det : Consultas base de Datos 'Ciem Medic Jad' --> se tiene vistas , consultas, cursores   
	aplicado al desarrollo del proyecto
*/




-- Vista UserConfiguraciones
CREATE VIEW UserConfiguraciones AS
SELECT u.usuario_id, u.nombre, u.apellido, c.motor_busqueda, c.idioma_preferido
FROM usuarios u, configuraciones c
WHERE u.usuario_id = c.usuario_id;


-- Vista ArticulosAutores

CREATE OR REPLACE VIEW ArtiAutores AS
SELECT Distinct a.articulo_id, a.titulo, a.contenido, u.nombre AS autor
FROM articulosreferencia a, usuarios u
WHERE a.autor LIKE 'Dra%';


CREATE VIEW HistorialUsr AS
SELECT u.nombre, u.apellido, h.texto_busqueda, h.fecha
FROM usuarios u
JOIN historialbusquedas h ON u.usuario_id = h.usuario_id;



CREATE VIEW RepUsuarios AS
SELECT r.reporte_id, u.nombre, u.apellido, r.contenido, r.fecha
FROM reportes_usuario r 
JOIN usuarios u ON r.usuario_id = u.usuario_id;

CREATE VIEW DirUsuarios AS
SELECT u.nombre, u.apellido, d.calle, d.ciudad, d.codigo_postal
FROM usuarios u
JOIN direcciones d ON u.usuario_id = d.usuario_id;


CREATE VIEW NomeFav as
SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT f.usuario_id
    FROM favoritos f
    GROUP BY f.usuario_id
    HAVING COUNT(f.articulo_id) < 10
);


create view ArticUsr as
SELECT a.titulo
FROM articulosreferencia a
WHERE a.articulo_id IN (
    SELECT f.articulo_id
    FROM favoritos f
    GROUP BY f.articulo_id
    HAVING COUNT(f.usuario_id) > 1
);

create or replace view  HistBusquedas as
SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT h.usuario_id
    FROM historialbusquedas h
    WHERE h.fecha < NOW() + INTERVAL '10'
);


create or replace view DeptoLoc as
SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT d.usuario_id
    FROM direcciones d
    WHERE d.ciudad = 'La Paz'
);

CREATE OR REPLACE VIEW FavID as 
SELECT u.nombre, u.apellido, a.titulo
FROM usuarios u
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;



-- Subconsultas 
-- 1 

SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT f.usuario_id
    FROM favoritos f
    GROUP BY f.usuario_id
    HAVING COUNT(f.articulo_id) < 10
);
-- 2

SELECT a.titulo
FROM articulosreferencia a
WHERE a.articulo_id IN (
    SELECT f.articulo_id
    FROM favoritos f
    GROUP BY f.articulo_id
    HAVING COUNT(f.usuario_id) > 1
);

-- 3

SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT h.usuario_id
    FROM historialbusquedas h
    WHERE h.fecha < NOW() - INTERVAL '10'
);

-- 4
SELECT c.motor_busqueda, COUNT(c.motor_busqueda) AS cantidad
FROM configuraciones c
GROUP BY c.motor_busqueda
ORDER BY cantidad DESC;


--5
SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT d.usuario_id
    FROM direcciones d
    WHERE d.ciudad = 'La Paz'
);
--6

SELECT u.nombre, u.apellido, a.titulo
FROM usuarios u
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;

--7
SELECT * 
FROM HistorialBusquedas 
WHERE usuario_id = ( SELECT usuario_id 
					 FROM Usuarios 
					 WHERE nombre = 'Laura');
--8

SELECT usuario_id, id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion
FROM RecuperacionCuenta
WHERE usuario_id = (SELECT usuario_id 
					FROM Usuarios 
					WHERE nombre = 'Diego');



INSERT INTO Sesiones (usuario_id, token_sesion, fecha_inicio, fecha_expiracion)
VALUES ( '10',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoxLCJpYXQiOjE2MjMxMzU4MzksImV4cCI6MTYyMzEzNjQzOX0.9UEGmC0S2eJxw3_GtKGu46FFo_tgx-PlVS8YIezlNlA', -- Token de sesión generado
    '2024-06-05 15:00:00', 
    '2024-06-05 16:00:00' 
);

ALTER TABLE Sesiones
ALTER COLUMN token_sesion TYPE VARCHAR(250);
--9
SELECT sesion_id, usuario_id, token_sesion
FROM Sesiones
WHERE usuario_id = ( SELECT usuario_id
					 FROM Usuarios 
					 WHERE nombre = 'Carlos');


SELECT Distinct u.usuario_id, u.nombre, u.apellido, u.email, u.telefono, u.semilla, u.contrasena, u.id_unico,
       (SELECT c.configuracion_id FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS configuracion_id,
       (SELECT c.motor_busqueda FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS motor_busqueda,
       (SELECT c.otras_preferencias FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS otras_preferencias
FROM Usuarios u;


-- Cursores :::: 

-- 1 Consulta de UsuarioArticuloTitulo
create or replace  function UsuariosDsip(
	OUT v_nombre VARCHAR(50),
	OUT v_apellido VARCHAR(50),
	OUT v_titulo VARCHAR(200)
)

RETURNS SETOF RECORD AS

$$

DECLARE
    cur_favoritos CURSOR FOR
		SELECT u.nombre, u.apellido, a.titulo
		FROM usuarios u
		JOIN favoritos f ON u.usuario_id = f.usuario_id
		JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;
		
	articulos_record RECORD;
	
BEGIN
    OPEN cur_favoritos;
    LOOP
        FETCH cur_favoritos INTO articulos_record;
        EXIT WHEN NOT FOUND;
		
		v_nombre = articulos_record.nombre;
		v_apellido = articulos_record.apellido;
		v_titulo  = articulos_record.titulo;
        RAISE NOTICE 'Usuario: % %, Articulo: %', v_nombre, v_apellido, v_titulo;
		
		RETURN NEXT;
    END LOOP;
    CLOSE cur_favoritos;
END;

$$

LANGUAGE PLPGSQL;
SELECT * FROM UsuariosDsip();


-- 2 
CREATE OR REPLACE FUNCTION usuarios_Favoritos()
RETURNS TABLE (nombre VARCHAR(50), apellido VARCHAR(50)) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT u.nombre, u.apellido
        FROM usuarios u
        WHERE u.usuario_id IN (
            SELECT f.usuario_id
            FROM favoritos f
            GROUP BY f.usuario_id
            HAVING COUNT(f.articulo_id) < 10
        );
    user_record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO user_record;
        EXIT WHEN NOT FOUND;
        nombre := user_record.nombre;
        apellido := user_record.apellido;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

-- 3 
CREATE OR REPLACE FUNCTION BusquedasPasadas()
RETURNS TABLE (nombre VARCHAR(50), apellido VARCHAR(50)) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT u.nombre, u.apellido
        FROM usuarios u
        WHERE u.usuario_id IN (
            SELECT h.usuario_id
            FROM historialbusquedas h
            WHERE h.fecha < NOW() - INTERVAL '10' DAY
        );
    user_record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO user_record;
        EXIT WHEN NOT FOUND;
        nombre := user_record.nombre;
        apellido := user_record.apellido;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

--4 
CREATE OR REPLACE FUNCTION CuentasBusqueDatos()
RETURNS TABLE (motor_busqueda VARCHAR(50), cantidad INT) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT c.motor_busqueda, COUNT(c.motor_busqueda) AS cantidad
        FROM configuraciones c
        GROUP BY c.motor_busqueda
        ORDER BY cantidad DESC;
    config_record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO config_record;
        EXIT WHEN NOT FOUND;
        motor_busqueda := config_record.motor_busqueda;
        cantidad := config_record.cantidad;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

--5
CREATE OR REPLACE FUNCTION UsuarioCiudad()
RETURNS TABLE (nombre VARCHAR(50), apellido VARCHAR(50)) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT u.nombre, u.apellido
        FROM usuarios u
        WHERE u.usuario_id IN (
            SELECT d.usuario_id
            FROM direcciones d
            WHERE d.ciudad = 'La Paz'
        );
    user_record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO user_record;
        EXIT WHEN NOT FOUND;
        nombre := user_record.nombre;
        apellido := user_record.apellido;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

--6 
CREATE OR REPLACE FUNCTION Favoritos()
RETURNS TABLE (nombre VARCHAR(50), apellido VARCHAR(50), titulo VARCHAR(200)) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT u.nombre, u.apellido, a.titulo
        FROM usuarios u
        JOIN favoritos f ON u.usuario_id = f.usuario_id
        JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;
    record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO record;
        EXIT WHEN NOT FOUND;
        nombre := record.nombre;
        apellido := record.apellido;
        titulo := record.titulo;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;


--7
CREATE OR REPLACE FUNCTION historialUsuario()
RETURNS TABLE (historial_id INT, usuario_id INT, texto_busqueda VARCHAR(200), fecha TIMESTAMP) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT *
        FROM HistorialBusquedas 
        WHERE usuario_id = (SELECT usuario_id FROM Usuarios WHERE nombre = 'Laura');
    record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO record;
        EXIT WHEN NOT FOUND;
        historial_id := record.historial_id;
        usuario_id := record.usuario_id;
        texto_busqueda := record.texto_busqueda;
        fecha := record.fecha;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;


--8
CREATE OR REPLACE FUNCTION recuperarCuenta()
RETURNS TABLE (usuario_id INT, id_unico VARCHAR(20), token_recuperacion VARCHAR(100), fecha_solicitud TIMESTAMP, fecha_expiracion TIMESTAMP) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT usuario_id, id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion
        FROM RecuperacionCuenta
        WHERE usuario_id = (SELECT usuario_id FROM Usuarios WHERE nombre = 'Diego');
    record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO record;
        EXIT WHEN NOT FOUND;
        usuario_id := record.usuario_id;
        id_unico := record.id_unico;
        token_recuperacion := record.token_recuperacion;
        fecha_solicitud := record.fecha_solicitud;
        fecha_expiracion := record.fecha_expiracion;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;

--9
CREATE OR REPLACE FUNCTION SessionesUsuario()
RETURNS TABLE (sesion_id INT, usuario_id INT, token_sesion VARCHAR(250)) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT sesion_id, usuario_id, token_sesion
        FROM Sesiones
        WHERE usuario_id = (SELECT usuario_id FROM Usuarios WHERE nombre = 'Carlos');
    record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO record;
        EXIT WHEN NOT FOUND;
        sesion_id := record.sesion_id;
        usuario_id := record.usuario_id;
        token_sesion := record.token_sesion;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;


--10
CREATE OR REPLACE FUNCTION ConfiguracionesUsr()
RETURNS TABLE (
    usuario_id INT, 
    nombre VARCHAR(50), 
    apellido VARCHAR(50), 
    email VARCHAR(100), 
    telefono VARCHAR(15), 
    semilla VARCHAR(20), 
    contrasena VARCHAR(100), 
    id_unico VARCHAR(20), 
    configuracion_id INT, 
    motor_busqueda VARCHAR(50), 
    otras_preferencias TEXT
) AS
$$
DECLARE
    cur CURSOR FOR
        SELECT DISTINCT 
               u.usuario_id, 
               u.nombre, 
               u.apellido, 
               u.email, 
               u.telefono, 
               u.semilla, 
               u.contrasena, 
               u.id_unico,
               (SELECT c.configuracion_id FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS configuracion_id,
               (SELECT c.motor_busqueda FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS motor_busqueda,
               (SELECT c.otras_preferencias FROM Configuraciones c WHERE c.usuario_id = u.usuario_id) AS otras_preferencias
        FROM Usuarios u;
    record RECORD;
BEGIN
    OPEN cur;
    LOOP
        FETCH cur INTO record;
        EXIT WHEN NOT FOUND;
        usuario_id := record.usuario_id;
        nombre := record.nombre;
        apellido := record.apellido;
        email := record.email;
        telefono := record.telefono;
        semilla := record.semilla;
        contrasena := record.contrasena;
        id_unico := record.id_unico;
        configuracion_id := record.configuracion_id;
        motor_busqueda := record.motor_busqueda;
        otras_preferencias := record.otras_preferencias;
        RETURN NEXT;
    END LOOP;
    CLOSE cur;
END;
$$
LANGUAGE plpgsql;


SELECT * FROM usuarios_Favoritos();
SELECT * FROM BusquedasPasadas();
SELECT * FROM CuentasBusqueDatos();
SELECT * FROM UsuarioCiudad();
SELECT * FROM Favoritos();
SELECT * FROM historialUsuario();
SELECT * FROM recuperarCuenta();
SELECT * FROM SessionesUsuario();
SELECT * FROM ConfiguracionesUsr();

