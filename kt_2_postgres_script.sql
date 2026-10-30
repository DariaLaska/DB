create role rl_customer with password 'Pa$$w0rd';
alter role rl_customer LOGIN;
grant connect on database "sukhareva_clothing_store_db" to rl_customer;
create role rl_worker with password 'Pa$$w0rd';
alter role rl_worker LOGIN;
grant connect on database "sukhareva_clothing_store_db" to rl_worker;
create role rl_supplier with password 'Pa$$w0rd';
alter role rl_supplier LOGIN;
grant connect on database "sukhareva_clothing_store_db" to rl_supplier;
create role rl_administrator with password 'Pa$$w0rd';
alter role rl_administrator LOGIN;
grant connect on database "sukhareva_clothing_store_db" to rl_administrator;

select * from pg_roles where rolname in ('rl_customer', 'rl_worker', 'rl_supplier', 'rl_administrator');

create user rl_customer@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to rl_customer @'127.0.0.1';
create user rl_worker@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to rl_worker @'127.0.0.1';
create user rl_supplier@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to rl_supplier @'127.0.0.1';
create user rl_administrator@'127.0.0.1' identified by 'Pa$$w0rd';
grant all on sukhareva_clothing_store_db to rl_administrator@'127.0.0.1';

select * from mysql.user where user in ('rl_customer', 'rl_worker', 'rl_supplier',  'rl_administrator');

SELECT datname FROM pg_catalog.pg_database
where datname = 'sukhareva_clothing_store_db';
