-- GRANT SELECT ON Client_order_in_itinerary TO 'rl_worker'@'127.0.0.1';
-- GRANT SELECT ON Car TO 'rl_worker'@'127.0.0.1';
-- GRANT UPDATE ON Deliv_order_status TO 'rl_worker'@'127.0.0.1';
-- GRANT UPDATE ON Delivery_man TO 'rl_worker'@'127.0.0.1';
-- GRANT SELECT, UPDATE ON Itinerary TO 'rl_worker'@'127.0.0.1';
-- GRANT SELECT, UPDATE ON Overall_status TO 'rl_worker'@'127.0.0.1';

-- GRANT EXECUTE ON PROCEDURE Delivery_man_Update TO 'rl_worker'@'127.0.0.1';
-- GRANT EXECUTE ON PROCEDURE Itinerary_Update TO 'rl_worker'@'127.0.0.1';
-- GRANT EXECUTE ON PROCEDURE Overall_status_Update TO 'rl_worker'@'127.0.0.1';


-- grant select on Overall_status to 'rl_customer'@'127.0.0.1';

-- -- grant select, insert, update, delete on Schedule_Period to rl_managersd@'127.0.0.1';

-- GRANT SELECT, INSERT, UPDATE, DELETE ON Overall_status TO rl_administrator@'127.0.0.1';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON Car TO 'rl_administrator'@'127.0.0.1';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON Client_order_in_itinerary TO 'rl_administrator'@'127.0.0.1';
-- GRANT SELECT, INSERT, UPDATE, DELETE ON Deliv_order_status TO 'rl_administrator'@'127.0.0.1';
-- GRANT SELECT, INSERT, DELETE ON Itinerary TO 'rl_administrator'@'127.0.0.1';
-- GRANT SELECT, INSERT, DELETE ON Delivery_man TO 'rl_administrator'@'127.0.0.1';
-- GRANT EXECUTE ON PROCEDURE Client_order_in_itinerary_Insert TO 'rl_administrator'@'127.0.0.1';


-- grant execute on procedure Client_order_in_itinerary_Update to rl_administrator@'127.0.0.1';
-- grant execute on procedure Client_order_in_itinerary_Delete to rl_administrator@'127.0.0.1';
-- grant execute on procedure Deliv_order_status_Insert to rl_administrator@'127.0.0.1';
-- grant execute on procedure Deliv_order_status_Update to rl_administrator@'127.0.0.1';
-- grant execute on procedure Deliv_order_status_Delete to rl_administrator@'127.0.0.1';
-- grant execute on procedure Delivery_man_Insert to rl_administrator@'127.0.0.1';
-- grant execute on procedure Delivery_man_Delete to rl_administrator@'127.0.0.1';
-- grant execute on procedure Car_Insert to rl_administrator@'127.0.0.1';
-- grant execute on procedure Car_Update to rl_administrator@'127.0.0.1';
-- grant execute on procedure Car_Delete to rl_administrator@'127.0.0.1';
-- grant execute on procedure Itinerary_Insert to rl_administrator@'127.0.0.1';
-- grant execute on procedure Itinerary_Delete to rl_administrator@'127.0.0.1';
-- grant execute on procedure Overall_status_Insert to rl_administrator@'127.0.0.1';
-- grant execute on procedure Overall_status_Update to rl_administrator@'127.0.0.1';
-- grant execute on procedure Overall_status_Delete to rl_administrator@'127.0.0.1';




-- DELIMITER $$
-- CREATE PROCEDURE Delivery_man_Delete (
--     IN p_ID_Delivery_man INT
-- )
-- BEGIN
--     DECLARE p_Exist INT;
--     SELECT COUNT(*) INTO p_Exist 
--     FROM Delivery_man
--     WHERE Delivery_man_id = p_ID_Delivery_man; 
--     IF p_Exist > 0 THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Selected Delivery man cannot be deleted!';
--     ELSE
--         DELETE FROM Delivery_man
--         WHERE ID_Delivery_man = p_ID_Delivery_man;  
--     END IF;
-- END$$
-- DELIMITER ;








select 
	information_schema.tables.table_name as "Название таблиц",
	group_concat(distinct information_schema.columns.column_name) as "Столбцы",
	group_concat(distinct information_schema.statistics.index_name) as "Индексы",
	group_concat(distinct information_schema.routines.routine_name) as "Список процедур",
	information_schema.tables.table_rows  as "Кол-во записей в таблицах"
from information_schema.tables
	inner join information_schema.columns
		on information_schema.columns.table_name = information_schema.tables.table_name
	inner join information_schema.statistics
		on information_schema.tables.table_name = information_schema.statistics.table_name
	inner join information_schema.routines
		on information_schema.tables.table_name = substring(information_schema.routines.routine_name, 1, length(information_schema.tables.table_name))
	where 
		information_schema.tables.table_schema = 'sukhareva_clothing_store_db' and
        index_name <> 'PRIMARY'
	group by
		information_schema.tables.table_name,
		table_rows
union all
select 
	(select 
	 	count(*)
	 from information_schema.tables
	 	where 
	 	information_schema.tables.table_schema = 'sukhareva_clothing_store_db'),
	(select 
	 	count(information_schema.columns.column_name)
	from information_schema.tables
		inner join information_schema.columns
			on information_schema.columns.table_name = information_schema.tables.table_name
		where 
	 		information_schema.tables.table_schema = 'sukhareva_clothing_store_db'),
	(select 
	 	count(information_schema.statistics.index_name) 
	 from information_schema.statistics
				where 
	 				information_schema.statistics.table_schema = 'sukhareva_clothing_store_db' and 
                    index_name <> 'PRIMARY'),
	(select 
	count(information_schema.routines.routine_name) from information_schema.routines
	where 
		routine_type = 'PROCEDURE' and 
		routine_name not in ('structure_create','structure_re_create')),
	(select 
	 	sum(information_schema.tables.table_rows) 
	 from information_schema.tables
				where 
	 				information_schema.tables.table_schema = 'sukhareva_clothing_store_db');
