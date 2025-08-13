CREATE DATABASE IF NOT EXISTS proyectoasistencia DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


-- ==============================
-- Tabla de usuarios
-- ==============================
CREATE TABLE usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    turno VARCHAR(50) NOT NULL,
    correo VARCHAR(100) DEFAULT NULL,
    password VARCHAR(255) DEFAULT NULL, -- opcional si luego agregas login
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

-- ==============================
-- Tabla de asistencias
-- ==============================
CREATE TABLE asistencias (
    id_asistencia INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha DATE NOT NULL,
    hora_entrada TIME DEFAULT NULL,
    foto_entrada VARCHAR(255) DEFAULT NULL, -- ruta de la foto de entrada
    hora_salida TIME DEFAULT NULL,
    foto_salida VARCHAR(255) DEFAULT NULL,  -- ruta de la foto de salida
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
      ON DELETE CASCADE
) ENGINE=InnoDB;

-- ==============================
-- Tabla de justificantes
-- ==============================
CREATE TABLE justificantes (
    id_justificante INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    fecha_ausencia DATE NOT NULL,
    archivo VARCHAR(255) NOT NULL, -- ruta del PDF o imagen
    estado ENUM('pendiente','aprobada','rechazada') DEFAULT 'pendiente',
    comentario_admin TEXT DEFAULT NULL,
    creado_en TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
      ON DELETE CASCADE
) ENGINE=InnoDB;
