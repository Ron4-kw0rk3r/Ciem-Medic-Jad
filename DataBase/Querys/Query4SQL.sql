
CREATE VIEW RepUsuarios AS
SELECT r.reporte_id, u.nombre, u.apellido, r.contenido, r.fecha
FROM reportes_usuario r 
JOIN usuarios u ON r.usuario_id = u.usuario_id;

CREATE VIEW DirUsuarios AS
SELECT u.nombre, u.apellido, d.calle, d.ciudad, d.codigo_postal
FROM usuarios u
JOIN direcciones d ON u.usuario_id = d.usuario_id;


-- Subconsultas 
SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT f.usuario_id
    FROM favoritos f
    GROUP BY f.usuario_id
    HAVING COUNT(f.articulo_id) < 10
);


SELECT a.titulo
FROM articulosreferencia a
WHERE a.articulo_id IN (
    SELECT f.articulo_id
    FROM favoritos f
    GROUP BY f.articulo_id
    HAVING COUNT(f.usuario_id) > 1
);

SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT h.usuario_id
    FROM historialbusquedas h
    WHERE h.fecha < NOW() + INTERVAL '10'
);

SELECT c.motor_busqueda, COUNT(c.motor_busqueda) AS cantidad
FROM configuraciones c
GROUP BY c.motor_busqueda
ORDER BY cantidad DESC;



SELECT u.nombre, u.apellido
FROM usuarios u
WHERE u.usuario_id IN (
    SELECT d.usuario_id,*
    FROM direcciones d
    WHERE d.ciudad = 'La Paz'
);


DECLARE
    cur_favoritos CURSOR FOR
    SELECT u.nombre, u.apellido, a.titulo
    FROM usuarios u
    JOIN favoritos f ON u.usuario_id = f.usuario_id
    JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;
BEGIN
    OPEN cur_favoritos;
    LOOP
        FETCH cur_favoritos INTO v_nome, v_ap, v_titulo;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'Usuario: % %, Articulo: %', v_nome, v_ap, v_titulo;
    END LOOP;
    CLOSE cur_favoritos;
END;