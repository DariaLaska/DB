-- insert into Position(Position_name) values ('Старший кассир');
-- call Position_Insert('Кассир');


-- insert into Sales_floor(Sales_floor_name) values ('Мужская');
-- call Sales_floor_Insert('Женская');
-- call Sales_floor_Insert('Детская');

-- ALTER TABLE Shop
-- ALTER COLUMN Shop_address TYPE Varchar(150);
-- insert into Shop(Shop_name, Shop_address) values ('FG-01', 'ул. Беговая, д. 17, стр. 8');
-- call Shop_Insert('FG-02', 'г. Москва, ул. Комсомольская, д. 56, стр. 6');

-- ALTER TABLE Warehouse
-- ALTER COLUMN Warehouse_number TYPE Varchar(4);
-- ALTER TABLE Warehouse
-- ALTER COLUMN Warehouse_address TYPE Varchar(150);

-- insert into Warehouse(Warehouse_number, Warehouse_address, Shop_id) 
-- values ('СП01', 'г. Москва, ул. Беговая, д. 19, к. 1', 1),
-- ('СП02', 'г. Москва, ул. Беговая, д. 19, к. 2 ', 1);

-- DROP PROCEDURE Warehouse_Insert ;
-- DROP PROCEDURE Warehouse_Update;
-- create or replace procedure Warehouse_Insert (p_Warehouse_number Varchar(4), p_Warehouse_address Varchar(150), p_Shop_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Warehouse (Warehouse_number, Warehouse_address, Shop_id)
-- 		values (p_Warehouse_number, p_Warehouse_address, p_Shop_id);
-- 	end;
-- $$;
-- create or replace procedure Warehouse_Update (p_ID_Warehouse Int, p_Warehouse_number Varchar(4), p_Warehouse_address Varchar(150), p_Shop_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Warehouse set
-- 		Warehouse_number = p_Warehouse_number,
-- 		Warehouse_address = p_Warehouse_address,
-- 		Shop_id = p_Shop_id

-- 			where 
-- 				ID_Warehouse = p_ID_Warehouse;
-- 	end;
-- $$;


-- call Warehouse_Insert('СП03', 'г. Москва, ул. Комсомольская, д. 52, к. 1', 2);
-- call Warehouse_Insert('СП04', 'г. Москва, ул. Комсомольская, д. 54, к. 1', 2);

-- ALTER TABLE Customer
-- ALTER COLUMN Credit_card_info TYPE Varchar(19);

-- insert into Customer(Customer_surname, Customer_name, Customer_last_name, Passport_series, Passport_number, Issue_data, Customer_phone_number, Credit_card_info, Cusomer_email, Customer_login, Customer_password) 
-- values ('Андреев', 'Виталий', 'Алексеевич', '49 62', '956384', '03.05.2021', '+7(975)351-48-69', '0324 6723 7235 7122',  'andreev_v_a@gmail.com', 'AndreevVA', 'Pa$$w0rd'),
-- ('Михаилов', 'Валентин', 'Олегович', '41 73', '898329', '10.12.2020', '+7(954)786-04-08', '6335 7323 7762 1234', 'mihailov_v_o@ya.ru', 'MichailovVO', 'Pa$$w0rd');

-- DROP PROCEDURE Customer_Insert ;
-- -- DROP PROCEDURE Customer_Update;
-- create or replace procedure Customer_Insert (
-- p_Customer_surname Varchar(36), 
-- p_Customer_name Varchar(36), 
-- p_Customer_last_name Varchar(36), 
-- p_Passport_series Varchar(5), 
-- p_Passport_number Varchar(6), 
-- p_Issue_data Date, 
-- p_Customer_phone_number Varchar(16), 
-- p_Credit_card_info Varchar(19), 
-- p_Cusomer_email Varchar(36),
-- p_Customer_login Varchar(36),
-- p_Customer_password Varchar(36)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Customer(Customer_surname, Customer_name, Customer_last_name, Passport_series, Passport_number, Issue_data, Customer_phone_number, Credit_card_info, Cusomer_email, Customer_login, Customer_password)
-- 		values (p_Customer_surname, p_Customer_name, p_Customer_last_name, p_Passport_series, p_Passport_number, p_Issue_data, p_Customer_phone_number, p_Credit_card_info, p_Cusomer_email, p_Customer_login, p_Customer_password);
-- 	end;
-- $$;
-- create or replace procedure Customer_Update (
-- p_ID_Customer Int,
-- p_Customer_surname Varchar(36), 
-- p_Customer_name Varchar(36), 
-- p_Customer_last_name Varchar(36), 
-- p_Passport_series Varchar(5), 
-- p_Passport_number Varchar(6), 
-- p_Issue_data Date, 
-- p_Customer_phone_number Varchar(16), 
-- p_Credit_card_info Varchar(19),
-- p_Cusomer_email Varchar(36),
-- p_Customer_login Varchar(36),
-- p_Customer_password Varchar(36)
-- );

-- language plpgsql
-- as $$
-- 	begin
-- 		update Customer set
-- 		Customer_surname = p_Customer_surname, 
-- 		Customer_name = p_Customer_name, 
-- 		Customer_last_name = p_Customer_last_name, 
-- 		Passport_series = p_Passport_series, 
-- 		Passport_number = p_Passport_number, 
-- 		Issue_data = p_Issue_data, 
-- 		Customer_phone_number = p_Customer_phone_number,
-- 		Credit_card_info = p_Credit_card_info, 
-- 		Cusomer_email = p_Cusomer_email, 
-- 		Customer_login = p_Customer_login, 
-- 		Customer_password = p_Customer_password			
-- 		where
-- 				ID_Customer = p_ID_Customer;
-- 	end;
-- $$;

-- call Customer_Insert('Михайлова', 'Елена', 'Андреевна', '41 78', '234577', '18.11.2019', '+7(975)124-57-60', '7223 7781 4325 9021', 'michailova_e_a@ya.ru', 'MihailovaEA', 'Pa$$w0rd');
-- call Customer_Insert('Сергеева', 'Валерия', 'Константиновна', '46 63', '430199', '06.05.2021', '+7(900)144-35-79', '4622 8992 1346 1334', 'sergeeva_b_k@gamil.com', 'SergeevaBK', 'Pa$$w0rd');

-- insert into Manufacturer(Manufacturer_name) values ('FugiStyle');
-- call Manufacturer_Insert('Пошивка');
-- call Manufacturer_Insert('GRT');

-- insert into Manufacturing_country(Manufacturing_country_name) values ('Таиланд');
-- call Manufacturing_country_Insert('Россия');
-- call Manufacturing_country_Insert('Китай');

-- drop procedure Product_Insert;
-- drop procedure Product_Update;
-- create or replace procedure Product_Insert (p_Article_number Varchar(10), 
-- p_Product_type Varchar(36),
-- p_Product_photo Text,
-- p_Manufacturing_country_id Int,
-- p_Manufacturer_id Int,
-- p_Product_amount Int,
-- p_Product_price Decimal(10,2)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product (Article_number, Product_type, Product_photo, Manufacturing_country_id, Manufacturer_id, Product_amount, Product_price)
-- 		values (p_Article_number, p_Product_type, p_Product_photo, p_Manufacturing_country_id, p_Manufacturer_id, p_Product_amount, p_Product_price);
-- 	end;
-- $$;

-- drop procedure Product_Update ;
create or replace procedure Product_Update (
p_ID_Product Int, 
p_Article_number Varchar(10), 
p_Product_type Varchar(36),
p_Product_photo Text,
p_Manufacturing_country_id Int,
p_Manufacturer_id Int,
p_Product_amount Int,
p_Product_price Decimal(10,2)
)

language plpgsql
as $$
	begin
		update Product set
		Article_number = p_Article_number, 
		Product_type = p_Product_type, 
		Product_photo = p_Product_photo,
		Manufacturing_country_id = p_Manufacturing_country_id, 
		Manufacturer_id = p_Manufacturer_id, 
		Product_amount = p_Product_amount, 
		Product_price = p_Product_price			where
				ID_Product = p_ID_Product;
	end;
$$;



-- insert into Product(Article_number, Product_type, Product_photo, Manufacturing_country_id, Manufacturer_id, Product_amount, Product_price) 
-- values ('SP/0000001', 'Футболка', 'С:\img1.png', 1, 1, 450, 299.99),
-- ('SP/0000002', 'Пальто', 'С:\img2.png', 2, 2, 500, 14000.00),
-- ('SP/0000003', 'Джемпер', 'С:\img3.png', 1, 1, 389, 450.00);
-- call Product_Insert('SP/0000004', 'Джемпер', 'С:\img4.png',1, 1, 300, 1500.00);
-- call Product_Insert('SP/0000005', 'Джемпер', 'С:\img5.png', 3, 3, 454, 359.99);

-- insert into Season(Season_name) values ('Летний'),
-- ('Осень');
-- call Season_Insert('Зима');
-- call Season_Insert('Демисезонная');

-- insert into Composition(Composition_name) values ('хлопок'),
-- ('синтетика'), ('войлок'),
-- ('кашемир'), ('шерсть');
-- call Composition_Insert('лён');
-- call Composition_Insert('кожа');
-- call Composition_Insert('кожзаменитель');

-- ALTER TABLE Size
-- ALTER COLUMN Size TYPE Varchar(10);
-- drop procedure Size_Insert;
-- drop procedure Size_Update;
-- create or replace procedure Size_Insert (p_Size varchar(10))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Size (Size)
-- 		values (p_Size);
-- 	end;
-- $$;

-- create or replace procedure Size_Update (p_ID_Size int, p_Size varchar(10))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Size set
-- 		Size = p_Size
-- 			where
-- 				ID_Size = p_ID_Size;
-- 	end;
-- $$;

-- insert into Size(Size) values ('XS'),
-- ('S'),
-- ('M'), 
-- ('L'),
-- ('XL'), 
-- ('20');
-- call Size_Insert('22');
-- call Size_Insert('24');
-- call Size_Insert('26');
-- call Size_Insert('28');
-- call Size_Insert('100 см');
-- call Size_Insert('120 см');


-- call Supplier_Insert('Вещи даром и не только');

-- insert into Order_status(Order_status) values ('Доставлено'), 
-- ('В пути');
-- call Order_status_Insert('В обработке');

-- ALTER TABLE Orders
-- ALTER COLUMN Order_number TYPE Varchar(16);


-- ALTER TABLE Orders
-- ALTER COLUMN Order_number TYPE Varchar(16);

-- ALTER TABLE Orders
-- ALTER COLUMN Order_time TYPE TIMESTAMP;

-- insert into Orders(Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs) 
-- values ('ЗП-0000000001-23', 1, '2023-08-30', '11:02:00', 1, 50000.00);

-- drop procedure Order_Insert;
-- drop procedure Order_Update;
-- create or replace procedure Order_Insert (p_Order_number Varchar(16), p_Supplier_id Int, p_Order_date Date, p_Order_time TIME, p_Order_status_id Int, p_Costs Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Orders 
-- (Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs)
-- 		values (p_Order_number, p_Supplier_id, p_Order_date, p_Order_time, p_Order_status_id, p_Costs);
-- 	end;
-- $$;

-- create or replace procedure Order_Update (p_ID_Order int, p_Order_number Varchar(16), p_Supplier_id Int, p_Order_date Date, p_Order_time TIME, p_Order_status_id Int, p_Costs Decimal(10,2))
-- language plpgsql
-- as $$
-- 	begin
-- 		update Orders set
-- 		Order_number = p_Order_number,
-- 		Supplier_id = p_Supplier_id,
-- 		Order_date = p_Order_date,
-- 		Order_time = p_Order_time,
-- 		Order_status_id = p_Order_status_id,
-- 		Costs =p_Costs
-- 			where
-- 				ID_Order = p_ID_Order;
-- 	end;
-- $$;

-- call Order_Insert('ЗП-0000000002-23', 1, '2023-08-30', '12:40', 1, 40500.00);


-- ALTER TABLE Extra_request
-- ALTER COLUMN Extra_request_number TYPE Varchar(18);

-- ALTER TABLE Extra_request DROP COLUMN Worker_id;

-- create or replace procedure Extra_request_Insert (p_Extra_request_number Varchar(18), p_Order_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Extra_request (Extra_request_number, Order_id)
-- 		values (p_Extra_request_number, p_Order_id);
-- 	end;
-- $$;

-- create or replace procedure Extra_request_Update (p_ID_Extra_request int, p_Extra_request_number Varchar(18), p_Order_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Extra_request set
-- 		Extra_request_number = p_Extra_request_number,
-- 		Order_id = p_Order_id
-- 			where
-- 				ID_Extra_request = p_ID_Extra_request;
-- 	end;
-- $$;


-- insert into Extra_request(Extra_request_number, Order_id) 
-- values('ЗП-0000000002-23/1', 2);

-- insert into Worker (Worker_surname, Worker_name, Worker_second_name, Worker_login, Worker_password, Shop_id, Position_id)
-- values ('Иванов', 'Иван', 'Иванович', 'wk_IvanovII', 'Pa$$w0rd', 1, 1),
-- ('Алексеев', 'Алексей', 'Алексеевич', 'wk_AlekseevAA', 'Pa$$w0rd', 2, 1);
-- call Worker_Insert('Павлов', 'Павел', 'Павлович', 'wk_PavlovPP', 'Pa$$w0rd', 1, 2);
-- call Worker_Insert('Глебов', 'Глеб', 'Глебович', 'wk_GlebovGG', 'Pa$$w0rd', 1, 2);
-- call Worker_Insert('Фёдоров', 'Фёдор', 'Фёдорович', 'wk_FedorovFF', 'Pa$$w0rd', 2, 2);


-- select * from worker;
-- ALTER TABLE Request
-- ALTER COLUMN Request_number TYPE Varchar(12);

-- create or replace procedure Request_Insert (p_Request_number Varchar(12), p_Request_date Date, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Request(Request_number, Request_date, Worker_id)
-- 		values (p_Request_number, p_Request_date, p_Worker_id);
-- 	end;
-- $$;

-- create or replace procedure Request_Update (p_ID_Request Int, p_Request_number Varchar(12), p_Request_date Date, p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Request set
-- 			Request_number = p_Request_number,
-- 			Request_date = p_Request_date,
-- 			Worker_id = p_Worker_id

-- 			where
-- 				ID_Request = p_ID_Request;
-- 	end;
-- $$;


-- insert into Request(Request_number, Request_date, Worker_id) 
-- values ('ЗяП-00000001', '2023-08-25', 9),
-- ('ЗяП-00000002', '2023-08-25', 8);
-- call Request_Insert('ЗяП-00000003',  '2023-08-26', 8);

-- select * from Customer;
-- select * from Worker;

-- drop procedure Client_order_Insert;
-- drop procedure Client_order_Update;

-- create or replace procedure Client_order_Insert(
-- p_Client_order_number Varchar(16), 
-- p_Customer_id Int, 
-- p_Client_order_date Date, 
-- p_Client_order_time Time,
--  p_Client_order_sum Decimal(3,2), 
-- p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Client_order(Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id)
-- 		values (p_Client_order_number, p_Customer_id, p_Client_order_date, p_Client_order_time, p_Client_order_sum, p_Worker_id);
-- 	end;
-- $$;

-- create or replace procedure Client_order_Update (
-- p_ID_Client_order Int,
-- p_Client_order_number Varchar(16), 
-- p_Customer_id Int, 
-- p_Client_order_date Date, 
-- p_Client_order_time Time,
--  p_Client_order_sum Decimal(3,2), 
-- p_Worker_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Client_order set
		
-- 		Client_order_number = p_Client_order_number,
-- 		Customer_id = p_Customer_id,
-- 		Client_order_date = p_Client_order_date,
-- 		Client_order_time = p_Client_order_time,
-- 		Client_order_sum = p_Client_order_sum,
-- 		Worker_id = p_Worker_id
-- 			where
-- 				ID_Client_order = p_ID_Client_order;
-- 	end;
-- $$;

-- insert into Client_order (Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id) 
-- values ('ЗкП-000000001-23', 6, '2023-09-01', '10:46:23', 19319.98, 9), 
-- ('ЗкП-000000002-23', 5, '2023-09-01', '10:59:01', 17063.99, 8),
-- ('ЗкП-000000003-23', 5, '2023-09-02', '15:43:25', 1620.00, 9);
-- call Client_order_Insert('ЗкП-000000004-23', 6, '2023-09-02', '17:20:26', 35111.99, 10);
-- call Client_order_Insert('ЗкП-000000005-23', 3, '2023-09-02', '18:00:23', 3600.00, 10);
-- call Client_order_Insert('ЗкП-000000006-23', 4, '2023-09-03', '10:43:25', 22199.99, 8);

-- drop procedure Receipt_Insert;
-- drop procedure Receipt_Update;

--  create or replace procedure Receipt_Insert (p_Receipt_number Varchar(36), 
-- p_Client_order_id Int,
-- p_Receipt_date Date,
-- p_Receipt_time Time,
-- p_Receipt_sum Decimal(10,2),
-- p_Receipt_change Decimal(10,2)
-- )
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Receipt (Receipt_number, Client_order_id, Receipt_date,  Receipt_time, Receipt_sum, Receipt_change)
-- 		values (p_Receipt_number, p_Client_order_id, p_Receipt_date, p_Receipt_time, p_Receipt_sum, p_Receipt_change 
-- );
-- 	end;
-- $$;

-- create or replace procedure Receipt_Update (
-- p_ID_Receipt Int,
-- p_Receipt_number Varchar(36), 
-- p_Client_order_id Int,
-- p_Receipt_date Date,
-- p_Receipt_time Time,
-- p_Receipt_sum Decimal(10,2),
-- p_Receipt_change Decimal(10,2)
-- )

-- language plpgsql
-- as $$
-- 	begin
-- 		update Receipt set
-- 		Receipt_number = p_Receipt_number,
-- 		Client_order_id = p_Client_order_id,
-- 		Receipt_date = p_Receipt_date,
-- 		Receipt_time = p_Receipt_time,
-- 		Receipt_sum = p_Receipt_sum,
-- 		Receipt_change = p_Receipt_change

-- 			where
-- 				ID_Receipt = p_ID_Receipt;
-- 	end;
-- $$;


-- insert into Receipt (Receipt_number, Client_order_id, Receipt_date, Receipt_time, Receipt_sum, Receipt_change) 
-- values ('КЧ-0000000001', 16, '2023-09-01', '11:05:04', 20000.00, 680.00), 
-- ('КЧ-0000000002', 17, '2023-09-01', '11:10:34', 17500.00, 436.00),
-- ('КЧ-0000000003', 18, '2023-09-02', '16:28:20', 1700.00, 80.00);
-- call Receipt_Insert('КЧ-0000000004', 19, '2023-09-02', '18:11:41', 35500.00, 388.00);
-- call Receipt_Insert('КЧ-0000000005', 20, '2023-09-02', '18:11:41', 3600.00, 0.00);
-- call Receipt_Insert('КЧ-0000000006', 21, '2023-09-03', '12:15:39', 22500.00, 300.00);



-- insert into Request_in_order(Request_id, Order_id) 
-- values (11, 2);
-- call Request_in_order_Insert(9, 1);
-- call Request_in_order_Insert(10, 1);


-- insert into Products_in_request(Product_id, Request_id) 
-- values (15, 9), 
-- (17, 9);

-- drop procedure Product_in_request_Insert;
-- create or replace procedure Product_in_request_Insert (p_Product_id Int, p_Request_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Products_in_request
-- (Product_id, Request_id)
-- 		values (p_Product_id, p_Request_id);
-- 	end;
-- $$;
-- call product_in_request_insert(16, 10);
-- call product_in_request_insert(18, 11);
-- call product_in_request_insert(19, 11); 


-- drop procedure Product_in_request_Update;
-- drop procedure Product_in_request_delete;
-- drop procedure Product_in_customer_order_Insert;
-- drop procedure Product_in_customer_order_Update;
-- drop procedure Product_in_customer_order_Delete;
-- create or replace procedure Product_in_request_Update (p_ID_Product_in_request int, p_Product_id Int, p_Request_id Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Products_in_request set
-- 		Product_id = p_Product_id,
-- 		Request_id = p_Request_id			where
-- 				ID_Product_in_request = p_ID_Product_in_request;
-- 	end;
-- $$;

-- create or replace procedure Product_in_request_Delete (p_ID_Product_in_request int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Products_in_request
-- 			where
-- 				ID_Product_in_request = p_ID_Product_in_request;
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Insert
-- (p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Products_in_customer_order
-- (Customer_order_id, Product_id, Product_amount)
-- 		values (p_Customer_order_id, p_Product_id, p_Product_amount);
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Update (p_ID_Product_in_customer_order int, p_Customer_order_id Int, p_Product_id Int, p_Product_amount Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Products_in_customer_order set
-- 		Customer_order_id = p_Customer_order_id,
-- 		Product_id = p_Product_id,
-- 		Product_amount = p_Product_amount			where
-- 				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
-- 	end;
-- $$;

-- create or replace procedure Product_in_customer_order_Delete (p_ID_Product_in_customer_order int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from Products_in_customer_order
-- 			where
-- 				ID_Product_in_customer_order = p_ID_Product_in_customer_order;
-- 	end;
-- $$;



-- insert into Products_in_customer_order(Customer_order_id, Product_id, Product_amount) 
-- values (16, 15, 2), 
-- (16, 18, 1),
-- (16, 16, 1),
-- (17, 16, 1),
-- (17, 15, 1),
-- (18, 17, 3),
-- (19, 17, 2);

-- drop table Products_in_customer_order;
-- create table if not exists Products_in_customer_order (
-- 	ID_Product_in_customer_order Serial not null constraint PK_Product_in_customer_order primary key,
-- 	Customer_order_id Int not null references Client_order(ID_Client_order),
-- 	Product_id Int not null references Product(ID_Product),
-- 	Product_amount Int not null
-- 	);


-- call Product_in_customer_order_Insert(19, 16, 2);
-- call Product_in_customer_order_Insert(19, 19, 1);
-- call Product_in_customer_order_Insert(20, 18, 2);
-- call Product_in_customer_order_Insert(21, 15, 2);
-- call Product_in_customer_order_Insert(21, 16, 1);
-- call Product_in_customer_order_Insert(21, 18, 2);
-- call Product_in_customer_order_Insert(21, 17, 2);


-- insert into Product_size(Product_id, Size_id) 
-- values (15, 3), 
-- (15, 4),
-- (15, 5),
-- (16, 2),
-- (16, 3),
-- (16, 4),
-- (16, 5),
-- (17, 1),
-- (17, 2);
-- call Product_size_Insert(17, 3);
-- call Product_size_Insert(17, 4);
-- call Product_size_Insert(18, 6);
-- call Product_size_Insert(18, 7);
-- call Product_size_Insert(18, 8);
-- call Product_size_Insert(18, 9);
-- call Product_size_Insert(18, 10);
-- call Product_size_Insert(19, 11);
-- call Product_size_Insert(19, 12);



-- insert into Composition_product(Product_id, Composition_id, Percents) 
-- values (15, 1, 60), 
-- (15, 2, 40),
-- (16, 3, 70),
-- (16, 4, 10),
-- (16, 5, 20);

-- drop procedure Composition_product_Insert;
-- create or replace procedure Composition_product_Insert (p_Composition_id Int, p_Product_id Int, p_Percents Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Composition_product
-- (Composition_id, Product_id, Percents)
-- 		values (p_Composition_id, p_Product_id, p_Percents);
-- 	end;
-- $$;

-- call Composition_Insert('подкладка');


-- call Composition_product_Insert(5, 17, 90);
-- call Composition_product_Insert(1, 17, 10);
-- call Composition_product_Insert(6, 18, 100);
-- call Composition_product_Insert(7, 19, 65);
-- call Composition_product_Insert(8, 19, 35);


-- insert into Product_in_shop( Shop_id,Product_id, Product_amount) 
-- values (1, 15, 450), 
-- (1, 16, 500),
-- (1, 17, 191),
-- (2, 17, 197);
-- call Product_in_shop_Insert(1, 18, 126);
-- call Product_in_shop_Insert(2, 18, 174);
-- call Product_in_shop_Insert(2, 19, 454);


-- insert into Season_product(Product_id, Season_id) 
-- values (15, 1), 
-- (16, 2),
-- (16, 3);
-- call Season_product_Insert(17, 3);
-- call Season_product_Insert(18, 4);
-- call Season_product_Insert(19, 4);


-- insert into Sales_floor_in_shop(Sales_floor_id, Shop_id, Sector_in_sales_floor) 
-- values (1, 1, 1), 
-- (2, 1, 1),
-- (3, 1, 2); 
-- call Sales_floor_in_shop_Insert(1, 2, 1);
-- call Sales_floor_in_shop_Insert(2, 2, 2);
-- call Sales_floor_in_shop_Insert(3, 2, 3);

-- drop procedure Product_on_display_Insert;
-- drop procedure Product_on_display_Update;
-- create or replace procedure Product_on_display_Insert (p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		insert into Product_on_display
-- (Sales_floor_in_shop_id, Product_id, Display_in_sales_floor)
-- 		values (p_Sales_floor_in_shop_id, p_Product_id, p_Display_in_sales_floor);
-- 	end;
-- $$;

-- create or replace procedure Product_on_display_Update (p_ID_Product_on_display int, p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
-- language plpgsql
-- as $$
-- 	begin
-- 		update Product_on_display set
-- 		Sales_floor_in_shop_id = p_Sales_floor_in_shop_id,
-- 		Product_id = p_Product_id,
-- 		Display_in_sales_floor = p_Display_in_sales_floor			where
-- 				ID_Product_on_display = p_ID_Product_on_display;
-- 	end;
-- $$;
-- drop table Product_on_display;
-- create table if not exists Product_on_display(
-- 	ID_Product_on_display Serial not null constraint PK_Product_on_display primary key,
-- 	Sales_floor_in_shop_id Int not null references Sales_floor_in_shop(ID_Sales_floor_in_shop),
-- 	Product_id Int not null references Product(ID_Product),
-- 	Display_in_sales_floor Int not null
-- 	);

-- insert into Product_on_display(Sales_floor_in_shop_id, Product_id, Display_in_sales_floor) 
-- values (1, 15, 3), 
-- (1, 16, 2),
-- (2, 17, 1);
-- call Product_on_display_Insert(5, 17, 4);
-- call Product_on_display_Insert(3, 18, 2);
-- call Product_on_display_Insert(6, 18, 3);
-- call Product_on_display_Insert(4, 19, 1);



-- insert into Product_in_extra_request(Extra_request_id, Product_id, Sum) 
-- values (1, 19, 3700.00);


-- select * from client_order;
-- create or replace procedure client_order_Delete (p_ID_client_order int)
-- language plpgsql
-- as $$
-- 	begin
-- 		delete from client_order
-- 			where
-- 				ID_client_order = p_ID_client_order;
-- 	end;
-- $$;

-- grant execute on procedure client_order_delete to rl_customer;
-- grant execute on procedure client_order_delete to rl_administrator;