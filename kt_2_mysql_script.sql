create role sukhareva_customer with password 'Pa$$w0rd';
alter role sukhareva_customer LOGIN;
grant connect on database "sukhareva_clothing_store_db" to sukhareva_customer;
create role sukhareva_worker with password 'Pa$$w0rd';
alter role sukhareva_worker LOGIN;
grant connect on database "sukhareva_clothing_store_db" to sukhareva_worker;
create role sukhareva_supplier with password 'Pa$$w0rd';
alter role sukhareva_supplier LOGIN;
grant connect on database "sukhareva_clothing_store_db" to sukhareva_supplier;
create role sukhareva_administrator with password 'Pa$$w0rd';
alter role sukhareva_administrator LOGIN;
grant connect on database "sukhareva_clothing_store_db" to sukhareva_administrator;

select * from pg_roles where rolname in ('sukhareva_customer', 'sukhareva_worker', 'sukhareva_supplier', 'sukhareva_administrator');

create user sukhareva_customer identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to sukhareva_customer;
create user sukhareva_worker identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to sukhareva_worker;
create user sukhareva_supplier identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to sukhareva_supplier;
create user sukhareva_administrator identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to sukhareva_administrator;

select * from mysql.user where user in ('sukhareva_customer', 'sukhareva_worker', 'sukhareva_supplier', 'sukhareva_administrator');

show databases;