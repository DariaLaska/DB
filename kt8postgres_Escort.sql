-- Alter table Position
-- add constraint UQ_Position_name unique (Position_name);

-- Alter table Request
-- add constraint UQ_Request_number unique (Request_number);

-- Alter table Client_order
--            add constraint UQ_Client_order_number unique (Client_order_number),
--            add constraint CH_Client_order_number check (Client_order_number similar to 'ЗкП-[0-9]{9}-[0-9]{2}'),
-- 		      add constraint CH_Client_order_sum check (Client_order_sum >= 0);
-- Alter table Client_order
-- 	alter column Client_order_number type varchar (19);

-- Alter table Receipt
--            add constraint UQ_Receipt_number unique (Receipt_number),
--              add constraint CH_Receipt_number check (Receipt_number similar to 'КЧ-[0-9]{10}'),
--              add constraint CH_Receipt_sum check (Receipt_sum >= 0),
--              add constraint CH_Receipt_change check (Receipt_change >= 0);
-- Alter table Receipt
-- 	alter column Receipt_number type varchar(16);

-- Alter table Sales_floor
-- add constraint UQ_Sales_floor_name unique (Sales_floor_name);

-- Alter table Shop
--            add constraint UQ_Shop_name unique (Shop_name),
--            add constraint CH_Shop_name check (Shop_name similar to 'FG-[0-9]{2}'),
--            add constraint UQ_Shop_address unique (Shop_address);

-- alter table Shop
-- alter column Shop_name type varchar(7);

-- Alter table Warehouse
--            add constraint UQ_Warehouse_number unique (Warehouse_number),
--            add constraint CH_Warehouse_number check (Warehouse_number similar to 'СП[0-9]{2}'),
--            add constraint UQ_Warehouse_address unique (Warehouse_address);
-- alter table Warehouse
-- alter column Warehouse_number type varchar(7);

-- Alter table Worker
-- add constraint UQ_Worker_login unique (Worker_login),
-- 	add constraint CH_Worker_login_len check (length(Worker_login) >= 6),
-- 	add constraint CH_Worker_login_LetterU check (Worker_login similar to '%[A-Z]%'),
-- 	add constraint CH_Worker_login_LetterL check (Worker_login similar to '%[a-z]%'),

-- 	add constraint CH_Worker_password_Len check (length(Worker_password) >= 8),
-- 	add constraint CH_Worker_password_LetterU check (Worker_password similar to '%[A-Z]%'),
-- 	add constraint CH_Worker_password_LetterL check (Worker_password similar to '%[a-z]%'),
-- 	add constraint CH_Worker_password_Numb check (Worker_password similar to '%[0-9]%'),
--     add constraint CH_Worker_passwor_Symb check (Worker_password similar to '%[!@#$%^&*()]%'),


-- 	alter column Worker_second_name set default (' Нет данных ');


-- Alter table Customer
--     add constraint CH_Passport_series check (Passport_series similar to '[0-9]{2} [0-9]{2}'),
--     add constraint CH_Passport_number check (Passport_number similar to '[0-9]{6}'),
	
--     add constraint CH_Customer_phone_number check (Customer_phone_number similar to '\+7\([0-9]{3}\)[0-9]{3}-[0-9]{2}-[0-9]{2}'),
 
--     add constraint CH_Credit_card_info check (Credit_card_info similar to '[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}'),
-- 	add constraint UQ_Credit_card_info unique (Credit_card_info),

-- 	add constraint UQ_Customer_login unique (Customer_login),
-- 	add constraint CH_Customer_login_len check (length(Customer_login) >= 6),
-- 	add constraint CH_Customer_login_LetterU check (Customer_login similar to '%[a-zA-Z]%'),
	
-- 	add constraint CH_Customer_password_Len check (length(Customer_password) >= 8),
-- 	add constraint CH_Customer_password_LetterU check (Customer_password similar to '%[A-Z]%'),
-- 	add constraint CH_Customer_password_LetterL check (Customer_password similar to '%[a-z]%'),
-- 	add constraint CH_Customer_password_Numb check (Customer_password similar to '%[0-9]%'),
--     add constraint CH_Customer_passwor_Symb check (Customer_password similar to '%[!@#$%^&*()]%');
	
-- alter table Customer
-- alter column Customer_last_name set default ('Нет данных');

-- alter table Customer
-- alter column Passport_series type varchar(8);
-- alter table Customer
-- alter column Passport_number type varchar(9);
-- alter table Customer
-- alter column Customer_phone_number type varchar(19);
-- alter table Customer
-- alter column Credit_card_info type varchar(22);


-- call Product_update(7, 'SP/0000004', 'Брюки', 'С:\img4.png', 1, 1, 300, 1500.00);
-- call Product_update(8, 'SP/0000005', 'Поясной ремень', 'С:\img5.png', 3, 3, 454, 359.99);

-- select * from Product

-- Alter table Product
--             add constraint CH_Article_number check (Article_number similar to 'SP/[0-9]{7}'),
--             add constraint UQ_Article_number unique (Article_number),
-- 			   add constraint UQ_Product_type unique (Product_type),
			
--             add constraint CH_Product_amount check (Product_amount > 0),
--             add constraint CH_Product_price check (Product_price > 0);

-- alter table Product
-- alter column Article_number type varchar(13);

-- Alter table Manufacturer
--      add constraint UQ_Manufacturer_name unique (Manufacturer_name);

-- Alter table Manufacturing_country
--        add constraint UQ_Manufacturing_country_name unique (Manufacturing_country_name);

-- Alter table Season
--             add constraint UQ_Season_name unique (Season_name);

-- Alter table Composition
--             add constraint UQ_Composition_name unique (Composition_name);

-- Alter table Size
--             add constraint UQ_Size unique (Size);

-- Alter table Extra_request
--     add constraint UQ_Extra_request_number unique (Extra_request_number),
--     add constraint CH_Extra_request_number check (Extra_request_number similar to 'ЗП-[0-9]{10}-[0-9]{2}/[0-9]');

-- alter table Extra_request
-- alter column Extra_request_number type varchar(21);


-- call Order_update(2, 'ЗП-0000000000-23', 1, '2023-08-30', '12:40', 1, 40500.00);

-- Alter table Orders
--     add constraint UQ_Order_number unique (Order_number),
--     add constraint CH_Order_number check (Order_number similar to 'ЗП-[0-9]{10}-[0-9]{2}');

-- alter table Orders
-- alter column Order_number type varchar(19);


-- Alter table Products_in_customer_order
--              add constraint CH_Product_amount check (Product_amount > 0);

-- Alter table Composition_Product
--              add constraint CH_Percents check (Percents > 0);

-- Alter table Product_in_shop
-- 			add constraint CH_Product_amount check (Product_amount > 0);

-- Alter table Product_on_display             
--         add constraint CH_Display_in_sales_floor check (Display_in_sales_floor > 0);

-- Alter table Product_in_extra_request
--         add constraint CH_Sum check (Sum > 0);

-- Alter table Order_status
--             add constraint CH_Order_status check (Order_status in ('В обработке', 'В пути', 'Доставлено'));

-- create table Overall_status
-- (
-- 	ID_Overall_status serial not null constraint PK_Overall_status primary key,
-- 	Overall_status varchar(36) not null  constraint UQ_Overall_status unique
-- 	constraint CH_Overall_status check (Overall_status in ('Завершён', 'Выполняется'))
-- );
-- create index if not exists index_ID_Overall_status on Overall_status (ID_Overall_status);
-- create index if not exists index_Overall_status on Overall_status (Overall_status);

-- create table Delivery_man
-- (
-- 	ID_Delivery_man serial not null constraint PK_Delivery_man primary key,
-- 	Delivery_man_surname Varchar(36) not null,
-- 	Delivery_man_name Varchar(36) not null,
-- 	Delivery_man_second_name Varchar(36) null default ('Отсутствует'),
-- 	Delivery_man_phone Varchar(16) not null  constraint UQ_Delivery_man_phone unique
-- 	constraint CH_Delivery_man_phone check (Delivery_man_phone similar to '\+7\([0-9]{3}\)[0-9]{3}-[0-9]{2}-[0-9]{2}')
-- );
-- create index if not exists index_ID_Delivery_man  on Delivery_man (ID_Delivery_man );
-- create index if not exists index_Delivery_man_phone on Delivery_man(Delivery_man_phone);

-- create table Car
-- (
-- 	ID_Car serial not null constraint PK_Car primary key,
-- 	Car_model Varchar(36) not null constraint UQ_Car_model unique,
-- 	Car_number Varchar(12) not null constraint UQ_Car_number unique	
-- 	constraint CH_Car_number check (Car_number similar to '[ABCEHKMOPTYX][0-9]{3}[ABCEHKMOPTYX]{2} [0-9]{2}')
-- );
-- create index if not exists index_ID_Car on Car (ID_Car);
-- create index if not exists index_Car_number on Car(Car_number);
	
-- create table Deliv_order_status
-- (
-- 	ID_Deliv_order_status serial not null constraint PK_Deliv_order_status primary key,
-- 	Delivery_order_status varchar(36) not null  constraint UQ_Delivery_order_status unique
-- 	constraint CH_Delivery_order_status check (Delivery_order_status in ('Ожидает выдачи', 'В пути', 'Закрыт')) 
-- );
-- create index if not exists index_ID_Deliv_order_status on Deliv_order_status (ID_Deliv_order_status);
-- create index if not exists index_Delivery_order_status on Deliv_order_status (Delivery_order_status);

-- create table Itinerary
-- (
-- 	ID_Itinerary serial not null constraint PK_Itinerary primary key,
-- 	Itinerary_number Varchar(22) not null constraint UQ_Itinerary_number unique
-- 	constraint CH_Itinerary_number check (Itinerary_number similar to 'Д-МЛ-[0-9]{2}-[0-9]{10}'),
-- 	Itinerary_date Date not null,
-- 	Itinerary_time Time not null,
-- 	Delivery_man_id Int not null references Delivery_man (ID_Delivery_man),
-- 	Car_id Int not null references Car (ID_Car),
-- 	Overall_status_id Int not null references Overall_status (ID_Overall_status)
-- );

-- create index if not exists index_ID_Itinerary on Itinerary (ID_Itinerary);

-- create index if not exists index_Itinerary_number
-- on Itinerary (Itinerary_number);

-- create table Client_order_in_itinerary
-- (
-- 	ID_Client_order_in_itinerary serial not null constraint PK_Client_order_in_itinerary primary key,
-- 	Itinerary_id Int not null references Itinerary (ID_Itinerary),
-- 	Client_order_id Int not null references Client_order (ID_Client_order),
-- 	Packaging_time Time not null,
-- 	Cl_order_to_curier_time Time not null,
-- 	Order_on_way Time not null,
-- 	Cl_order_to_client Time not null
-- );

-- create index if not exists index_ID_Client_order_in_itinerary on Client_order_in_itinerary (ID_Client_order_in_itinerary);

-- create index if not exists index_Cl_order_to_curier_time on Client_order_in_itinerary (Cl_order_to_curier_time);
-- create index if not exists index_Packaging_time on Client_order_in_itinerary (Packaging_time);
-- create index if not exists index_Order_on_way on Client_order_in_itinerary (Order_on_way);
-- create index if not exists index_Cl_order_to_client on Client_order_in_itinerary (Cl_order_to_client);


