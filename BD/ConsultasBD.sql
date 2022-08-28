
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


EC.Puntaje as PuntajeTotal

FROM ParticipaEn P INNER JOIN Encuentro En ON P.IdEncuentro = En.Id AND En.Fecha = '2021-03-23 00:00:00'

INNER JOIN Equipo Eq ON Eq.Id = P.IdEquipo
INNER JOIN Deportista D ON D.Id = P.IdDeportista
INNER JOIN EcontieneE Econti ON Econti.IdEncuentro = En.Id
INNER JOIN Etapa Et ON Et.IdCompetencia = Econti.IdCompetencia AND Et.Nombre = Econti.NombreEtapa
INNER JOIN Competencia C ON C.Id = Et.IdCompetencia
INNER JOIN EparticipaC EC ON EC.IdEquipo = Eq.Id;








