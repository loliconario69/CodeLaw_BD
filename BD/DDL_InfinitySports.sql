DROP DATABASE IF EXISTS InfinitySports;
CREATE DATABASE InfinitySports CHARSET utf8mb4;
USE InfinitySports;


CREATE TABLE `Paises` (
  `Nombre` varchar(15) not null,
  `Ciudad` varchar(20) not null,
  PRIMARY KEY (`Nombre`, `Ciudad`)
);

#---------------ENTIDADES------------------#
CREATE TABLE `Publicidad` (
  `Nombre` varchar(20) not null,
  `URL` varchar(100) not null,
  PRIMARY KEY (`Nombre`)
);

CREATE TABLE `Usuarios` (
  `Email` varchar(20),
  `Nombre` varchar(20) not null,
  `Apellido` varchar(20) not null,
  `Contrasenia` varchar(50) not null,
  `TipoDeCuenta` ENUM ('Normal', 'Premium') not null,
  PRIMARY KEY (`Email`)
);
CREATE TABLE `Administradores` (
  `Email` varchar(20),
  `Nombre` varchar(20) not null,
  `Apellido` varchar(20) not null,
  `Contrasenia` varchar(50) not null,
  `Rol` ENUM ('Funcionario', 'Administrador') not null,
  PRIMARY KEY (`Email`)
);

CREATE TABLE `Competicion` (
  `Id` int unsigned auto_increment,
  `Nombre` varchar(30) not null,
  `Etapa` varchar(30) not null,
  `FechaInicio` datetime not null,
  `FechaFin` datetime not null,
  `Ubicacion` varchar(40)  not null,
  `Conformacion` ENUM ('ParJugador', 'ParEquipo', 'VariosJugadores') not null,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `Deporte` (
  `Nombre` varchar(20),
  `Descripcion` varchar(100) not null,
  PRIMARY KEY (`Nombre`)
);

CREATE TABLE `Equipo` (
  `Id` int unsigned auto_increment,
  `Nombre` varchar(20),
  `Pais` varchar(15) not null,
  `Ciudad` varchar(20) not null,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Pais`, `Ciudad`) REFERENCES `Paises` (`Nombre`, `Ciudad`)
);

CREATE TABLE `Persona` (
  `Id` int unsigned auto_increment,
  `PrimerNombre` varchar(15) not null,
  `SegundoNombre` varchar(15),
  `PrimerApellido` varchar(15) not null,
  `SegundoApellido` varchar(15),
  `FechaNacimiento` date  not null,
  `Pais` varchar(15) not null,
  `Ciudad` varchar(20) not null,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Pais`, `Ciudad`) REFERENCES `Paises` (`Nombre`, `Ciudad`)
);

CREATE TABLE `Jugador` (
  `Id` int unsigned,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id`) REFERENCES `Persona` (`Id`) ON DELETE CASCADE
);
CREATE TABLE `Juez` (
  `Id` int unsigned,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id`) REFERENCES `Persona` (`Id`)  ON DELETE CASCADE
);
CREATE TABLE `Entrenador` (
  `Id` int unsigned,
  PRIMARY KEY (`Id`),
  FOREIGN KEY (`Id`) REFERENCES `Persona` (`Id`)  ON DELETE CASCADE
);

#---------------RELACIONES------------------#

CREATE TABLE `JugadorCompite` (
  `IdJugador1` int unsigned,
  `IdJugador2` int unsigned,
  `Fecha` datetime,
  `PuntosJugador1` varchar(10),
  `PuntosJugador2` varchar(10),
  PRIMARY KEY (`IdJugador1`, `IdJugador2`, `Fecha`),
  FOREIGN KEY (`IdJugador1`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdJugador2`) REFERENCES `Jugador` (`Id`)
);
CREATE TABLE `EquipoCompite` (
  `IdEquipo1` int unsigned,
  `IdEquipo2` int unsigned,
  `Fecha` datetime,
  `PuntosEquipo1` varchar(10),
  `PuntosEquipo2` varchar(10),
  PRIMARY KEY (`IdEquipo1`, `IdEquipo2`, `Fecha`),
  FOREIGN KEY (`IdEquipo1`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdEquipo2`) REFERENCES `Equipo` (`Id`)
);

CREATE TABLE `SeSuscribeParJugador` (
  `EmailUsuario` varchar(20),
  `IdJugador1` int unsigned,
  `IdJugador2` int unsigned,
  `Fecha` datetime,
  PRIMARY KEY (`EmailUsuario`, `IdJugador1`, `IdJugador2`, `Fecha`),
  FOREIGN KEY (`EmailUsuario`) REFERENCES `Usuarios` (`Email`) ON DELETE CASCADE,
  FOREIGN KEY (`IdJugador1`,`IdJugador2`,`Fecha`) REFERENCES `jugadorcompite` (`IdJugador1`,`IdJugador2`,`Fecha`)
);
CREATE TABLE `SeSuscribeParEquipo` (
  `EmailUsuario` varchar(20),
  `IdEquipo1` int unsigned,
  `IdEquipo2` int unsigned,
  `Fecha` datetime,
  PRIMARY KEY (`EmailUsuario`, `IdEquipo1`, `IdEquipo2`, `Fecha`),
  FOREIGN KEY (`EmailUsuario`) REFERENCES `Usuarios` (`Email`) ON DELETE CASCADE,
  FOREIGN KEY (`IdEquipo1`,`IdEquipo2`,`Fecha`) REFERENCES `equipocompite` (`IdEquipo1`,`IdEquipo2`,`Fecha`)
);
CREATE TABLE `SeSuscribeVariosJugadores` (
  `EmailUsuario` varchar(20),
  `IdComp` int unsigned,
  PRIMARY KEY (`EmailUsuario`, `IdComp`),
  FOREIGN KEY (`EmailUsuario`) REFERENCES `Usuarios` (`Email`) ON DELETE CASCADE,
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`)
);

CREATE TABLE `PersonaPertenece` (
  `IdPersona` int unsigned,
  `Deporte` varchar(20),
  PRIMARY KEY (`IdPersona`, `Deporte`),
  FOREIGN KEY (`IdPersona`) REFERENCES `Persona` (`Id`) ON DELETE CASCADE,
  FOREIGN KEY (`Deporte`) REFERENCES `Deporte` (`Nombre`) ON DELETE CASCADE
);
CREATE TABLE `Comp_de_deport` (
  `Deporte` varchar(20),
  `IdComp` int unsigned,
  PRIMARY KEY (`Deporte`, `IdComp`),
  FOREIGN KEY (`Deporte`) REFERENCES `Deporte` (`Nombre`) ON DELETE CASCADE,
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`) ON DELETE CASCADE
);
CREATE TABLE `EquipoPertenece` (
  `IdEquipo` int unsigned,
  `Deporte` varchar(20),
  PRIMARY KEY (`IdEquipo`, `Deporte`),
  FOREIGN KEY (`IdEquipo`) REFERENCES `Equipo` (`Id`) ON DELETE CASCADE,
  FOREIGN KEY (`Deporte`) REFERENCES `Deporte` (`Nombre`) ON DELETE CASCADE
);

CREATE TABLE `J_pertenece_E` (
  `IdJugador` int unsigned,
  `IdEquipo` int unsigned,
  `posicion` varchar(20),
  PRIMARY KEY (`IdJugador`, `IdEquipo`),
  FOREIGN KEY (`IdJugador`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdEquipo`) REFERENCES `Equipo` (`Id`) ON DELETE CASCADE
);

CREATE TABLE `Juez_ParJugador` (
  `IdJugador1` int unsigned,
  `IdJugador2` int unsigned,
  `IdJuez` int unsigned,
  PRIMARY KEY (`IdJugador1`, `IdJugador2`, `IdJuez`),
  FOREIGN KEY (`IdJugador1`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdJugador2`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdJuez`) REFERENCES `Juez` (`Id`) ON DELETE CASCADE
  );
CREATE TABLE `Juez_ParEquipo` (
  `IdEquipo1` int unsigned,
  `IdEquipo2` int unsigned,
  `IdJuez` int unsigned,
  PRIMARY KEY (`IdEquipo1`, `IdEquipo2`, `IdJuez`),
  FOREIGN KEY (`IdEquipo1`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdEquipo2`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdJuez`) REFERENCES `Juez` (`Id`) ON DELETE CASCADE
  );
CREATE TABLE `Juez_VariosJugadores` (
  `IdJuez` int unsigned,
  `IdComp` int unsigned,
  PRIMARY KEY (`IdJuez`, `IdComp`),
  FOREIGN KEY (`IdJuez`) REFERENCES `Juez` (`Id`),
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`) ON DELETE CASCADE
);  

CREATE TABLE `Entrenador_Jugador` (
  `IdJugador` int unsigned,
  `IdEntrenador` int unsigned,
  PRIMARY KEY (`IdJugador`, `IdEntrenador`),
  FOREIGN KEY (`IdJugador`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdEntrenador`) REFERENCES `Entrenador` (`Id`) ON DELETE CASCADE
);
CREATE TABLE `Entrenador_Equipo` (
  `IdEquipo` int unsigned,
  `IdEntrenador` int unsigned,
  PRIMARY KEY (`IdEquipo`, `IdEntrenador`),
  FOREIGN KEY (`IdEquipo`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdEntrenador`) REFERENCES `Entrenador` (`Id`) ON DELETE CASCADE
); 

CREATE TABLE `JugadoresParticipan` (
  `IdJugador1` int unsigned,
  `IdJugador2` int unsigned,
  `IdComp` int unsigned,
  PRIMARY KEY (`IdJugador1`, `IdJugador2`, `IdComp`),
  FOREIGN KEY (`IdJugador1`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdJugador2`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`) ON DELETE CASCADE
);
CREATE TABLE `JugadorParticipa` (
  `IdJugador` int unsigned,
  `IdComp` int unsigned,
  `Puntos` varchar(10),
  PRIMARY KEY (`IdJugador`, `IdComp`),
  FOREIGN KEY (`IdJugador`) REFERENCES `Jugador` (`Id`),
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`) ON DELETE CASCADE
);
CREATE TABLE `EquiposParticipan` (
  `IdEquipo1` int unsigned,
  `IdEquipo2` int unsigned,
  `IdComp` int unsigned,
  PRIMARY KEY (`IdEquipo1`, `IdEquipo2`, `IdComp`),
  FOREIGN KEY (`IdEquipo1`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdEquipo2`) REFERENCES `Equipo` (`Id`),
  FOREIGN KEY (`IdComp`) REFERENCES `Competicion` (`Id`) ON DELETE CASCADE
);



DELIMITER $$
CREATE TRIGGER comp_de_deport_BorrarCompetencia
AFTER DELETE ON comp_de_deport
FOR EACH ROW
BEGIN
	DELETE FROM competicion WHERE
		Id = OLD.idComp;
END$$

CREATE TRIGGER PersonaPertenece_BorrarJugador
AFTER DELETE ON personapertenece
FOR EACH ROW
BEGIN
	DELETE FROM persona WHERE
		Id = OLD.IdPersona;
END$$

CREATE TRIGGER EquipoPertenece_BorrarEquipo
AFTER DELETE ON equipopertenece
FOR EACH ROW
BEGIN
	DELETE FROM equipo WHERE
		Id = OLD.IdEquipo;
END$$
DELIMITER ;