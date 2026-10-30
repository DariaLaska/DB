DELIMITER $$
CREATE FUNCTION Get_Worker_Data(p_Worker_Login TEXT, p_Worker_Password TEXT)
RETURNS TEXT
DETERMINISTIC
BEGIN
    DECLARE res TEXT;
    DECLARE exist_worker SMALLINT;
    DECLARE just_worker SMALLINT;

    SELECT COUNT(*) INTO exist_worker
    FROM Worker
    WHERE worker_login = p_Worker_Login AND Worker_Password = p_Worker_Password;

    SELECT COUNT(client_order_number) INTO just_worker
    FROM client_order
    INNER JOIN worker ON id_worker = worker_id
    WHERE worker_login = p_Worker_Login AND Worker_Password = p_Worker_Password;

    IF exist_worker = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Сотрудник не найден!';
    ELSE
        IF just_worker = 0 THEN 
            SELECT concat('ФИО: ', worker_surname, ' ', worker_name, ' ', worker_second_name, ', должность: ', position_name, ', ', GROUP_CONCAT(DISTINCT CONCAT( request_number)))
            INTO res
            FROM worker
            INNER JOIN positions ON id_position = position_id
            INNER JOIN request ON id_worker = worker_id
            WHERE worker_login = p_Worker_Login AND Worker_Password = p_Worker_Password
            group by worker_surname, worker_name, worker_second_name, position_name;
        ELSE 
            SELECT CONCAT('ФИО: ', worker_surname, ' ', worker_name, ' ', worker_second_name, ', должность: ', position_name, ', ', GROUP_CONCAT(DISTINCT (client_order_number)))
            INTO res
            FROM worker
            INNER JOIN positions ON id_position = position_id
            INNER JOIN client_order ON id_worker = worker_id
            WHERE worker_login = p_Worker_Login AND Worker_Password = p_Worker_Password
            group by worker_surname, worker_name, worker_second_name, position_name;
        END IF;
    END IF;
    RETURN res;
END;
$$ DELIMITER ;


select Get_Worker_Data('wk_IvanovII', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_GlebovGG', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_PavlovPP', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_AlekseevAA', 'Pa$$w0rd');
-- select Get_Worker_Data('wk_FedorovFF', 'Pa$$w0rd');
-- select Get_Worker_Data('User1', 'Password');





-- DELIMITER $$

-- CREATE FUNCTION Get_Product_in_Shop(p_Shop_Name VARCHAR(255))
-- RETURNS TEXT
-- DETERMINISTIC
-- BEGIN
--     DECLARE p_Products TEXT;

--     IF p_Shop_Name IS NULL THEN
--         SELECT GROUP_CONCAT(CONCAT(article_number, ', вид одежды: ', product_type) SEPARATOR ',')
--         INTO p_Products
--         FROM product
--         INNER JOIN product_in_shop ON id_product = product_id
--         INNER JOIN shop ON id_shop = shop_id;
--     ELSE
--         IF (SELECT COUNT(product_id) 
--             FROM product_in_shop
--             INNER JOIN shop ON id_shop = shop_id
--             WHERE shop_name = p_Shop_Name) = 0 THEN
--             SET p_Products = 'Тогровая точка не найдена!';
--         ELSE
--             SELECT GROUP_CONCAT(CONCAT(article_number, ', вид одежды: ', product_type) SEPARATOR ',')
--             INTO p_Products
--             FROM product
--             INNER JOIN product_in_shop ON id_product = product_id
--             INNER JOIN shop ON id_shop = shop_id
--             WHERE shop_name = p_Shop_Name;
--         END IF;
--     END IF;

--     RETURN p_Products;
-- END $$

-- DELIMITER ;


-- select Get_Product_in_Shop('FG-01');
-- select Get_Product_in_Shop('FG-02');
-- select Get_Product_in_Shop(Null);
-- select Get_Product_in_Shop('FG-03');





-- DELIMITER $$
-- CREATE PROCEDURE Get_Itinerary_List(IN p_Iinerary_number VARCHAR(255))
-- BEGIN
--     DECLARE itinerary_count INT;

--     SELECT COUNT(*) INTO itinerary_count FROM itinerary 
--     WHERE itinerary_number = p_Iinerary_number;

--     IF itinerary_count = 0 THEN 
--         SELECT 
--             'Ошибка' AS Cl_order_number,
--             'Нет данных' AS Customer_info,
--             'Нет данных' AS Actions,
--             'Нет данных' AS Delivery_man_info;
--     ELSE
--         SELECT 
--             client_order_number AS Cl_order_number, 
--             CONCAT(customer_surname, ' ', customer_name, ' ', customer_last_name, ', телефон: ', customer_phone_number) AS Customer_info,
--             CASE 
--                 WHEN cl_order_to_client IS NULL 
--                      AND (packaging_time IS NOT NULL OR cl_order_to_curier_time IS NOT NULL OR order_on_way IS NOT NULL)
--                 THEN 
--                     CONCAT('Товары заказа собраны, время: ', TIME_FORMAT(packaging_time, '%H:%i:%s'), 
--                            '; Заказ передан курьеру, время: ', TIME_FORMAT(cl_order_to_curier_time, '%H:%i:%s'), 
--                            '; Заказ в пути, время: ', TIME_FORMAT(order_on_way, '%H:%i:%s'))
--                 WHEN packaging_time IS NULL AND cl_order_to_curier_time IS NULL AND order_on_way IS NULL AND cl_order_to_client IS NULL 
--                 THEN 
--                     'Нет событий'
--                 ELSE 
--                     CONCAT('Товары заказа собраны, время: ', TIME_FORMAT(packaging_time, '%H:%i:%s'), 
--                            '; Заказ передан курьеру, время: ', TIME_FORMAT(cl_order_to_curier_time, '%H:%i:%s'), 
--                            '; Заказ в пути, время: ', TIME_FORMAT(order_on_way, '%H:%i:%s'), 
--                            '; Заказ передан клиенту, время: ', TIME_FORMAT(cl_order_to_client, '%H:%i:%s'))
--             END AS Actions,
--             CONCAT(delivery_man_surname, ' ', delivery_man_name, ' ', delivery_man_second_name, ', Телефон: ', delivery_man_phone, ', автомобиль: ', car_model, ' ', car_number) AS Delivery_man_info
--         FROM itinerary
--         INNER JOIN client_order_in_itinerary ON id_itinerary = itinerary_id
--         INNER JOIN client_order ON id_client_order = client_order_id
--         INNER JOIN customer ON id_customer = customer_id
--         INNER JOIN delivery_man ON id_delivery_man = delivery_man_id
--         INNER JOIN car ON id_car = car_id
--         WHERE itinerary_number = p_Iinerary_number;
--     END IF;
-- END $$

-- DELIMITER ;

-- call  Get_Itinerary_List('Д-МЛ-23-0000000001');
-- call Get_Itinerary_List('Д-МЛ-23-0000000002');
-- call Get_Itinerary_List('Д-МЛ-23-0000000003');
-- Call Get_Itinerary_List('Д-МЛ-23-0000000004');



-- grant execute on function Get_Itinerary_List to rl_customer;
-- grant execute on function Get_Product_in_Shop  to rl_worker;
-- grant execute on function Get_Worker_Data to rl_administrator;
-- grant execute on function Get_Itinerary_List to rl_administrator;




select 
	routine_name as "Название функции" 
from information_schema.routines
	where 
		routine_type = 'FUNCTION' and routine_schema = 'public'
union all
	select 
		count(specific_name)::text
	from information_schema.routines
		where 
			routine_type = 'FUNCTION' and routine_schema = 'public';


grant execute on procedure Get_Itinerary_List to rl_customer@'127.0.0.1';
grant execute on function Get_Product_in_Shop  to rl_worker@'127.0.0.1';
grant execute on function Get_Worker_Data to rl_administrator@'127.0.0.1';
grant execute on procedure Get_Itinerary_List to rl_administrator@'127.0.0.1';


 grant execute on procedure Get_Itinerary_List to sukhareva_customer;
 grant execute on function Get_Product_in_Shop  to sukhareva_worker;
 -- grant execute on function Get_Worker_Data to rl_administrator;
 grant execute on procedure Get_Itinerary_List to sukhareva_administrator;