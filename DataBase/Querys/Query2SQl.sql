
-- fecha: 20-05-24
-- Autor: Brayan Ronaldo Sanchez Mendoza
-- script: Sql

ALTER TABLE Usuarios ALTER COLUMN id_unico TYPE VARCHAR(20);

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



INSERT INTO HistorialBusquedas (usuario_id, texto_busqueda) VALUES
(16, 'Síntomas de gripe común',now()),
(17, 'Tratamientos para la presión arterial alta',now),
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

select *  from ArticulosReferencia;
INSERT INTO ArticulosReferencia (titulo, contenido, autor, fecha_publicacion) VALUES
('Innovaciones en Terapia Génica', 'Este artículo explora los últimos avances en terapia génica y su impacto en el tratamiento de enfermedades hereditarias.', 'Dra. Ana López', '2024-05-01 10:00:00'),
('Uso de la Inteligencia Artificial en Diagnóstico Médico', 'La inteligencia artificial está revolucionando el diagnóstico médico, desde la detección de cáncer hasta la predicción de enfermedades cardiovasculares.', 'Dr. Carlos Martínez', '2024-05-01 10:00:00'),
('Telemedicina: Beneficios y Retos', 'La telemedicina ha cobrado relevancia durante la pandemia de COVID-19. Este artículo analiza sus beneficios y los retos a superar.', 'Dr. Laura Pérez', '2024-05-01 10:00:00'),
('Nuevas Técnicas de Imagenología Médica', 'Descubre las nuevas técnicas de imagenología, como la tomografía computarizada de alta resolución y la resonancia magnética funcional.', 'Dra. Silvia González', '2024-05-01 10:00:00'),
('Robótica en Cirugía: Un Futuro Prometedor', 'La robótica está transformando la cirugía con mayor precisión y menos invasividad. Aquí se presentan los avances más recientes.', 'Dr. Javier Fernández', '2024-05-01 10:00:00'),
('Impresión 3D de Prótesis Médicas', 'La impresión 3D está revolucionando la creación de prótesis personalizadas, mejorando significativamente la calidad de vida de los pacientes.', 'Dra. Carmen Hernández', '2024-05-01 10:00:00'),
('Biomarcadores en la Medicina Personalizada', 'Este artículo detalla cómo los biomarcadores están permitiendo tratamientos personalizados y más efectivos en oncología.', 'Dr. Manuel García', '2024-05-01 10:00:00'),
('Desarrollo de Vacunas de Nueva Generación', 'Exploramos las innovaciones en el desarrollo de vacunas, incluyendo las basadas en ARN mensajero.', 'Dra. Patricia Sánchez', '2024-05-01 10:00:00'),
('Big Data en la Gestión de la Salud', 'El análisis de big data está transformando la gestión de la salud pública y la investigación clínica.', 'Dr. Luis Ramírez', '2024-05-01 10:00:00'),
('Wearables y su Impacto en el Monitoreo de la Salud', 'Los dispositivos wearables están cambiando cómo monitorizamos nuestra salud diaria y detectamos problemas de manera temprana.', 'Dra. Elena Ruiz', '2024-04-22 10:30:00'),
('Avances en Terapias de Células Madre', 'Revisamos los últimos avances en terapias de células madre para el tratamiento de enfermedades degenerativas.', 'Dr. Pedro Jiménez', '2024-04-22 13:12:00'),
('Aplicaciones de la Nanotecnología en Medicina', 'La nanotecnología ofrece nuevas soluciones para el tratamiento de enfermedades y la administración de medicamentos.', 'Dra. Rosa Martínez', '2024-04-30 11:00:00'),
('Sistemas de Salud Basados en Blockchain', 'El blockchain promete mejorar la seguridad y la eficiencia en la gestión de datos de salud.', 'Dr. Juan Torres', '2024-04-06 16:22:00'),
('Terapias Digitales para Trastornos Mentales', 'Las terapias digitales están emergiendo como una alternativa efectiva para el tratamiento de trastornos mentales.', 'Dra. Isabel Gómez', '2024-05-01 15:20:00'),
('Innovaciones en Medicina Regenerativa', 'Este artículo examina los últimos avances en medicina regenerativa y sus aplicaciones clínicas.', 'Dr. Sergio Morales','2024-05-01 12:30:00');

-- select * from  Historialbusquedas;
select * from favoritos;

INSERT INTO favoritos (usuario_id, articulo_id, fecha) VALUES
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


INSERT INTO HistorialConsultas (usuario_id, articulo_id, fecha) VALUES
(16, 1, '2024-05-01 10:00:22'),
(17, 1, '2024-05-03 10:35:25'),
(18, 10, '2024-05-07 10:36:20'),
(19, 11, '2024-05-07 11:00:40'),
(20, 5, '2024-05-07 11:05:35'),
(21, 3, '2024-05-10 11:12:12'),
(22, 3, '2024-05-10 11:33:10'),
(23, 4, '2024-05-10 11:41:15'),
(24, 4, '2024-05-11 12:15:00'),
(25, 7, '2024-05-15 18:25:03'),
(26, 7, '2024-05-15 19:47:33'),
(27, 7, '2024-05-18 09:50:11'),
(28, 12, '2024-05-18 13:20:17'),
(29, 13, '2024-05-20 15:00:35'),
(30, 7, '2024-05-15 18:00:00');

INSERT INTO reportes (reporte_id, usuario_id, contenido, fecha) VALUES
(16, 1, 'Reporte detallado de búsquedas', '2024-05-01 10:00:00'),
(17, 2, 'Reporte de actividad', '2024-05-02 10:30:00'),
(18, 3, 'Reporte de errores', '2024-05-03 11:00:00'),
(19, 4, 'Reporte de uso de la cuenta', '2024-05-04 11:30:00'),
(20, 5, 'Reporte de seguridad', '2024-05-05 12:00:00'),
(21, 6, 'Reporte de sesiones activas', '2024-05-06 12:30:00'),
(22, 7, 'Reporte de favoritos', '2024-05-07 13:00:00'),
(23, 8, 'Reporte de consultas realizadas', '2024-05-08 13:30:00'),
(24, 9, 'Reporte de configuraciones', '2024-05-09 14:00:00'),
(25, 10, 'Reporte de recuperación de cuenta', '2024-05-10 14:30:00'),
(26, 11, 'Reporte de login', '2024-05-11 15:00:00'),
(27, 12, 'Reporte de nuevos usuarios', '2024-05-12 15:30:00'),
(28, 13, 'Reporte de artículos referenciados', '2024-05-13 16:00:00'),
(29, 14, 'Reporte de cuentas eliminadas', '2024-05-14 16:30:00'),
(30, 15, 'Reporte de actividad sospechosa', '2024-05-15 17:00:00');




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

select * from sesiones;


-- Corrección para la tabla Sesiones
INSERT INTO Sesiones (usuario_id, token_sesion, fecha_inicio, fecha_expiracion) VALUES
(16, 'a1b2c3d4e5', '2024-05-23 08:00:00', '2024-05-23 09:00:00'),
(17, 'f6g7h8i9j0', '2024-05-23 09:00:00', '2024-05-23 10:00:00'),
(18, 'k1l2m3n4o5', '2024-05-23 10:00:00', '2024-05-23 11:00:00'),
(19, 'p6q7r8s9t0', '2024-05-23 11:00:00', '2024-05-23 12:00:00'),
(20, 'u1v2w3x4y5', '2024-05-23 12:00:00', '2024-05-23 13:00:00'),
(21, 'z6a7b8c9d0', '2024-05-23 13:00:00', '2024-05-23 14:00:00'),
(22, 'e1f2g3h4i5', '2024-05-23 14:00:00', '2024-05-23 15:00:00'),
(23, 'j6k7l8m9n0', '2024-05-23 15:00:00', '2024-05-23 16:00:00'),
(24, 'o1p2q3r4s5', '2024-05-23 16:00:00', '2024-05-23 17:00:00'),
(25, 't6u7v8w9x0', '2024-05-23 17:00:00', '2024-05-23 18:00:00'),
(26, 'y1z2a3b4c5', '2024-05-23 18:00:00', '2024-05-23 19:00:00'),
(27, 'd6e7f8g9h0', '2024-05-23 19:00:00', '2024-05-23 20:00:00'),
(28, 'i1j2k3l4m5', '2024-05-23 20:00:00', '2024-05-23 21:00:00'),
(29, 'n6o7p8q9r0', '2024-05-23 21:00:00', '2024-05-23 22:00:00'),
(30, 's1t2u3v4w5', '2024-05-23 22:00:00', '2024-05-23 23:00:00');


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



-- MODIFICACIONES 


ALTER TABLE Usuarios
ALTER COLUMN contrasena TYPE VARCHAR(150);

ALTER TABLE Configuraciones
ADD COLUMN idioma_preferido VARCHAR(50);

ALTER TABLE HistorialBusquedas
ALTER COLUMN texto_busqueda TYPE TEXT;

ALTER TABLE Favoritos
DROP COLUMN fecha;

ALTER TABLE reportes RENAME TO reportes_usuario;

CREATE TABLE Direcciones (
    direccion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    calle VARCHAR(100),
    ciudad VARCHAR(100),
    codigo_postal VARCHAR(10)
);


ALTER TABLE Usuarios
ADD CONSTRAINT telefono_check CHECK (LENGTH(telefono) = 10);

ALTER TABLE Usuarios
DROP CONSTRAINT telefono_check;


-- eliminaciones 


DROP TABLE Sesiones;

DROP TABLE HistorialConsultas;

DROP TABLE RegistroNewUser;

