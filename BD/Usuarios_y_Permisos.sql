# APIs create-------------------------------------------------
CREATE USER 'API_Publicidad'@'192.168.2.%' IDENTIFIED BY '9usr5F9kJHnKzJZ2N2cLhkpW';
CREATE USER 'API_Resultados'@'192.168.2.%' IDENTIFIED BY 'bWtMgf3vHZxebzq3YprGLMhD';
CREATE USER 'API_Autenticacion'@'192.168.2.%' IDENTIFIED BY 'V5sVhmUqNj92HDAShB9zrkAN';
CREATE USER 'API_Suscripcion'@'192.168.2.%' IDENTIFIED BY 'atn8wgS6spcSvfnWEsE3QXAC';

# ADMINISTRADORES create-----------------------------------------------------
CREATE USER 'Administrador'@'192.168.4.%' IDENTIFIED BY '9vkXzs9bUAeaMDjszbN5eNPc';
CREATE USER 'Funcionario'@'192.168.3.%' IDENTIFIED BY '4HGawgXDQ5LtAKbG8QdJAphZ';

# ADMINISTRADOR Base de daTOs create-----------------------------------------------------
CREATE USER 'AdminBD'@'127.0.0.1' IDENTIFIED BY 'mJj3J8DT55BUTr6t3rtUatQS';

# REPLICACIÓN create-----------------------------------------------------
CREATE USER 'ReplicationUser'@'192.168.2.%' IDENTIFIED BY 'PbVKrpQSEhGTKxJw7eW9R4e7';


# APIs GRANT--------------------------------------------------------------
GRANT SELECT ON infinitysports.publicidad TO 'API_Publicidad'@'192.168.2.%';

GRANT SELECT,INSERT,DELETE ON infinitysports.ususcribec TO 'API_Suscripcion'@'192.168.2.%';
GRANT SELECT,INSERT,DELETE ON infinitysports.ususcribed TO 'API_Suscripcion'@'192.168.2.%';
GRANT SELECT,INSERT,DELETE ON infinitysports.ususcribeeq TO 'API_Suscripcion'@'192.168.2.%';
GRANT SELECT,INSERT,DELETE ON infinitysports.ususcribeen TO 'API_Suscripcion'@'192.168.2.%';


GRANT SELECT ON infinitysports.Deporte TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.Deportista TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.DintegraE TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.EcONtieneE TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.Encuentro TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.EparticipaEn TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.Equipo TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.Etapa TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.EtieneJ TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.Juez TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.ParticipaEn TO 'API_Resultados'@'192.168.2.%';
GRANT SELECT ON infinitysports.SePracticaDeporte TO 'API_Resultados'@'192.168.2.%';


GRANT SELECT,INSERT,DELETE ON infinitysports.usuario TO 'API_Autenticacion'@'192.168.2.%';


# ADMINISTRADOR Base de daTOs GRANT-----------------------------------------------------
GRANT all privileges ON infinitysports.* TO 'AdminBD'@'127.0.0.1';

# ADMINISTRADORES GRANT-----------------------------------------------------
GRANT SELECT,INSERT,DELETE,UPDATE ON infinitysports.* TO 'Administrador'@'192.168.4.%';

GRANT INSERT, UPDATE, DELETE, SELECT ON infinitysports.publicidad TO 'Funcionario'@'192.168.3.%';
GRANT INSERT, UPDATE, DELETE, SELECT ON infinitysports.usuario TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Deporte TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Deportista TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.DintegraE TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.EcONtieneE TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Encuentro TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.EparticipaEn TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Equipo TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Etapa TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.EtieneJ TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.Juez TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.ParticipaEn TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.SePracticaDeporte TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.UsuscribeC TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.UsuscribeEq TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.UsuscribeEn TO 'Funcionario'@'192.168.3.%';
GRANT SELECT,INSERT,UPDATE,DELETE ON infinitysports.UsuscribeD TO 'Funcionario'@'192.168.3.%';

# REPLICACIÓN create-----------------------------------------------------
GRANT REPLICATION SLAVE ON *.* TO 'ReplicationUser'@'192.168.2.%';


FLUSH privileges;

/*
# APIs create-------------------------------------------------
DROP USER 'API_Publicidad'@'192.168.2.%';
DROP USER 'API_Resultados'@'192.168.2.%';
DROP USER 'API_Autenticacion'@'192.168.2.%';
DROP USER 'API_Suscripcion'@'192.168.2.%';

# ADMINISTRADORES create-----------------------------------------------------
DROP USER 'Administrador'@'192.168.4.%';
DROP USER 'Funcionario'@'192.168.3.%';

# ADMINISTRADOR Base de daTOs create-----------------------------------------------------
DROP USER 'AdminBD'@'127.0.0.1';

# REPLICACIÓN create-----------------------------------------------------
DROP USER 'ReplicationUser'@'192.168.2.%';
*/
