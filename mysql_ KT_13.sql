-- concat
-- group_concat - aggregatnaya function
-- all virtual tables in views

-- call warehouse_update('7', 'СП03', 'г. Москва, ул. Беговая, д. 19', '2');
-- call warehouse_update('8', 'СП04', 'г. Москва, ул. Беговая, д. 19', '2');

CREATE OR REPLACE VIEW Shop_List AS
SELECT 
    CONCAT('Название: ', Shop_name, ', адрес: ', shop_address) AS 'Магазин',
    GROUP_CONCAT(DISTINCT CONCAT('Номер: ', warehouse_number, ', адрес: ', warehouse_address) SEPARATOR '; ') AS `Склады`,
    COUNT(DISTINCT warehouse_number) AS `Количество складов`,
    GROUP_CONCAT(DISTINCT CONCAT(worker_surname, ' ', worker_name, ' ', worker_second_name, ', должность: ', position_name) SEPARATOR '; ') AS `Сотрудники`,
    COUNT(DISTINCT worker_surname) AS `Количество сотрудников`
FROM shop
    left JOIN warehouse ON id_shop = warehouse.Shop_id
     JOIN worker ON id_shop = worker.shop_id
    left JOIN positions ON id_position = worker.position_id
GROUP BY
    Shop_name, shop_address
ORDER BY 
    Shop_name ASC, 
    shop_address ASC;
select * from shop_list;





CREATE OR REPLACE VIEW Product_List (
    `Продукция`, 
    `Вид`, 
    `Сезон`, 
    `Состав`, 
    `Производитель`, 
    `Размеры`, 
    `Доступно`, 
    `Расположение`
) AS
SELECT 
    CONCAT('Артикул: ', Article_number) AS `Продукция`,
    product_type AS `Вид`,
    GROUP_CONCAT(DISTINCT season_name SEPARATOR '-') AS `Сезон`,
    GROUP_CONCAT(DISTINCT CONCAT(composition_name, ' ', percents, '%') SEPARATOR ', ') AS `Состав`,
    CONCAT(manufacturing_country_name, ' «', manufacturer_name, '»') AS `Производитель`,
    GROUP_CONCAT(DISTINCT size SEPARATOR ', ') AS `Размеры`,
    GROUP_CONCAT(DISTINCT CONCAT('Количество: ', product.product_amount, ' шт., ', 'цена: ', product_price) SEPARATOR '') AS `Доступно`,
    GROUP_CONCAT(DISTINCT CONCAT(shop_name, ', зал: ', sales_floor_name, ', сектор: ', sector_in_sales_floor, ', стенд: ', display_in_sales_floor) SEPARATOR ', ') AS `Расположение`
FROM 
    product_on_display
    INNER JOIN product ON id_product = product_on_display.product_id
    INNER JOIN season_product ON id_product = season_product.product_id
    INNER JOIN season ON id_season = season_id
    INNER JOIN composition_product ON id_product = composition_product.product_id
    INNER JOIN composition ON id_composition = composition_id
    INNER JOIN manufacturing_country ON id_manufacturing_country = manufacturing_country_id
    INNER JOIN manufacturer ON id_manufacturer = manufacturer_id
    INNER JOIN product_size ON id_product = product_size.product_id
    INNER JOIN size ON id_size = size_id
    INNER JOIN product_in_shop ON id_product = product_in_shop.product_id
    INNER JOIN shop ON id_shop = shop_id    
    INNER JOIN sales_floor_in_shop ON id_sales_floor_in_shop = sales_floor_in_shop_id
    INNER JOIN sales_floor ON id_sales_floor = sales_floor_id
GROUP BY
    Article_number, product_type, manufacturing_country_name, manufacturer_name
ORDER BY 
    Article_number ASC;


SELECT * FROM Product_List;




call client_order_update('5', 'ЗкП-000000002-23', '3', '2023-09-01', '10:59:01', '17063.99', '6');
call client_order_update('6', 'ЗкП-000000003-23', '3', '2023-09-02', '15:43:25', '1620.00', '5');
call client_order_update('9', 'ЗкП-000000006-23', '2', '2023-09-03', '10:43:25', '22199.99', '6');
-- DELETE FROM products_in_customer_order where ID_Product_in_customer_order>13
call product_in_customer_order_update('8', '4', '1', '2');
call product_in_customer_order_update('9', '4', '4', '1');
call product_in_customer_order_update('10', '4', '2', '1');
call product_in_customer_order_update('13', '6', '3', '3');
call products_in_customer_order_insert(7, 3, 2);
call products_in_customer_order_insert(7, 2, 2);
call products_in_customer_order_insert(7, 5, 1);
call products_in_customer_order_insert(8, 4, 2);
call products_in_customer_order_insert(9, 1, 2);
call products_in_customer_order_insert(9, 2, 1);
call products_in_customer_order_insert(9, 4, 2);
call products_in_customer_order_insert(9, 3, 2);
call client_order_update('7', 'ЗкП-000000004-23', '1', '2023-09-02', '17:20:26', '35111.99', '7');
call client_order_update('8', 'ЗкП-000000005-23', '4', '2023-09-02', '18:00:23', '3600.00', '7');

CREATE OR REPLACE VIEW Client_orders_List( Клиент, Заказ, Сотрудник, Список_в_заказе, Итоговая_стоимость, Чек, Проведение_оплаты) AS
SELECT
    CONCAT(customer_surname, ' ', customer_name, ' ', customer_last_name, ', телефон: ', customer_phone_number) ,
    CONCAT(client_order_number, ', дата и время формирования: ', LPAD(DAY(client_order_date), 2, '0'), '.', LPAD(MONTH(client_order_date), 2, '0'), '.', YEAR(client_order_date), ' ', client_order_time) ,
    CONCAT(worker_surname, ' ', worker_name, ' ', worker_second_name, ', должность: ', position_name),
    GROUP_CONCAT(DISTINCT CONCAT('Артикул: ', article_number, ' количество: ', products_in_customer_order.product_amount, ', цена: ', products_in_customer_order.product_amount * product.product_price)),
    client_order.client_order_sum ,
    CONCAT('Кассовый чек: ', receipt_number, ', дата и время формирования: ', 
           LPAD(DAY(receipt_date), 2, '0'), '.', 
           LPAD(MONTH(receipt_date), 2, '0'), '.', 
           YEAR(receipt_date), ' ', 
           receipt_time) ,
    CONCAT('Внесённая сумма: ', receipt_sum, ', сдача: ', receipt_change) 
FROM 
    products_in_customer_order
    inner JOIN product ON id_product = product_id
    inner JOIN client_order ON id_client_order = customer_order_id
    inner JOIN customer ON id_customer = client_order.customer_id
    LEFT JOIN worker ON id_worker = worker_id
    LEFT JOIN positions ON id_position = worker.position_id
    LEFT JOIN receipt ON id_client_order = client_order_id
GROUP BY 
    customer_surname, customer_name, customer_last_name, customer_phone_number, client_order_number, 
    client_order_date, client_order_time, worker_surname, worker_name,
    worker_second_name, position_name, client_order_sum, 
    receipt_number, receipt_date, receipt_time, receipt_sum, receipt_change
ORDER BY 
    client_order_number ASC;
select * from Client_orders_List;



call request_update(1, 'ЗяП-00000001', '2023-08-25', 4);
call request_update(2, 'ЗяП-00000002', '2023-08-25', 3);
call request_update(3, 'ЗяП-00000003', '2023-08-26', 3);

CREATE OR REPLACE VIEW Product_in_request_List (Заявка, Сотрудник, Создана, `Перечень в заявке`) AS
SELECT 
    CONCAT('№ заявки: ', request_number) ,
    CONCAT(worker_surname, ' ', worker_name, ' ', worker_second_name, ', должность: ', position_name),
    DATE_FORMAT(request_date, '%d.%m.%Y') AS `Создана`,
    GROUP_CONCAT(CONCAT(article_number, ' - ', product_type) ORDER BY article_number SEPARATOR ', ') 
FROM 
    request
    INNER JOIN products_in_request ON id_request = request_id
    INNER JOIN product ON id_product = product_id
    INNER JOIN worker ON id_worker = worker_id
    INNER JOIN positions ON id_position = worker.position_id
GROUP BY 
    request_number, worker_surname, worker_name, worker_second_name, position_name, request_date
ORDER BY 
    request_number ASC;

SELECT * FROM Product_in_request_List;



CREATE OR REPLACE VIEW Orders_List AS
SELECT 
    CONCAT('«', Supplier_name, '»') AS `Поставщик`,
    CONCAT('№ поставки: ', order_number) AS `Поставка`,
    DATE_FORMAT(order_date, '%d.0%m.%Y') AS `Дата формирования`,
    GROUP_CONCAT(request_number SEPARATOR ', ') AS `Заявки`,
    order_status AS `Статус`,
    costs AS `Итог`
FROM Orders
    INNER JOIN Supplier ON id_Supplier = Supplier_id
    INNER JOIN request_in_order ON id_order = order_id
    INNER JOIN request ON id_request = request_id
    INNER JOIN order_status ON id_order_status = order_status_id
GROUP BY 
    Supplier_name, order_number, order_date, order_status, costs
ORDER BY 
    Supplier_name ASC;

SELECT * FROM Orders_List;






call delivery_man_update('1', 'Павлов', 'Роман', 'Дмитриевич', '+7(921)561-79-91');
-- drop procedure Itinerary_Update

--  DELIMITER $$
--  CREATE PROCEDURE Itinerary_Update (
--      IN p_ID_Itinerary INT,
--      IN p_Itinerary_number varchar(22),
--      IN p_Itinerary_date DATE, 
--      IN p_Itinerary_time TIME, 
--      IN p_Delivery_man_id INT, 
--      IN p_Car_id INT, 
--      IN p_Overall_status_id INT
--  )
--  BEGIN
--      UPDATE Itinerary 
--      SET 
-- 		 Itinerary_number = p_Itinerary_number,
--          Itinerary_date = p_Itinerary_date,
--          Itinerary_time = p_Itinerary_time,
--          Delivery_man_id = p_Delivery_man_id,
--          Car_id = p_Car_id,
--          Overall_status_id = p_Overall_status_id
--      WHERE 
--          ID_Itinerary = p_ID_Itinerary;
--  END$$
--  DELIMITER ;
call itinerary_update('3', 'Д-МЛ-23-0000000001', '2023-09-01', '11:28:04', '1', '1', '1'); -- 01.09.2023 
call itinerary_update('4', 'Д-МЛ-23-0000000002', '2023-09-02', '18:14:19', '2', '1', '2');
call itinerary_update('5', 'Д-МЛ-23-0000000003', '2023-09-03', '11:28:04', '1', '2', '1');

CREATE OR REPLACE VIEW Itinerary_List (Маршрутный_лист, Сформирован, Заявки, Курьер, История) AS
SELECT 
    CONCAT(Itinerary_number, ', общий статус: «', overall_status, '»') AS `Маршрутный лист`,
    CONCAT( LPAD(DAY(Itinerary_date), 2, 0), '.', LPAD(MONTH(Itinerary_date), 2, 0), '.', YEAR(Itinerary_date), ' ', Itinerary_time) AS `Сформирован`,
    CONCAT(client_order_number, ', Статус заказа: «', delivery_order_status, '»') AS `Заявки`,
    CONCAT(delivery_man_surname, ' ', delivery_man_name, ' ', delivery_man_second_name, ', Телефон: ', delivery_man_phone, ', автомобиль: ', car_model, ' ', car_number) AS `Курьер`,
    CASE 
        WHEN cl_order_to_client IS NULL 
             AND (packaging_time IS NOT NULL OR cl_order_to_curier_time IS NOT NULL OR order_on_way IS NOT NULL)
        THEN 
            CONCAT('Товары заказа собраны, время: ', DATE_FORMAT(packaging_time, '%H:%i:%s'), 
                   '; Заказа передан курьеру, время: ', DATE_FORMAT(cl_order_to_curier_time, '%H:%i:%s'), 
                   '; Заказа в пути, время: ', DATE_FORMAT(order_on_way, '%H:%i:%s'))
        WHEN packaging_time IS NULL 
             AND cl_order_to_curier_time IS NULL 
             AND order_on_way IS NULL 
             AND cl_order_to_client IS NULL 
        THEN 
            'Не начато'
        ELSE 
            CONCAT('Товары заказа собраны, время: ', DATE_FORMAT(packaging_time, '%H:%i:%s'), 
                   '; Заказа передан курьеру, время: ', DATE_FORMAT(cl_order_to_curier_time, '%H:%i:%s'), 
                   '; Заказа в пути, время: ', DATE_FORMAT(order_on_way, '%H:%i:%s'), 
                   '; Заказа передан клиенту, время: ', DATE_FORMAT(cl_order_to_client, '%H:%i:%s'))
    END AS `История`
FROM Itinerary
    INNER JOIN overall_status ON id_overall_status = overall_status_id
    INNER JOIN client_order_in_itinerary ON id_itinerary = itinerary_id
    INNER JOIN client_order ON id_client_order = client_order_id
    INNER JOIN deliv_order_status ON id_deliv_order_status = deliv_order_status_id
    INNER JOIN delivery_man ON id_delivery_man = delivery_man_id
    INNER JOIN car ON id_car = car_id
ORDER BY 
    Itinerary_number ASC;

SELECT * FROM Itinerary_List;




grant select on Product_List to rl_customer@'127.0.0.1';
grant select on Client_orders_List to rl_customer@'127.0.0.1';
grant select on Shop_List to rl_worker@'127.0.0.1';
grant select on Client_orders_List to rl_worker@'127.0.0.1';
-- grant select on Product_in_request_List to rl_worker@'127.0.0.1';
grant select on Orders_List to rl_worker@'127.0.0.1';
grant select on Itinerary_List to rl_worker@'127.0.0.1';
grant select on Product_in_request_List to rl_supplier@'127.0.0.1';
grant select on Orders_List to rl_supplier@'127.0.0.1';
grant select on Shop_List to rl_administrator@'127.0.0.1';
grant select on Product_List to rl_administrator@'127.0.0.1';
grant select on Client_orders_List to rl_administrator@'127.0.0.1';
-- grant select on Product_in_request_List to rl_administrator@'127.0.0.1';
grant select on Orders_List to rl_administrator@'127.0.0.1';
grant select on Itinerary_List to rl_administrator@'127.0.0.1';





select 
	information_schema.tables.table_name as "Название таблицы",
	group_concat(information_schema.columns.column_name) as "Количество столбцов" 
from information_schema.tables
	inner join information_schema.columns on 
		information_schema.tables.table_name = information_schema.columns.table_name
	where
		information_schema.tables.table_schema = 'sukhareva_clothing_store_db' and 
		table_type = 'VIEW'
	group by
		information_schema.tables.table_name
union all
select 
	count(distinct information_schema.tables.table_name),
	count(information_schema.columns.column_name)
from information_schema.tables
	inner join information_schema.columns on 
		information_schema.tables.table_name = information_schema.columns.table_name
	where
		information_schema.tables.table_schema = 'sukhareva_clothing_store_db' and 
		table_type = 'VIEW';
