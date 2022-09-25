CREATE VIEW vista_DetallesDeEtapa AS

SELECT 
    E.IdCompetencia as IdCompetencia,
    E.Nombre as Nombre,
    E.Lugar as Lugar,
    D.Nombre as Deporte,
    D.Id as IdDeporte
FROM
    Etapa E
        INNER JOIN
    sepracticadeporte se ON E.IdCompetencia = se.IdCompetencia AND E.Nombre = se.Nombre
        INNER JOIN
    Deporte D ON D.Id = se.IdDeporte;

 
CREATE VIEW vista_DetallesEncuentro AS

SELECT 
	EE.IdCompetencia AS IdCompetencia,
    EE.NombreEtapa AS NombreEtapa,
    
    En.Id AS EncuentroId,
    
    Eq.Id AS EquipoId,
    Eq.Nombre AS EquipoNombre,
    D.Id AS DeportistaId,
    CONCAT(D.PrimerNombre, ' ', COALESCE(D.SegundoNombre, ''), ' ', D.PrimerApellido, ' ', COALESCE(D.SegundoApellido, '')) AS DeportistaNombre,
    CONCAT(COALESCE(P.Puntaje, ''), COALESCE(P.Tiempo, '')) AS Anotacion,
    EEn.Puntaje
FROM
    EcontieneE EE
        INNER JOIN
    Encuentro En ON En.Id = EE.IdEncuentro
        INNER JOIN
    ParticipaEn P ON P.IdEncuentro = En.Id
        INNER JOIN
    Equipo Eq ON Eq.Id = P.IdEquipo
        INNER JOIN
    Deportista D ON D.Id = P.IdDeportista
        LEFT JOIN
    eparticipaen EEn ON EEn.IdEncuentro = En.Id AND P.IdEquipo = EEn.IdEquipo;
    
    
    