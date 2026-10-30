-- DROP PROCEDURE Manufacturing_country_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Manufacturing_country_Insert(IN p_Manufacturing_country_name VARCHAR(36))
-- BEGIN
--     DECLARE EXIT HANDLER FOR SQLEXCEPTION
--     BEGIN
--         -- Raise a notice about the duplicate entry
--         SELECT 'Указанная страна уже есть в базе!' AS notice;
--     END;
--     INSERT INTO Manufacturing_country (Manufacturing_country_name)
--     VALUES (p_Manufacturing_country_name);
-- END $$
-- DELIMITER ;

-- CALL Manufacturing_country_Insert('Китай');


--     
-- END$$
-- DELIMITER ;

-- CALL Itinerary_Insert('2024-03-01', '10:00:00', 1, 1, 1);


-- DROP PROCEDURE  Customer_Delete;

-- DELIMITER $$
-- CREATE PROCEDURE Customer_Delete(IN p_ID_Customer INT)
-- BEGIN
--     DECLARE p_Exist_Client_order INT DEFAULT 0;
--     SELECT COUNT(*) INTO p_Exist_Client_order
--     FROM Client_order
--     WHERE Customer_id = p_ID_Customer;
--     IF p_Exist_Client_order > 0 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Выбранного клиента невозможно удалить!';
--     ELSE
--         DELETE FROM Customer
--         WHERE ID_Customer = p_ID_Customer;
--     END IF;
-- END; $$
-- DELIMITER ;
--  
-- CALL Customer_Delete(3);




-- DROP PROCEDURE IF EXISTS Season_product_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Season_product_Insert(IN p_Product_id INT, IN p_Season_id INT)
-- BEGIN
--     DECLARE p_Exist_Season INT;
--     SELECT COUNT(*) INTO p_Exist_Season
--     FROM Season_product
--     WHERE Product_id = p_Product_id AND Season_id = p_Season_id;
--     IF (p_Exist_Season <> 0) THEN
--         SELECT 'Указанный сезон уже есть у выбранного товара!' AS message;
--     ELSE
--         INSERT INTO Season_product(Product_id, Season_id)
--         VALUES (p_Product_id, p_Season_id);
--     END IF;
-- END $$
-- DELIMITER ;

-- CALL Season_product_Insert(1, 1);






drop procedure products_in_customer_order_Insert;
DELIMITER $$
create procedure products_in_customer_order_Insert (IN p_Customer_order_id INT, IN p_Product_id INT, IN p_Product_amount INT)
 	begin
		declare p_new_sum decimal(10,2);
		INSERT INTO Products_in_customer_order (Customer_order_id, Product_id, Product_amount)
        VALUES (p_Customer_order_id, p_Product_id, p_Product_amount);
    
		select sum(Product_price*products_in_customer_order.Product_amount) into p_new_sum from product
							 inner join products_in_customer_order on id_product = product_id
							 where Customer_order_id = p_Customer_order_id;
    
    
		update Client_order set
			Client_order_sum = p_new_sum
				where 
					ID_Client_order = p_Customer_order_id;
	end $$
DELIMITER ;

select * from products_in_customer_order 
where Customer_order_id = 5;






-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Insert (
--     p_Itinerary_date DATE,
--     p_Itinerary_time TIME,
--     p_Delivery_man_id INT,
--     p_Car_id INT,
--     p_Overall_status_id INT
-- )
-- BEGIN
--     DECLARE p_New_Number int;
--     DECLARE p_Year VARCHAR(2);
--     DECLARE p_Symb_Len INT;
--     DECLARE p_Loop_Max_Step INT;
--     DECLARE p_New_Text_Number VARCHAR(21) DEFAULT '';
--     DECLARE formatted_number VARCHAR(21);    
--     SELECT COUNT(*) + 1 INTO p_New_Number FROM Itinerary;
--     SET p_Year = DATE_FORMAT(p_Itinerary_date, '%y');
--     SET p_Symb_Len = LENGTH(p_New_Number); 
--     SET p_Loop_Max_Step = 10 - p_Symb_Len;
--     WHILE p_Loop_Max_Step > 0 DO
--         SET p_New_Text_Number = CONCAT(p_New_Text_Number, '0');
--         SET p_Loop_Max_Step = p_Loop_Max_Step - 1;
--     END WHILE;
--     SET formatted_number = CONCAT('Д-МЛ-', p_Year, '-', p_New_Text_Number, p_New_Number);
--     INSERT INTO Itinerary (Itinerary_number, 
--                            Itinerary_date, 
--                            Itinerary_time, 
--                            Delivery_man_id, 
--                            Car_id, 
--                            Overall_status_id)
--     VALUES (formatted_number, p_Itinerary_date, p_Itinerary_time, p_Delivery_man_id, p_Car_id, p_Overall_status_id);
-- END $$
-- DELIMITER ;


-- CALL Itinerary_Insert('2024-03-01', '10:00:00', 1, 1, 1);


-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Update (
--     IN p_ID_Itinerary INT,
--     IN p_Itinerary_date DATE, 
--     IN p_Itinerary_time TIME, 
--     IN p_Delivery_man_id INT, 
--     IN p_Car_id INT, 
--     IN p_Overall_status_id INT
-- )
-- BEGIN
--     UPDATE Itinerary 
--     SET 
--         Itinerary_date = p_Itinerary_date,
--         Itinerary_time = p_Itinerary_time,
--         Delivery_man_id = p_Delivery_man_id,
--         Car_id = p_Car_id,
--         Overall_status_id = p_Overall_status_id
--     WHERE 
--         ID_Itinerary = p_ID_Itinerary;
-- END$$
-- DELIMITER ;


-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Delete (
--     IN p_ID_Itinerary INT
-- )
-- BEGIN
--     DECLARE p_Exist INT;
--     SELECT COUNT(*) INTO p_Exist 
--     FROM Client_order_in_itinerary 
--     WHERE Itinerary_id = p_ID_Itinerary;  -- Assuming you meant p_ID_Itinerary
--     IF p_Exist > 0 THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Selected itinerary cannot be deleted!';
--     ELSE
--         DELETE FROM Itinerary
--         WHERE ID_Itinerary = p_ID_Itinerary;  -- Assuming you meant ID_Itinerary
--     END IF;
-- END$$
-- DELIMITER ;








-- DELIMITER $$

-- CREATE PROCEDURE Car_Insert (
--     IN p_Car_model VARCHAR(36), 
--     IN p_Car_number VARCHAR(12)
-- )
-- BEGIN
--     INSERT INTO Car (Car_model, Car_number)
--     VALUES (p_Car_model, p_Car_number);
-- END $$
-- DELIMITER ;


-- call Car_Insert('KIA Rio', 'O464OP 77');
-- select * from Car;


-- DELIMITER $$

-- CREATE PROCEDURE Delivery_man_Insert(
--     IN p_Delivery_man_surname VARCHAR(36), 
--     IN p_Delivery_man_name VARCHAR(36),
--     IN p_Delivery_man_second_name VARCHAR(36),
--     IN p_Delivery_man_phone VARCHAR(19)
-- )
-- BEGIN
--     INSERT INTO Delivery_man(Delivery_man_surname, Delivery_man_name, Delivery_man_second_name, Delivery_man_phone)
--     VALUES (p_Delivery_man_surname, p_Delivery_man_name, p_Delivery_man_second_name, p_Delivery_man_phone);
-- END $$

-- DELIMITER ;

-- call Delivery_man_Insert('Павлов', 'Роман', 'Дмитриевич', '+7(999)999-99-99');
-- select * from Delivery_man;





-- DELIMITER $$

-- CREATE PROCEDURE Overall_status_Insert(
--     IN p_Overall_status VARCHAR(36) 
-- )
-- BEGIN
--     INSERT INTO Overall_status(Overall_status)
--     VALUES (p_Overall_status);
-- END $$

-- DELIMITER ;


-- CALL Overall_status_Insert('Выполняется');
-- CALL Overall_status_Insert('Завершён');

-- SELECT * FROM Overall_status;



-- DELIMITER $$
-- CREATE PROCEDURE Overall_status_Update(IN p_ID_Overall_status INT, IN p_Overall_status VARCHAR(36))
-- BEGIN
--     DECLARE status_exists INT;
--     SELECT COUNT(*) INTO status_exists
--     FROM Overall_status
--     WHERE ID_Overall_status = p_ID_Overall_status;
--     IF status_exists > 0 THEN
--         UPDATE Overall_status
--         SET Overall_status = p_Overall_status
--         WHERE ID_Overall_status = p_ID_Overall_status;
--     ELSE
--         -- Notify that the status doesn't exist
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Такой статус уже есть!';
--     END IF;
-- END $$
-- DELIMITER ;


-- DELIMITER $$
-- CREATE PROCEDURE Overall_status_Delete(IN p_ID_Overall_status INT)
-- BEGIN
--     DECLARE p_Exist INT;
--     SELECT COUNT(*) INTO p_Exist
--     FROM Itinerary
--     WHERE Car_id = p_ID_Overall_status;
--     IF p_Exist > 0 THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Выбранный статус нельзя удалить, он есть в маршутном листе!';
--     ELSE
--         -- Delete the status
--         DELETE FROM Overall_status
--         WHERE Overall_status_id = p_ID_Overall_status;
--     END IF;
-- END $$
-- DELIMITER ;







-- DELIMITER $$
-- CREATE PROCEDURE Deliv_order_status_Insert(IN p_Delivery_order_status VARCHAR(36))
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SELECT 'Указанный статус уже есть!' AS message;
--     END;

--     INSERT INTO Deliv_order_status(Delivery_order_status)
--     VALUES (p_Delivery_order_status);
-- END $$
-- DELIMITER ;



-- DELIMITER $$
-- CREATE PROCEDURE Deliv_order_status_Update(IN p_ID_Deliv_order_status INT, IN p_Delivery_order_status VARCHAR(36))
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SELECT 'Указанный статус уже есть!' AS message;
--     END;
--     UPDATE Deliv_order_status
--     SET Delivery_order_status = p_Delivery_order_status
--     WHERE ID_Deliv_order_status = p_ID_Deliv_order_status;
-- END $$
-- DELIMITER ;



-- DELIMITER $$
-- CREATE PROCEDURE Deliv_order_status_Delete(IN p_ID_Deliv_order_status INT)
-- BEGIN
--     DECLARE p_Exist INT;
--     SELECT COUNT(*) INTO p_Exist 
--     FROM Client_order_in_itinerary
--     WHERE Deliv_order_status_id = p_ID_Deliv_order_status;
--     IF p_Exist > 0 THEN
--         SELECT 'Выбранный тип удалить нельзя, есть созданная ID карта!' AS message;
--     ELSE
--         DELETE FROM Deliv_order_status
--         WHERE ID_Deliv_order_status = p_ID_Deliv_order_status;
--     END IF;
-- END $$
-- DELIMITER ;





-- DELIMITER $$
-- CREATE PROCEDURE Delivery_man_Update(
--     IN p_ID_Delivery_man INT,
--     IN p_Delivery_man_surname VARCHAR(36),
--     IN p_Delivery_man_name VARCHAR(36),
--     IN p_Delivery_man_second_name VARCHAR(36),
--     IN p_Delivery_man_phone VARCHAR(19)
-- )
-- BEGIN
--     DECLARE EXIT HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SELECT 'Такой курьер уже есть!' AS message;
--     END;
--     UPDATE Delivery_man
--     SET
--         Delivery_man_surname = p_Delivery_man_surname,
--         Delivery_man_name = p_Delivery_man_name,
--         Delivery_man_second_name = p_Delivery_man_second_name,
--         Delivery_man_phone = p_Delivery_man_phone
--     WHERE
--         ID_Delivery_man = p_ID_Delivery_man;
-- END $$
-- DELIMITER ;







-- DELIMITER $$
-- CREATE PROCEDURE Car_Delete(IN p_ID_Car INT)
-- BEGIN
--     DECLARE p_Exist INT;
--     SELECT COUNT(*) INTO p_Exist FROM Itinerary WHERE Car_id = p_ID_Car;
--     IF p_Exist > 0 THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Выбранный автомобиль нельзя удалить, он есть в маршутном листе!';
--     ELSE
--         DELETE FROM Car WHERE ID_Car = p_ID_Car;
--     END IF;
-- END $$
-- DELIMITER ;


-- DELIMITER $$
-- CREATE PROCEDURE Car_Update(IN p_ID_Car INT, IN p_Car_model VARCHAR(36), IN p_Car_number VARCHAR(12))
-- BEGIN
--     DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
--     BEGIN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Такой автомобиль уже есть!';
--     END;
--     UPDATE Car
--     SET Car_model = p_Car_model,
--         Car_number = p_Car_number
--     WHERE ID_Car = p_ID_Car;
-- END $$
-- DELIMITER ;






-- DELIMITER $$
-- CREATE PROCEDURE Client_order_in_itinerary_Insert (
--     IN p_Itinerary_id INT,
--     IN p_Client_order_id INT,
--     IN p_Packaging_time TIME,
--     IN p_Cl_order_to_curier_time TIME,
--     IN p_Order_on_way TIME,
--     IN p_Cl_order_to_client TIME,
--     IN p_Deliv_order_status_id INT
-- )
-- BEGIN
--     DECLARE p_Itinerary_time TIME;
--     SELECT Itinerary_time INTO p_Itinerary_time
--     FROM Itinerary
--     WHERE ID_itinerary = p_Itinerary_id;
--     IF p_Itinerary_time <= p_Packaging_time AND
--        p_Itinerary_time <= p_Cl_order_to_curier_time AND
--        p_Itinerary_time <= p_Order_on_way AND
--        p_Itinerary_time <= p_Cl_order_to_client THEN
--         INSERT INTO Client_order_in_itinerary (Itinerary_id, Client_order_id, Packaging_time, Cl_order_to_curier_time, Order_on_way, Cl_order_to_client, Deliv_order_status_id)
--         VALUES (p_Itinerary_id, p_Client_order_id, p_Packaging_time, p_Cl_order_to_curier_time, p_Order_on_way, p_Cl_order_to_client, p_Deliv_order_status_id);
--     ELSE
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Время действия над позицией не может быть раньше даты формирования общего маршрутного листа';
--     END IF;
-- END $$
-- DELIMITER ;




-- DELIMITER $$
-- CREATE PROCEDURE Client_order_in_itinerary_Update (
--     IN p_ID_Client_order_in_itinerary INT,
--     IN p_Itinerary_id INT,
--     IN p_Client_order_id INT,
--     IN p_Packaging_time TIME,
--     IN p_Cl_order_to_curier_time TIME,
--     IN p_Order_on_way TIME,
--     IN p_Cl_order_to_client TIME,
--     IN p_Deliv_order_status_id INT
-- )
-- BEGIN
--     UPDATE Client_order_in_itinerary
--     SET
--         Itinerary_id = p_Itinerary_id,
--         Client_order_id = p_Client_order_id,
--         Packaging_time = p_Packaging_time,
--         Cl_order_to_curier_time = p_Cl_order_to_curier_time,
--         Order_on_way = p_Order_on_way,
--         Cl_order_to_client = p_Cl_order_to_client,
--         Deliv_order_status_id = p_Deliv_order_status_id
--     WHERE ID_Client_order_in_itinerary = p_ID_Client_order_in_itinerary;
-- END $$
-- DELIMITER ;

-- DELIMITER $$
-- CREATE PROCEDURE Client_order_in_itinerary_Delete (
--     IN p_ID_Client_order_in_itinerary INT
-- )
-- BEGIN
--     DELETE FROM Client_order_in_itinerary
--     WHERE Client_order_in_itinerary_id = p_ID_Client_order_in_itinerary;
-- END $$
-- DELIMITER ;








-- DROP PROCEDURE Request_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Request_Insert(
--     IN p_Request_number VARCHAR(12),
--     IN p_Request_date DATE,
--     IN p_Worker_id INT
-- )
-- BEGIN
--     IF p_Request_date < CURDATE() THEN
--         SIGNAL SQLSTATE '45000' 
--         SET MESSAGE_TEXT = 'Дата создания учебной группы должна быть в настоящем времени!';
--     ELSE
--         INSERT INTO Request (Request_number, Request_date, Worker_id)
--         VALUES (p_Request_number, p_Request_date, p_Worker_id);
--     END IF;
-- END $$
-- DELIMITER ;






-- drop procedure Customer_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Customer_Insert(
--     IN p_Customer_surname VARCHAR(36),
--     IN p_Customer_name VARCHAR(36),
--     IN p_Customer_last_name VARCHAR(36),
--     IN p_Passport_series VARCHAR(5),
--     IN p_Passport_number VARCHAR(6),
--     IN p_Issue_data DATE,
--     IN p_Customer_phone_number VARCHAR(16),
--     IN p_Credit_card_info VARCHAR(19),
--     IN p_Cusomer_email VARCHAR(36),
--     IN p_Customer_login VARCHAR(36),
--     IN p_Customer_password VARCHAR(36)
-- )
-- BEGIN
--     DECLARE current_year INT;
--     SET current_year = YEAR(CURDATE());
--     IF TIMESTAMPDIFF(YEAR, p_Issue_data, CURDATE()) >= 14 THEN
--         INSERT INTO Customer(
--             Customer_surname, 
--             Customer_name, 
--             Customer_last_name, 
--             Passport_series, 
--             Passport_number, 
--             Issue_data, 
--             Customer_phone_number, 
--             Credit_card_info, 
--             Cusomer_email, 
--             Customer_login, 
--             Customer_password
--         ) VALUES (
--             p_Customer_surname, 
--             p_Customer_name, 
--             p_Customer_last_name, 
--             p_Passport_series, 
--             p_Passport_number, 
--             p_Issue_data, 
--             p_Customer_phone_number, 
--             p_Credit_card_info, 
--             p_Cusomer_email, 
--             p_Customer_login, 
--             p_Customer_password
--         );
--     ELSE
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Дата выдачи паспорта, должна иметь разницу относительно текущей даты, не менее 14 лет!';
--     END IF;
-- END $$
-- DELIMITER ;


-- drop procedure Order_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Order_Insert (
--     IN p_Order_number VARCHAR(16),
--     IN p_Supplier_id INT,
--     IN p_Order_date DATE,
--     IN p_Order_time TIME,
--     IN p_Order_status_id INT,
--     IN p_Costs DECIMAL(10,2)
-- )
-- BEGIN
--     IF p_Order_date = CURDATE() AND p_Order_time = CURTIME() THEN
--         INSERT INTO Orders (Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs)
--         VALUES (p_Order_number, p_Supplier_id, p_Order_date, p_Order_time, p_Order_status_id, p_Costs);
--     ELSE
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Дата заказа должна быть в настоящем времени!';
--     END IF;
-- END$$
-- DELIMITER ;



-- drop procedure Itinerary_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Itinerary_Insert(
--     IN p_Itinerary_date DATE,
--     IN p_Itinerary_time TIME,
--     IN p_Delivery_man_id INT,
--     IN p_Car_id INT,
--     IN p_Overall_status_id INT
-- )
-- BEGIN
--     DECLARE p_New_Number INT;
--     DECLARE p_Year INT;
--     DECLARE p_Symb_Len INT;
--     DECLARE p_Loop_Max_Step INT;
--     DECLARE p_New_Text_Number VARCHAR(21);
--     DECLARE p_cl_order_id INT;
--     DECLARE p_Form_data DATE;
--     SELECT COUNT(*) INTO p_New_Number FROM Itinerary;
--     SET p_New_Number = p_New_Number + 1;
--     SET p_Year = YEAR(p_Itinerary_date) % 100; -- Get the last two digits of the year
--     SET p_Symb_Len = LENGTH(p_New_Number);
--     SET p_Loop_Max_Step = 10 - p_Symb_Len;
--     SET p_New_Text_Number = '';
--     WHILE p_Loop_Max_Step > 0 DO
--         SET p_New_Text_Number = CONCAT(p_New_Text_Number, '0');
--         SET p_Loop_Max_Step = p_Loop_Max_Step - 1;
--     END WHILE;
--     SET p_New_Text_Number = CONCAT('Д-МЛ-', p_Year, '-', p_New_Text_Number, p_New_Number);
--     SELECT Client_order_id INTO p_cl_order_id FROM Client_order_in_itinerary ;
--     SELECT client_order_date INTO p_Form_data FROM Client_order WHERE id_client_order = p_cl_order_id;
--     IF p_Form_data > p_Itinerary_date THEN
--         SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Дата заказа должна быть в настоящем времени!';
--     ELSE
--         INSERT INTO Itinerary (Itinerary_number, Itinerary_date, Itinerary_time, Delivery_man_id, Car_id, Overall_status_id)
--         VALUES (p_New_Text_Number, p_Itinerary_date, p_Itinerary_time, p_Delivery_man_id, p_Car_id, p_Overall_status_id);
--     END IF;
-- END $$
-- DELIMITER ;






-- drop procedure Client_order_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Client_order_Insert(
--     IN p_Client_order_number VARCHAR(19), 
--     IN p_Customer_id INT, 
--     IN p_Client_order_date DATE, 
--     IN p_Client_order_time TIME,
--     IN p_Client_order_sum DECIMAL(10,2), 
--     IN p_Worker_id INT
-- )
-- BEGIN
--     IF (p_Client_order_date = CURDATE()) THEN
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Дата создания заказа должна быть в будущем!';
--     ELSE
--         INSERT INTO Client_order(Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id)
--         VALUES (p_Client_order_number, p_Customer_id, p_Client_order_date, p_Client_order_time, p_Client_order_sum, p_Worker_id);
--     END IF;
-- END $$
-- DELIMITER ;




-- drop procedure Receipt_Insert;

-- DELIMITER $$
-- CREATE PROCEDURE Receipt_Insert (
--     IN p_Receipt_number VARCHAR(36),
--     IN p_Client_order_id INT,
--     IN p_Receipt_date DATE,
--     IN p_Receipt_time TIME,
--     IN p_Receipt_sum DECIMAL(10,2),
--     IN p_Receipt_change DECIMAL(10,2)
-- )
-- BEGIN
--     IF (p_Receipt_date = CURDATE() AND p_Receipt_time = CURTIME()) THEN
--         INSERT INTO Receipt
--             (Receipt_number, Client_order_id, Receipt_date, Receipt_time, Receipt_sum, Receipt_change)
--         VALUES
--             (p_Receipt_number, p_Client_order_id, p_Receipt_date, p_Receipt_time, p_Receipt_sum, p_Receipt_change);
--     ELSE
--         SIGNAL SQLSTATE '45000'
--         SET MESSAGE_TEXT = 'Дата создания чека должна быть в настоящем времени!';
--     END IF;
-- END$$
-- DELIMITER ;
