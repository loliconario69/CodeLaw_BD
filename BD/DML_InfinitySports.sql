LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Paises.csv' 
INTO TABLE paises 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Usuarios.csv' 
INTO TABLE usuarios 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Administradores.csv' 
INTO TABLE administradores 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Competicion.csv' 
INTO TABLE competicion 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Deporte.csv' 
INTO TABLE deporte 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Equipo.csv' 
INTO TABLE equipo 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Persona.csv' 
INTO TABLE persona 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Jugador.csv' 
INTO TABLE jugador 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Juez.csv' 
INTO TABLE juez 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Entrenador.csv' 
INTO TABLE entrenador 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/JugadorCompite.csv' 
INTO TABLE jugadorcompite 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/EquipoCompite.csv' 
INTO TABLE equipocompite 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/SeSuscribeParJugador.csv' 
INTO TABLE sesuscribeparjugador 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/SeSuscribeParEquipo.csv' 
INTO TABLE sesuscribeparequipo 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/SeSuscribeVariosJugadores.csv' 
INTO TABLE sesuscribevariosjugadores 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/PersonaPertenece.csv' 
INTO TABLE personapertenece 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Comp_de_deport.csv' 
INTO TABLE comp_de_deport 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/EquipoPertenece.csv' 
INTO TABLE equipopertenece 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/J_pertenece_E.csv' 
INTO TABLE j_pertenece_e 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Juez_ParJugador.csv' 
INTO TABLE juez_parjugador 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Juez_ParEquipo.csv' 
INTO TABLE juez_parequipo 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Juez_VariosJugadores.csv' 
INTO TABLE juez_variosjugadores 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Entrenador_Jugador.csv' 
INTO TABLE entrenador_jugador 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/Entrenador_Equipo.csv' 
INTO TABLE entrenador_equipo 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/JugadoresParticipan.csv' 
INTO TABLE jugadoresparticipan 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/EquiposParticipan.csv' 
INTO TABLE equiposparticipan 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'D:/Users/Loliconario/Desktop/CodeLaw_BD_y_SO/BD/CSV/JugadorParticipa.csv' 
INTO TABLE jugadorparticipa 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;