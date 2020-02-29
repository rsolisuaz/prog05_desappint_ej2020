DROP DATABASE IF EXISTS controlpeliculas;
CREATE DATABASE IF NOT EXISTS controlpeliculas DEFAULT CHARACTER SET utf8;
DROP USER IF EXISTS 'IngSW'@'localhost';
CREATE USER 'DesApp2020'@'localhost' IDENTIFIED BY 'UAZej2020';
GRANT ALL ON controlconcursos.* TO 'DesApp2020'@'localhost';

USE controlpeliculas;

-- -----------------------------------------------------
-- Tabla entidad
-- -----------------------------------------------------
DROP TABLE IF EXISTS entidad;

CREATE TABLE IF NOT EXISTS entidad (
  id_entidad SMALLINT NOT NULL,
  nombre_entidad VARCHAR(20) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (id_entidad))
  COMMENT = 'Catalogo de entidades';


-- -----------------------------------------------------
-- Tabla municipio
-- -----------------------------------------------------
DROP TABLE IF EXISTS municipio;

CREATE TABLE IF NOT EXISTS municipio (
  id_municipio INT NOT NULL,
  nombre_municipio VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  PRIMARY KEY (id_municipio))
  COMMENT = 'Catalogo de municipios';


-- -----------------------------------------------------
-- Tabla usuario
-- -----------------------------------------------------
DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS usuario (
  RFC CHAR(13) NOT NULL,
  nombre VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  ap_paterno VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  ap_materno VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  email VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  telefono CHAR(10) NOT NULL,
  calle VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  colonia VARCHAR(30) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NULL,
  id_municipio INT NULL,
  id_entidad SMALLINT NULL DEFAULT 32,
  codpostal INT NULL,
  PRIMARY KEY (RFC))
COMMENT = 'Información de usuarios a los que se presta películas';


-- -----------------------------------------------------
-- Tabla pelicula
-- -----------------------------------------------------
DROP TABLE IF EXISTS pelicula;

CREATE TABLE IF NOT EXISTS pelicula(
  id_pelicula INT NOT NULL AUTO_INCREMENT,
  titulo VARCHAR(255) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  fecha_estreno DATE NULL,
  duracion SMALLINT NULL,
  urlpelicula VARCHAR(255) NULL,
  urlimagen VARCHAR(255) NULL,
  fecha_compra DATE NULL,
  PRIMARY KEY (id_pelicula))
COMMENT = 'Información de películas coleccionadas';


-- -----------------------------------------------------
-- Tabla actor
-- -----------------------------------------------------
DROP TABLE IF EXISTS actor ;

CREATE TABLE IF NOT EXISTS actor (
  id_actor INT NOT NULL AUTO_INCREMENT,
  nombre_actor VARCHAR(75) CHARACTER SET 'utf8' COLLATE 'utf8_spanish_ci' NOT NULL,
  fecha_nacimiento DATE NULL,
  lugar_nacimiento VARCHAR(100) NULL,
  fecha_muerte DATE NULL,
  url_actor VARCHAR(255) NULL,
  url_imagen_actor VARCHAR(255) NULL,
  PRIMARY KEY (id_actor))
COMMENT = 'Información de actores';


-- -----------------------------------------------------
-- Tabla genero
-- -----------------------------------------------------
DROP TABLE IF EXISTS genero ;

CREATE TABLE IF NOT EXISTS genero (
  id_genero INT NOT NULL,
  nombre_genero VARCHAR(50) NOT NULL,
  PRIMARY KEY (id_genero))
COMMENT = 'Catalogo de generos';


-- -----------------------------------------------------
-- Tabla genero_pelicula
-- -----------------------------------------------------
DROP TABLE IF EXISTS genero_pelicula ;

CREATE TABLE IF NOT EXISTS genero_pelicula (
  id_generopelicula INT NOT NULL AUTO_INCREMENT,
  id_pelicula INT NOT NULL,
  id_genero INT NOT NULL,
  PRIMARY KEY (id_generopelicula))
COMMENT = 'generos a los que una pelicula pertenece';

CREATE INDEX index_genero_pelicula_por_pelicula ON genero_pelicula (id_pelicula ASC);
CREATE INDEX index_genero_pelicula_por_genero ON genero_pelicula (id_genero ASC);


-- -----------------------------------------------------
-- Tabla reparto
-- -----------------------------------------------------
DROP TABLE IF EXISTS reparto ;

CREATE TABLE IF NOT EXISTS reparto (
  id_reparto INT NOT NULL AUTO_INCREMENT,
  id_pelicula INT NOT NULL,
  id_actor INT NOT NULL,
  papel VARCHAR(75) NOT NULL,
  PRIMARY KEY (id_reparto))
COMMENT = 'reparto de las peliculas (que actores participan en cada una y que papel interpretan)';

CREATE INDEX index_reparto_por_pelicula ON reparto (id_pelicula ASC);
CREATE INDEX index_reparto_por_actor ON reparto (id_actor ASC);


-- -----------------------------------------------------
-- Tabla bitacora_prestamo
-- -----------------------------------------------------
DROP TABLE IF EXISTS bitacora_prestamo;

CREATE TABLE IF NOT EXISTS bitacora_prestamo (
  id_bitacora_prestamo INT NOT NULL AUTO_INCREMENT,
  RFC CHAR(13) NOT NULL,
  id_pelicula INT NOT NULL,
  fecha_prestamo DATE NOT NULL,
  fecha_retorno DATE NULL,
  PRIMARY KEY (id_bitacora_prestamo))
COMMENT = 'Relación de películas prestadas y a quien con sus fechas de préstamo y retorno';

CREATE INDEX index_bitacora_por_pelicula ON bitacora_prestamo (id_pelicula ASC);

CREATE INDEX index_bitacora_por_usuario ON bitacora_prestamo (RFC ASC);
