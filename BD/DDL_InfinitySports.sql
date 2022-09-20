DROP DATABASE IF EXISTS InfinitySports;
CREATE DATABASE InfinitySports CHARSET utf8mb4;
USE InfinitySports;


# ENTIDADES--------------------------------
CREATE TABLE Usuario (
  Id int unsigned auto_increment,
  Nombre varchar(30) not null,
  Email varchar(30) not null unique,
  Contrasena varchar(100) not null,
  Telefono int(10) unsigned not null ,
  EsPremium bool not null,
  Modo bool not null,
  PRIMARY KEY (Id)
);
CREATE TABLE Administrador (
	Id int unsigned auto_increment,
    Email varchar(30) not null unique,
    Contrasena varchar(100) not null,
    Tipo bool not null,
    PRIMARY KEY (Id)
);

CREATE TABLE Publicidad (
	Id int unsigned auto_increment,
	Grupo varchar(15) not null,
    Descripcion varchar(100) not null,
    Imagen varchar(255) not null,
    Tipo tinyint not null,
    PRIMARY KEY (Id)
);

CREATE TABLE Competencia (
	Id int unsigned auto_increment,
    Nombre varchar(30) not null,
    Lugar varchar(30) not null,
    Imagen varchar(255),
    FechaInicio date not null,
    FechaFin date not null,
    PRIMARY KEY (Id)
);
CREATE TABLE Etapa (
	IdCompetencia int unsigned,
    Nombre varchar(30) not null,
    Lugar varchar(50) not null,
    PRIMARY KEY (IdCompetencia,Nombre),
    FOREIGN KEY (IdCompetencia) REFERENCES Competencia(Id)
);
    
CREATE TABLE Deporte (
	Id mediumint unsigned auto_increment,
    Nombre varchar(30) not null,
    Imagen varchar(255),
    PRIMARY KEY (Id)
);

CREATE TABLE Juez (
	Id int unsigned auto_increment,
    PrimerNombre varchar(15) not null,
    SegundoNombre varchar(15),
    PrimerApellido varchar(15) not null,
    SegundoApellido varchar(15),
    PRIMARY KEY (Id)
);

CREATE TABLE Encuentro (
	Id int unsigned auto_increment,
    Nombre varchar(30) not null,
    Fecha datetime not null,
    Lugar varchar(30),
    PRIMARY KEY (Id)
);

CREATE TABLE Equipo (
	Id int unsigned auto_increment,
    Nombre varchar(60) not null,
    Imagen varchar(255),
    Pais varchar(20) not null,
    FechaCreacion date,
    PRIMARY KEY (Id)
);
CREATE TABLE Deportista (
	Id int unsigned auto_increment,
    PrimerNombre varchar(15) not null,
    SegundoNombre varchar(15),
    PrimerApellido varchar(15) not null,
    SegundoApellido varchar(15),
    Imagen varchar(255),
    Pais varchar(20) not null,
    FechaDeNacimiento date,
    PRIMARY KEY (Id)
);
# RELACIONES ----------------------------------------

CREATE TABLE UconsumeP (
	IdUsuario int unsigned,
    IdPublicidad int unsigned,
    PRIMARY KEY (IdUsuario,IdPublicidad),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdPublicidad) REFERENCES Publicidad(Id) ON DELETE CASCADE
);
    
CREATE TABLE UsuscribeD (
	IdUsuario int unsigned,
    IdDeportista int unsigned,
    PRIMARY KEY (IdUsuario,IdDeportista),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdDeportista) REFERENCES Deportista(Id) ON DELETE CASCADE
);
CREATE TABLE UsuscribeEq (
	IdUsuario int unsigned,
    IdEquipo int unsigned,
    PRIMARY KEY (IdUsuario,IdEquipo),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEquipo) REFERENCES Equipo(Id) ON DELETE CASCADE
);

CREATE TABLE UsuscribeEn (
	IdUsuario int unsigned,
    IdEncuentro int unsigned,
    PRIMARY KEY (IdUsuario,IdEncuentro),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id) ON DELETE CASCADE
);

CREATE TABLE UsuscribeC (
	IdUsuario int unsigned,
    IdCompetencia int unsigned,
    PRIMARY KEY (IdUsuario,IdCompetencia),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdCompetencia) REFERENCES Competencia(Id) ON DELETE CASCADE
);

CREATE TABLE SePracticaDeporte (
	IdCompetencia int unsigned,
    Nombre varchar(30),
    IdDeporte mediumint unsigned,
    PRIMARY KEY (IdCompetencia,Nombre,IdDeporte),
    FOREIGN KEY (IdCompetencia,Nombre) REFERENCES Etapa(IdCompetencia,Nombre) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdDeporte) REFERENCES Deporte(Id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE EcontieneE (
	IdCompetencia int unsigned,
    NombreEtapa varchar(30),
    IdEncuentro int unsigned,
    PRIMARY KEY (IdCompetencia,NombreEtapa,IdEncuentro),
    FOREIGN KEY (IdCompetencia,NombreEtapa) REFERENCES Etapa(IdCompetencia,Nombre) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id) ON DELETE CASCADE
);

CREATE TABLE EtieneJ (
	IdEncuentro int unsigned,
    IdJuez int unsigned,
    PRIMARY KEY (IdEncuentro,IdJuez),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdJuez) REFERENCES Juez(Id) ON DELETE CASCADE
);

CREATE TABLE DintegraE (
	IdDeportista int unsigned,
    IdEquipo int unsigned,
    posicion varchar(30),
    PRIMARY KEY (IdDeportista,IdEquipo),
    FOREIGN KEY (IdDeportista) REFERENCES Deportista(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEquipo) REFERENCES Equipo(Id) ON DELETE CASCADE
);

CREATE TABLE ParticipaEn (
	IdDeportista int unsigned,
    IdEquipo int unsigned,
    IdEncuentro int unsigned,
    Tiempo time,
    Puntaje int,
    PRIMARY KEY (IdDeportista,IdEquipo,IdEncuentro),
    FOREIGN KEY (IdDeportista) REFERENCES Deportista(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEquipo) REFERENCES Equipo(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id) ON DELETE CASCADE
);

CREATE TABLE EparticipaEn (
    IdEquipo int unsigned,
    IdEncuentro int unsigned,
    Puntaje int,
    PRIMARY KEY (IdEquipo,IdEncuentro),
    FOREIGN KEY (IdEquipo) REFERENCES Equipo(Id) ON DELETE CASCADE,
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id) ON DELETE CASCADE
);


# TRIGGERS ----------------------------------------

DELIMITER $$

CREATE TRIGGER UsuscribeD_Premium
BEFORE INSERT ON ususcribed
FOR EACH ROW
BEGIN

DECLARE Premium bool;
SELECT EsPremium INTO Premium FROM usuario WHERE Id = NEW.IdUsuario;

IF(Premium = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No eres premium, no te puedes suscribir';
    END IF;
END$$

CREATE TRIGGER UsuscribeEq_Premium
BEFORE INSERT ON ususcribeeq
FOR EACH ROW
BEGIN

DECLARE Premium bool;
SELECT EsPremium INTO Premium FROM usuario WHERE Id = NEW.IdUsuario;

IF(Premium = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No eres premium, no te puedes suscribir';
    END IF;
END$$

CREATE TRIGGER UsuscribeEn_Premium
BEFORE INSERT ON ususcribeen
FOR EACH ROW
BEGIN

DECLARE Premium bool;
SELECT EsPremium INTO Premium FROM usuario WHERE Id = NEW.IdUsuario;

IF(Premium = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No eres premium, no te puedes suscribir';
    END IF;
END$$

CREATE TRIGGER UsuscribeC_Premium
BEFORE INSERT ON ususcribec
FOR EACH ROW
BEGIN

DECLARE Premium bool;
SELECT EsPremium INTO Premium FROM usuario WHERE Id = NEW.IdUsuario;

IF(Premium = 0) THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'No eres premium, no te puedes suscribir';
    END IF;
END$$

/*
CREATE TRIGGER VerificarFechaEncuentro
BEFORE INSERT ON encuentro
FOR EACH ROW
BEGIN

IF !(NEW.Fecha between (select FechaInicio from competencia) AND (select FechaFin from competencia)) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'Fuera de rango de fechas';
END IF;
END$$
*/

CREATE TRIGGER VerificarFechaCompetencia
BEFORE INSERT ON competencia
FOR EACH ROW
BEGIN

IF (NEW.FechaInicio >= NEW.FechaFin) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'FechaInicio no puede ser mayor a FechaFin';
END IF;
END$$

CREATE TRIGGER VerificarExistenciaDeEquipo
BEFORE INSERT ON EparticipaEn
FOR EACH ROW
BEGIN

IF (NEW.IdEquipo not in (select p.IdEquipo from ParticipaEn p WHERE p.IdEncuentro = NEW.IdEncuentro AND p.IdEquipo = NEW.IdEquipo)) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'El equipo no existe en ParticipaEn';
END IF;

END$$

CREATE TRIGGER VerificarIntegracionDeDeportistaEnEquipo
BEFORE INSERT ON participaen
FOR EACH ROW
BEGIN

IF (select exists(select IdDeportista,IdEquipo from dintegrae WHERE IdDeportista = NEW.IdDeportista and IdEquipo = NEW.IdEquipo) = 0) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'El deportista no integra el equipo';
END IF;

END$$

CREATE TRIGGER VerificarExistenciaDePuntajeEquipo
BEFORE INSERT ON eparticipaen
FOR EACH ROW
BEGIN

IF (select exists(select IdEquipo from eparticipaen WHERE IdEquipo = NEW.IdEquipo AND IdEncuentro = NEW.IdEncuentro) = 1) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'El equipo ya cuenta con un puntaje';
END IF;

END$$

CREATE TRIGGER VerificarExistenciaDeEncuentroEnEtapa
BEFORE INSERT ON econtienee
FOR EACH ROW
BEGIN

IF (select exists(select IdEncuentro from econtienee WHERE IdEncuentro = NEW.IdEncuentro) = 1) THEN
           SIGNAL SQLSTATE '45000'
		   SET MESSAGE_TEXT = 'El encuentro ya existe';
END IF;

END$$

CREATE TRIGGER VerificarExistenciaDeParticipantes
AFTER DELETE ON participaen
FOR EACH ROW
BEGIN

IF (select IdDeportista from ParticipaEn WHERE IdEncuentro = OLD.IdEncuentro AND IdEquipo = OLD.IdEquipo AND IdDeportista = OLD.IdDeportista )IS NULL THEN
           DELETE FROM eparticipaen WHERE IdEncuentro = OLD.IdEncuentro AND IdEquipo = OLD.IdEquipo;
END IF;

END$$

DELIMITER ;



