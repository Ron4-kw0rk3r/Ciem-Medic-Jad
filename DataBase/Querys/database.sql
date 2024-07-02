-- Crear la tabla de Usuarios
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

-- Crear la tabla de Artículos de Referencia
CREATE TABLE ArticulosReferencia (
    articulo_id SERIAL PRIMARY KEY,
    titulo VARCHAR(200),
    contenido TEXT,
    tipo_articulo VARCHAR(50), -- Por ejemplo: síntoma, enfermedad, tratamiento, etc.
    medico_id INT REFERENCES Usuarios(usuario_id)
);

-- Crear la tabla de Configuraciones
CREATE TABLE Configuraciones (
    configuracion_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id),
    motor_busqueda VARCHAR(50), -- Por ejemplo: Google, Bing, DuckDuckGo, etc.
    otras_preferencias TEXT
);

-- Crear la tabla de Historial de Búsquedas
CREATE TABLE HistorialBusquedas (
    historial_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id),
    texto_busqueda VARCHAR(200),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de Favoritos
CREATE TABLE Favoritos (
    favorito_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id),
    articulo_id INT REFERENCES ArticulosReferencia(articulo_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de Historial de Consultas (consultas realizadas)
CREATE TABLE HistorialConsultas (
    consulta_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id),
    articulo_id INT REFERENCES ArticulosReferencia(articulo_id),
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Crear la tabla de Reportes
CREATE TABLE Reportes (
    reporte_id SERIAL PRIMARY KEY,
    usuario_id INT REFERENCES Usuarios(usuario_id),
    contenido TEXT, -- Detalles del reporte exportado
    fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
