-- Dig de base de datos relacional 


--1  Crear la tabla de Usuarios
CREATE TABLE Usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    semilla VARCHAR(20) UNIQUE NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    id_unico VARCHAR(10) UNIQUE NOT NULL
);
ALTER TABLE Usuarios ALTER COLUMN id_unico TYPE VARCHAR(20) UNIQUE NOT NULL;


-- describe Usuarios
-- drop Usuarios

-- 2 Selecciones del usuario la tabla de Configuraciones

CREATE TABLE Configuraciones (
    configuracion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    motor_busqueda VARCHAR(50), -- Por ejemplo: Google, Bing, DuckDuckGo, etc.
    otras_preferencias TEXT
);


CREATE TABLE usuarioseed (
    usuarioseed_id SERIAL PRIMARY KEY,
    nombreseed VARCHAR(50)

);

INSERT INTO usuarioseed (nombreseed) VALUES ('Datos de Usuario 1');
INSERT INTO usuarioseed (nombreseed) VALUES ('Datos de Usuario 2');
INSERT INTO usuarioseed (nombreseed) VALUES ('Datos de Usuario 3');


CREATE TABLE cfgseedUsuario (
    cfgseed_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES usuarioseed(usuarioseed_id) ON DELETE CASCADE GENERATED ALWAYS AS IDENTITY,
    motor_busqueda VARCHAR(50),
    nombreperfil VARCHAR(50),
    imgperfil VARCHAR(100),
    notificaciones BOOLEAN,
    tipodeseleccion VARCHAR(50)
);

ALTER TABLE cfgseedUsuario
    ALTER COLUMN imgperfil TYPE VARCHAR(300);


INSERT INTO cfgseedUsuario (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion) 
VALUES ('Google', 'Perfil de Usuario 1', 'imagen1.jpg', true, 'Opción A');

INSERT INTO cfgseedUsuario (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion) 
VALUES ('Bing', 'Perfil de Usuario 2', 'imagen2.jpg', false, 'Opción B');

INSERT INTO cfgseedUsuario (motor_busqueda, nombreperfil, imgperfil, notificaciones, tipodeseleccion) 
VALUES ('DuckDuckGo', 'Perfil de Usuario 3', 'imagen3.jpg', true, 'Opción C');

-- Describe Configuraciones

-- ALTER TABLE Configuraciones
--    ADD COLUMN nombreperfil VARCHAR(50),
--    ADD COLUMN imgperfil VARCHAR(100),
--    DROP COLUMN otras_preferencias,
--    ADD COLUMN notificaciones BOOLEAN,
--    ADD COLUMN tipodeseleccion VARCHAR(50);


-- describe Configuraciones


-- 3 Crear la tabla de Historial de Búsquedas
CREATE TABLE HistorialBusquedas (
    historial_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    texto_busqueda VARCHAR(200),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 4 Crear la tabla de Favoritos
CREATE TABLE favoritos (
    favorito_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    articulo_id INT REFERENCES ArticulosReferencia(articulo_id) ON DELETE CASCADE,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 5 Crear la tabla de Historial de Consultas
CREATE TABLE HistorialConsultas (
    consulta_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    articulo_id INT REFERENCES ArticulosReferencia(articulo_id) ON DELETE CASCADE,
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6 Crear la tabla de Reportes
CREATE TABLE reportes (
    reporte_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    contenido TEXT, -- Detalles del reporte exportado
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 7 Crear la tabla de Recuperación de Cuenta
CREATE TABLE RecuperacionCuenta (
    recuperacion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    id_unico VARCHAR(10) NOT NULL,
    token_recuperacion VARCHAR(100) UNIQUE NOT NULL,
    fecha_solicitud TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion TIMESTAMP NOT NULL
);


-- 8 Crear la tabla de Sesiones
CREATE TABLE Sesiones (
    sesion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE,
    token_sesion VARCHAR(100) UNIQUE NOT NULL,
    fecha_inicio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    fecha_expiracion TIMESTAMP NOT NULL
);


-- 9 Crear la tabla de Artículos de Referencia (necesaria para las relaciones)
CREATE TABLE ArticulosReferencia (
    articulo_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200) NOT NULL,
    contenido TEXT NOT NULL,
    autor VARCHAR(100) NOT NULL,
    fecha_publicacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


-- 10 Crear la tabla de LoginUsuario
CREATE TABLE LoginUsuario (
    login_id SERIAL PRIMARY KEY,
    nombre_o_semilla VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE
);

INSERT INTO LoginUsuario (nombre_o_semilla, contrasena, usuario_id)
VALUES ('exampleUser', 'examplePassword', 1);

--- 11 registroUsuarios 
CREATE TABLE RegistroNewUser (
    registro_id SERIAL PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(25) NOT NULL,
    contrasena VARCHAR(100) NOT NULL
);


ALTER TABLE RegistroNewUser
ADD COLUMN usuario_id SERIAL,
ADD CONSTRAINT fk_usuario_id FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id) ON DELETE CASCADE ON UPDATE NO ACTION;

-- Insert into Usuarios table first to get the usuario_id
WITH new_user AS (
    INSERT INTO Usuarios (nombre, apellido, email, telefono, contrasena)
    VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', 'securePassword123')
    RETURNING usuario_id
)
-- Use the returned usuario_id to insert into RegistroNewUser
INSERT INTO RegistroNewUser (nombre, apellido, email, telefono, contrasena, usuario_id)
SELECT 'John', 'Doe', 'john.doe@example.com', '1234567890', 'securePassword123', usuario_id
FROM new_user;


WITH auto_insert AS (
    INSERT INTO Usuarios (nombre, apellido, email, telefono, semilla, contrasena, id_unico)
    VALUES ('John', 'Doe', 'john.doe@example.com', '1234567890', '0', 'securePassword123', 222)
    RETURNing usuario_id
)
-- Use the returned usuario_id to insert into RegistroNewUser
INSERT INTO RegistroNewUser (nombre, apellido, email, telefono, contrasena, usuario_id)
SELECT 'John', 'Doe', 'john.doe@example.com', '1234567890', 'securePassword123', usuario_id
FROM auto_insert;

-- describe RegistroNewUser
-- complementer of segment... 

ALTER TABLE RegistroNewUser
ADD COLUMN usuario_id INT REFERENCES Usuarios(usuario_id) ON DELETE CASCADE;


INSERT INTO RegistroNewUser (nombre, apellido, email, telefono, contrasena)
VALUES ('Alice', 'Smith', 'alice.smith@example.com', '9876543210', 'alicePassword123');

--- updateDatabase on Postgresql
