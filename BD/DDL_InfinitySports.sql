DROP DATABASE IF EXISTS InfinitySports;
CREATE DATABASE InfinitySports CHARSET utf8mb4;
USE InfinitySports;


# ENTIDADES--------------------------------
CREATE TABLE Usuario (
  Id int unsigned auto_increment,
  Nombre varchar(30) not null,
  Email varchar(30),
  Contrasenia varchar(100) not null,
  Telefono smallint not null, # ---------------Telefono?
  EsPremium bool not null,
  PRIMARY KEY (Id)
);
CREATE TABLE Administrador ( # -------NO DEBERIA SER UNA SOLA TABLA?
	Id int unsigned auto_increment,
    Contraseña varchar(100) not null,
    Tipo bool not null,
    PRIMARY KEY (Id)
);
CREATE TABLE EmailAdministador (
	IdAdministrador int unsigned,
    Email varchar(30) not null,
    PRIMARY KEY (IdAdministrador),
    FOREIGN KEY (IdAdministrador) REFERENCES Administrador(Id)
);
CREATE TABLE Publicidad (
	Id int unsigned auto_increment,
	Grupo varchar(15) not null,
    Descripcion varchar(100) not null,
    Imagen varchar(255) not null,
    Tipo varchar(20) not null,       #-----------¿QUE ES?-------
    PRIMARY KEY (Id)
);

CREATE TABLE Competencia (
	Id int unsigned auto_increment,
    Nombre varchar(30) not null,
    Lugar varchar(30),
    Tipo varchar(20) not null, #-----------Tipo?
    Imagen varchar(255),
    FechaInicio date not null,  #-----------------Agregé fecha inicio y fin
    FechaFin date not null,
    PRIMARY KEY (Id)
);
CREATE TABLE Etapa (
	IdCompetencia int unsigned,
    Nombre varchar(30) not null,
    Lugar varchar(30) not null,
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
    Nombre varchar(60) not null, # ---------Atributo compuesto?
    PRIMARY KEY (Id)
);

CREATE TABLE Encuentro (
	Id int unsigned auto_increment,
    Fecha datetime not null, # ---------Corrección de MR encuentro
    Lugar varchar(30),
    PRIMARY KEY (Id)
);

CREATE TABLE Contendiente (
	Id int unsigned auto_increment,
    Imagen varchar(255),
    Pais varchar(20) not null,
    FechaDeNacimiento date,
    PRIMARY KEY (Id)
);

CREATE TABLE Resultado (
	IdContendiente int unsigned,
	IdEncuentro int unsigned,
    Tiempo time,
    Puntaje mediumint,
    PRIMARY KEY (IdContendiente,IdEncuentro),
    FOREIGN KEY (IdContendiente) REFERENCES Contendiente(Id),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id)
);
CREATE TABLE Equipo (
	IdContendiente int unsigned,
    Nombre varchar(30) not null,
    PRIMARY KEY (IdContendiente),
    FOREIGN KEY (IdContendiente) REFERENCES Contendiente(Id)
);
CREATE TABLE Deportista (
	IdContendiente int unsigned,
    PrimerNombre varchar(15) not null,
    SegundoNombre varchar(15),
    PrimerApellido varchar(15) not null,
    SegundoApellido varchar(15),
    PRIMARY KEY (IdContendiente),
    FOREIGN KEY (IdContendiente) REFERENCES Contendiente(Id)
);

# RELACIONES ----------------------------------------

CREATE TABLE UconsumeP (
	IdUsuario int unsigned,
    IdPublicidad int unsigned,
    PRIMARY KEY (IdUsuario,IdPublicidad),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdPublicidad) REFERENCES Publicidad(Id)
);
    
CREATE TABLE UsuscribeD (
	IdUsuario int unsigned,
    IdDeportista int unsigned,
    PRIMARY KEY (IdUsuario,IdDeportista),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdDeportista) REFERENCES Deportista(IdContendiente)
);
CREATE TABLE UsuscribeEq (
	IdUsuario int unsigned,
    IdEquipo int unsigned,
    PRIMARY KEY (IdUsuario,IdEquipo),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdEquipo) REFERENCES Equipo(IdContendiente)
);

CREATE TABLE UsuscribeEn (
	IdUsuario int unsigned,
    IdEncuentro int unsigned,
    PRIMARY KEY (IdUsuario,IdEncuentro),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id)
);

CREATE TABLE UsuscribeC (
	IdUsuario int unsigned,
    IdCompetencia int unsigned,
    PRIMARY KEY (IdUsuario,IdCompetencia),
    FOREIGN KEY (IdUsuario) REFERENCES Usuario(Id),
    FOREIGN KEY (IdCompetencia) REFERENCES Competencia(Id)
);

CREATE TABLE SePracticaDeporte (
	IdCompetencia int unsigned,
    Nombre varchar(30),
    IdDeporte mediumint unsigned,
    PRIMARY KEY (IdCompetencia,Nombre,IdDeporte),
    FOREIGN KEY (IdCompetencia,Nombre) REFERENCES Etapa(IdCompetencia,Nombre),
    FOREIGN KEY (IdDeporte) REFERENCES Deporte(Id)
);

CREATE TABLE EcontieneE (
	IdCompetencia int unsigned,
    NombreEtapa varchar(30),
    IdEncuentro int unsigned,
    PRIMARY KEY (IdCompetencia,NombreEtapa,IdEncuentro),
    FOREIGN KEY (IdCompetencia,NombreEtapa) REFERENCES Etapa(IdCompetencia,Nombre),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id)
);

CREATE TABLE EtieneJ (
	IdEncuentro int unsigned,
    IdJuez int unsigned,
    PRIMARY KEY (IdEncuentro,IdJuez),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id),
    FOREIGN KEY (IdJuez) REFERENCES Juez(Id)
);

CREATE TABLE CparticipaE (
	IdContendiente int unsigned,
    IdEncuentro int unsigned,
    PRIMARY KEY (IdContendiente,IdEncuentro),
    FOREIGN KEY (IdContendiente) REFERENCES Contendiente(Id),
    FOREIGN KEY (IdEncuentro) REFERENCES Encuentro(Id)
);


















