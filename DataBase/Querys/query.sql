<<<<<<< HEAD
-- registro de las consultas 17 -> Sql_spirit.sql
-- tabla de usuarios

-- fecha: 20-05-24
-- Autor: Brayan Ronaldo Sanchez Mendoza
-- script: Sql


-- Inserciones de datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, apellido, email, telefono, semilla, contrasena, id_unico) 
VALUES
  ('Luis', 'Perez', 'luis.perez@example.com', '555-1234', 'av7D1216', 'wih4f0sabc12', 'unique_id16'),
  ('Laura', 'Garcia', 'laura.garcia@gmail.com', '555-5678', 'ffTa86V9', 'loqq3nd0ap', 'unique_id17'),
  ('Pedro', 'Lopez', 'pedro.lopez@example.com', '555-9012', 'av7s8555', 'admin1234', 'unique_id18'),
  ('Ana', 'Martinez', 'ana.martinez@gmail.com', '555-3456', 'x457fgtzm', 'secr3t0d0s', 'unique_id19'),
  ('Sofia', 'Hernandez', 'sofia.hernandez@example.com', '555-7890', '8c55op25JL', 'acc3x0desc', 'unique_id20'),
  ('Diego', 'Gutierrez', 'diego.gutierrez@gmail.com', '555-2345', 'AB-Ufla21', 'd3mop4ss12', 'unique_id21'),
  ('Maria', 'Sanchez', 'maria.sanchez@example.com', '555-6789', 'aBcDeF1', 'password_22', 'unique_id22'),
  ('Julia', 'Ramirez', 'julia.ramirez@gmail.com', '555-0123', 'zYxWvU2', 'abyY0todo', 'unique_id23'),
  ('Roberto', 'Diaz', 'roberto.diaz@example.com', '555-4567', 'qWeRtY3', 'blad3tes00', 'unique_id24'),
  ('Elena', 'Torres', 'elena.torres@gmail.com', '555-8901', 'mNoPqR4', 'campeonGundyr', 'unique_id25'),
  ('Raul', 'Vargas', 'raul.vargas@example.com', '555-2345', 'jKlMnO5', 'contrasena123', 'unique_id26'),
  ('Carolina', 'Perez', 'carolina.perez@gmail.com', '555-6789', 'fGhIjK6', 'tomatoRojo45', 'unique_id27'),
  ('Pablo', 'Gomez', 'pablo.gomez@example.com', '555-0123', 'dEfGhI7', 'pablo42#adm', 'unique_id28'),
  ('Monica', 'Lopez', 'monica.lopez@gmail.com', '555-4567', 'aBcDeF8', 'yujirohatmaPRO', 'unique_id29'),
  ('Andres', 'Martinez', 'andres.martinez@example.com', '555-8901', 'zYxWvU9', 'adminLOQ78', 'unique_id30');



-- tabla Configs 

-- Inserciones de datos en la tabla Configuraciones
INSERT INTO Configuraciones (usuario_id, motor_busqueda, otras_preferencias)
VALUES
  (16, 'Google', 'check on'),
  (17, 'Bing-medic', 'check off'),
  (18, 'DuckDuckGo', 'check off'),
  (19, 'Google', 'check off'),
  (20, 'Bing', 'check off'),
  (21, 'DuckDuckGo', 'check off'),
  (22, 'Google', 'check on'),
  (23, 'Bing', 'check on'),
  (24, 'DuckDuckGo', 'check off'),
  (25, 'Google', 'check off'),
  (26, 'Bing', 'check off'),
  (27, 'DuckDuckGo', 'check off'),
  (28, 'Google', 'check off'),
  (29, 'Bing', 'check off'),
  (30, 'DuckDuckGo', 'check off');

-- modificaciones::
UPDATE Configuraciones SET motor_busqueda = 'Yahoo' WHERE configuracion_id = 1;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 2;
UPDATE Configuraciones SET motor_busqueda = 'DuckDuckGo' WHERE configuracion_id = 3;
UPDATE Configuraciones SET otras_preferencias = 'Preferencias actualizadas' WHERE configuracion_id = 4;
UPDATE Configuraciones SET motor_busqueda = 'Google' WHERE configuracion_id = 5;
UPDATE Configuraciones SET otras_preferencias = 'Otras preferencias' WHERE configuracion_id = 6;
UPDATE Configuraciones SET motor_busqueda = 'Bing' WHERE configuracion_id = 7;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 8;

-- desto package dot:bob
-- Eliminaciones
DELETE FROM Configuraciones WHERE configuracion_id = 9;
DELETE FROM Configuraciones WHERE configuracion_id = 10;
DELETE FROM Configuraciones WHERE configuracion_id = 11;



-- Inserciones de datos en la tabla HistorialBusquedas
INSERT INTO HistorialBusquedas (usuario_id, texto_busqueda)
VALUES
  (16, 'covid-19 que es?'),
  (17, 'si las manos se me ponen rojas es por la presion alta ?'),
  (18, 'que signifiacan las ojeras o las manchas en los parpados'),
  (19, 'hay diferencias en el color de la saliva'),
  (20, 'que es la influencia b o d'),
  (21, 'registro de infecciones sobre la influencia'),
  (22, 'enfermedades respiratorias'),
  (23, 'cuanto tipo de señales hay sobre la mordedura de una viuda negra'),
  (24, 'la rabia afecta a los riñones o el estomago '),
  (25, 'litros de agua que se deben de consumir al dia'),
  (26, 'libros sobre medicina natural'),
  (27, 'la wira wira que es? '),
  (28, 'el mate negro o te negro que beneficios tiene'),
  (29, 'tipos mordeduras y sus infecciones'),
  (30, 'Tratamiento o sintomas  de palides o baja azucar');

-- Modificaciones en la tabla Usuarios
UPDATE Usuarios SET nombre = 'Updated Name' WHERE usuario_id = 1;
UPDATE Usuarios SET apellido = 'Updated Lastname' WHERE usuario_id = 2;
UPDATE Usuarios SET email = 'updated.email@example.com' WHERE usuario_id = 3;
UPDATE Usuarios SET telefono = '555-0000' WHERE usuario_id = 4;
UPDATE Usuarios SET semilla = 'updated_semilla' WHERE usuario_id = 5;
UPDATE Usuarios SET contrasena = 'updated_password' WHERE usuario_id = 6;
UPDATE Usuarios SET id_unico = 'updated_unique_id' WHERE usuario_id = 7;
UPDATE Usuarios SET nombre = 'New Name' WHERE usuario_id = 8;

-- Modificaciones en la tabla Configuraciones
UPDATE Configuraciones SET motor_busqueda = 'Yahoo' WHERE configuracion_id = 1;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 2;
UPDATE Configuraciones SET motor_busqueda = 'DuckDuckGo' WHERE configuracion_id = 3;
UPDATE Configuraciones SET otras_preferencias = 'Preferencias actualizadas' WHERE configuracion_id = 4;
UPDATE Configuraciones SET motor_busqueda = 'Google' WHERE configuracion_id = 5;
UPDATE Configuraciones SET otras_preferencias = 'Otras preferencias' WHERE configuracion_id = 6;
UPDATE Configuraciones SET motor_busqueda = 'Bing' WHERE configuracion_id = 7;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 8;

-- Eliminaciones en la tabla Usuarios
DELETE FROM Usuarios WHERE usuario_id = 9;
DELETE FROM Usuarios WHERE usuario_id = 10;
DELETE FROM Usuarios WHERE usuario_id = 11;

INSERT INTO HistorialBusquedas (usuario_id, texto_busqueda) VALUES
(16, 'Síntomas de gripe común', NOW()),
(17, 'Tratamientos para la presión arterial alta', NOW()),
(18, 'Causas de ojeras y manchas en los párpados', NOW()),
(19, 'Importancia del color de la saliva', NOW()),
(20, 'Diferencias entre influencia B y D', NOW()),
(21, 'Prevención de infecciones respiratorias', NOW()),
(22, 'Señales de mordedura de arañas venenosas', NOW()),
(23, 'Efectos de la rabia en el cuerpo humano', NOW()),
(24, 'Cantidad de agua recomendada diariamente', NOW()),
(25, 'Beneficios de la medicina natural', NOW()),
(26, 'Significado de "wira wira"', NOW()),
(27, 'Propiedades del té negro', NOW()),
(28, 'Tipos de mordeduras y sus complicaciones', NOW()),
(29, 'Tratamientos y síntomas de palidez y baja azúcar', NOW());









-- 4. Insertar datos en la tabla Favoritos
INSERT INTO favoritos (usuario_id, articulo_id, fecha) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
-- (10, 10, NOW()), -- This line is causing a foreign key constraint violation
(11, 11, NOW()),
(12, 12, NOW()),
(13, 13, NOW()),
(14, 14, NOW()),
(15, 15, NOW());

INSERT INTO favoritos (usuario_id, articulo_id, fecha) VALUES
(1, 1, '2023-05-01 10:00:00'),
(2, 2, '2023-05-02 11:00:00'),
(3, 3, '2023-05-03 12:00:00'),
(4, 4, '2023-05-04 13:00:00'),
(5, 5, '2023-05-05 14:00:00'),
(6, 6, '2023-05-06 15:00:00'),
(7, 7, '2023-05-07 16:00:00'),
(8, 8, '2023-05-08 17:00:00'),
(9, 9, '2023-05-09 18:00:00'),
(10, 10, '2023-05-10 19:00:00'),
(11, 11, '2023-05-11 20:00:00'),
(12, 12, '2023-05-12 21:00:00'),
(13, 13, '2023-05-13 22:00:00'),
(14, 14, '2023-05-14 23:00:00'),
(15, 15, '2023-05-15 10:00:00'),
(1, 2, '2023-05-16 11:00:00');





INSERT INTO HistorialConsultas (usuario_id, articulo_id) VALUES
(16, 10, NOW()),
(17, 13, NOW()),
(18, 33, NOW()),
(19, 32, NOW()),
(20, 30, NOW()),
(21, 16, NOW()),
(22, 27, NOW()),
(23, 10, NOW()),
(24, 10, NOW()),
(25, 10, NOW()),
(26, 15, NOW()),
(27, 11, NOW()),
(28, 33, NOW()),
(29, 16, NOW()),
(30, 12, NOW());


INSERT INTO reportes (usuario_id, contenido) VALUES
(1, 'Reporte detallado de búsquedas', NOW()),
(2, 'Reporte de actividad', NOW()),
(3, 'Reporte de errores', NOW()),
(4, 'Reporte de uso de la cuenta', NOW()),
(5, 'Reporte de seguridad', NOW()),
(6, 'Reporte de sesiones activas', NOW()),
(7, 'Reporte de favoritos', NOW()),
(8, 'Reporte de consultas realizadas', NOW()),
(9, 'Reporte de configuraciones', NOW()),
(10, 'Reporte de recuperación de cuenta', NOW()),
(11, 'Reporte de login', NOW()),
(12, 'Reporte de nuevos usuarios', NOW()),
(13, 'Reporte de artículos referenciados', NOW()),
(14, 'Reporte de cuentas eliminadas', NOW()),
(15, 'Reporte de actividad sospechosa', NOW());


INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_expiracion) VALUES
(1, 'U12345', 'token123456', NOW() + INTERVAL 1 DAY),
(2, 'U12346', 'token123457', NOW() + INTERVAL 1 DAY),
(3, 'U12347', 'token123458', NOW() + INTERVAL 1 DAY),
(4, 'U12348', 'token123459', NOW() + INTERVAL 1 DAY),
(5, 'U12349', 'token123460', NOW() + INTERVAL 1 DAY),
(6, 'U12350', 'token123461', NOW() + INTERVAL 1 DAY),
(7, 'U12351', 'token123462', NOW() + INTERVAL 1 DAY),
(8, 'U12352', 'token123463', NOW() + INTERVAL 1 DAY),
(9, 'U12353', 'token123464', NOW() + INTERVAL 1 DAY),
(10, 'U12354', 'token123465', NOW() + INTERVAL 1 DAY),
(11, 'U12355', 'token123466', NOW() + INTERVAL 1 DAY),
(12, 'U12356', 'token123467', NOW() + INTERVAL 1 DAY),
(13, 'U12357', 'token123468', NOW() + INTERVAL 1 DAY),
(14, 'U12358', 'token123469', NOW() + INTERVAL 1 DAY),
(15, 'U12359', 'token123470', NOW() + INTERVAL 1 DAY);




INSERT INTO HistorialConsultas (usuario_id, articulo_id) VALUES
(16, 1, '2024-03-01 10:00:22'),
(17, 1, '2024-03-03 10:35:25'),
(18, 10, '2024-03-07 10:36:20'),
(19, 11, '2024-04-07 11:00:40'),
(20, 5, '2024-05-07 11:05:35'),
(21, 3, '2024-05-10 11:12:12'),
(22, 3, '2024-05-10 11:33:10'),
(23, 4, '2024-05-10 11:41:15'),
(24, 4, '2024-05-11 12:15:00'),
(30, 7, '2024-05-15 18:00:00'), -- This line is causing a foreign key constraint violation
(25, 7, '2024-05-15 18:25:03'),
(26, 7, '2024-05-15 19:47:33'),
(27, 7, '2024-05-18 09:50:11'),
(28, 12, '2024-05-18 13:20:17'),
(29, 13, '2024-05-20 15:00:35');





-- 7. Insertar datos en la tabla RecuperacionCuenta
INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_expiracion) VALUES
(1, 'U12345', 'token123456', NOW() + INTERVAL '1 day'),
(2, 'U12346', 'token123457', NOW() + INTERVAL '1 day'),
(3, 'U12347', 'token123458', NOW() + INTERVAL '1 day'),
(4, 'U12348', 'token123459', NOW() + INTERVAL '1 day'),
(5, 'U12349', 'token123460', NOW() + INTERVAL '1 day'),
(6, 'U12350', 'token123461', NOW() + INTERVAL '1 day'),
(7, 'U12351', 'token123462', NOW() + INTERVAL '1 day'),
(8, 'U12352', 'token123463', NOW() + INTERVAL '1 day'),
(9, 'U12353', 'token123464', NOW() + INTERVAL '1 day'),
(10, 'U12354', 'token123465', NOW() + INTERVAL '1 day'),
(11, 'U12355', 'token123466', NOW() + INTERVAL '1 day'),
(12, 'U12356', 'token123467', NOW() + INTERVAL '1 day'),
(13, 'U12357', 'token123468', NOW() + INTERVAL '1 day'),
(14, 'U12358', 'token123469', NOW() + INTERVAL '1 day'),
(15, 'U12359', 'token123470', NOW() + INTERVAL '1 day');

-- 8. Insertar datos en la tabla Sesiones
INSERT INTO Sesiones (usuario_id, token_sesion, fecha_expiracion) VALUES
(1, 'sesion123456', NOW() + INTERVAL '1 hour'),
(2, 'sesion123457', NOW() + INTERVAL '1 hour'),
(3, 'sesion123458', NOW() + INTERVAL '1 hour'),
(4, 'sesion123459', NOW() + INTERVAL '1 hour'),
(5, 'sesion123460', NOW() + INTERVAL '1 hour'),
(6, 'sesion123461', NOW() + INTERVAL '1 hour'),
(7, 'sesion123462', NOW() + INTERVAL '1 hour'),
(8, 'sesion123463', NOW() + INTERVAL '1 hour'),
(9, 'sesion123464', NOW() + INTERVAL '1 hour'),
(10, 'sesion123465', NOW() + INTERVAL '1 hour'),
(11, 'sesion123466', NOW() + INTERVAL '1 hour'),
(12, 'sesion123467', NOW() + INTERVAL '1 hour'),
(13, 'sesion123468', NOW() + INTERVAL '1 hour'),
(14, 'sesion123469', NOW() + INTERVAL '1 hour'),
(15, 'sesion123470', NOW() + INTERVAL '1 hour');

-- 9. Insertar datos en la tabla ArticulosReferencia
INSERT INTO ArticulosReferencia (titulo, contenido, autor) VALUES
('Introducción a SQL', 'Contenido del artículo 1', 'Autor 1', NOW()),
('Avanzando en Python', 'Contenido del artículo 2', 'Autor 2', NOW()),
('Guía de HTML y CSS', 'Contenido del artículo 3', 'Autor 3', NOW()),
('JavaScript para Principiantes', 'Contenido del artículo 4', 'Autor 4', NOW()),
('Desarrollo Web Full Stack', 'Contenido del artículo 5', 'Autor 5', NOW()),
('Machine Learning con Python', 'Contenido del artículo 6', 'Autor 6', NOW()),
('Inteligencia Artificial Básica', 'Contenido del artículo 7', 'Autor 7', NOW()),
('Análisis de Datos con R', 'Contenido del artículo 8', 'Autor 8', NOW()),
('Fundamentos de Redes', 'Contenido del artículo 9', 'Autor 9', NOW()),
('Seguridad Informática', 'Contenido del artículo 10', 'Autor 10', NOW()),
('Desarrollo de Apps Móviles', 'Contenido del artículo 11', 'Autor 11', NOW()),
('Introducción a DevOps', 'Contenido del artículo 12', 'Autor 12', NOW()),
('Bases de Datos Relacionales', 'Contenido del artículo 13', 'Autor 13', NOW()),
('Big Data y Hadoop', 'Contenido del artículo 14', 'Autor 14', NOW()),
('Arquitectura de Software', 'Contenido del artículo 15', 'Autor 15', NOW());



INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion) VALUES
(16, 'U12345', 'aB3cD4eF6', '2024-05-23 08:00:00', '2024-05-24 08:00:00'),
(17, 'U12346', 'bC4dE5fG7', '2024-05-23 09:00:00', '2024-05-24 09:00:00'),
(18, 'U12347', 'cD5eF6gH8', '2024-05-23 10:00:00', '2024-05-24 10:00:00'),
(19, 'U12348', 'dE6fG7hI9', '2024-05-23 11:00:00', '2024-05-24 11:00:00'),
(20, 'U12349', 'eF7gH8iJ0', '2024-05-23 12:00:00', '2024-05-24 12:00:00'),
(21, 'U12350', 'fG8hI9jK1', '2024-05-23 13:00:00', '2024-05-24 13:00:00'),
(22, 'U12351', 'gH9iJ0kL2', '2024-05-23 14:00:00', '2024-05-24 14:00:00'),
(23, 'U12352', 'hI0jK1lM3', '2024-05-23 15:00:00', '2024-05-24 15:00:00'),
(24, 'U12353', 'iJ1kL2mN4', '2024-05-23 16:00:00', '2024-05-24 16:00:00'),
(25, 'U12354', 'jK2lM3nO5', '2024-05-23 17:00:00', '2024-05-24 17:00:00'),
(26, 'U12355', 'kL3mN4oP6', '2024-05-23 18:00:00', '2024-05-24 18:00:00'),
(27, 'U12356', 'lM4nO5pQ7', '2024-05-23 19:00:00', '2024-05-24 19:00:00'),
(28, 'U12357', 'mN5oP6qR8', '2024-05-23 20:00:00', '2024-05-24 20:00:00'),
(29, 'U12358', 'nO6pQ7rS9', '2024-05-23 21:00:00', '2024-05-24 21:00:00'),
(30, 'U12359', 'oP7qR8sT0', '2024-05-23 22:00:00', '2024-05-24 22:00:00');


-- 10. Insertar datos en la tabla LoginUsuario



INSERT INTO LoginUsuario (nombre_o_semilla, contrasena, usuario_id) VALUES
('carlos.garcia', 'password123', 1),
('maria.lopez', 'securepass456', 2),
('juan.martinez', 'mysecretword', 3),
('ana.gonzalez', 'newpass789', 4),
('luis.rodriguez', 'hiddenkey321', 5),
('sofia.hernandez', 'safepassword654', 6),
('david.perez', 'confidential789', 7),
('laura.jimenez', 'protectedpass987', 8),
('jorge.sanchez', 'classifiedword123', 9),
('marta.romero', 'topsecret456', 10),
('pedro.torres', 'passphrase789', 11),
('carmen.vazquez', 'accesskey123', 12),
('ricardo.ramos', 'unlockcode456', 13),
('elena.cruz', 'privatepass789', 14),
('manuel.flores', 'keytosafety123', 15);
-- 11. Insertar datos en la tabla RegistroNewUser
INSERT INTO RegistroNewUser (nombre, apellido, email, telefono, contrasena, usuario_id) VALUES
('Carlos', 'García', 'carlos.garcia@example.com', '555-1234', 'contrasena1', 1),
('María', 'López', 'maria.lopez@example.com', '555-5678', 'contrasena2', 2),
('Juan', 'Martínez', 'juan.martinez@example.com', '555-8765', 'contrasena3', 3),
('Ana', 'González', 'ana.gonzalez@example.com', '555-4321', 'contrasena4', 4),
('Luis', 'Rodríguez', 'luis.rodriguez@example.com', '555-6789', 'contrasena5', 5),
('Sofía', 'Hernández', 'sofia.hernandez@example.com', '555-9876', 'contrasena6', 6),
('David', 'Pérez', 'david.perez@example.com', '555-3456', 'contrasena7', 7),
('Laura', 'Jiménez', 'laura.jimenez@example.com', '555-6543', 'contrasena8', 8),
('Jorge', 'Sánchez', 'jorge.sanchez@example.com', '555-7890', 'contrasena9', 9),
('Marta', 'Romero', 'marta.romero@example.com', '555-0987', 'contrasena10', 10),
('Pedro', 'Torres', 'pedro.torres@example.com', '555-1111', 'contrasena11', 11),
('Carmen', 'Vázquez', 'carmen.vazquez@example.com', '555-2222', 'contrasena12', 12),
('Ricardo', 'Ramos', 'ricardo.ramos@example.com', '555-3333', 'contrasena13', 13),
('Elena', 'Cruz', 'elena.cruz@example.com', '555-4444', 'contrasena14', 14),
('Manuel', 'Flores', 'manuel.flores@example.com', '555-5555', 'contrasena15', 15);

=======
-- registro de las consultas 17 -> Sql_spirit.sql
-- tabla de usuarios

-- fecha: 20-05-24
-- Autor: Brayan Ronaldo Sanchez Mendoza
-- script: Sql


-- Inserciones de datos en la tabla Usuarios
INSERT INTO Usuarios (nombre, apellido, email, telefono, semilla, contrasena, id_unico) 
VALUES
  ('Luis', 'Perez', 'luis.perez@example.com', '555-1234', 'av7D1216', 'wih4f0sabc12', 'unique_id16'),
  ('Laura', 'Garcia', 'laura.garcia@gmail.com', '555-5678', 'ffTa86V9', 'loqq3nd0ap', 'unique_id17'),
  ('Pedro', 'Lopez', 'pedro.lopez@example.com', '555-9012', 'av7s8555', 'admin1234', 'unique_id18'),
  ('Ana', 'Martinez', 'ana.martinez@gmail.com', '555-3456', 'x457fgtzm', 'secr3t0d0s', 'unique_id19'),
  ('Sofia', 'Hernandez', 'sofia.hernandez@example.com', '555-7890', '8c55op25JL', 'acc3x0desc', 'unique_id20'),
  ('Diego', 'Gutierrez', 'diego.gutierrez@gmail.com', '555-2345', 'AB-Ufla21', 'd3mop4ss12', 'unique_id21'),
  ('Maria', 'Sanchez', 'maria.sanchez@example.com', '555-6789', 'aBcDeF1', 'password_22', 'unique_id22'),
  ('Julia', 'Ramirez', 'julia.ramirez@gmail.com', '555-0123', 'zYxWvU2', 'abyY0todo', 'unique_id23'),
  ('Roberto', 'Diaz', 'roberto.diaz@example.com', '555-4567', 'qWeRtY3', 'blad3tes00', 'unique_id24'),
  ('Elena', 'Torres', 'elena.torres@gmail.com', '555-8901', 'mNoPqR4', 'campeonGundyr', 'unique_id25'),
  ('Raul', 'Vargas', 'raul.vargas@example.com', '555-2345', 'jKlMnO5', 'contrasena123', 'unique_id26'),
  ('Carolina', 'Perez', 'carolina.perez@gmail.com', '555-6789', 'fGhIjK6', 'tomatoRojo45', 'unique_id27'),
  ('Pablo', 'Gomez', 'pablo.gomez@example.com', '555-0123', 'dEfGhI7', 'pablo42#adm', 'unique_id28'),
  ('Monica', 'Lopez', 'monica.lopez@gmail.com', '555-4567', 'aBcDeF8', 'yujirohatmaPRO', 'unique_id29'),
  ('Andres', 'Martinez', 'andres.martinez@example.com', '555-8901', 'zYxWvU9', 'adminLOQ78', 'unique_id30');



-- tabla Configs 

-- Inserciones de datos en la tabla Configuraciones
INSERT INTO Configuraciones (usuario_id, motor_busqueda, otras_preferencias)
VALUES
  (16, 'Google', 'check on'),
  (17, 'Bing-medic', 'check off'),
  (18, 'DuckDuckGo', 'check off'),
  (19, 'Google', 'check off'),
  (20, 'Bing', 'check off'),
  (21, 'DuckDuckGo', 'check off'),
  (22, 'Google', 'check on'),
  (23, 'Bing', 'check on'),
  (24, 'DuckDuckGo', 'check off'),
  (25, 'Google', 'check off'),
  (26, 'Bing', 'check off'),
  (27, 'DuckDuckGo', 'check off'),
  (28, 'Google', 'check off'),
  (29, 'Bing', 'check off'),
  (30, 'DuckDuckGo', 'check off');

-- modificaciones::
UPDATE Configuraciones SET motor_busqueda = 'Yahoo' WHERE configuracion_id = 1;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 2;
UPDATE Configuraciones SET motor_busqueda = 'DuckDuckGo' WHERE configuracion_id = 3;
UPDATE Configuraciones SET otras_preferencias = 'Preferencias actualizadas' WHERE configuracion_id = 4;
UPDATE Configuraciones SET motor_busqueda = 'Google' WHERE configuracion_id = 5;
UPDATE Configuraciones SET otras_preferencias = 'Otras preferencias' WHERE configuracion_id = 6;
UPDATE Configuraciones SET motor_busqueda = 'Bing' WHERE configuracion_id = 7;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 8;

-- desto package dot:bob
-- Eliminaciones
DELETE FROM Configuraciones WHERE configuracion_id = 9;
DELETE FROM Configuraciones WHERE configuracion_id = 10;
DELETE FROM Configuraciones WHERE configuracion_id = 11;



-- Inserciones de datos en la tabla HistorialBusquedas
INSERT INTO HistorialBusquedas (usuario_id, texto_busqueda)
VALUES
  (16, 'covid-19 que es?'),
  (17, 'si las manos se me ponen rojas es por la presion alta ?'),
  (18, 'que signifiacan las ojeras o las manchas en los parpados'),
  (19, 'hay diferencias en el color de la saliva'),
  (20, 'que es la influencia b o d'),
  (21, 'registro de infecciones sobre la influencia'),
  (22, 'enfermedades respiratorias'),
  (23, 'cuanto tipo de señales hay sobre la mordedura de una viuda negra'),
  (24, 'la rabia afecta a los riñones o el estomago '),
  (25, 'litros de agua que se deben de consumir al dia'),
  (26, 'libros sobre medicina natural'),
  (27, 'la wira wira que es? '),
  (28, 'el mate negro o te negro que beneficios tiene'),
  (29, 'tipos mordeduras y sus infecciones'),
  (30, 'Tratamiento o sintomas  de palides o baja azucar');

-- Modificaciones en la tabla Usuarios
UPDATE Usuarios SET nombre = 'Updated Name' WHERE usuario_id = 1;
UPDATE Usuarios SET apellido = 'Updated Lastname' WHERE usuario_id = 2;
UPDATE Usuarios SET email = 'updated.email@example.com' WHERE usuario_id = 3;
UPDATE Usuarios SET telefono = '555-0000' WHERE usuario_id = 4;
UPDATE Usuarios SET semilla = 'updated_semilla' WHERE usuario_id = 5;
UPDATE Usuarios SET contrasena = 'updated_password' WHERE usuario_id = 6;
UPDATE Usuarios SET id_unico = 'updated_unique_id' WHERE usuario_id = 7;
UPDATE Usuarios SET nombre = 'New Name' WHERE usuario_id = 8;

-- Modificaciones en la tabla Configuraciones
UPDATE Configuraciones SET motor_busqueda = 'Yahoo' WHERE configuracion_id = 1;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 2;
UPDATE Configuraciones SET motor_busqueda = 'DuckDuckGo' WHERE configuracion_id = 3;
UPDATE Configuraciones SET otras_preferencias = 'Preferencias actualizadas' WHERE configuracion_id = 4;
UPDATE Configuraciones SET motor_busqueda = 'Google' WHERE configuracion_id = 5;
UPDATE Configuraciones SET otras_preferencias = 'Otras preferencias' WHERE configuracion_id = 6;
UPDATE Configuraciones SET motor_busqueda = 'Bing' WHERE configuracion_id = 7;
UPDATE Configuraciones SET otras_preferencias = 'Nuevas preferencias' WHERE configuracion_id = 8;

-- Eliminaciones en la tabla Usuarios
DELETE FROM Usuarios WHERE usuario_id = 9;
DELETE FROM Usuarios WHERE usuario_id = 10;
DELETE FROM Usuarios WHERE usuario_id = 11;

INSERT INTO HistorialBusquedas (usuario_id, texto_busqueda) VALUES
(16, 'Síntomas de gripe común', NOW()),
(17, 'Tratamientos para la presión arterial alta', NOW()),
(18, 'Causas de ojeras y manchas en los párpados', NOW()),
(19, 'Importancia del color de la saliva', NOW()),
(20, 'Diferencias entre influencia B y D', NOW()),
(21, 'Prevención de infecciones respiratorias', NOW()),
(22, 'Señales de mordedura de arañas venenosas', NOW()),
(23, 'Efectos de la rabia en el cuerpo humano', NOW()),
(24, 'Cantidad de agua recomendada diariamente', NOW()),
(25, 'Beneficios de la medicina natural', NOW()),
(26, 'Significado de "wira wira"', NOW()),
(27, 'Propiedades del té negro', NOW()),
(28, 'Tipos de mordeduras y sus complicaciones', NOW()),
(29, 'Tratamientos y síntomas de palidez y baja azúcar', NOW());









-- 4. Insertar datos en la tabla Favoritos
INSERT INTO favoritos (usuario_id, articulo_id, fecha) VALUES
(1, 1, NOW()),
(2, 2, NOW()),
(3, 3, NOW()),
(4, 4, NOW()),
(5, 5, NOW()),
(6, 6, NOW()),
(7, 7, NOW()),
(8, 8, NOW()),
(9, 9, NOW()),
-- (10, 10, NOW()), -- This line is causing a foreign key constraint violation
(11, 11, NOW()),
(12, 12, NOW()),
(13, 13, NOW()),
(14, 14, NOW()),
(15, 15, NOW());

INSERT INTO favoritos (usuario_id, articulo_id, fecha) VALUES
(1, 1, '2023-05-01 10:00:00'),
(2, 2, '2023-05-02 11:00:00'),
(3, 3, '2023-05-03 12:00:00'),
(4, 4, '2023-05-04 13:00:00'),
(5, 5, '2023-05-05 14:00:00'),
(6, 6, '2023-05-06 15:00:00'),
(7, 7, '2023-05-07 16:00:00'),
(8, 8, '2023-05-08 17:00:00'),
(9, 9, '2023-05-09 18:00:00'),
(10, 10, '2023-05-10 19:00:00'),
(11, 11, '2023-05-11 20:00:00'),
(12, 12, '2023-05-12 21:00:00'),
(13, 13, '2023-05-13 22:00:00'),
(14, 14, '2023-05-14 23:00:00'),
(15, 15, '2023-05-15 10:00:00'),
(1, 2, '2023-05-16 11:00:00');





INSERT INTO HistorialConsultas (usuario_id, articulo_id) VALUES
(16, 10, NOW()),
(17, 13, NOW()),
(18, 33, NOW()),
(19, 32, NOW()),
(20, 30, NOW()),
(21, 16, NOW()),
(22, 27, NOW()),
(23, 10, NOW()),
(24, 10, NOW()),
(25, 10, NOW()),
(26, 15, NOW()),
(27, 11, NOW()),
(28, 33, NOW()),
(29, 16, NOW()),
(30, 12, NOW());


INSERT INTO reportes (usuario_id, contenido) VALUES
(1, 'Reporte detallado de búsquedas', NOW()),
(2, 'Reporte de actividad', NOW()),
(3, 'Reporte de errores', NOW()),
(4, 'Reporte de uso de la cuenta', NOW()),
(5, 'Reporte de seguridad', NOW()),
(6, 'Reporte de sesiones activas', NOW()),
(7, 'Reporte de favoritos', NOW()),
(8, 'Reporte de consultas realizadas', NOW()),
(9, 'Reporte de configuraciones', NOW()),
(10, 'Reporte de recuperación de cuenta', NOW()),
(11, 'Reporte de login', NOW()),
(12, 'Reporte de nuevos usuarios', NOW()),
(13, 'Reporte de artículos referenciados', NOW()),
(14, 'Reporte de cuentas eliminadas', NOW()),
(15, 'Reporte de actividad sospechosa', NOW());


INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_expiracion) VALUES
(1, 'U12345', 'token123456', NOW() + INTERVAL 1 DAY),
(2, 'U12346', 'token123457', NOW() + INTERVAL 1 DAY),
(3, 'U12347', 'token123458', NOW() + INTERVAL 1 DAY),
(4, 'U12348', 'token123459', NOW() + INTERVAL 1 DAY),
(5, 'U12349', 'token123460', NOW() + INTERVAL 1 DAY),
(6, 'U12350', 'token123461', NOW() + INTERVAL 1 DAY),
(7, 'U12351', 'token123462', NOW() + INTERVAL 1 DAY),
(8, 'U12352', 'token123463', NOW() + INTERVAL 1 DAY),
(9, 'U12353', 'token123464', NOW() + INTERVAL 1 DAY),
(10, 'U12354', 'token123465', NOW() + INTERVAL 1 DAY),
(11, 'U12355', 'token123466', NOW() + INTERVAL 1 DAY),
(12, 'U12356', 'token123467', NOW() + INTERVAL 1 DAY),
(13, 'U12357', 'token123468', NOW() + INTERVAL 1 DAY),
(14, 'U12358', 'token123469', NOW() + INTERVAL 1 DAY),
(15, 'U12359', 'token123470', NOW() + INTERVAL 1 DAY);




INSERT INTO HistorialConsultas (usuario_id, articulo_id) VALUES
(16, 1, '2024-03-01 10:00:22'),
(17, 1, '2024-03-03 10:35:25'),
(18, 10, '2024-03-07 10:36:20'),
(19, 11, '2024-04-07 11:00:40'),
(20, 5, '2024-05-07 11:05:35'),
(21, 3, '2024-05-10 11:12:12'),
(22, 3, '2024-05-10 11:33:10'),
(23, 4, '2024-05-10 11:41:15'),
(24, 4, '2024-05-11 12:15:00'),
(30, 7, '2024-05-15 18:00:00'), -- This line is causing a foreign key constraint violation
(25, 7, '2024-05-15 18:25:03'),
(26, 7, '2024-05-15 19:47:33'),
(27, 7, '2024-05-18 09:50:11'),
(28, 12, '2024-05-18 13:20:17'),
(29, 13, '2024-05-20 15:00:35');





-- 7. Insertar datos en la tabla RecuperacionCuenta
INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_expiracion) VALUES
(1, 'U12345', 'token123456', NOW() + INTERVAL '1 day'),
(2, 'U12346', 'token123457', NOW() + INTERVAL '1 day'),
(3, 'U12347', 'token123458', NOW() + INTERVAL '1 day'),
(4, 'U12348', 'token123459', NOW() + INTERVAL '1 day'),
(5, 'U12349', 'token123460', NOW() + INTERVAL '1 day'),
(6, 'U12350', 'token123461', NOW() + INTERVAL '1 day'),
(7, 'U12351', 'token123462', NOW() + INTERVAL '1 day'),
(8, 'U12352', 'token123463', NOW() + INTERVAL '1 day'),
(9, 'U12353', 'token123464', NOW() + INTERVAL '1 day'),
(10, 'U12354', 'token123465', NOW() + INTERVAL '1 day'),
(11, 'U12355', 'token123466', NOW() + INTERVAL '1 day'),
(12, 'U12356', 'token123467', NOW() + INTERVAL '1 day'),
(13, 'U12357', 'token123468', NOW() + INTERVAL '1 day'),
(14, 'U12358', 'token123469', NOW() + INTERVAL '1 day'),
(15, 'U12359', 'token123470', NOW() + INTERVAL '1 day');

-- 8. Insertar datos en la tabla Sesiones
INSERT INTO Sesiones (usuario_id, token_sesion, fecha_expiracion) VALUES
(1, 'sesion123456', NOW() + INTERVAL '1 hour'),
(2, 'sesion123457', NOW() + INTERVAL '1 hour'),
(3, 'sesion123458', NOW() + INTERVAL '1 hour'),
(4, 'sesion123459', NOW() + INTERVAL '1 hour'),
(5, 'sesion123460', NOW() + INTERVAL '1 hour'),
(6, 'sesion123461', NOW() + INTERVAL '1 hour'),
(7, 'sesion123462', NOW() + INTERVAL '1 hour'),
(8, 'sesion123463', NOW() + INTERVAL '1 hour'),
(9, 'sesion123464', NOW() + INTERVAL '1 hour'),
(10, 'sesion123465', NOW() + INTERVAL '1 hour'),
(11, 'sesion123466', NOW() + INTERVAL '1 hour'),
(12, 'sesion123467', NOW() + INTERVAL '1 hour'),
(13, 'sesion123468', NOW() + INTERVAL '1 hour'),
(14, 'sesion123469', NOW() + INTERVAL '1 hour'),
(15, 'sesion123470', NOW() + INTERVAL '1 hour');

-- 9. Insertar datos en la tabla ArticulosReferencia
INSERT INTO ArticulosReferencia (titulo, contenido, autor) VALUES
('Introducción a SQL', 'Contenido del artículo 1', 'Autor 1', NOW()),
('Avanzando en Python', 'Contenido del artículo 2', 'Autor 2', NOW()),
('Guía de HTML y CSS', 'Contenido del artículo 3', 'Autor 3', NOW()),
('JavaScript para Principiantes', 'Contenido del artículo 4', 'Autor 4', NOW()),
('Desarrollo Web Full Stack', 'Contenido del artículo 5', 'Autor 5', NOW()),
('Machine Learning con Python', 'Contenido del artículo 6', 'Autor 6', NOW()),
('Inteligencia Artificial Básica', 'Contenido del artículo 7', 'Autor 7', NOW()),
('Análisis de Datos con R', 'Contenido del artículo 8', 'Autor 8', NOW()),
('Fundamentos de Redes', 'Contenido del artículo 9', 'Autor 9', NOW()),
('Seguridad Informática', 'Contenido del artículo 10', 'Autor 10', NOW()),
('Desarrollo de Apps Móviles', 'Contenido del artículo 11', 'Autor 11', NOW()),
('Introducción a DevOps', 'Contenido del artículo 12', 'Autor 12', NOW()),
('Bases de Datos Relacionales', 'Contenido del artículo 13', 'Autor 13', NOW()),
('Big Data y Hadoop', 'Contenido del artículo 14', 'Autor 14', NOW()),
('Arquitectura de Software', 'Contenido del artículo 15', 'Autor 15', NOW());



INSERT INTO RecuperacionCuenta (usuario_id, id_unico, token_recuperacion, fecha_solicitud, fecha_expiracion) VALUES
(16, 'U12345', 'aB3cD4eF6', '2024-05-23 08:00:00', '2024-05-24 08:00:00'),
(17, 'U12346', 'bC4dE5fG7', '2024-05-23 09:00:00', '2024-05-24 09:00:00'),
(18, 'U12347', 'cD5eF6gH8', '2024-05-23 10:00:00', '2024-05-24 10:00:00'),
(19, 'U12348', 'dE6fG7hI9', '2024-05-23 11:00:00', '2024-05-24 11:00:00'),
(20, 'U12349', 'eF7gH8iJ0', '2024-05-23 12:00:00', '2024-05-24 12:00:00'),
(21, 'U12350', 'fG8hI9jK1', '2024-05-23 13:00:00', '2024-05-24 13:00:00'),
(22, 'U12351', 'gH9iJ0kL2', '2024-05-23 14:00:00', '2024-05-24 14:00:00'),
(23, 'U12352', 'hI0jK1lM3', '2024-05-23 15:00:00', '2024-05-24 15:00:00'),
(24, 'U12353', 'iJ1kL2mN4', '2024-05-23 16:00:00', '2024-05-24 16:00:00'),
(25, 'U12354', 'jK2lM3nO5', '2024-05-23 17:00:00', '2024-05-24 17:00:00'),
(26, 'U12355', 'kL3mN4oP6', '2024-05-23 18:00:00', '2024-05-24 18:00:00'),
(27, 'U12356', 'lM4nO5pQ7', '2024-05-23 19:00:00', '2024-05-24 19:00:00'),
(28, 'U12357', 'mN5oP6qR8', '2024-05-23 20:00:00', '2024-05-24 20:00:00'),
(29, 'U12358', 'nO6pQ7rS9', '2024-05-23 21:00:00', '2024-05-24 21:00:00'),
(30, 'U12359', 'oP7qR8sT0', '2024-05-23 22:00:00', '2024-05-24 22:00:00');


-- 10. Insertar datos en la tabla LoginUsuario



INSERT INTO LoginUsuario (nombre_o_semilla, contrasena, usuario_id) VALUES
('carlos.garcia', 'password123', 1),
('maria.lopez', 'securepass456', 2),
('juan.martinez', 'mysecretword', 3),
('ana.gonzalez', 'newpass789', 4),
('luis.rodriguez', 'hiddenkey321', 5),
('sofia.hernandez', 'safepassword654', 6),
('david.perez', 'confidential789', 7),
('laura.jimenez', 'protectedpass987', 8),
('jorge.sanchez', 'classifiedword123', 9),
('marta.romero', 'topsecret456', 10),
('pedro.torres', 'passphrase789', 11),
('carmen.vazquez', 'accesskey123', 12),
('ricardo.ramos', 'unlockcode456', 13),
('elena.cruz', 'privatepass789', 14),
('manuel.flores', 'keytosafety123', 15);
-- 11. Insertar datos en la tabla RegistroNewUser
INSERT INTO RegistroNewUser (nombre, apellido, email, telefono, contrasena, usuario_id) VALUES
('Carlos', 'García', 'carlos.garcia@example.com', '555-1234', 'contrasena1', 1),
('María', 'López', 'maria.lopez@example.com', '555-5678', 'contrasena2', 2),
('Juan', 'Martínez', 'juan.martinez@example.com', '555-8765', 'contrasena3', 3),
('Ana', 'González', 'ana.gonzalez@example.com', '555-4321', 'contrasena4', 4),
('Luis', 'Rodríguez', 'luis.rodriguez@example.com', '555-6789', 'contrasena5', 5),
('Sofía', 'Hernández', 'sofia.hernandez@example.com', '555-9876', 'contrasena6', 6),
('David', 'Pérez', 'david.perez@example.com', '555-3456', 'contrasena7', 7),
('Laura', 'Jiménez', 'laura.jimenez@example.com', '555-6543', 'contrasena8', 8),
('Jorge', 'Sánchez', 'jorge.sanchez@example.com', '555-7890', 'contrasena9', 9),
('Marta', 'Romero', 'marta.romero@example.com', '555-0987', 'contrasena10', 10),
('Pedro', 'Torres', 'pedro.torres@example.com', '555-1111', 'contrasena11', 11),
('Carmen', 'Vázquez', 'carmen.vazquez@example.com', '555-2222', 'contrasena12', 12),
('Ricardo', 'Ramos', 'ricardo.ramos@example.com', '555-3333', 'contrasena13', 13),
('Elena', 'Cruz', 'elena.cruz@example.com', '555-4444', 'contrasena14', 14),
('Manuel', 'Flores', 'manuel.flores@example.com', '555-5555', 'contrasena15', 15);

>>>>>>> 2ff92714ff7fd361dccf5a372332fe861bf5370a
