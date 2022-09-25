/*
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
    Deporte D ON E.IdCompetencia = @Id AND E.Nombre = @Nombre AND D.Id = se.IdDeporte


*/
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
    
    
    
    
    
    
    
    