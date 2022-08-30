# APIs create-------------------------------------------------
create user 'API_Publicidad'@'127.0.0.1' identified by 'contraseña';
create user 'API_Resultados'@'127.0.0.1' identified by 'contraseña';
create user 'API_Autenticacion'@'127.0.0.1' identified by 'contraseña';
create user 'API_Suscripcion'@'127.0.0.1' identified by 'contraseña';

# USUARIOS create----------------------------------------------
create user 'Auto-Registro'@'127.0.0.1' identified by 'contraseña';

# ADMINISTRADORES create-----------------------------------------------------
create user 'Administrador'@'127.0.0.1' identified by 'contraseña';
create user 'Funcionario'@'127.0.0.1' identified by 'contraseña';

create user 'AdminBD'@'127.0.0.1' identified by 'contraseña';

#------------------------------------------------------------------------
#------------------------------------------------------------------------
#------------------------------------------------------------------------
#------------------------------------------------------------------------


# APIs grant--------------------------------------------------------------
grant select on infinitysports.publicidad to 'API_Publicidad'@'127.0.0.1';

grant select,insert,delete on infinitysports.ususcribec to 'API_Publicidad'@'127.0.0.1';
grant select,insert,delete on infinitysports.ususcribed to 'API_Publicidad'@'127.0.0.1';
grant select,insert,delete on infinitysports.ususcribeeq to 'API_Publicidad'@'127.0.0.1';
grant select,insert,delete on infinitysports.ususcribeen to 'API_Publicidad'@'127.0.0.1';


grant select on infinitysports.Deporte to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.Deportista to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.DintegraE to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.EcontieneE to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.Encuentro to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.EparticipaEn to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.Equipo to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.Etapa to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.EtieneJ to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.Juez to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.ParticipaEn to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.SePracticaDeporte to 'API_Resultados'@'127.0.0.1';


grant select on infinitysports.usuario to 'API_Autenticacion'@'127.0.0.1';


# USUARIOS grant--------------------------------------------------------------


grant select, insert on infinitysports.usuario to 'Auto-Registro'@'127.0.0.1';


# ADMINISTRADORES grant-----------------------------------------------------

grant all privileges on infinitysports.* to 'AdminBD'@'127.0.0.1';

grant select,insert,delete,update on infinitysports.* to 'Administrador'@'127.0.0.1';

grant insert, update, delete, select on infinitysports.publicidad to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.usuario to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Deporte to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Deportista to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.DintegraE to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.EcontieneE to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Encuentro to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.EparticipaEn to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Equipo to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Etapa to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.EtieneJ to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.Juez to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.ParticipaEn to 'Funcionario'@'127.0.0.1';
grant select,insert,update,delete on infinitysports.SePracticaDeporte to 'Funcionario'@'127.0.0.1';



FLUSH privileges;



/*
# APIs-------------------------------------------------
DROP user 'API_Publicidad'@'127.0.0.1';
DROP user 'API_Resultados'@'127.0.0.1';
DROP user 'API_Autenticacion'@'127.0.0.1';

# USUARIOS----------------------------------------------
DROP user 'Auto-Registro'@'127.0.0.1';
DROP user 'Auto-Eliminacion'@'127.0.0.1';

# ADMINISTRADORES-----------------------------------------------------
DROP user 'Administrador'@'127.0.0.1';
DROP user 'AdminBD'@'127.0.0.1';
DROP user 'Funcionario'@'127.0.0.1';
*/

