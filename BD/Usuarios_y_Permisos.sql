# APIs create-------------------------------------------------
create user 'API_Publicidad'@'127.0.0.1' identified by 'contraseña';
create user 'API_Resultados'@'127.0.0.1' identified by 'contraseña';
create user 'API_Autenticacion'@'127.0.0.1' identified by 'contraseña';

# USUARIOS create----------------------------------------------
create user 'Auto-Registro'@'127.0.0.1' identified by 'contraseña';
create user 'Auto-Eliminacion'@'127.0.0.1' identified by 'contraseña';

# ADMINISTRADORES create-----------------------------------------------------
create user 'Administrador'@'127.0.0.1' identified by 'contraseña';
create user 'Funcionario'@'127.0.0.1' identified by 'contraseña';


#------------------------------------------------------------------------
#------------------------------------------------------------------------
#------------------------------------------------------------------------
#------------------------------------------------------------------------


# APIs grant--------------------------------------------------------------
grant select on infinitysports.publicidad to 'API_Publicidad'@'127.0.0.1';


grant select on infinitysports.competencia to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.etapa to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.encuentro to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.resultado to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.deportista to 'API_Resultados'@'127.0.0.1';
grant select on infinitysports.equipo to 'API_Resultados'@'127.0.0.1';


grant select on infinitysports.usuario to 'API_Autenticacion'@'127.0.0.1';


# USUARIOS grant--------------------------------------------------------------

grant delete, select on infinitysports.usuario to 'Auto-Eliminacion'@'127.0.0.1';
grant delete, select on infinitysports.ususcribed to 'Auto-Eliminacion'@'127.0.0.1';
grant delete, select on infinitysports.ususcribeeq to 'Auto-Eliminacion'@'127.0.0.1';
grant delete, select on infinitysports.ususcribeen to 'Auto-Eliminacion'@'127.0.0.1';
grant delete, select on infinitysports.ususcribec to 'Auto-Eliminacion'@'127.0.0.1';

grant select, insert on infinitysports.usuario to 'Auto-Registro'@'127.0.0.1';


# ADMINISTRADORES grant-----------------------------------------------------

grant all privileges on infinitysports.* to 'Administrador'@'127.0.0.1';

grant insert, update, delete, select on infinitysports.publicidad to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.usuario to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.competencia to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.etapa to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.encuentro to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.EContieneE to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.juez to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.ETieneJ to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.resultado to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.contendiente to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.deportista to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.equipo to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.DIntegraE to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.CParticipaE to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.deporte to 'Funcionario'@'127.0.0.1';
grant insert, update, delete, select on infinitysports.SePracticaDeporte to 'Funcionario'@'127.0.0.1';



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
DROP user 'Funcionario'@'127.0.0.1';
*/

