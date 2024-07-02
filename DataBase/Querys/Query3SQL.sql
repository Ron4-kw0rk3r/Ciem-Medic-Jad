
/*

  Query: Postgresql Base de datos II
  Autor: Brayan Ronaldo
  Consultas dependiendo los requirimientos de los usuarios
  
*/

select distinct usuario_id as IDs, nombre as Nombre, email as Correo  
from usuarios;


SELECT *
FROM articulosreferencia
where autor LIKE 'Dra%';
-- FROM articulosreferencia WHERE autor = '';


SELECT *
FROM favoritos 
WHERE usuario_id = 17;



SELECT *
FROM historialbusquedas
WHERE usuario_id = 22;



SELECT *
FROM usuarios
WHERE email = 'miguel.herrera@example.com';


SELECT *
FROM recuperacioncuenta;

SELECT *
FROM configuraciones
WHERE usuario_id = 20;

SELECT *
FROM loginusuario
WHERE usuario_id = 15;

INSERT INTO direcciones (usuario_id, calle, ciudad, codigo_postal)
VALUES 
(1, 'Calle Falsa 123', 'Rodrigues', '0000'),
(2, 'Av. Sánchez Lima', 'Ex parada del 22', '0000'),
(3, 'Calle 10', 'Curva Norte', '5400');

SELECT *
FROM direcciones
WHERE usuario_id = 3;

SELECT * FROM reportes_usuario;

------------------ Multiples Tablas -------
SELECT a.*
FROM articulosreferencia a
JOIN favoritos f ON a.articulo_id = f.articulo_id
WHERE f.usuario_id = 17;


SELECT u.*, a.*
FROM usuarios u
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;


SELECT u.*, h.*
FROM usuarios u
JOIN historialbusquedas h ON u.usuario_id = h.usuario_id;


SELECT l.*, u.*
FROM loginusuario l
JOIN usuarios u ON l.usuario_id = u.usuario_id;


SELECT Distinct a.*, u.*
FROM articulosreferencia a, usuarios u
where a.autor LIKE 'Dr%'
and u.nombre LIKE 'Clara%';

SELECT c.*, u.*
FROM configuraciones c
JOIN usuarios u ON c.usuario_id = u.usuario_id;


SELECT r.*, u.*
FROM reportes_usuario r
JOIN usuarios u ON r.usuario_id = u.usuario_id;


SELECT u.*, f.*, a.*, h.*
FROM usuarios u
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id
JOIN historialbusquedas h ON u.usuario_id = h.usuario_id;



SELECT u.usuario_id, a.titulo, c.idioma_preferido
FROM usuarios u
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id
JOIN configuraciones c ON u.usuario_id = c.usuario_id;


SELECT u.nombre, u.apellido, a.titulo, h.texto_busqueda, h.fecha
FROM usuarios u
JOIN historialbusquedas h ON u.usuario_id = h.usuario_id
JOIN favoritos f ON u.usuario_id = f.usuario_id
JOIN articulosreferencia a ON f.articulo_id = a.articulo_id;



-- 10 Crear la tabla de LoginUsuario
CREATE TABLE LoginUsuario (
    login_id SERIAL PRIMARY KEY,
    nombre_o_semilla VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE
);

select *
from loginusuario;


