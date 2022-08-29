#1) Dado un participante (equipo o no) los resultado de un periodo

SELECT
C.Nombre as CompetenciaNombre,
E.Nombre as EtapaNombre,
En.Fecha as EncuentroFecha,
Eq.Nombre as EquipoNombre,
CONCAT(COALESCE(P.Puntaje,''),COALESCE(P.Tiempo,'')) as Anotacion,
EEn.Puntaje
FROM Equipo Eq INNER JOIN ParticipaEn P ON Eq.Id = 15 AND Eq.Id=P.IdEquipo
INNER JOIN EparticipaEn EEn ON Eq.Id = EEn.IdEquipo
INNER JOIN Encuentro En ON En.Id=P.IdEncuentro and Fecha between '2020-00-00' and '2022-00-00' #<<<<--------------PERIODO
INNER JOIN EcontieneE EE ON EE.IdEncuentro = En.Id
INNER JOIN Etapa E ON E.IdCompetencia = EE.IdCompetencia and E.Nombre = EE.NombreEtapa
INNER JOIN competencia C ON C.Id = E.IdCompetencia;



#2) dado un evento posicion  | resultados

SELECT 
	C.FechaInicio as CompetenciaApertura,
	C.FechaFin as CompetenciaCierre,
    C.Nombre AS CompetenciaNombre, 
    E.Nombre AS EtapaNombre,
    Eq.Nombre as EquipoNombre,
    EEn.Puntaje
FROM
    Etapa E
        INNER JOIN
    Competencia C ON 
		E.Nombre = 'Final'
        AND C.Nombre = 'Copa Libertadores'
        AND C.FechaInicio = '2021-02-23'
        AND C.FechaFin = '2021-11-27'
        AND E.IdCompetencia = C.Id
        INNER JOIN EcontieneE EE ON E.IdCompetencia = EE.IdCompetencia AND E.Nombre = EE.NombreEtapa
        INNER JOIN Encuentro En ON En.Id = EE.IdEncuentro
        INNER JOIN ParticipaEn P ON En.Id = P.IdEncuentro
        INNER JOIN Equipo Eq ON P.IdEquipo = Eq.Id
        INNER JOIN EparticipaEn EEn ON EEn.IdEncuentro = En.Id ORDER BY EEn.Puntaje desc;


#3)dado un encuentro en una fecha info total (integración y resultado)
SELECT
C.Nombre as CompetenciaNombre,
C.Lugar as CompetenciaLugar,
C.FechaInicio as CompetenciaApertura,
C.FechaFin as CompetenciaCierre,

Et.Nombre as EtapaNombre,
Et.Lugar as EtapaLugar,

En.Lugar as EncuentroLugar,
En.Fecha as EncuentroFecha,
 
Eq.Nombre as EquipoNombre,
Eq.Pais as EquipoPais,
Eq.FechaCreacion as EquipoCreacion,

CONCAT(D.PrimerNombre,' ',COALESCE(D.SegundoNombre,''),' ',D.PrimerApellido,' ',COALESCE(D.SegundoApellido,'')) as DeportistaNombre,
D.Pais as DeportistaPais,
D.FechaDeNacimiento as DeportistaEdad,

CONCAT(COALESCE(P.Puntaje,''),COALESCE(P.Tiempo,'')) as Anotacion,

EEn.Puntaje as PuntajeTotal

FROM ParticipaEn P 
INNER JOIN Encuentro En ON P.IdEncuentro = En.Id AND En.Fecha = '2021-03-23 00:00:00'
INNER JOIN Equipo Eq ON Eq.Id = P.IdEquipo
INNER JOIN Deportista D ON D.Id = P.IdDeportista
INNER JOIN EcontieneE Econti ON Econti.IdEncuentro = En.Id
INNER JOIN Etapa Et ON Et.IdCompetencia = Econti.IdCompetencia AND Et.Nombre = Econti.NombreEtapa
INNER JOIN Competencia C ON C.Id = Et.IdCompetencia
INNER JOIN EparticipaEn EEn ON EEn.IdEquipo = Eq.Id;


#4) Dado un participante en un periodo dada detallar su participación (nombre,fecha,sede,evento) COMO MINIMO

SELECT
C.Nombre as CompetenciaNombre,
C.Lugar as CompetenciaLugar,
C.FechaInicio as CompetenciaApertura,
C.FechaFin as CompetenciaCierre,

E.Nombre as EtapaNombre,
E.Lugar as EtapaLugar,
D.Nombre as DeporteDeEtapa,

En.Fecha as EncuentroFecha,

Eq.Nombre as EquipoNombre,
CONCAT(COALESCE(P.Puntaje,''),COALESCE(P.Tiempo,'')) as Anotacion,
EEn.Puntaje
FROM Equipo Eq INNER JOIN ParticipaEn P ON Eq.Id = 15 AND Eq.Id=P.IdEquipo
INNER JOIN EparticipaEn EEn ON Eq.Id = EEn.IdEquipo
INNER JOIN Encuentro En ON En.Id=P.IdEncuentro and Fecha between '2020-00-00' and '2022-00-00' #<<<<--------------PERIODO
INNER JOIN EcontieneE EE ON EE.IdEncuentro = En.Id
INNER JOIN Etapa E ON E.IdCompetencia = EE.IdCompetencia and E.Nombre = EE.NombreEtapa
INNER JOIN competencia C ON C.Id = E.IdCompetencia
INNER JOIN SePracticaDeporte spd ON E.IdCompetencia = spd.IdCompetencia AND E.Nombre = spd.Nombre
INNER JOIN Deporte D ON D.Id= spd.IdDeporte;



