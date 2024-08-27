Schema avilchenko has to be created from DBA account
sqlplus / as sysdba ( or any DBA user )
create user avilchenko identified by ******;
grant connect, resource to avilchenko;
after this ddl.sql and dml_populate.sql have to be executed from AVILCHENKO account
