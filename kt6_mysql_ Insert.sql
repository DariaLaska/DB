--  insert into Positions(Position_name) values ('Старший кассир');
--  call Positions_Insert('Кассир');

--  insert into Sales_floor(Sales_floor_name) values ('Мужская');
--  call Sales_floor_Insert('Женская');
--  call Sales_floor_Insert('Детская');

--  insert into Shop(Shop_name, Shop_address) values ('FG-01', 'ул. Беговая, д. 17, стр. 8');
-- call Shop_Insert('FG-02', 'г. Москва, ул. Комсомольская, д. 56, стр. 6');

 -- insert into Warehouse(Warehouse_number, Warehouse_address, Shop_id) 
--  values ('СП01', 'г. Москва, ул. Беговая, д. 19, к. 1', 1),
--  ('СП02', 'г. Москва, ул. Беговая, д. 19, к. 2 ', 1);
--  call Warehouse_Insert('СП03', 'г. Москва, ул. Комсомольская, д. 52, к. 1', 2);
--  call Warehouse_Insert('СП04', 'г. Москва, ул. Комсомольская, д. 54, к. 1', 2);
 
--  insert into Manufacturer(Manufacturer_name) values ('FugiStyle');
--  call Manufacturer_Insert('Пошивка');
--  call Manufacturer_Insert('GRT');

--  insert into Manufacturing_country(Manufacturing_country_name) values ('Таиланд');
--  call Manufacturing_country_Insert('Россия');
--  call Manufacturing_country_Insert('Китай');

--  insert into Product(Article_number, Product_type, Product_photo, Manufacturing_country_id, Manufacturer_id, Product_amount, Product_price) 
--  values ('SP/0000001', 'Футболка', 'С:\img1.png', 1, 1, 450, 299.99),
--  ('SP/0000002', 'Пальто', 'С:\img2.png', 2, 2, 500, 14000.00),
--  ('SP/0000003', 'Джемпер', 'С:\img3.png', 1, 1, 389, 450.00);
--  call Product_Insert('SP/0000004', 'Джемпер', 'С:\img4.png',1, 1, 300, 1500.00);
--  call Product_Insert('SP/0000005', 'Джемпер', 'С:\img5.png', 3, 3, 454, 359.99);

 
--  insert into Season(Season_name) values ('Летний'),
--  ('Осень');
--  call Season_Insert('Зима');
--  call Season_Insert('Демисезонная');


--  insert into Composition(Composition_name) values ('хлопок'),
--  ('синтетика'), ('войлок'),
--  ('кашемир'), ('шерсть');
--  call Composition_Insert('лён');
--  call Composition_Insert('кожа');
--  call Composition_Insert('кожзаменитель');


--  insert into Size(Size) values ('XS'),
--  ('S'),
--  ('M'), 
--  ('L'),
--  ('XL'), 
--  ('20');
--  call Size_Insert('22');
--  call Size_Insert('24');
--  call Size_Insert('26');
--  call Size_Insert('28');
--  call Size_Insert('100 см');
--  call Size_Insert('120 см');

-- call Supplier_Insert('Вещи даром и не только');

--  insert into Order_status(Order_status) values ('Доставлено'), 
--  ('В пути');
--  call Order_status_Insert('В обработке');


 -- insert into Orders(Order_number, Supplier_id, Order_date, Order_time, Order_status_id, Costs) 
--  values ('ЗП-0000000001-23', 1, '2023-08-30', '11:02:00', 1, 50000.00);
--  call Order_Insert('ЗП-0000000002-23', 1, '2023-08-30', '12:40', 1, 40500.00);


-- ALTER TABLE Extra_request DROP FOREIGN KEY FK_Worker_Extra_request;
--  ALTER TABLE Extra_request DROP COLUMN Worker_id;

--  insert into Extra_request(Extra_request_number, Order_id) 
--  values('ЗП-0000000002-23/1', 2);
 

-- insert into Worker (Worker_surname, Worker_name, Worker_second_name, Worker_login, Worker_password, Shop_id, Position_id)
--  values ('Иванов', 'Иван', 'Иванович', 'wk_IvanovII', 'Pa$$w0rd', 1, 1),
--  ('Алексеев', 'Алексей', 'Алексеевич', 'wk_AlekseevAA', 'Pa$$w0rd', 2, 1);
--  call Worker_Insert('Павлов', 'Павел', 'Павлович', 'wk_PavlovPP', 'Pa$$w0rd', 1, 2);
--  call Worker_Insert('Глебов', 'Глеб', 'Глебович', 'wk_GlebovGG', 'Pa$$w0rd', 1, 2);
--  call Worker_Insert('Фёдоров', 'Фёдор', 'Фёдорович', 'wk_FedorovFF', 'Pa$$w0rd', 2, 2);

-- ALTER TABLE Request MODIFY COLUMN Request_number Varchar(12) Not null;



--  insert into Request(Request_number, Request_date, Worker_id) 
--  values ('ЗяП-00000001', '2023-08-25', 6),
--  ('ЗяП-00000002', '2023-08-25', 7);
--  call Request_Insert('ЗяП-00000003',  '2023-08-26', 7);

-- insert into Customer(Customer_surname, Customer_name, Customer_last_name, Passport_series, Passport_number, Issue_data, Customer_phone_number, Credit_card_info, Cusomer_email, Customer_login, Customer_password) 
--  values ('Андреев', 'Виталий', 'Алексеевич', '49 62', '956384', '03.05.2021', '+7(975)351-48-69', '0324 6723 7235 7122',  'andreev_v_a@gmail.com', 'AndreevVA', 'Pa$$w0rd'),
--  ('Михаилов', 'Валентин', 'Олегович', '41 73', '898329', '10.12.2020', '+7(954)786-04-08', '6335 7323 7762 1234', 'mihailov_v_o@ya.ru', 'MichailovVO', 'Pa$$w0rd');
--  call Customer_Insert('Михайлова', 'Елена', 'Андреевна', '41 78', '234577', '18.11.2019', '+7(975)124-57-60', '7223 7781 4325 9021', 'michailova_e_a@ya.ru', 'MihailovaEA', 'Pa$$w0rd');
--  call Customer_Insert('Сергеева', 'Валерия', 'Константиновна', '46 63', '430199', '06.05.2021', '+7(900)144-35-79', '4622 8992 1346 1334', 'sergeeva_b_k@gamil.com', 'SergeevaBK', 'Pa$$w0rd');


--  insert into Client_order (Client_order_number, Customer_id, Client_order_date, Client_order_time, Client_order_sum, Worker_id) 
--  values ('ЗкП-000000001-23', 1, '2023-09-01', '10:46:23', 19319.98, 5), 
--  ('ЗкП-000000002-23', 2, '2023-09-01', '10:59:01', 17063.99, 6),
--  ('ЗкП-000000003-23', 2, '2023-09-02', '15:43:25', 1620.00, 5);
--  call Client_order_Insert('ЗкП-000000004-23', 1, '2023-09-02', '17:20:26', 35111.99, 7);
--  call Client_order_Insert('ЗкП-000000005-23', 4, '2023-09-02', '18:00:23', 3600.00, 7);
--  call Client_order_Insert('ЗкП-000000006-23', 3, '2023-09-03', '10:43:25', 22199.99, 6);

--  insert into Receipt (Receipt_number, Client_order_id, Receipt_date, Receipt_time, Receipt_sum, Receipt_change) 
--  values ('КЧ-0000000001', 4, '2023-09-01', '11:05:04', 20000.00, 680.00), 
--  ('КЧ-0000000002', 5, '2023-09-01', '11:10:34', 17500.00, 436.00),
--  ('КЧ-0000000003', 6, '2023-09-02', '16:28:20', 1700.00, 80.00);
--  call Receipt_Insert('КЧ-0000000004', 7, '2023-09-02', '18:11:41', 35500.00, 388.00);
--  call Receipt_Insert('КЧ-0000000005', 8, '2023-09-02', '18:11:41', 3600.00, 0.00);
--  call Receipt_Insert('КЧ-0000000006', 9, '2023-09-03', '12:15:39', 22500.00, 300.00);


--  insert into Request_in_order(Request_id, Order_id) 
--  values (3, 2);
--  call Request_in_order_Insert(1, 1);
--  call Request_in_order_Insert(2, 1);


--  insert into Products_in_request(Product_id, Request_id) 
--  values (1, 1), 
--  (3, 1);
--  call product_in_request_insert(2, 2);
--  call product_in_request_insert(4, 3);
--  call product_in_request_insert(5, 3); 




-- insert into Product_size(Product_id, Size_id) 
 -- values (1, 3), 
 -- (1, 4),
 -- (1, 5),
 -- (2, 2),
 -- (2, 3),
 -- (2, 4),
 -- (2, 5),
 -- (3, 1),
 -- (3, 2);

--  call Product_size_Insert(3, 3);
--  call Product_size_Insert(3, 4);
--  call Product_size_Insert(4, 6);
--  call Product_size_Insert(4, 7);
--  call Product_size_Insert(4, 8);
--  call Product_size_Insert(4, 9);
--  call Product_size_Insert(4, 10);
--  call Product_size_Insert(5, 11);
--  call Product_size_Insert(5, 12);

--  insert into Composition_product(Product_id, Composition_id, Percents) 
--  values (1, 1, 60), 
--  (1, 2, 40),
--  (2, 3, 70),
--  (2, 4, 10),
--  (2, 5, 20);

--  call Composition_Insert('подкладка');
 
--  call Composition_product_Insert(5, 3, 90);
--  call Composition_product_Insert(1, 3, 10);
--  call Composition_product_Insert(6, 4, 100);
--  call Composition_product_Insert(7, 5, 65);
--  call Composition_product_Insert(8, 5, 35);

--  insert into Product_in_shop( Shop_id, Product_id, Product_amount) 
--  values (1, 1, 450), 
--  (1, 2, 500),
--  (1, 3, 191),
--  (2, 3, 197);
--  call Product_in_shop_Insert(1, 4, 126);
--  call Product_in_shop_Insert(2, 4, 174);
--  call Product_in_shop_Insert(2, 5, 454);

--  insert into Season_product(Product_id, Season_id) 
--  values (1, 1), 
--  (2, 2),
--  (2, 3);
--  call Season_product_Insert(3, 3);
--  call Season_product_Insert(4, 4);
--  call Season_product_Insert(5, 4); 

--  insert into Sales_floor_in_shop(Sales_floor_id, Shop_id, Sector_in_sales_floor) 
--  values (1, 1, 1), 
--  (2, 1, 1),
--  (3, 1, 2); 
--  call Sales_floor_in_shop_Insert(1, 2, 1);
--  call Sales_floor_in_shop_Insert(2, 2, 2);
--  call Sales_floor_in_shop_Insert(3, 2, 3); 

--  create or replace procedure Product_on_display_Update (p_ID_Product_on_display int, p_Sales_floor_in_shop_id Int, p_Product_id Int, p_Display_in_sales_floor Int)
--  language plpgsql
--  as $$
--  	begin
--  		update Product_on_display set
--  		Sales_floor_in_shop_id = p_Sales_floor_in_shop_id,
--  		Product_id = p_Product_id,
--  		Display_in_sales_floor = p_Display_in_sales_floor			where
--  				ID_Product_on_display = p_ID_Product_on_display;
--  	end;
--  $$;

-- create table if not exists Product_on_display(
-- 	ID_Product_on_display Int not null auto_increment primary key,
-- 	Sales_floor_in_shop_id Int not null, constraint FK_Sales_floor_in_shop_Product_on_display foreign key (Sales_floor_in_shop_id)  references Sales_floor_in_shop(ID_Sales_floor_in_shop),
-- 	Product_id Int not null, constraint FK_Product_Product_on_display foreign key (Product_id)  references Product(ID_Product),
-- 	Display_in_sales_floor Int not null
-- 	);

--  insert into Product_on_display(Sales_floor_in_shop_id, Product_id, Display_in_sales_floor) 
--  values (1, 1, 3), 
--  (1, 2, 2),
--  (2, 3, 1);
--  call Product_on_display_Insert(5, 3, 4);
--  call Product_on_display_Insert(3, 4, 2);
--  call Product_on_display_Insert(6, 4, 3);
--  call Product_on_display_Insert(4, 5, 1);


--  insert into Product_in_extra_request(Extra_request_id, Product_id, Sum) 
--  values (1, 5, 3700.00);




--  create table if not exists Products_in_customer_order (
--  	ID_Product_in_customer_order Int  not null auto_increment primary key,
--  	Customer_order_id Int not null, constraint FK_Customer_order_Products_in_customer_order foreign key (Customer_order_id) references Client_order(ID_Client_order),
--     Product_id Int not null, constraint FK_Products_Product_on_display foreign key (Product_id)  references Product(ID_Product),

--  	Product_amount Int not null
--  	);

-- insert into Products_in_customer_order(Customer_order_id, Product_id, Product_amount) 
--  values (4, 1, 4), 
--  (4, 4, 4),
--  (4, 2, 4),
--  (5, 2, 4),
--  (5, 1, 4),
--  (6, 3, 6),
--  (7, 3, 5);

--    
--  call Product_in_customer_order_Insert(4, 2, 2);
--  call Product_in_customer_order_Insert(4, 5, 1);
--  call Product_in_customer_order_Insert(5, 4, 2);
--  call Product_in_customer_order_Insert(6, 1, 2);
--  call Product_in_customer_order_Insert(6, 2, 1);
--  call Product_in_customer_order_Insert(6, 4, 2);
--  call Product_in_customer_order_Insert(6, 3, 2);
--  select * from  Products_in_customer_order