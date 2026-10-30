grant select on Client_order_in_itinerary to rl_worker;
grant select on Car to rl_worker;
grant update on Deliv_order_status to rl_worker; 
grant update on Delivery_man to rl_worker;
grant select, update on Itinerary to rl_worker; 
grant select, update on Overall_status to rl_worker;
grant execute on procedure Delivery_man_Update to rl_worker;
grant execute on procedure Itinerary_Update to rl_worker;
grant execute on procedure Overall_status_Update to rl_worker;

grant select on Overall_status to rl_customer;

grant select, insert, update, delete on Overall_status to rl_administrator;
grant usage, select on sequence Overall_status_id_Overall_status_seq to rl_administrator;
grant select, insert, update, delete on Car to rl_administrator;
grant usage, select on sequence Car_id_Car_seq to rl_administrator;
grant select, insert, update, delete on Client_order_in_itinerary to rl_administrator;
grant usage, select on sequence Client_order_in_itinerary_id_Client_order_in_itinerary_seq to rl_administrator;
grant select, insert, update, delete on Deliv_order_status to rl_administrator;
grant usage, select on sequence Deliv_order_status_id_Deliv_order_status_seq to rl_administrator; 
grant select, insert, delete on Itinerary to rl_administrator;
grant usage, select on sequence Itinerary_id_Itinerary_seq to rl_administrator;
grant select, insert, delete on Delivery_man to rl_administrator;
grant usage, select on sequence Delivery_man_id_Delivery_man_seq to rl_administrator;
grant execute on procedure Client_order_in_itinerary_Insert to rl_administrator;

select 
	information_schema.tables.table_name as "Название таблиц",
	string_agg(distinct information_schema.columns.column_name, ', ') as "Столбцы",
	string_agg(distinct pg_indexes.indexname, ', ') as "Индексы",
	string_agg(distinct information_schema.routines.routine_name, ', ') as "Список процедур",
	n_live_tup as "Кол-во записей в таблицах"
from information_schema.tables
	inner join information_schema.columns
		on information_schema.columns.table_name = information_schema.tables.table_name
	inner join pg_indexes 
		on information_schema.tables.table_name = pg_indexes.tablename
	inner join information_schema.routines
		on information_schema.tables.table_name = substring(information_schema.routines.routine_name, 1, length(information_schema.tables.table_name))
	inner join pg_stat_user_tables
		on information_schema.tables.table_name = pg_stat_user_tables.relname
	where 
		information_schema.tables.table_schema = 'public'and 
		routine_type = 'PROCEDURE' and
		information_schema.tables.table_schema = 'public' and 
			indexname not like 'pk_%'
	group by
		information_schema.tables.table_name,
		n_live_tup
union all
select 
	(select 
	 	count(*)::text 
	 from information_schema.tables
	 	where 
	 	table_schema = 'public'),
	(select 
	 	count(information_schema.columns.column_name)::text 
	from information_schema.tables
		inner join information_schema.columns
			on information_schema.columns.table_name = information_schema.tables.table_name
		where 
	 		information_schema.tables.table_schema = 'public'),
	(select 
	 	count(pg_indexes.indexname)::text 
	 from information_schema.tables
		inner join pg_indexes 
	 		on information_schema.tables.table_name = pg_indexes.tablename
				where 
	 				information_schema.tables.table_schema = 'public'	and 
	 				indexname not like 'pk_%'),
	(select 
	count(information_schema.routines.routine_name)::text from information_schema.routines
	where 
		routine_type = 'PROCEDURE' and 
		routine_name not in ('structure_create','structure_re_create')),
	(select 
	 	sum(n_live_tup) 
	 from pg_stat_user_tables);

-- grant execute on procedure Client_order_in_itinerary_Update to rl_administrator;
-- grant execute on procedure Client_order_in_itinerary_Delete to rl_administrator;
-- grant execute on procedure Deliv_order_status_Insert to rl_administrator;
-- grant execute on procedure Deliv_order_status_Update to rl_administrator;
-- grant execute on procedure Deliv_order_status_Delete to rl_administrator;
-- grant execute on procedure Delivery_man_Insert to rl_administrator;
-- grant execute on procedure Delivery_man_Delete to rl_administrator;
-- grant execute on procedure Car_Insert to rl_administrator;
-- grant execute on procedure Car_Update to rl_administrator;
-- grant execute on procedure Car_Delete to rl_administrator;
-- grant execute on procedure Itinerary_Insert to rl_administrator;
-- grant execute on procedure Itinerary_Delete to rl_administrator;
-- grant execute on procedure Overall_status_Insert to rl_administrator;
-- grant execute on procedure Overall_status_Update to rl_administrator;
-- grant execute on procedure Overall_status_Delete to rl_administrator;




