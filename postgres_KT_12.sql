-- CREATE OR REPLACE VIEW Shop_List ("Магазин", "Склады", " Количество складов ", "Сотрудники", " Количество сотрудников ")
-- AS
-- SELECT 
--     'Название: '||Shop_name||', адрес: '||shop_address AS "Магазин",
--     STRING_AGG(DISTINCT  'Номер: '|| warehouse_number||', адрес: '||warehouse_address, '; ')  AS "Склады",
--     COUNT(DISTINCT warehouse_number) AS "Количество складов",
--     STRING_AGG(DISTINCT worker_surname || ' ' || worker_name || ' ' || worker_second_name || ', должность: ' || position_name, '; ') AS "Сотрудники",
--     COUNT(DISTINCT worker_surname) AS "Количество сотрудников"
-- FROM shop
--     inner JOIN warehouse ON id_shop = warehouse.shop_id
--     inner JOIN worker ON id_shop = worker.shop_id
--     inner JOIN position ON id_position = worker.position_id
-- GROUP BY
--     Shop_name, shop_address
-- ORDER BY 
--     Shop_name ASC, 
--     shop_address ASC;

-- SELECT * FROM Shop_List;





create or replace view Product_List ("Продукция", "Вид", "Сезон", "Состав", "Произво
дитель", "Размеры", "Доступно", "Расположение")
as
select 
	'Артикул: '||Article_number,
	product_type,
	STRING_AGG(DISTINCT season_name, '-'),
	STRING_AGG(DISTINCT composition_name||' '||percents||'%', ', '),
	manufacturing_country_name||' «'||manufacturer_name||'»',
	STRING_AGG(DISTINCT size, ', '),
	STRING_AGG(DISTINCT 'Kоличество: '||product.product_amount||' шт., '||'цена: '||product_price ,''),
	STRING_AGG(DISTINCT shop_name || ', зал: ' || sales_floor_name || ', сектор: ' || sector_in_sales_floor || ', стенд: ' || display_in_sales_floor, ', ')

from product_on_display
	inner join  product on id_product = product_on_display.product_id
	inner join season_product on id_product = season_product.product_id
	inner join season on id_season = season_id
	inner join composition_product on id_product = composition_product.product_id
	inner join composition on id_composition = composition_id
	inner join manufacturing_country on id_manufacturing_country = manufacturing_country_id
	inner join manufacturer on id_manufacturer = manufacturer_id
	inner join product_size on id_product = product_size.product_id
	inner join size on id_size = size_id
	inner join product_in_shop on id_product = product_in_shop.product_id
	inner join shop on id_shop = shop_id	
	-- inner join product_on_display on id_product = product_on_display.product_id
	inner join sales_floor_in_shop on id_sales_floor_in_shop = sales_floor_in_shop_id
	inner join sales_floor on id_sales_floor = sales_floor_id
	GROUP BY
		Article_number, product_type, manufacturing_country_name, manufacturer_name 
	order by 
		Article_number ASC;
		
select * from Product_List;




-- create or replace view Client_orders_List("Клиент", "Заказ", "Сотрудник", "Список в заказе", "Итоговая стоимость", "Чек", "Проведение оплаты")
-- as
-- select
-- 	customer_surname||' '||customer_name||' '||customer_last_name||', телефон: '||customer_phone_number,
-- 	client_order_number||', дата и время формирования: 0'||date_part('Day', client_order_date)||'.0'||date_part('Month', client_order_date)||'.'||date_part('Year', client_order_date)||' '||client_order_time,
-- 	worker_surname||' '||worker_name||' '||worker_second_name||', должность: '||position_name,
-- 	-- STRING_AGG(DISTINCT 'Артикул: '||article_number||' количество: '||products_in_customer_order.product_amount||', цена: '||SUBSTRING((products_in_customer_order.product_amount*product_price)::text, 0, length((products_in_customer_order.product_amount*product_price)::text))||' р. '||SUBSTRING((products_in_customer_order.product_amount*product_price)::text, length((products_in_customer_order.product_amount*product_price)::text)-1||'к.',3), '; '),
-- 	STRING_AGG(DISTINCT 'Артикул: '||article_number||' количество: '||products_in_customer_order.product_amount||', цена: '||products_in_customer_order.product_amount*product_price, '; '),
-- 	client_order_sum,
-- 	'Кассовый чек: '||receipt_number||', дата и время формирования: 0'||date_part('Day', receipt_date)||'.0'||date_part('Month', receipt_date)||'.'||date_part('Year', receipt_date)||' '||receipt_time,
-- 	'Внесённая сумма: '||receipt_sum||', сдача: '||receipt_change
-- from products_in_customer_order
-- 	inner join product on 
-- 		id_product = product_id
-- 	inner join client_order on 
-- 		id_client_order = customer_order_id
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner join worker on 
-- 		id_worker = worker_id
-- 	inner join position on  
--  		id_position = worker.position_id
-- 	inner join receipt on 
-- 		id_client_order = client_order_id

-- 	group by
-- 		customer_surname, customer_name, customer_last_name, customer_phone_number, client_order_number, client_order_date, client_order_time,
-- 		worker_surname, worker_name, worker_second_name, position_name, client_order_sum,
-- 		receipt_number, receipt_date, receipt_time, receipt_sum, receipt_change
-- 	order by 
-- 		client_order_number ASC;
-- select * from Client_orders_List;



-- create or replace view Product_in_request_List ("Заявка", "Сотрудник", "Создана", "Перечень в заявке")
-- as
-- select 
-- 	'№ заявки: '||request_number,
-- 	worker_surname||' '||worker_name||' '||worker_second_name||', должность: '||position_name,
-- 	date_part('Day', request_date)||'.'||date_part('Month', request_date)||'.'||date_part('Year', request_date),
-- 	STRING_AGG(article_number||' - '||product_type, ', ')
-- from request
-- 	inner join products_in_request on 
-- 		id_request = request_id
-- 	inner join product on 
-- 		id_product = product_id
-- 	inner join worker on 
-- 		id_worker = worker_id
-- 	inner join position on  
-- 		id_position = worker.position_id
-- 	GROUP BY
-- 		request_number, worker_surname, worker_name, worker_second_name, position_name, request_date
-- 	order by 
-- 		request_number ASC;
-- select * from Product_in_request_List;




-- create or replace view Orders_List ("Поставщик", "Поставка", "Дата формирования", "Заявки", "Статус", "Итог")
-- as
-- select 
-- 	'«'||Supplier_name||'»',
-- 	'№ поставки: '||order_number,
-- 	date_part('Day', order_date)||'.0'||date_part('Month', order_date)||'.'||date_part('Year', order_date),
-- 	string_agg(request_number, ', '),
-- 	order_status,
-- 	costs
-- from Orders
-- 	inner join Supplier on 
-- 		id_Supplier = Supplier_id
-- 	inner join request_in_order on 
-- 		id_order = order_id
-- 	inner join request on 
-- 		id_request = request_id
-- 	inner join order_status on 
-- 		id_order_status = order_status_id

-- 	group by
-- 		Supplier_name, order_number, order_date, order_status, costs
-- 	order by 
-- 		Supplier_name ASC;
-- select * from Orders_List;






-- create or replace view Itinerary_List ("Маршрутный лист", "Сформирован", "Заявки", "Курьер", "История")
-- as
-- select 
-- 	Itinerary_number||', общий статус: «'||overall_status||'»',
-- 	'0'||date_part('Day', Itinerary_date)||'.0'||date_part('Month', Itinerary_date)||'.'||date_part('Year', Itinerary_date)||' '||Itinerary_time,
-- 	client_order_number||', Статус заказа: «'||delivery_order_status||'»',
-- 	delivery_man_surname||' '||delivery_man_name||' '||delivery_man_second_name||', Телефон: '||delivery_man_phone||', автомобиль: '||car_model||' '||car_number,
-- 	case 
-- 	    when cl_order_to_client is null 
-- 	    and (packaging_time is not null or cl_order_to_curier_time is not null or order_on_way is not null)
-- 	    then 'Товары заказа собраны, время: ' || to_char(packaging_time, 'HH24:MI:SS') || 
-- 	         '; Заказа передан курьеру, время: ' || to_char(cl_order_to_curier_time, 'HH24:MI:SS') || 
-- 	         '; Заказа в пути, время: ' || to_char(order_on_way, 'HH24:MI:SS')
-- 	    when packaging_time is null and cl_order_to_curier_time is null and order_on_way is null and cl_order_to_client is null 
-- 	    then 'Не начато'
-- 	    else 'Товары заказа собраны, время: ' || to_char(packaging_time, 'HH24:MI:SS') || 
-- 	         '; Заказа передан курьеру, время: ' || to_char(cl_order_to_curier_time, 'HH24:MI:SS') || 
-- 	         '; Заказа в пути, время: ' || to_char(order_on_way, 'HH24:MI:SS') || 
-- 	         '; Заказа передан клиенту, время: ' || to_char(cl_order_to_client, 'HH24:MI:SS')
-- 	end as "История"


-- from Itinerary
-- 	inner join overall_status on 
-- 		id_overall_status = overall_status_id
-- 	inner join client_order_in_itinerary on 
-- 		id_itinerary = itinerary_id
-- 	inner join client_order on 
-- 		id_client_order = client_order_id
-- 	inner join deliv_order_status on 
-- 		id_deliv_order_status = deliv_order_status_id
-- 	inner join delivery_man on 
-- 		id_delivery_man = delivery_man_id
-- 	inner join car on 
-- 		id_car = car_id
	
-- order by 
-- 		Itinerary_number ASC;
-- select * from Itinerary_List;







-- grant select on Client_orders_List to rl_customer;
-- grant select on Shop_List to rl_worker;
-- grant select on Client_orders_List to rl_worker;
-- grant select on Product_in_request_List to rl_worker;
-- grant select on Orders_List to rl_worker;
-- grant select on Itinerary_List to rl_worker;
-- grant select on Product_in_request_List to rl_supplier;
-- grant select on Orders_List to rl_supplier;
-- grant select on Shop_List to rl_administrator;

-- grant select on Client_orders_List to rl_administrator;
-- grant select on Product_in_request_List to rl_administrator;
-- grant select on Orders_List to rl_administrator;
-- grant select on Itinerary_List to rl_administrator;


-- grant select on Product_List to rl_customer;
-- grant select on Product_List to rl_administrator;





-- select 
-- 	information_schema.tables.table_name as "Название таблицы",
-- 	string_agg(information_schema.columns.column_name, ', ') as "Количество столбцов" 
-- from information_schema.tables
-- 	inner join information_schema.columns on 
-- 		information_schema.tables.table_name = information_schema.columns.table_name
-- 	where
-- 		information_schema.tables.table_schema = 'public' and 
-- 		table_type = 'VIEW'
-- 	group by
-- 		information_schema.tables.table_name
-- union all
-- select 
-- 	count(distinct information_schema.tables.table_name)::text,
-- 	count(information_schema.columns.column_name)::text 
-- from information_schema.tables
-- 	inner join information_schema.columns on 
-- 		information_schema.tables.table_name = information_schema.columns.table_name
-- 	where
-- 		information_schema.tables.table_schema = 'public' and 
-- 		table_type = 'VIEW';
