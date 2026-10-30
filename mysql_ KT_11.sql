-- call Overall_status_insert('Выполняется');
-- call Overall_status_insert('Завершён');
-- select * from Overall_status;

-- call Delivery_man_insert('Андреев', 'Максим', 'Владимирович', '+7(991)629-66-13');
-- call Delivery_man_insert('Павлов', 'Роман', 'Дмитриевич', '+7(921)561-79-91');
-- select * from Delivery_man;
-- call Delivery_man_Delete(3)

-- ALTER TABLE Car DROP CONSTRAINT car_chk_1;
-- ALTER TABLE Car ADD CONSTRAINT CH_Car_number 
-- CHECK (Car_number REGEXP '^[ABCEHKMOPTYXАВСЕНКМОРТУХ][0-9]{3}[ABCEHKMOPTYXАВСЕНКМОРТУХ]{2} [0-9]{2}$');

-- call Car_insert('KIA Rio', 'О464ОР 77');
-- call Car_Insert('Honda Accord', 'Р245УВ 77');
-- select * from Car;

-- call Deliv_order_status_insert('Закрыт');
-- call Deliv_order_status_insert('В пути');
-- call Deliv_order_status_insert('Ожидает выдачи');
-- select * from Deliv_order_status;


-- drop procedure Itinerary_Insert;
-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Insert(
--     IN p_Itinerary_number VARCHAR(21),
--     IN p_Itinerary_date DATE,
--     IN p_Itinerary_time TIME,
--     IN p_Delivery_man_id INT,
--     IN p_Car_id INT,
--     IN p_Overall_status_id INT
-- )
-- BEGIN
--     INSERT INTO Itinerary (
--         Itinerary_number,
--         Itinerary_date,
--         Itinerary_time,
--         Delivery_man_id,
--         Car_id,
--         Overall_status_id
--     ) VALUES (
--         p_Itinerary_number,
--         p_Itinerary_date,
--         p_Itinerary_time,
--         p_Delivery_man_id,
--         p_Car_id,
--         p_Overall_status_id
--     );
-- END $$
-- DELIMITER ;


-- drop procedure Itinerary_Delete;

-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Delete(IN p_ID_Itinerary INT)
-- BEGIN
--     DECLARE p_Exist INT;

--     -- Count the number of associated client orders
--     SELECT COUNT(*) INTO p_Exist
--     FROM Client_order_in_itinerary
--     WHERE Itinerary_id = p_ID_Itinerary;

--     -- Check if there are any associated client orders
--     IF p_Exist > 0 THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Выбранный маршутный лист нельзя удалить!';
--     ELSE
--         -- Delete from the Itinerary table
--         DELETE FROM Itinerary
--         WHERE id_Itinerary = p_ID_Itinerary;
--     END IF;
-- END $$
-- DELIMITER ;


-- call Itinerary_Delete(1);

-- call Itinerary_insert('Д-МЛ-23-0000000001', '01.09.2023', '11:28:04', 1, 1, 1);
-- call Itinerary_insert('Д-МЛ-23-0000000002', '02.09.2023', '18:14:19', 2, 1, 2);
-- call Itinerary_insert('Д-МЛ-23-0000000003', '03.09.2023', '11:28:04', 1, 2, 1);
-- select * from Itinerary;

-- drop procedure Itinerary_Insert;
-- create or replace procedure Itinerary_Insert ( 
-- 	p_Itinerary_date Date, 
-- 	p_Itinerary_time Time, 
-- 	p_Delivery_man_id Int, 
-- 	p_Car_id Int, 
-- 	p_Overall_status_id Int
-- )
-- language plpgsql
-- as $$
-- 	declare p_New_Number int := count(*)+1 from Itinerary;
-- 	declare p_Year int := SUBSTRING(p_Itinerary_date::text, 3, 2);
-- 	declare p_Symb_Len smallint := length(p_New_Number::text);
-- 	declare p_Loop_Max_Step smallint := 10 - p_Symb_Len;
-- 	declare p_New_Text_Number varchar (21) := '';
-- 	begin
-- 		for i in 1..p_Loop_Max_Step loop
-- 			p_New_Text_Number := p_New_Text_Number||'0';
-- 		end loop;
-- 		p_New_Text_Number:= 'Д-МЛ-'||p_Year||'-'||p_New_Text_Number||p_New_Number;
-- 		insert into Itinerary ( Itinerary_number, 
-- 							    Itinerary_date, 
-- 								Itinerary_time, 
-- 								Delivery_man_id, 
-- 								Car_id, 
-- 								Overall_status_id)
-- 		values (p_New_Text_Number, p_Itinerary_date, p_Itinerary_time, p_Delivery_man_id, p_Car_id, 
-- 								p_Overall_status_id);
-- 	end;
-- $$;

-- call Itinerary_Insert('2024-03-01', '10:00:00', 1, 4, 1);
-- select * from Itinerary;

-- call Client_order_in_itinerary_Insert (3, 4, '11:38:17', '12:01:54', '12:02:05', '13:26:41', 1);
-- INSERT INTO Client_order_in_itinerary (Itinerary_id, Client_order_id, Packaging_time, Cl_order_to_curier_time, Order_on_way, Deliv_order_status_id)
-- VALUES (3, 5, '11:40:36', '12:01:54', '12:02:05',  2);
-- call Client_order_in_itinerary_Insert (4, 6, '18:23:38', '18:29:30', '18:35:14', '19:28:16', 1);
-- call Client_order_in_itinerary_Insert (4, 8, '18:26:30', '18:29:30', '18:35:14', '19:59:04', 1);
-- call Client_order_in_itinerary_Insert (5, 9, 3);
-- INSERT INTO Client_order_in_itinerary (Itinerary_id, Client_order_id, Deliv_order_status_id)
-- VALUES (5, 9, 3);
-- select * from Client_order_in_itinerary;






















-- SELECT 
--     article_number as "Артикул", 
--     product_type as "Тип", 
--     season_name as "Сезон", 
--     shop_name as "Номер торговой точки"
-- FROM 
--     product
-- inner JOIN 
--     season_product ON product.id_product = product_id
-- inner JOIN 
--     Season ON season_product.season_id = id_season
-- inner JOIN 
--     Product_in_shop ON product.id_product = Product_in_shop.product_id
-- inner JOIN 
--     Shop ON Product_in_shop.shop_id = id_shop
-- WHERE 
--     shop_name = 'FG-02';


-- select
-- 	client_order_number as "номер заказа",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО",
-- 	customer_phone_number as "номер телефона клиента",
-- 	client_order_sum as "итоговую стоимость ",
-- 	receipt_sum as "внесено средств",
-- 	receipt_change as "сдача"
-- from client_order
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner join receipt on
-- 		id_client_order = client_order_id
-- 	where 
-- 		receipt_change < 500;


-- SELECT 
--     article_number as "Артикул", 
--     product_type as "Тип", 
--     size as "Размер", 
-- 	product_price as "Цена",
--     shop_name as "Номер торговой точки"
-- FROM 
--     product
-- inner JOIN 
--     product_size ON id_product = product_id
-- inner JOIN 
--     size ON size_id = id_size
-- inner JOIN 
--     Product_in_shop ON product.id_product = Product_in_shop.product_id
-- inner JOIN 
--     Shop ON Product_in_shop.shop_id = id_shop
-- WHERE 
--     product_price > 1000;


-- select
-- 	client_order_number as "номер заказа",
-- 	client_order_date as "датa формирования",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	client_order_sum as "итоговую стоимость ",
-- 	CONCAT_WS(' ', worker_surname, worker_name, worker_second_name) as "ФИО кассира",
-- 	worker_login as "логин кассира"
-- from client_order
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner join worker on
-- 		id_worker = worker_id
-- 	where 
-- 		worker_login <> 'wk_FedorovFF';



-- SELECT 
--     article_number as "Артикул", 
--     product_type as "Тип", 
-- 	season_name as "Сезон",
-- 	manufacturing_country_name as "Страна производителя"
-- FROM 
--     product
-- inner JOIN 
--     season_product ON id_product = product_id
-- inner JOIN 
--     Season ON season_id = id_season
-- inner JOIN 
--     manufacturing_country ON id_manufacturing_country = manufacturing_country_id
-- WHERE 
--     product_type like '%осень';


-- select
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО покупателя",
-- 	client_order_number as "Hомер заказа",
-- 	customer_phone_number as "Hомер телефона клиента",
-- 	article_number as "Aртикул"
-- 	
-- from client_order
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner JOIN 
-- 	    products_in_customer_order ON id_client_order = customer_order_id
-- 	inner JOIN 
-- 	    product ON product_id = id_product
-- 	where 
-- 		customer_phone_number not like '%975%';


-- SELECT 
--     article_number as "Артикул", 
-- 	season_name as "Сезон",
-- 	manufacturer_name as "Производитель",
-- 	size as "Размер"
-- FROM 
--     product
-- inner JOIN 
--     season_product ON id_product = product_id
-- inner JOIN 
--     Season ON season_id = id_season
-- inner JOIN 
--      manufacturer ON id_manufacturer = manufacturer_id
-- inner JOIN 
--     product_size ON id_product = product_size.product_id
-- inner JOIN 
--     size ON size_id = id_size
-- WHERE 
--     size in ('XL', '26');


-- select
-- 	client_order_number as "Hомер заказа",
-- 	CONCAT_WS(' ', client_order_date, client_order_time) as "Дата и время формирования",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	credit_card_info as "Hомер банковской карты",
-- 	article_number as "Aртикул"
-- 	
-- from client_order
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner JOIN 
-- 	    products_in_customer_order ON id_client_order = customer_order_id
-- 	inner JOIN 
-- 	    product ON product_id = id_product
-- 	where 
-- 		article_number not in ('SP/0000001', 'SP/0000003');


-- SELECT 
--     article_number as "Артикул", 
--     product_type as "Тип", 
--     composition_name as "Состав", 
--     product_amount as "Kоличество ",
-- 	product_price as "Цена"
-- FROM 
--     product
-- inner JOIN 
--     composition_product ON product.id_product = product_id
-- inner JOIN 
--     composition ON composition_product.composition_id = id_composition
-- WHERE 
--     product_amount between 400 and 500;


-- select
-- 	client_order_number as "Hомер заказа",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	CONCAT_WS(' ', worker_surname, worker_name, worker_second_name) as "ФИО кассира",
-- 	credit_card_info as "Hомер банковской карты ",
-- 	client_order_sum as "Итоговую стоимость ",
-- 	receipt_sum as "Bнесено средств"
-- from client_order
-- 	inner join customer on 
-- 		id_customer = customer_id
-- 	inner join receipt on
-- 		id_client_order = client_order_id
-- 	inner join worker on
-- 		id_worker = worker_id
-- where 
-- 		receipt_sum not between 20000 and 30000;


-- SELECT 
-- 	itinerary_number as "номер маршрутного листа",
-- 	client_order_number as "номер клиентского заказа",
-- 	itinerary_date as "датa создания маршрутного листа",
-- 	concat_ws(' ', delivery_man_surname, delivery_man_name, delivery_man_second_name) as "ФИО курьера",
-- 	concat_ws(' ', car_model, car_number) as "маркa и модель автомобиля",
-- 	overall_status as "статус маршрутного листа"
-- FROM 
--     itinerary
-- inner JOIN 
--     delivery_man ON id_delivery_man = delivery_man_id
-- inner JOIN 
--     car ON id_car = car_id
-- inner JOIN 
--     client_order_in_itinerary ON id_itinerary = itinerary_id
-- inner JOIN 
--     deliv_order_status ON id_deliv_order_status = deliv_order_status_id
-- inner JOIN 
--     client_order ON client_order_id = id_client_order
-- inner JOIN 
--     overall_status ON overall_status_id = id_overall_status
-- WHERE 
-- 	overall_status = 'Выполняется' AND
--     delivery_order_status in ('В пути', 'Ожидает выдачи') ;


-- SELECT 
-- 	shop_name as "Торговая точка",
--     article_number as "Артикул", 
--     product_type as "Тип", 
--     composition_name as "Состав",
-- 	case 
--     	when product.product_amount between 0 and 300 then 'Скудные запасы'
-- 		when product.product_amount between 301 and 700 then 'Нормальные запасы'
-- 		when product.product_amount > 701  then 'Большие запасы'
-- 	end as "Kоличество"
-- FROM 
--     product
-- inner JOIN 
--     composition_product ON product.id_product = product_id
-- inner JOIN 
--     composition ON composition_product.composition_id = id_composition
-- inner JOIN
-- 	Product_in_shop ON product.id_product = Product_in_shop.product_id
-- inner JOIN 
--     Shop ON Product_in_shop.shop_id = id_shop;


-- select 
-- 	shop_address as "Торговая точка",
-- 	count(product_id) as "Количество позиций продукции"
-- from shop
-- 	inner join product_in_shop on
-- 		id_shop = shop_id
-- 	group by 
-- 		shop_address;


-- Select 
-- 	shop_name as "Торговая точка",
-- 	sum(product_amount) as "Количество продукции"
-- from shop
-- 	inner join product_in_shop on
-- 		id_shop = shop_id
-- 	group by 
-- 		shop_name;


-- select 
-- 	concat_ws(' ', worker_surname, worker_name, worker_second_name) as "ФИО сотрудника",
-- 	avg(client_order_sum) as "Среднеарифметический результат выручки"
-- from worker
-- 	inner join client_order on
-- 		id_worker = worker_id
-- 	group by
-- 		worker_surname, worker_name, worker_second_name;


-- select 
-- 	shop_name as "Торговая точка",
-- 	round(avg(product_amount), 0) as "Cреднее количество позиций "
-- from shop
-- 	inner join product_in_shop on
-- 		id_shop = shop_id
-- 	group by 
-- 		shop_name;


-- select 
-- 	CONCAT_WS(',  ', article_number, product_type, season_name, product.product_amount, product_price) as "Продукция",
-- 	CONCAT(shop_name, ',  ', warehouse_number) as "Hомер торговой точки и склада"
-- from product
-- 	inner JOIN 
-- 	    season_product ON id_product = product_id
-- 	inner JOIN 
-- 	    Season ON season_id = id_season
-- 	inner join product_in_shop on
-- 			product.id_product = product_in_shop.product_id
-- 	inner join shop on
-- 			shop.id_shop = product_in_shop.shop_id
-- 	inner join warehouse on
-- 			shop.id_shop = warehouse.shop_id


-- select 
-- 	concat_ws('  ', article_number, product_type, manufacturer_name) as "Продукция",
-- 	group_concat(composition_name, ' ') as "Cостав продукции"
-- from product
-- 	inner JOIN 
-- 	    manufacturer ON id_manufacturer = manufacturer_id
-- 	inner JOIN 
-- 	    composition_product ON id_product = product_id
-- 	inner JOIN 
-- 	    composition ON id_composition = composition_id
-- 	group by 
-- 		article_number, product_type, manufacturer_name;


-- select 
-- 	article_number as "Артикул",
-- 	product_type as "Вид одежды",
-- 	manufacturing_country_name as "Страна производителя",
-- 	manufacturer_name as "Производитель",
-- 	length(manufacturer_name) as "Длина названия производителя"
-- from product
-- 	inner JOIN 
-- 	    manufacturing_country ON id_manufacturing_country = manufacturing_country_id
-- 	inner JOIN 
-- 	    manufacturer ON manufacturer_id = id_manufacturer;


-- select 
-- 	warehouse_number as "Номер склада",
-- 	warehouse_address as "Адрес  склада",
-- 	substring(article_number, 4) as "Числовую часть артикля одежды "
-- from warehouse
-- 	inner JOIN 
-- 	    shop ON id_shop = shop_id
-- 	inner JOIN 
-- 	    product_in_shop ON product_in_shop.shop_id = shop.id_shop
-- 	inner JOIN 
-- 	    product ON product_id = id_product;


-- select 
-- 	article_number as "Артикул",
-- 	product_type as "Вид одежды",
-- 	upper(season_name) as "СЕЗОН"
-- from product
-- 	inner JOIN 
-- 	    season_product ON id_product = product_id
-- 	inner JOIN 
-- 	    Season ON season_id = id_season

-- select 
-- 	shop_name as "Номер торговой точки",
-- 	shop_address as "Aдрес торговой точки",
-- 	lower(warehouse_number) as "Номер склада"
-- from shop
-- 	inner JOIN 
-- 	    warehouse ON id_shop = shop_id


-- select 
-- 	client_order_number as "Номер заказа клиента",
-- 	receipt_number as "Номер чека",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	receipt_sum as "Bнесённая сумма",
--     -- date_format(date_create_sg, '%D/%M/%Y') as "Дата создания"
-- 	concat('Распечатан – ', ' ', date_format(receipt_date,  '%D/%M/%Y'), ':', date_format(receipt_time, '%H/%I')) as "Дата и время формирования чека"
-- from client_order
-- 	inner JOIN 
-- 	    receipt ON id_client_order = client_order_id
-- 	inner join
-- 		customer on id_customer = customer_id;


-- select 
-- 	client_order_number as "Номер заказа клиента",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	credit_card_info as "Hомер банковской карты",
-- 	article_number as "Aртикул",
--     concat('Месяц: ',extract(Month from client_order_date)) as "Месяц",
--     concat('Год: ',extract(Year from client_order_date)) as "Год",
--     concat('Час: ',extract(Hour from client_order_time)) as "Час",
--     concat('Минуты: ',extract(Minute from client_order_time)) as "Минуты"
-- from client_order
-- 	inner JOIN 
-- 		products_in_customer_order ON id_client_order = customer_order_id
-- 	inner JOIN 
-- 	    product ON id_product = product_id
-- 	inner join
-- 		customer on id_customer = customer_id;


-- select 
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	receipt_number as "Hомер кассового чека",
-- 	Receipt_date as "Дата формирования чека",
--     DATE_ADD(receipt_date, INTERVAL 14 DAY) AS `Окончание даты возврата товара`
-- from customer
-- 	inner JOIN 
-- 		client_order ON id_customer = customer_id
-- 	inner JOIN 
-- 	    receipt ON id_client_order = client_order_id;


-- SELECT 
--     itinerary_number AS "Hомер маршрутного листа",
--     itinerary_date AS "датa формирования",
--     itinerary_time AS "время формирования",
--     client_order_number AS "номер заказа",
--     CONCAT(delivery_man_surname, ' ', delivery_man_name, ' ', delivery_man_second_name) AS "ФИО курьера",
--     CONCAT('C формирования заказа до сбора: ', TIMEDIFF(packaging_time, itinerary_time)) AS "Время до сбора",
--     CONCAT('C формирования заказа до передачи заказа курьеру: ', TIMEDIFF(cl_order_to_curier_time, itinerary_time)) AS "Время до передачи заказа курьеру",
--     CONCAT('C формирования заказа до момента заказ в пути: ', TIMEDIFF(order_on_way, itinerary_time)) AS "Время в пути",
--     CONCAT('C формирования заказа до передачи его покупателю: ', TIMEDIFF(cl_order_to_client, itinerary_time)) AS "Время до передачи заказа покупателю"
-- FROM 
--     itinerary
-- INNER JOIN 
--     client_order_in_itinerary ON id_itinerary = itinerary_id
-- INNER JOIN 
--     delivery_man ON id_delivery_man = delivery_man_id
-- INNER JOIN 
--     client_order ON id_client_order = client_order_id
-- INNER JOIN 
--     receipt ON id_client_order = receipt.client_order_id;


-- select 
-- 	client_order_number as "номер заказа",
-- 	client_order_date as "датa формирования заказа",
-- 	credit_card_info as "номер банковской карты",
-- 	client_order_sum as "итоговую стоимость заказа"
-- from client_order
-- 	inner JOIN 
-- 		customer ON id_customer = customer_id
-- 	where client_order_sum = (select max(client_order_sum) from client_order) ;



-- select 
-- 	receipt_number as "Номер чека",
-- 	receipt_date as "Дата формирования",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	receipt_sum as "Bнесённая сумма",
-- 	receipt_change as "Cдача "
-- from client_order
-- 	inner JOIN 
-- 	    receipt ON id_client_order = client_order_id
-- 	inner join
-- 		customer on id_customer = customer_id
-- 	where receipt_change = (select min(receipt_change) from receipt);

-- select 
-- 	client_order_number as "Номер заказа клиента",
-- 	CONCAT_WS(' ', customer_surname, customer_name, customer_last_name) as "ФИО клиента",
-- 	client_order_date||' '||client_order_time as "Дата и время формирования",
-- 	client_order_sum as "Итоговую стоимость заказа",
-- 	
-- 	row_number() over (order by product_type, products_in_customer_order.product_amount) as "№ П/П",
-- 	product_type as "Продукция",
-- 	products_in_customer_order.product_amount as "Кол-во продукции"
-- from client_order
-- 	inner JOIN 
-- 		products_in_customer_order ON id_client_order = customer_order_id
-- 	inner JOIN 
-- 	    product ON id_product = product_id
-- 	inner join
-- 		customer on id_customer = customer_id
-- 	where 
-- 		client_order_number = 'ЗкП-000000001-23';


-- select 
-- 	distinct client_order_date as "Даты формирования заказов клиентов"
-- from client_order;

-- SELECT 
--     client_order_number AS "Номер заказа клиента",
--     CONCAT(customer_surname, ' ', customer_name, ' ', customer_last_name) AS "ФИО клиента",
--     CONCAT(client_order_date, ' ', client_order_time) AS "Дата и время формирования",
--     COUNT(product_id) AS "Кол-во позиций"
-- FROM 
--     client_order
--     INNER JOIN 
--     products_in_customer_order ON id_client_order = customer_order_id
--     INNER JOIN 
--     customer ON id_customer = customer_id
-- GROUP BY 
--     client_order_number, customer_surname, customer_name, customer_last_name, client_order_date, client_order_time
-- ORDER BY 
--     COUNT(product_id) ASC
-- LIMIT 3;


s-- elect 
-- 	shop_name as "Номер торговой точки",
-- 	shop_address as "Aдрес торговой точки",
-- 	round(sum(receipt_sum-receipt_change)*0.6, 2) as "Премиальный фонд для сотрудников"
-- from shop
-- 	inner JOIN 
-- 	    worker ON id_shop = shop_id
-- 	inner JOIN 
-- 	    client_order ON id_worker = worker_id
-- 	inner JOIN 
-- 	    receipt ON id_client_order = client_order_id
-- 	group by
-- 		shop_name, shop_address


